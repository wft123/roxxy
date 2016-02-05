package com.hanains.mysite.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanains.mysite.service.NoticeService;
import com.hanains.mysite.vo.NoticeVo;

@Controller
public class MainController {
	
	@Autowired
	private NoticeService service;

	@RequestMapping("/")
	public String index( Model model,@RequestParam(value="pg", required=true, defaultValue="1") long pg, @RequestParam(value="kwd", required=true, defaultValue="") String kwd,
			@RequestParam(value="searchType", required=false) String searchType ){
		Map<String, Object> data = service.list(pg,kwd,searchType);
		model.addAttribute("data", data);
		return "/main/index";
	}
}
