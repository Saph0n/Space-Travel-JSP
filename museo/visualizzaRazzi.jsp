<%@ page import="java.sql.*" %>
<html>
<head>
  <script src="https://cdn.tailwindcss.com"></script>
    <style>
    .container {
      width: 100%;
      height: 100%;
      --s: 105px; /* control the size */
      --c1: #b9b9b9;
      --c2: #dcdcdc;
      --c3: #fafafa;

      background: conic-gradient(
            from 75deg,
            var(--c1) 15deg,
            var(--c2) 0 30deg,
            #0000 0 180deg,
            var(--c2) 0 195deg,
            var(--c1) 0 210deg,
            #0000 0
          )
          calc(0.5 * var(--s)) calc(0.5 * var(--s) / 0.577),
        conic-gradient(
          var(--c1) 30deg,
          var(--c3) 0 75deg,
          var(--c1) 0 90deg,
          var(--c2) 0 105deg,
          var(--c3) 0 150deg,
          var(--c2) 0 180deg,
          var(--c3) 0 210deg,
          var(--c1) 0 256deg,
          var(--c2) 0 270deg,
          var(--c1) 0 286deg,
          var(--c2) 0 331deg,
          var(--c3) 0
        );
      background-size: var(--s) calc(var(--s) / 0.577);
      /* 0.577=tan(30deg)*/
    }
        .h-8.w-8 {
        border-radius: 50%;
    }
  </style>
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

<div class="bg-gray-300 py-24 sm:py-32" >
  <div class="mx-auto max-w-7xl px-6 text-center lg:px-8">
    <div class="mx-auto max-w-2xl">
      <h2 class="text-3xl font-bold tracking-tight text-black sm:text-4xl">Corioli Space Ships</h2>
      <p class="mt-4 text-lg leading-8 text-gray-700">Prenota il tuo viaggio beyonde innovation su per la luna Verso l infinito e oltre</p>
    </div>
<ul role="list" class="mx-auto mt-20 grid max-w-2xl grid-cols-1 gap-6 sm:grid-cols-2 lg:mx-0 lg:max-w-none lg:grid-cols-3 lg:gap-8">
<%
String userId = request.getParameter("id");
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/museorazzi", "root", "");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM razzi");
    while(rs.next()) {
        int id = rs.getInt("id");
        String nome = rs.getString("nome");
        String descrizione = rs.getString("descrizione");
        String foto = rs.getString("foto");
%>
  <li class="rounded-2xl bg-white px-8 py-10">
    <a href="prenota.jsp?razzoId=<%= id %>&userId=<%= userId %>">
        <img class="mx-auto h-48 w-48 rounded-full md:h-56 md:w-56" src="<%= foto %>" alt="<%= nome %>">
    </a>
    <h3 class="mt-6 text-base font-semibold leading-7 tracking-tight text-black"><%= nome %></h3>
    <p class="text-sm leading-6 text-gray-700"><%= descrizione %></p>
  </li>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

    <li class="rounded-2xl bg-white px-8 py-10">
        <div class="flex flex-col items-center justify-center h-full">
            <h3 class="mt-6 text-base font-semibold leading-7 tracking-tight text-black">Aggiungi Razzo</h3>
            <a href="index.jsp" class="mt-4 px-4 py-2 bg-blue-500 text-white rounded-md">Aggiungi</a>
        </div>
    </li>
</ul>
  </div>
</div>

</body>
<footer class="bg-gray-200 py-6 text-center text-black">
  <div class="w-full max-w-6xl mx-auto">
    
  </div>
  <div class="border-t mt-8 pt-6 text-center text-gray-700">
  </div>
</footer>

</html>
