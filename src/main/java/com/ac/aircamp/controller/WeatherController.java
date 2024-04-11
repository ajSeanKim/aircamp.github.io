package com.ac.aircamp.controller;

import java.security.Provider.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ac.aircamp.service.WeatherService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WeatherController {
	
	private WeatherService weatherService;
	
	@RequestMapping("/list")
	public String main() {
		return "weather/list";
	}
	
	
	
	

}
