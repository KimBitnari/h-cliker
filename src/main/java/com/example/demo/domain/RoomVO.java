package com.example.demo.domain;

import java.util.Date;

public class RoomVO {
	private int room_id;
	private String room_name;
	private String code;
	private String md_user;
	private String pt_user;
	private Date regDate;
	
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMd_user() {
		return md_user;
	}
	public void setMd_user(String md_user) {
		this.md_user = md_user;
	}
	public String getPt_user() {
		return pt_user;
	}
	public void setPt_user(String pt_user) {
		this.pt_user = pt_user;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
