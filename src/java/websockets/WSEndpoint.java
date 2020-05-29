package websockets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.Random;
import javax.websocket.OnMessage;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/WSEndpoint")
public class WSEndpoint {

    @OnMessage
    public String onMessage(String message) {
        Gson gsonBuilder = new GsonBuilder().create();
        Random random = new Random();

        int[] dataPointsParam = new int[50];

        for (int i = 0; i < dataPointsParam.length; i++) {
            dataPointsParam[i] = random.nextInt(100);
        }

        return gsonBuilder.toJson(dataPointsParam);
    }

}
