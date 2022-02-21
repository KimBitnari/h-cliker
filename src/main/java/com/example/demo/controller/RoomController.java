package com.example.demo.controller;

import java.security.SecureRandom;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.RoomVO;
import com.example.demo.service.RoomService;

@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Inject
	RoomService roomservice;

	@RequestMapping(value="/main", method = RequestMethod.GET) //메인 리스트 화면 호출  
    public String list(Model model, @RequestParam(value="code", required=false)String code) throws Exception{
		logger.info("list");
        
        model.addAttribute("list", roomservice.list());
        
       if(code!=null) {
        	logger.info("plist");
        	 
            model.addAttribute("plist", roomservice.plist(code));
        }
        
        return "main"; //생성할 jsp
	}
	
	@RequestMapping(value="/mroom", method = RequestMethod.GET) //mroom 디테일페이지 이동
	private String roomDetail(RoomVO RoomVO, Model model) throws Exception{
		logger.info("roomDetail");
		
	    model.addAttribute("roomDetail", roomservice.roomDetail(RoomVO.getRoom_id()));
	        
	    return "mroom";
	}

	@RequestMapping("/insertProc") //새로운 방 만들기(방제목입력)
	private String roomInsertProc(HttpServletRequest request) throws Exception{
	    RoomVO room = new RoomVO();

	    SecureRandom random = new SecureRandom();

	    String ENGLISH_LOWER = "abcdefghijklmnopqrstuvwxyz";
        String ENGLISH_UPPER = ENGLISH_LOWER.toUpperCase();
        String NUMBER = "0123456789";
        
        /** 랜덤을 생성할 대상 문자열 **/
        String DATA_FOR_RANDOM_STRING = ENGLISH_LOWER + ENGLISH_UPPER + NUMBER;
        
        /** 랜덤 문자열 길이 **/
        int random_string_length=6;
        
        StringBuilder sb = new StringBuilder(random_string_length);
        for (int i = 0; i < random_string_length; i++) {
            sb.append( DATA_FOR_RANDOM_STRING.charAt(
            		random.nextInt(DATA_FOR_RANDOM_STRING.length())
            		));
        }
        
	    room.setRoom_name(request.getParameter("room_name"));
	    room.setCode(sb.toString());
	    room.setMd_user(request.getParameter("user_id"));
	    roomservice.roomInsert(room);
	    return "redirect:/main";
	}
	@RequestMapping("/delete/{room_id}") //mroom 삭제
    private String roomDelete(@PathVariable int room_id) throws Exception{
       
       roomservice.roomDelete(room_id);
        
        return "redirect:/main";
    }
	@RequestMapping("/mroom/{room_id}/dash_professor") //mroom 자료실페이지 이동
    private String dash_professor(){
        return "dash_professor"; 
	}
	@RequestMapping("/proom/{room_id}/dash_student") //proom 자료실페이지 이동
    private String dash_student(){
        return "dash_student"; 
	}
}