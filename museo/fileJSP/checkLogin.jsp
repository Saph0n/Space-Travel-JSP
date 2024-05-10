<!DOCTYPE html>
<html>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
 <% 
 // Parametri di connessione al database
    String jdbcUrl = "jdbc:mysql://localhost:3306/MuseoRazzi";
    String usernameDB = "root";
    String passwordDB = "";

        String username = request.getParameter("email");
        String password = request.getParameter("password"); 
        
        
        // Se user e pass sono valide ci si connette al database e si verificano delle credenziali
        // Connessione al database e verifica delle credenziali
    try {
        // Carica il driver JDBC
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Crea la connessione al database
        Connection conn = DriverManager.getConnection(jdbcUrl, usernameDB, passwordDB);
        
        String query = "SELECT * FROM Users WHERE username = ?";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, username);
        ResultSet result = statement.executeQuery();
        
        if (!result.next()) {
            // se l'utente non è stato trovato'
            response.sendRedirect("../fileHTML/login.html?correctEmail=false");
        }

        
        query = "SELECT * FROM Users WHERE username = ? AND password = ?";
        statement = conn.prepareStatement(query);
        statement.setString(1, username);
        statement.setString(2, password);
       // out.println(query);
        
        // Esegui la query
        result = statement.executeQuery();

        
        // Controlla se sono stati restituiti risultati (utente trovato)
        if (result.next()) {
            // Imposta l'username e la password come attributi della sessione
            int id = result.getInt("id");

            HttpSession sessionObj = request.getSession();
            sessionObj.setAttribute("username", username);
            sessionObj.setAttribute("password", password);
            
            response.sendRedirect("../visualizzaRazzi.jsp?id="+id);
        } else {
            // se l'utente non è stato trovato'
            response.sendRedirect("../fileHTML/login.html?credentials=false&email="+username);
        }

        // Chiudi la connessione al database
        conn.close();
    } catch (Exception e) {
        out.println("<p class='error'>Errore durante il login.</p>");
        e.printStackTrace();
    } 

    
%>

