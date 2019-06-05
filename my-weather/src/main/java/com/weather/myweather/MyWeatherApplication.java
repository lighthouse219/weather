package com.weather.myweather;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan("com.weather.controller")
@SpringBootApplication
public class MyWeatherApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(MyWeatherApplication.class, args);
	}
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MyWeatherApplication.class);
    }

}
