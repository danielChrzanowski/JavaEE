<%@page import="models.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Studenci</title>
    </head>

    <body>
        <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

        <div align="center">
            <h4>Select studentów (MVC, CRUD):</h4>
            <table cellpadding="10">
                <tr>
                    <th>id</th>
                    <th>Imię</th>
                    <th>Nazwisko</th>
                    <th>Email</th>
                    <th></th>
                </tr>
                <c:forEach items="${AllStudents}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.imie}</td>
                        <td>${p.nazwisko}</td>
                        <td>${p.email}</td>
                        <td>
                            <a href="EditStudent?id=${p.id}">Edytuj</a>
                            <a href="DeleteStudent?id=${p.id}">Usuń</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <A href="AddStudent.jsp">Dodaj</A>

            <hr>

            <h4>Select studentów w AllStudents.jsp (JSTL -> sql:query):</h4>
            <sql:query var="rs" dataSource="jdbc/sky-33_Daniel">
                select * from tss_students
            </sql:query>

            <c:forEach var="row" items="${rs.rows}">
                ${row.id} ${row.imie} ${row.nazwisko} ${row.email} <br>
            </c:forEach>

            <hr>

            <h4>(JSTL -> jsp:useBean):</h4>
            Stwórz obiekt klasy Student -> Zenek Nowak<br>
            <jsp:useBean id="obj" class="models.Student"/>  
            <%
                obj.setImie("Zenek");
                obj.setNazwisko("Nowak");
                out.println("Obiekt: " + obj.getImie() + " " + obj.getNazwisko());
            %>  

            <hr>
            <jsp:include page="return.jsp"></jsp:include>

        </div>
    </body>
</html>
