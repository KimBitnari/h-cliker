package com.example.demo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.demo.dao.RoomDAO;
import com.example.demo.domain.RoomVO;

@Service("com.example.demo.service.RoomServiceImpl")
public class RoomServiceImpl implements RoomService {
	
	@Inject 
	private RoomDAO dao;
	
	@Override
	public List<RoomVO> list() throws Exception{
        return dao.list();
    }
	public List<RoomVO> plist(String code) throws Exception{
		return dao.plist(code);
	}
	@Override
	public RoomVO roomDetail(int room_id) throws Exception{
		return dao.roomDetail(room_id);
	}
	@Override
	public int roomInsert(RoomVO room) throws Exception{
		return dao.roomInsert(room);
	}
	@Override
	public int roomDelete(int room_id) throws Exception{
		return dao.roomDelete(room_id);
	}
}
