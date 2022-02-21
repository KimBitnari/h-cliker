package com.example.demo.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.domain.RoomVO;
import com.example.demo.domain.SurveyVO;
//import com.example.demo.domain.AnswerVO;

@Repository("com.example.demo.mappers.SurveyMapper")
public interface SurveyMapper {
	
	/*public int surveyInsert(SurveyVO survey) throws Exception;
	
	public int answerInsert(AnswerVO answer) throws Exception;*/
	
	public List<SurveyVO> readSurvey(int room_id) throws Exception;
	public int roomusercount(int room_id) throws Exception;
	public RoomVO read(int room_id) throws Exception;

}
