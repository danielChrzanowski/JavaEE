var applicationContext = '/WebApplicationDC';
var tableData = [];

var webSocketTimer = setInterval(doSend, 600);

function drawChart(dataPointsParam) {
    var chart = new CanvasJS.Chart("chartContainer", {
        title: {
            text: "Wykres CanvasJS"
        },
        axisY: {
            title: "Opis osi Y",
            maximum: 100
        },
        data: [
            {
                type: "column",
                dataPoints: dataPointsParam
            }
        ]
    });
    chart.render();
}

var wsUri = getRootUri() + applicationContext + "/WSEndpoint";

function getRootUri() {
    var wsUri = (location.protocol === "http:" ? "ws://" : "wss://");
    return wsUri + (document.location.hostname === "" ?
            "localhost" :
            document.location.hostname) + ":" +
            (document.location.port === "" ? "8080" :
                    document.location.port);
}

function init() {
    drawChart();
    initWebSocket();
}

function initWebSocket() {
    websocket = new WebSocket(wsUri);

    websocket.onopen = function (evt) {
        onOpen(evt);
    };

    websocket.onmessage = function (evt) {
        onMessage(evt);
    };

    websocket.onerror = function (evt) {
        onError(evt);
    };
}

function onOpen(evt) {
    writeToScreen("POŁĄCZONO");
}

function onMessage(evt) {
    writeToScreen("OTRZYMANO: " + evt.data);

    var dataArrayJSON = JSON.parse(evt.data);
    for (i = 0; i < dataArrayJSON.length; i++)
    {
        tableData[i] = {label: i, y: dataArrayJSON[i]};
    }
    drawChart(tableData);
}

function onError(evt) {
    writeToScreen('<span style="color: red;">ERROR:</span> ' +
            evt.data);
}

function doSend(message) {
    writeToScreen("WYSŁANO: " + message);
    websocket.send(message);
}

function writeToScreen(message) {
    var pre = document.getElementById("messageID");
    pre.value = message;
}

window.addEventListener("load", init, false);

