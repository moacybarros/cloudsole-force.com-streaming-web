package com.example.service;

import java.io.IOException;

import org.cometd.bayeux.Message;
import org.cometd.bayeux.client.ClientSessionChannel;

import com.example.service.PushTopicFactory;
import com.force.sdk.streaming.client.ForceBayeuxClient;
import com.force.sdk.streaming.client.PushTopicManager;
import com.force.sdk.streaming.exception.ForceStreamingException;
import com.force.sdk.streaming.model.PushTopic;
import com.google.inject.Injector;

public class StreamingService {
	
	public void pushTopicSubScriber(){

		PushTopicFactory pushTopicFactory = new PushTopicFactory();
		Injector injector = pushTopicFactory.createInjector();
		ForceBayeuxClient client = pushTopicFactory.createClient(injector);
		PushTopicManager publicTopicManager = pushTopicFactory.createPushTopManager(injector);
		PushTopic createTopic = pushTopicFactory.createPushTopic(publicTopicManager, "NewAccountPushTopic", 27.0, "select Id, Name from Account", "New Push Topic");

		PushTopic topic = null;
		try {
			topic = pushTopicFactory.getTopicByName(publicTopicManager, createTopic.getName());
		} catch (ForceStreamingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
		/*try {
			client.subscribeTo(topic, new ClientSessionChannel.MessageListener() 
			{   
				public void onMessage(ClientSessionChannel channel, Message message) 
				{
					
				}
			});
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
}
