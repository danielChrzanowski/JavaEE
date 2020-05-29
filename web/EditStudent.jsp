<%@page import="dao.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edytuj studenta</title>
    </head>
    <body>
        <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
        <div align="center">
            <h1>Edytuj studenta</h1>
            <c:set var="p" scope="session" value="${getStudentById}"/>  
            <form action="EditStudentService" method="post">
                <input type="hidden" name="id" value="${p.id}">
                Imię: <input type="text" value="${p.imie}" name="imie" style="width: 200px"><br>
                Nazwisko: <input type="text" value="${p.nazwisko}" name="nazwisko" style="width: 200px"><br>
                Email: <input type="text" value="${p.email}" name="email" style="width: 200px"><br>
                <input type="submit" value="Zatwierdź">
            </form>

            <hr>

            <A href="AllStudents">Wróć</A>
        </div> 
        
    </body>
</html>
