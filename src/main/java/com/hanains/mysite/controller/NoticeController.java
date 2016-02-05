package com.hanains.mysite.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hanains.mysite.annotation.Auth;
import com.hanains.mysite.annotation.AuthUser;
import com.hanains.mysite.service.NoticeService;
import com.hanains.mysite.vo.NoticeVo;
import com.hanains.mysite.vo.UserVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@Auth
	@RequestMapping("/")
	public String list(Model model,@RequestParam(value="pg", required=true, defaultValue="1") long pg, @RequestParam(value="kwd", required=true, defaultValue="") String kwd,
			@RequestParam(value="searchType", required=false) String searchType ){
		Map<String, Object> data = service.list(pg,kwd,searchType);
		model.addAttribute("data", data);
		return "/notice/list";
	}
	
	@Auth
	@RequestMapping("/view")
	public String view(Model model, @RequestParam("no") long no, @AuthUser UserVo authUser){
		service.upCount(no);
		model.addAttribute("vo", service.getView(no));
		return "/notice/view";
	}
	
	@Auth
	@RequestMapping("/delete")
	public String delete(@RequestParam("no") long no, @AuthUser UserVo authUser){
		if(!"admin".equals(authUser.getEmail()) ) return "redirect:/notice/?result=fail";
		service.delete(no);
		return "redirect:/notice/";
	}
	
	@Auth
	@RequestMapping("/modifyform")
	public String modifyform(Model model, @RequestParam("no") long no){
		model.addAttribute("vo", service.getView(no));
		return "/notice/modifyform";
	}
	
	@Auth
	@RequestMapping("/modify")
	public String modify(Model model, @ModelAttribute NoticeVo vo,@RequestParam( "file" ) MultipartFile file){
		if(vo.getTitle().trim().length()==0||vo.getTitle().contains("script")||vo.getContent().contains("script")){
			model.addAttribute("vo", service.getView(vo.getNo()));
			model.addAttribute("result", "fail");
			return "/notice/modifyform";
		}
		service.modify(vo,file);
		return "redirect:/notice/";
	}

	@Auth
	@RequestMapping("/writeform")
	public String writeform(Model model, @ModelAttribute NoticeVo vo){
		model.addAttribute("vo", vo);
		return "/notice/writeform";
	}
	
	@Auth
	@RequestMapping("/write")
	public String write(@ModelAttribute NoticeVo vo,@RequestParam( "file" ) MultipartFile file){
		if(vo.getTitle().trim().length()==0||vo.getTitle().contains("script")||vo.getContent().contains("script")) return "redirect:/notice/writeform?result=fail";
		service.write(vo,file);
		return "redirect:/notice/";
	}

}
