<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Prenotazione</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<header class="bg-gray-200 py-6 px-4 sm:px-6 lg:px-8">
  <div class="flex items-center justify-center h-16">
    <div class="flex items-center">
      <div class="flex-shrink-0">
        <img class="h-8 w-8" src="../asset/logo.jpeg" alt="Logo">
      </div>
      <div class="ml-10 flex items-baseline space-x-4">
        <a href="visualizzaRazzi.jsp" class="text-gray-700 hover:text-black px-3 py-2 rounded-md text-sm font-medium">Home</a>
          <a href="index.jsp" class="text-gray-700 hover:text-black px-3 py-2 rounded-md text-sm font-medium">Aggiungi Razzo</a>
        <a href="fileHTML/login.html" class="text-gray-700 hover:text-black px-3 py-2 rounded-md text-sm font-medium">Logout</a>
      </div>
    </div>
  </div>
</header>
<style>
button {
 appearance: none;
 background-color: transparent;
 border: 0.125em solid #1A1A1A;
 border-radius: 0.9375em;
 box-sizing: border-box;
 color: #3B3B3B;
 cursor: pointer;
 display: inline-block;
 font-family: Roobert,-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
 font-size: 16px;
 font-weight: 600;
 line-height: normal;
 margin: 0;
 min-height: 3.75em;
 min-width: 0;
 outline: none;
 padding: 1em 2.3em;
 text-align: center;
 text-decoration: none;
 transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
 user-select: none;
 -webkit-user-select: none;
 touch-action: manipulation;
 will-change: transform;
}

button:disabled {
 pointer-events: none;
}

button:hover {
 color: #fff;
 background-color: #1A1A1A;
 box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
 transform: translateY(-2px);
}

button:active {
 box-shadow: none;
 transform: translateY(0);
}
</style>
    <div class="overflow-hidden bg-white py-24 sm:py-32">
        <div class="mx-auto max-w-7xl px-6 lg:px-8">
            <div class="mx-auto grid max-w-2xl grid-cols-1 gap-x-8 gap-y-16 sm:gap-y-20 lg:mx-0 lg:max-w-none lg:grid-cols-2">
             <div class="lg:pr-8 lg:pt-4">
                    <div class="lg:max-w-lg">
                        <h2 class="text-base font-semibold leading-7 text-indigo-600">Prenota ora</h2>
                        <p class="mt-2 text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Un viaggio spaziale indimenticabile</p>
                        <p class="mt-6 text-lg leading-8 text-gray-600">Informazioni</p>
                       
<%
    String userId = request.getParameter("userId");
    String razzoId = request.getParameter("razzoId");

    if ("POST".equalsIgnoreCase(request.getMethod()) && userId != null && razzoId != null) {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/museorazzi", "root", "");

            // Check if the user has already booked the rocket
            PreparedStatement checkStatement = connection.prepareStatement("SELECT * FROM prenotazioni WHERE id_utente = ? AND id_razzo = ?");
            checkStatement.setString(1, userId);
            checkStatement.setString(2, razzoId);
            ResultSet checkResult = checkStatement.executeQuery();

            if (!checkResult.next()) {
                // Create a statement
                PreparedStatement statement = connection.prepareStatement("INSERT INTO prenotazioni (id_utente, id_razzo, data_prenotazione) VALUES (?, ?, ?)");
                statement.setString(1, userId);
                statement.setString(2, razzoId);
                statement.setDate(3, new java.sql.Date(new java.util.Date().getTime()));

                // Execute the update
                statement.executeUpdate();

                // Close the statement
                statement.close();
            }

            // Close the check result and statement
            checkResult.close();
            checkStatement.close();

            // Close the connection
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>  
<form action="" method="post">
    <input type="hidden" name="userId" value="<%= request.getParameter("userId") %>">
    <input type="hidden" name="razzoId" value="<%= request.getParameter("razzoId") %>">
    <button type="submit">Prenota</button>
</form>

                    </div>
                </div>
<%
    String id = request.getParameter("razzoId");
    String imageUrl = "";

    // Load the JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

        // Establish a connection
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/museorazzi", "root", "");

    // Create a statement
    Statement statement = connection.createStatement();

    // Execute a query to get the image URL
    ResultSet resultSet = statement.executeQuery("SELECT foto FROM razzi WHERE id = " + id);

    // If the result set is not empty, get the image URL
    if (resultSet.next()) {
        imageUrl = resultSet.getString("foto");
    }

    
    // Close the result set, statement, and connection
    resultSet.close();
    statement.close();
    connection.close();
%>


<img src="<%=imageUrl%>" alt="Product screenshot" class="w-[48rem] max-w-none rounded-xl shadow-xl ring-1 ring-gray-400/10 sm:w-[57rem] md:-ml-4 lg:-ml-0" width="2432" height="1442">
      </div>
    </div>
</body>
</html>
