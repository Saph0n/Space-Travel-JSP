<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Viaggi Spaziali</title>
    <link rel="icon" href="../asset/logo.jpeg" type="image/x-icon">
    <style>
    body {
        background: url('../asset/logo.jpeg') no-repeat center center fixed, rgba(0, 23, 51, 1); 
        -webkit-background-size: 40 % 40 %;
        -moz-background-size: 40 % 40 %;
        -o-background-size: 40 % 40 %;
        background-size: 40 % 40 %;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 30px;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px;
    }
    form input[type="text"] {
        padding: 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 100%;
        max-width: 400px;
        font-size: 18px;
    }
        form input[type="number"] {
        padding: 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 100%;
        max-width: 400px;
        font-size: 18px;
    }
    form input[type="submit"] {
        padding: 15px 30px;
        border-radius: 5px;
        border: none;
        background-color: #007BFF;
        color: white;
        cursor: pointer;
        font-size: 18px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Aggiungi Razzo</h1>
        <form action="aggiungiRazzo.jsp" method="post">
            <input type="text" name="nome" placeholder="Nome del razzo">
            <input type="text" name="descrizione" placeholder="Descrizione del razzo">
            <input type="text" name="foto" placeholder="Link alla foto del razzo">
            <input type="number" name="posti" placeholder="Posti del razzo">

            <input type="submit" value="Aggiungi Razzo">
        </form>
    </div>
</body>
</html>