package com.study.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class lsc_BoardController {

	@RequestMapping("/board")
	public String board() {
		return "lsc_board";
	}
}
