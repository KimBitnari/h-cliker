package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.RoomVO;
import com.example.demo.domain.SurveyVO;

public interface SurveyService {

	public List<SurveyVO> readSurvey(int room_id) throws Exception;
	public RoomVO read(int room_id) throws Exception;


}
