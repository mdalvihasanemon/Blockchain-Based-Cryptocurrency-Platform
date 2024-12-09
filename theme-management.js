console.log("profile-dropdown.js loaded successfully!");

function toggleDropdown() {
    const dropdownList = document.querySelector('.profile-dropdown-list');
    dropdownList.classList.toggle('show');
}

// Close dropdown if clicked outside
window.addEventListener('click', function (event) {
    const dropdownBtn = document.querySelector('.profile-dropdown-btn');
    const dropdownList = document.querySelector('.profile-dropdown-list');

    if (!dropdownBtn.contains(event.target) && !dropdownList.contains(event.target)) {
        dropdownList.classList.remove('show');
    }
});

// Ensure dropdown reacts to the theme toggle
document.addEventListener('DOMContentLoaded', function () {
    const body = document.body;
    const dropdownList = document.querySelector('.profile-dropdown-list');

    function applyDarkTheme() {
        dropdownList.style.backgroundColor = '#1f1f1f'; // Navy blue-like for dark mode
        dropdownList.style.border = '1px solid #333';
        dropdownList.style.color = '#e0e0e0'; // Light text for dark mode
    }

    function applyLightTheme() {
        dropdownList.style.backgroundColor = '#f8f8f8'; // Off-white for light mode
        dropdownList.style.border = '1px solid #ddd';
        dropdownList.style.color = '#000'; // Dark text for light mode
    }

    // Apply the correct theme on load
    if (body.classList.contains('dark-theme')) {
        applyDarkTheme();
    } else {
        applyLightTheme();
    }

    // Listen for theme changes
    const themeBtn = document.querySelector('.theme-btn');
    themeBtn.addEventListener('click', () => {
        setTimeout(() => {
            if (body.classList.contains('dark-theme')) {
                applyDarkTheme();
            } else {
                applyLightTheme();
            }
        }, 300); // Small delay to ensure toggle is applied first
    });
});
