<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
 <% 
    // Parametri di connessione al database
    String jdbcUrl = "jdbc:mysql://localhost:3306/MuseoRazzi";
    String usernameDB = "root";
    String passwordDB = "";

    String username = request.getParameter("email");
    String password = request.getParameter("password"); 
    String nome = request.getParameter("nome");
    String cognome = request.getParameter("cognome");

    try {
        
        // Carica il driver JDBC
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Crea la connessione al database
        Connection conn = DriverManager.getConnection(jdbcUrl, usernameDB, passwordDB);
        // Crea una query per verificare le credenziali dell'utente
        String query = "SELECT * FROM Users WHERE username = ?";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, username);
        ResultSet result = statement.executeQuery();
        if (!result.next()) {

            query = "INSERT INTO Users (username, password, nome, cognome) VALUES (?, ?, ?, ?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, nome);
            statement.setString(4, cognome);
            statement.executeUpdate();
            response.sendRedirect("../fileHTML/login.html?correctRegistration=true&email="+username);
        } else 
            response.sendRedirect("../fileHTML/registrazione.html?correctEmail=false");
            
        // Chiudi la connessione al database
        conn.close();
    
    } catch (Exception e) {
        out.println("<p class=\"error\">Errore durante la registrazione.</p>");
        e.printStackTrace();
    } 

    
%>