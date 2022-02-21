package com.example.demo.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.domain.RoomVO;
import com.example.demo.domain.SurveyVO;
import com.example.demo.mappers.SurveyMapper;
import com.example.demo.service.SurveyService;

@Controller
public class SurveyController {

	private static final Logger Logger = LoggerFactory.getLogger(SurveyController.class);
	
	@Inject
	SurveyService surveyService;
	
	@Resource(name="com.example.demo.mappers.SurveyMapper")
	SurveyMapper mapper;
	
	
	@RequestMapping(value = "/proom", method = RequestMethod.GET)
	public String readSurvey(SurveyVO surveyVO, Model model, RoomVO roomVO) throws Exception {
		Logger.info("readSurvey");	
		Logger.info("read");
		
		model.addAttribute("readSurvey", surveyService.readSurvey(surveyVO.getRoom_id()));	
		model.addAttribute("read", surveyService.read(roomVO.getRoom_id()));
		
		return "proom";
	}
	@RequestMapping(value = "/mroom/{room_id}/dash_professor", method = RequestMethod.GET)
	public String userinfo(SurveyVO surveyVO, Model model, RoomVO roomVO) throws Exception {
		Logger.info("readSurvey");	
		model.addAttribute("readSurvey", surveyService.readSurvey(surveyVO.getRoom_id()));					
		
		Logger.info("roomusercount");
		model.addAttribute("roomusercount", mapper.roomusercount(roomVO.getRoom_id()));

		return "/dash_professor";
	}

}
