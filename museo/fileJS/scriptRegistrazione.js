const form = document.getElementById('form');
const email = document.getElementById('email');
const password = document.getElementById('password');
const password2 = document.getElementById('password2');
const emailError = document.getElementById('errore-email');
const passwordError = document.getElementById('errore-password');
const passwordError2 = document.getElementById('errore-password2');

form.addEventListener('submit', (e) => {
    e.preventDefault();
    var correct_credentials = 0;
    
    let regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if (email.value.trim() === '') {
        email.parentElement.className = 'input-field error';
        emailError.innerHTML = 'Email richiesta';
        correct_credentials = 0;
    } else if (!regex.test(email.value.trim())) {
        email.parentElement.className = 'input-field error';
        emailError.innerHTML = 'Email non valida';
        correct_credentials = 0;
    } else {
        email.parentElement.className = 'input-field success'; 
        correct_credentials++;
    }

    if(password.value.trim() === '') {
        password.parentElement.className = 'input-field error';
        passwordError.innerHTML = 'Password richiesta';
        correct_credentials = 0;
    } else if (password.value.trim().length < 8) {
        password.parentElement.className = 'input-field error';
        passwordError.innerHTML = 'La password deve contenere almeno 8 caratteri';
        correct_credentials = 0;
    } else if (password.value.trim().length > 15) {
        password.parentElement.className = 'input-field error';
        passwordError.innerHTML = 'La password deve contenere massimo 15 caratteri';
        correct_credentials = 0;
    } else {
        password.parentElement.className = 'input-field success';
        correct_credentials++;
    }

    if(password2.value.trim() === '') {
        password2.parentElement.className = 'input-field error';
        passwordError2.innerHTML = 'Password di conferma richiesta';
        correct_credentials = 0;
    } else if (password.value.trim() !== password2.value.trim()) {
        password2.parentElement.className = 'input-field error';
        passwordError2.innerHTML = 'Le password non corrispondono';
        correct_credentials = 0;
    } else {
        password2.parentElement.className = 'input-field success';
        correct_credentials++;
    }

    if (correct_credentials === 3) {
        form.submit();
    }
});


const urlParams = new URLSearchParams(window.location.search); 
if (urlParams.has('correctEmail')) {
    email.parentElement.className = 'input-field error';
    emailError.innerHTML = 'Utente già registrato. <a href="../fileHTML/login.html">Accedi</a>';
}

