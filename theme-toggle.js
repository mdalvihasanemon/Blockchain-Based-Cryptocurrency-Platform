document.addEventListener('DOMContentLoaded', function () {
    const themeBtn = document.querySelector('.theme-btn');
    const body = document.body;

    const lightModeIcon = themeBtn.querySelector('span:first-child');
    const darkModeIcon = themeBtn.querySelector('span:last-child');

    const storedTheme = localStorage.getItem('theme');
    if (storedTheme === 'dark') {
        body.classList.add('dark-theme');
        darkModeIcon.classList.add('active');
        lightModeIcon.classList.remove('active');
    } else {
        body.classList.remove('dark-theme');
        lightModeIcon.classList.add('active');
        darkModeIcon.classList.remove('active');
    }

    themeBtn.addEventListener('click', function () {
        if (body.classList.contains('dark-theme')) {
            body.classList.remove('dark-theme');
            lightModeIcon.classList.add('active');
            darkModeIcon.classList.remove('active');
            localStorage.setItem('theme', 'light');
        } else {
            body.classList.add('dark-theme');
            darkModeIcon.classList.add('active');
            lightModeIcon.classList.remove('active');
            localStorage.setItem('theme', 'dark');
        }
    });
});
