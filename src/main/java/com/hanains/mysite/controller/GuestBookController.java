package com.hanains.mysite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanains.mysite.service.GuestBookService;
import com.hanains.mysite.vo.GuestBookVo;
@Controller
@RequestMapping("/guestbook")
public class GuestBookController {

	@Autowired
	private GuestBookService service;
	
	@RequestMapping("/")
	public String list(Model model){
		model.addAttribute("list",service.getList());
		return "/guestbook/list";
	}
	
	@RequestMapping("/add")
	public String add(@ModelAttribute GuestBookVo vo){
		if(vo.getMessage().trim().length()==0 || vo.getName().trim().length()==0 || vo.getPassword().trim().length()==0||vo.getMessage().contains("script")||vo.getName().contains("script")) return "redirect:/guestbook/?result=fail";
		service.add(vo);
		return "redirect:/guestbook/";
	}
	
	@RequestMapping("/deleteform")
	public String deleteform(){
		return "/guestbook/deleteform";
	}
	
	@RequestMapping("/delete")
	public String delete(@ModelAttribute GuestBookVo vo){
		service.delete(vo);
		return "redirect:/guestbook/";
	}
}
