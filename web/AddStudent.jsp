
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Dodaj studenta</title>
    </head>
    <body>
        <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
        <div align="center">
            <h1>Dodaj studenta:</h1>
            <div style="width: 900px; margin-left: auto; margin-right: auto">
                <form action="AddStudentService" method="post">
                    Imię: <input type="text" name="imie" style="width: 200px"><br>
                    Nazwisko: <input type="text" name="nazwisko" style="width: 200px"><br>
                    Email: <input type="text" name="email" style="width: 200px"><br>
                    <input type="submit" value="Dodaj">
                </form>
            </div>

            <A href="AllStudents">Wróć</A>
        </div> 
    </body>
</html>
