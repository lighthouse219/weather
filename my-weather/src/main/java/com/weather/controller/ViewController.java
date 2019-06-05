package com.weather.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
	 
	 @RequestMapping("/")
	    public String home(Map<String, Object> model) {
	        return "home";
	    }
}
