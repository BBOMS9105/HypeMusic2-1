package com.study.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class lsc_MyinfoController {

	@RequestMapping("/myinfo")
	public String info(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
    	
		// 세션에서 계정 정보를 읽어옵니다
    	String id = (String) session.getAttribute("id");
    	Integer age = (Integer) session.getAttribute("age");
    	String preference = (String) session.getAttribute("preference");
    	Integer rank = (Integer) session.getAttribute("rank");
    	String name = (String) session.getAttribute("name");
    	String email = (String) session.getAttribute("email");
    	String nickname = (String) session.getAttribute("nickname");
    	
        System.out.println("내정보");
        System.out.println("id : " + id);
        System.out.println("age : " + age);
        System.out.println("preference : " + preference);
        System.out.println("rank : " + rank);
        System.out.println("name : " + name);
        System.out.println("email : " + email);
        System.out.println("nickname : " + nickname);
        
		return "lsc_myinfo";
	}
	
	// 정보수정
	@RequestMapping("/infoUpdate")
	public String update() {
		return "lsc_infoUpdate";
	}
	
	// 비밀번호 변경
	@RequestMapping("/pwUpdate")
	public String pwUpdate() {
		return "lsc_pwUpdate";
	}
}
