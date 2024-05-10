const form = document.getElementById('form');
const password = document.getElementById('password');
const passwordError = document.getElementById('errore-password');
const email = document.getElementById('email');
const emailError = document.getElementById('errore-email');

const urlParams = new URLSearchParams(window.location.search); 
if (urlParams.has('credentials')) {
    console.log('credentials');
    if (urlParams.get('credentials') === 'false') {
        password.parentElement.className = 'input-field error';
        passwordError.innerHTML = 'Password errata';
        email.parentElement.className = 'input-field success'; 
        
        email.value = urlParams.get('email');
    }
} else if (urlParams.has('correctEmail')) {
    console.log('correctEmail');
    email.parentElement.className = 'input-field error';
    emailError.innerHTML = 'Utente non registrato. <a href="../fileHTML/registrazione.html">Registrati</a>';
} else if (urlParams.has('correctRegistration')){
    if(urlParams.get('correctRegistration') === 'true'){
        email.parentElement.className = 'input-field success';
        email.value = urlParams.get('email');
    }
}