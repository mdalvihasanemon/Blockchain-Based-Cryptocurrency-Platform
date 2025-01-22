from flask import Flask, url_for, render_template, request, redirect, session, flash
from flask_bcrypt import Bcrypt
from flask_mysqldb import MySQL
from blockchain import Blockchain
from MySQLdb import IntegrityError
import random
import string
import hashlib
from werkzeug.utils import secure_filename
import os
import uuid

app = Flask(__name__)
app.secret_key = "ratcoin_secret"

# MySQL Configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'rat2'

mysql = MySQL(app)
bcrypt = Bcrypt(app)

# Constants
TOTAL_SUPPLY = 10000000
MIN_REWARD = 0.01
MAX_REWARD = 0.12
CHALLENGE = "00"  # Mining difficulty (adjustable)
PLOT_DIR = "plots/"  # Directory to store plot files

blockchain = Blockchain()

# Utility Functions
def generate_seed():
    return ''.join(random.choices(string.ascii_letters + string.digits, k=16))

def generate_address():
    return str(uuid.uuid4())
def generate_receive_addresses(user_id, num_addresses=5):
    """Generates a specified number of unique addresses for a user and stores them in the database."""
    cursor = mysql.connection.cursor()
    for _ in range(num_addresses):
        address = generate_address()
        cursor.execute("INSERT INTO receive_addresses (user_id, address) VALUES (%s, %s)", (user_id, address))
    mysql.connection.commit()
    cursor.close()
    print(f"{num_addresses} receiving addresses generated for user {user_id}.")

def generate_plots(user_id, plot_size=200, merge=True):
    """
    Generates new plots for the user. Optionally merges with old plots.
    
    Args:
        user_id (int): The ID of the user.
        plot_size (int): Number of new plots to generate.
        merge (bool): If True, merge new plots with old ones. If False, overwrite.
    """
    if not os.path.exists(PLOT_DIR):
        os.makedirs(PLOT_DIR)

    plot_file = os.path.join(PLOT_DIR, f"user_{user_id}.plot")
    old_hashes = set()

    # Read existing plots if merging
    if merge and os.path.exists(plot_file):
        with open(plot_file, "r") as f:
            old_hashes = set(line.strip() for line in f.readlines())

    # Generate new plots
    new_hashes = set()
    for i in range(plot_size):
        data = f"{user_id}-{i + len(old_hashes)}".encode()
        hash_value = hashlib.sha256(data).hexdigest()
        new_hashes.add(hash_value)

    # Combine old and new hashes if merging
    all_hashes = old_hashes.union(new_hashes) if merge else new_hashes

    # Write all hashes to the file
    with open(plot_file, "w") as f:
        for hash_value in all_hashes:
            f.write(hash_value + "\n")

    print(f"Plots {'merged' if merge else 'generated'} for user {user_id} and stored in {plot_file}")


def mine_block(user_id, challenge):
    """Attempts to mine a block using all available plots for the user."""
    plot_files = [
        os.path.join(PLOT_DIR, f) 
        for f in os.listdir(PLOT_DIR) 
        if f.startswith(f"user_{user_id}")
    ]

    if not plot_files:
        return False, 0  # No plots available

    for plot_file in plot_files:
        with open(plot_file, "r") as f:
            for line in f:
                hash_value = line.strip()
                if hash_value.endswith(challenge):
                    reward = round(random.uniform(MIN_REWARD, MAX_REWARD), 2)
                    return True, reward

    return False, 0

UPLOAD_FOLDER = 'static/uploads/'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Helper function
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route('/')
def landpage():
    return render_template('landpage.html')

@app.route('/')
def index():
    if 'user_id' in session:
        return redirect(url_for('wallet'))
    return render_template('login.html')

@app.route('/admin_dashboard')
def admin_dashboard():
    if 'admin_id' not in session or session.get('role') != 'admin':
        return redirect(url_for('login'))

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM help_queries")  # Fetch all help queries
    help_queries = cursor.fetchall()
    cursor.close()

    return render_template('admin_dashboard.html', help_queries=help_queries)


@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']

    cursor = mysql.connection.cursor()
    # Fetch balance
    cursor.execute("SELECT balance FROM wallets WHERE user_id = %s", (user_id,))
    balance = cursor.fetchone()[0] if cursor.rowcount > 0 else 0.0

    cursor.execute("SELECT name FROM users WHERE id = %s", (user_id,))
    name = cursor.fetchone()[0] if cursor.rowcount > 0 else "User"

    cursor.execute("SELECT profile_picture FROM users WHERE id = %s", (user_id,))
    result = cursor.fetchone()
    profile_picture = result[0]

    cursor.close()
    return render_template('dashboard.html', balance=balance, name=name, profile_picture=profile_picture)

@app.route('/submit_help_query', methods=['POST'])
def submit_help_query():
    name = request.form['name']
    email = request.form['email']
    category = request.form['category']
    message = request.form['message']
    file = request.files['file']
    file_path = None

    # Handle file upload
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)

    # Insert data into the database
    cursor = mysql.connection.cursor()
    cursor.execute(
        """
        INSERT INTO help_queries (name, email, category, message, file_path)
        VALUES (%s, %s, %s, %s, %s)
        """,
        (name, email, category, message, file_path)
    )
    mysql.connection.commit()
    cursor.close()

    flash('Your help request has been submitted!', 'success')
    return redirect(url_for('help'))

@app.route('/help')
def help():
    return render_template('help.html')

@app.route('/exchange')
def exchange():
    return render_template('exchange.html')
    
@app.route('/transaction')
def transaction():
    return render_template('transaction.html')

@app.route('/multi-wallets')
def multiwallets():
    return render_template('multi-wallets.html')
@app.route('/edit', methods=['GET', 'POST'])
def edit():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']

    if request.method == 'POST':
        name = request.form.get('name')
        seed = request.form.get('seed')
        new_password = request.form.get('password')  # Match the name attribute in the form
        profile_picture = request.files.get('profile-picture')

        cursor = mysql.connection.cursor()

        # Update name
        if name:
            cursor.execute("UPDATE users SET name = %s WHERE id = %s", (name, user_id))
            flash("Name updated successfully.")

        # Update profile picture
        if profile_picture and allowed_file(profile_picture.filename):
            filename = secure_filename(profile_picture.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], f"user_{user_id}_{filename}")
            profile_picture.save(file_path)

            cursor.execute("UPDATE users SET profile_picture = %s WHERE id = %s", (file_path, user_id))
            flash("Profile picture updated successfully.")

        # Reset password
        if seed and new_password:
            cursor.execute("SELECT seed FROM users WHERE id = %s", (user_id,))
            db_seed = cursor.fetchone()
            if db_seed and db_seed[0] == seed:
                hashed_password = bcrypt.generate_password_hash(new_password).decode('utf-8')
                cursor.execute("UPDATE users SET password = %s WHERE id = %s", (hashed_password, user_id))
                flash("Password reset successfully.")
            else:
                flash("Invalid seed. Password not updated.")

        mysql.connection.commit()
        cursor.close()

        # Redirect to dashboard after updates
        return redirect(url_for('dashboard'))

    # If GET request, fetch user details
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT name, profile_picture FROM users WHERE id = %s", (user_id,))
    user_details = cursor.fetchone()
    cursor.close()

    return render_template('edit.html', name=user_details[0], profile_picture=user_details[1])


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form['email']
        password = request.form['password']
        seed = generate_seed()
        hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
        if cursor.fetchone():
            flash('Email already exists. Please use a different one.')
            return redirect(url_for('signup'))

        cursor.execute("INSERT INTO users (name, email, password, seed) VALUES (%s, %s, %s, %s)",
                       (name, email, hashed_password, seed))
        mysql.connection.commit()

        user_id = cursor.lastrowid  # Get the new user's ID
        cursor.execute("INSERT INTO wallets (user_id, balance) VALUES (%s, %s)", (user_id, 0))
        mysql.connection.commit()

        generate_plots(user_id)  # Generate plots for the new user

        cursor.close()
        flash('Signup successful! Please login.')
        return redirect(url_for('index'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        cursor = mysql.connection.cursor()

        # Check if email exists in users table
        cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
        user = cursor.fetchone()

        if user and bcrypt.check_password_hash(user[3], password):  # User login
            session['user_id'] = user[0]
            session['email'] = user[2]
            session['role'] = 'user'
            return redirect(url_for('dashboard'))

        # Check if email exists in admins table
        cursor.execute("SELECT * FROM admins WHERE email = %s", (email,))
        admin = cursor.fetchone()

        if admin and bcrypt.check_password_hash(admin[2], password):  # Admin login
            session['admin_id'] = admin[0]
            session['email'] = admin[1]
            session['role'] = 'admin'
            return redirect(url_for('admin_dashboard'))

        cursor.close()

        flash('Invalid login credentials.')
        return redirect(url_for('login'))

    return render_template('login.html')

@app.route('/wallet')
def wallet():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    cursor = mysql.connection.cursor()

    # Fetch balance
    cursor.execute("SELECT balance FROM wallets WHERE user_id = %s", (user_id,))
    balance = cursor.fetchone()[0] if cursor.rowcount > 0 else 0.0

    # Fetch receiving addresses
    cursor.execute("SELECT address FROM receive_addresses WHERE user_id = %s AND used = FALSE", (user_id,))
    addresses = [row[0] for row in cursor.fetchall()]

    # If no unused addresses remain, generate new ones
    if len(addresses) == 0:
        generate_receive_addresses(user_id)
        cursor.execute("SELECT address FROM receive_addresses WHERE user_id = %s AND used = FALSE", (user_id,))
        addresses = [row[0] for row in cursor.fetchall()]

    # Fetch user's name
    cursor.execute("SELECT name FROM users WHERE id = %s", (user_id,))
    name = cursor.fetchone()[0] if cursor.rowcount > 0 else "User"

    # Fetch seed
    cursor.execute("SELECT seed FROM users WHERE id = %s", (user_id,))
    seed = cursor.fetchone()[0] if cursor.rowcount > 0 else "No Seed Available"

     # Fetch transactions (sent and received with details)
    cursor.execute("""
        SELECT 
            t.id,
            t.amount,
            t.timestamp,
            u_sender.name AS sender_name,
            u_recipient.name AS recipient_name,
            ra.address AS recipient_address
        FROM transactions t
        LEFT JOIN users u_sender ON t.sender_id = u_sender.id
        LEFT JOIN users u_recipient ON t.recipient_id = u_recipient.id
        LEFT JOIN receive_addresses ra ON ra.user_id = t.recipient_id
        WHERE t.sender_id = %s OR t.recipient_id = %s
        ORDER BY t.timestamp DESC
    """, (user_id, user_id))
    transactions = cursor.fetchall()


    cursor.close()
    return render_template('wallet.html', balance=balance, addresses=addresses, seed=seed, name=name, transactions=transactions)

@app.route('/mine', methods=['GET', 'POST'])
def mine():
    # Allow user_id from query parameters for non-logged-in users
    user_id = request.args.get('user_id', type=int)
    if not user_id:
        # Fallback to session user_id if available
        user_id = session.get('user_id')
        if not user_id:  # If neither is available, redirect to login
            return redirect(url_for('login'))

    # Fetch challenge value
    challenge = CHALLENGE  # Replace with actual challenge logic if necessary

    # Fetch existing plots for the user
    plot_file = os.path.join(PLOT_DIR, f"user_{user_id}.plot")
    plots = []
    if os.path.exists(plot_file):
        with open(plot_file, "r") as f:
            plots = [line.strip() for line in f.readlines()]

    # Handle plot generation via POST
    if request.method == 'POST':
        generate_plots(user_id)
        flash(f'New plots generated successfully for user {user_id}!')
        return redirect(url_for('mine', user_id=user_id))  # Ensure user_id is retained

    # Render the template with challenge and plots
    return render_template('mine.html', challenge=challenge, plots=plots, user_id=user_id)

@app.route('/generate_plots', methods=['POST'])
def generate_plots_route():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    merge = request.form.get('merge', 'true').lower() == 'true'
    generate_plots(user_id, merge=merge)

    flash(f"New plots {'merged' if merge else 'overwritten'} successfully!")
    return redirect(url_for('wallet'))


@app.route('/generate_new_plots/<int:user_id>', methods=['POST'])
def generate_new_plots_route(user_id):
    # Validate the user_id (optional, but recommended)
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM users WHERE id = %s", (user_id,))
    user_exists = cursor.fetchone()[0]
    cursor.close()

    if not user_exists:
        flash("Invalid user ID.")
        return redirect(url_for('mine'))

    # Generate new plots with merging
    merge = request.form.get('merge', 'true').lower() == 'true'  # Use 'merge' parameter from the form
    generate_plots(user_id, merge=merge)

    flash(f"New plots {'merged' if merge else 'overwritten'} successfully for user {user_id}!")
    return redirect(url_for('mine', user_id=user_id))


@app.route('/mine_block', methods=['POST'])
def mine_block_route():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    cursor = mysql.connection.cursor()

    # Fetch miner's wallet address
    cursor.execute("SELECT address FROM receive_addresses WHERE user_id = %s LIMIT 1", (user_id,))
    miner_address = cursor.fetchone()[0] if cursor.rowcount > 0 else None

    if not miner_address:
        flash("You don't have a receiving address. Please generate one.")
        return redirect(url_for('wallet'))

    # Attempt to mine a block
    success, reward = mine_block(user_id, CHALLENGE)
    if success:
        # Credit reward to miner's wallet
        try:
            cursor.execute("UPDATE wallets SET balance = balance + %s WHERE user_id = %s", (reward, user_id))

            # Add a transaction for the mined reward
            transaction = {
                "sender": "System",
                "recipient": miner_address,
                "amount": reward
            }
            blockchain.add_transaction(transaction)
            blockchain.mine_pending_transactions(miner_address)

            # Save mined block to the database
            latest_block = blockchain.get_latest_block()
            cursor.execute("""
                INSERT INTO blocks (`id`, `index`, `timestamp`, `transactions`, `previous_hash`, `nonce`, `hash`)
                VALUES (NULL, %s, %s, %s, %s, %s, %s)
            """, (
                latest_block.index, latest_block.timestamp, str(latest_block.transactions),
                latest_block.previous_hash, latest_block.nonce, latest_block.hash
            ))

            mysql.connection.commit()
            flash(f"Block mined successfully! Reward of {reward} RAT-COIN has been credited.")
        except IntegrityError as e:
            if "Duplicate entry" in str(e):
                flash("You already mined a block using the same hash. Wait a few moments, create new plots, and try again.")
            else:
                flash("An unexpected error occurred while mining. Please try again later.")
    else:
        flash("No valid hashes found. Try generating new plots or adjusting your strategy.")

    cursor.close()
    return redirect(url_for('mine'))


@app.route('/send', methods=['POST'])
def send():
    recipient_address = request.form.get('recipient_address')
    amount = float(request.form.get('amount'))

    if not recipient_address or amount <= 0:
        flash("Invalid recipient address or amount.")
        return redirect(url_for('wallet'))

    sender_id = session.get('user_id')

    cursor = mysql.connection.cursor()

    # Validate recipient address
    cursor.execute("SELECT user_id FROM receive_addresses WHERE address = %s", (recipient_address,))
    recipient = cursor.fetchone()
    if not recipient:
        flash("Invalid recipient address.")
        return redirect(url_for('wallet'))

    recipient_id = recipient[0]

    # Fetch sender's balance
    cursor.execute("SELECT balance FROM wallets WHERE user_id = %s", (sender_id,))
    sender_balance = cursor.fetchone()[0]

    if sender_balance < amount:
        flash("Insufficient funds.")
        return redirect(url_for('wallet'))

    # Add transaction to blockchain
    sender_address = session.get('email')  # Use email as sender identifier
    transaction_success = blockchain.add_transaction({
        "sender": sender_address,
        "recipient": recipient_address,
        "amount": amount
    })

    if not transaction_success:
        flash("Transaction failed.")
        return redirect(url_for('wallet'))

    # Update sender's and recipient's balances in the database
    cursor.execute("UPDATE wallets SET balance = balance - %s WHERE user_id = %s", (amount, sender_id))
    cursor.execute("UPDATE wallets SET balance = balance + %s WHERE user_id = %s", (amount, recipient_id))
    mysql.connection.commit()

    cursor.execute("INSERT INTO transactions (sender_id, recipient_id, amount) VALUES (%s, %s, %s)",
                   (sender_id, recipient_id, amount))
    mysql.connection.commit()

    cursor.close()
    flash("Transaction successful! Coins sent.")
    return redirect(url_for('wallet'))


@app.route('/logout', methods=['POST', 'GET'])
def logout():
    session.clear()
    if request.method == 'POST':
        return '', 204  # Minimal response for JS logout
    flash('You have been logged out.')
    return redirect(url_for('landpage'))


@app.after_request
def add_header(response):
    response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
    return response

@app.before_request
def check_session():
    protected_routes = ['/dashboard', '/wallet', '/mine']  # Add your protected routes here
    if 'user_id' not in session and request.path in protected_routes:
        flash('You need to log in first.')
        return redirect(url_for('index'))

@app.route('/reset_password', methods=['GET', 'POST'])
def reset_password():
    if request.method == 'POST':
        email = request.form['email']
        seed = request.form['seed']
        new_password = request.form['new_password']

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM users WHERE email = %s AND seed = %s", (email, seed))
        user = cursor.fetchone()

        if user:
            hashed_password = bcrypt.generate_password_hash(new_password).decode('utf-8')
            cursor.execute("UPDATE users SET password = %s WHERE email = %s", (hashed_password, email))
            mysql.connection.commit()
            flash("Password reset successfully.")
            return redirect(url_for('login'))
        else:
            flash("Invalid email or seed.")
        
        cursor.close()
        return redirect(url_for('reset_password'))

if __name__ == '__main__':
    app.run(debug=True)
