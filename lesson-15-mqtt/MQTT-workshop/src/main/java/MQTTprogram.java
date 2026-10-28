//opg5pgm

import java.io.IOException;

import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class MQTTprogram {

    static MqttClient sampleClient;

    static MqttMessage message;

    static String topicsend;

    public static void main(String[] args) throws InterruptedException {
        // TODO Auto-generated method stub
        String broker = "tcp://192.168.0.115:1883";
        MemoryPersistence persistence = new MemoryPersistence();
        try {

            sampleClient = new MqttClient(broker, MqttClient.generateClientId(), persistence);
            sampleClient.setCallback(new SimpleMqttCallBack());
            MqttConnectOptions connOpts = new MqttConnectOptions();
            connOpts.setCleanSession(true);
            System.out.println("Connecting to broker: " + broker);



            sampleClient.connect(connOpts);
            System.out.println("Connected");

            sampleClient.subscribe("tele/grp3297/SENSOR");

           Thread.sleep(200000);

            // put real stuff here        < -------- !!!!
            //publishMessage(sampleClient, "cmnd/grp3297/Power1","0");


            sampleClient.disconnect();
            System.out.println("Disconnected");
            System.exit(0);
        } catch (MqttException me) {
            System.out.println("reason " + me.getReasonCode());
            System.out.println("msg " + me.getMessage());
            System.out.println("loc " + me.getLocalizedMessage());
            System.out.println("cause " + me.getCause());
            System.out.println("excep " + me);
            me.printStackTrace();

        }
    }

    public static void publishMessage(MqttClient sampleClient, String content) throws MqttPersistenceException, MqttException {
        // Laver en publish p  sampleClient med topic topicsend og indhold content.
        message = new MqttMessage();
        message.setPayload(content.getBytes());
        System.out.println(content.getBytes());
        sampleClient.publish(topicsend, message);
        System.out.println("Message published");
    }

    public static void test(String temp) throws MqttException {
        message = new MqttMessage();
        message.setPayload(temp.getBytes());

        sampleClient.publish("cmnd/grp3297/Power1", message);
    }

}
