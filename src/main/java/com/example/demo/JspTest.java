package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspTest {
	 @RequestMapping("/member/login")
	    private String login(){
	        return "/member/login"; 
	}
	 @RequestMapping("/member/mroom")
	    private String mroom(){
	        return "/member/mroom"; 
	}
	 @RequestMapping("/member/proom")
	    private String proom(){
	        return "/member/proom"; 
	}
	 @RequestMapping("/member/dash_professor")
	    private String dash_professor(){
	        return "/member/dash_professor"; 
	}
	 @RequestMapping("/member/dash_student")
	    private String dash_student(){
	        return "/member/dash_student"; 
	}
	 @RequestMapping("/member/clicker")
	    private String clicker(){
	        return "/member/clicker"; 
	}
	 @RequestMapping("/member/index")
	    private String index(){
	        return "/member/index"; 
	}
	 @RequestMapping("/member/mroom1")
	    private String mroom1(){
	        return "/member/mroom1"; 
	}
	 /*@RequestMapping("/member/register")
	    private String register(){
	        return "/member/register"; 
	}*/
	 @RequestMapping("/member/main")
	    private String main(){
	        return "/member/main"; 
	}


}
