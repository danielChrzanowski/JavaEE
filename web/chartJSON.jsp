<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Wykres JSON</title>
        <script src="jScript/chartJSON.js"></script>
        <script src="lib/canvasjs.min.js"></script>
    </head>

    <body>
       <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
        <div align="center">
            <h2>Wykres JSON:</h2>
            <br>

            <div id="chartContainer" style="height: 300px; width: 50%;"></div>    
            <br>

            <form action="">
                <input onclick="doSend(textID.value)" value="Prześlij" type="button">
                <input id="textID" name="message" value="wartość" type="text"><br>
                <input style="width:50%" id="messageID" name="messageInfo" value="...." type="text"><br>
            </form>

            <hr>
             <jsp:include page="return.jsp"></jsp:include>
        </div>
    </body>

</html>