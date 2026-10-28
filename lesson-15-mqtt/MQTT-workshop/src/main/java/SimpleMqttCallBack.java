import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONObject;

public class SimpleMqttCallBack implements MqttCallback {
    int status = 0;
    public void connectionLost(Throwable throwable) {
        System.out.println("Connection to MQTT broker lost!");
    }

    public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
        String res= new String(mqttMessage.getPayload());
        System.out.println(res);

        JSONObject jo = new JSONObject(res);

        String time = jo.getString("Time");

        JSONObject jo2 = jo.getJSONObject("AM2301");

        double temp = jo2.getDouble("Temperature");

        double hum = jo2.getDouble("Humidity");

        String tempUnit = jo.getString("TempUnit");

        System.out.println("Tid: " + time + ", Temp: " + temp);



        if (hum > 40 ) {
            MQTTprogram.test("0");
        } else {
            MQTTprogram.test("1");
        }

        // res indeholder en m ling som et JSON-object
        // put real stuff here     < --------    !!!!!!!!!!
    }

    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        // not used in this example
    }
} 