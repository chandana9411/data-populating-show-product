package com.niit.bookstore.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController
{
	 @RequestMapping(value = "/",method=RequestMethod.GET)
		    public String init(Model model) {
		        model.addAttribute("msg", "Hello ADMIN");
		        return "admin";
		
	}
}
