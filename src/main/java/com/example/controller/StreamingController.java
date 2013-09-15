package com.example.controller;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.Account;
import com.force.api.ApiConfig;
import com.force.api.ForceApi;

@Controller
@RequestMapping("/streaming")
@PropertySource("classpath:/forceDatabase.properties")
public class StreamingController {

	@Inject private Environment env;
	
	private ForceApi api;
	private String id;
	
	@PostConstruct
	public ForceApi loginToSalesforce(){
		api = new ForceApi(new ApiConfig()
	    .setUsername("thysmichels@gmail.com")
	    .setPassword(env.getProperty("password")));
		return api;
	}
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String createAccount(){
		Account newAccount = new Account();
		newAccount.setName("Streaming Account");
		id = api.createSObject("Account", newAccount);
		return "streaming";
	}
	
	public void deleteAccount(){
		api.deleteSObject("Account", id);
	}
	
	 @RequestMapping("")
	    public String index() {
	        return "streaming";
	 }
}
