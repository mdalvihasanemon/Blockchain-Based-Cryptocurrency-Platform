import hashlib
import json
import time

class Block:
    def __init__(self, index, timestamp, transactions, previous_hash, nonce=0):
        self.index = index
        self.timestamp = timestamp
        self.transactions = transactions
        self.previous_hash = previous_hash
        self.nonce = nonce
        self.hash = self.calculate_hash()

    def calculate_hash(self):
        block_string = json.dumps(self.__dict__, sort_keys=True)
        return hashlib.sha256(block_string.encode()).hexdigest()


class Blockchain:
    def __init__(self):
        self.chain = [self.create_genesis_block()]
        self.pending_transactions = []
        self.difficulty = "00"  # Mining difficulty for PoC
        self.reward = 50  # Reward for mining a block

    def create_genesis_block(self):
        return Block(0, time.time(), "Genesis Block", "0")

    def get_latest_block(self):
        return self.chain[-1]

    def add_transaction(self, transaction):
        # Validate transaction (e.g., no negative amounts)
        if transaction["amount"] <= 0:
            return False
        self.pending_transactions.append(transaction)
        return True

    def mine_pending_transactions(self, miner_address):
        latest_block = self.get_latest_block()
        new_block = Block(
            index=latest_block.index + 1,
            timestamp=time.time(),
            transactions=self.pending_transactions,
            previous_hash=latest_block.hash,
        )

        if self.proof_of_capacity(new_block):
            self.chain.append(new_block)
            self.pending_transactions = [{"sender": "System", "recipient": miner_address, "amount": self.reward}]
            return new_block
        return None

    def proof_of_capacity(self, block):
        # Simulate Proof of Capacity (PoC) mining using nonce and challenge
        plot_file = f"plots/user_{block.index}.plot"
        try:
            with open(plot_file, "r") as f:
                for line in f:
                    plot_hash = line.strip()
                    if plot_hash.endswith(self.difficulty):
                        block.nonce = int(plot_hash, 16)
                        block.hash = block.calculate_hash()
                        return True
        except FileNotFoundError:
            print(f"Plot file {plot_file} not found.")
        return False

    def is_chain_valid(self):
        for i in range(1, len(self.chain)):
            current_block = self.chain[i]
            previous_block = self.chain[i - 1]

            if current_block.hash != current_block.calculate_hash():
                return False
            if current_block.previous_hash != previous_block.hash:
                return False
        return True

    def get_all_transactions(self):
        transactions = []
        for block in self.chain:
            if isinstance(block.transactions, list):
                transactions.extend(block.transactions)
        return transactions
