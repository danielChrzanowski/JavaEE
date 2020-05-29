<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body bgcolor="#E6E6FA">
        <div align="center">
            <h1>Login</h1>

            Widzi wszystko: admin admin
            <br>
            Widzi tylko index.jsp, ImageServlet i LogoutServlet: gosc gosc
            <br>
            Nie widzi nic (nie będzie się dało wylogować :) ): tomcat tomcat

            <form action="j_security_check" method="POST">
                <input type="text" name="j_username" value="admin"/><br>
                <input type="password" name="j_password" value="admin"/><br>
                <button type="submit">Zaloguj</button>
            </form>
            
        </div>
    </body>
</html>
