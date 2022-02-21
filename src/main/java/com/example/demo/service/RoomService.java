package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.RoomVO;

public interface RoomService {

	public List<RoomVO> list() throws Exception;
	
	public List<RoomVO> plist(String code) throws Exception;
	
	public RoomVO roomDetail(int room_id) throws Exception;
	
	public int roomInsert(RoomVO room) throws Exception;
	
	public int roomDelete(int room_id) throws Exception;
}
