<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Strona główna</title>
    </head>

    <body bgcolor="#E6E6FA">
       <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
        <div align="center">
            <h1>Autor: Daniel Chrzanowski</h1>

            <A href="AllStudents">Tabela studentów</A>
            <br>
            <A href="chartJSON.jsp">Wykres JSON</A>
            <br>
            <A href="/WebApplicationDC/webresources/studentREST">Student REST</A>
            <br>
            <A href="LogoutServlet">Wyloguj</A>

            <br><br>

            Obraz modyfikowany przez Image servlet:
            <br>
            <img src="/WebApplicationDC/ImageServlet" width="622" height="345" />

            <hr> 

            <%
                getServletContext().setAttribute("sWersjaAplikacji", "8.0");
                String sWersjaAplikacji = (String) application.getAttribute("sWersjaAplikacji");
                out.println("Wersja aplikacji: " + sWersjaAplikacji + "<br>");
            %>
        </div>
    </body>
</html>
