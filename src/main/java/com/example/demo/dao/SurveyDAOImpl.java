package com.example.demo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.RoomVO;
import com.example.demo.domain.SurveyVO;

@Repository
public class SurveyDAOImpl implements SurveyDAO {

	@Inject SqlSession sql;
	
	@Override
	public List<SurveyVO> readSurvey(int room_id) throws Exception {
		return sql.selectList("com.example.demo.mappers.SurveyMapper.readSurvey", room_id);
	}
	public RoomVO read(int room_id) throws Exception{
		return sql.selectOne("com.example.demo.mappers.SurveyMapper.read",room_id);
	}


	
}
