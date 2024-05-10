<%@ page import="java.sql.*" %>
<%
    String nome = request.getParameter("nome");
    String descrizione = request.getParameter("descrizione");
    String foto = request.getParameter("foto");
    int posti = Integer.parseInt(request.getParameter("posti")); // aggiunto qui
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/museorazzi", "root", "");
        PreparedStatement stmt = conn.prepareStatement("INSERT INTO razzi (nome, descrizione, foto, posti) VALUES (?, ?, ?, ?)"); // modificato qui
        stmt.setString(1, nome);
        stmt.setString(2, descrizione);
        stmt.setString(3, foto);
        stmt.setInt(4, posti); // aggiunto qui
        stmt.executeUpdate();
        stmt.close();
        conn.close();
        response.sendRedirect("visualizzaRazzi.jsp");
    } catch(SQLException e) {
        out.println("Si è verificato un errore SQL: " + e.getMessage());
        e.printStackTrace();
    } catch(ClassNotFoundException e) {
        out.println("Driver JDBC non trovato: " + e.getMessage());
        e.printStackTrace();
    } catch(Exception e) {
        out.println("Si è verificato un errore: " + e.getMessage());
        e.printStackTrace();
    }
%>