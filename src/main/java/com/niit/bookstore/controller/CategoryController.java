package com.niit.bookstore.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.bookstore.DAO.*;
import com.niit.bookstore.modal.*;

@Controller
public class CategoryController {
	@Autowired
	private CategoryDAO categoryDAO;
	
	 @RequestMapping(value = "/categorygson" )
	 @ResponseBody
	 public String CategoryGson() {
	  List<Category> list = categoryDAO.list();
	  Gson gson = new Gson();
	  String data = gson.toJson(list);
	  return data;
	 }
	
	@RequestMapping(value="/Category",method = RequestMethod.GET)
	public ModelAndView landPage(@ModelAttribute("category")Category category,BindingResult result,Model model)
	{
		ModelAndView mv=new ModelAndView("/Category");
		mv.addObject("userclickedcategory", "true");
		mv.addObject("allCategory",categoryDAO.list());
		return mv;
				
	}
	@RequestMapping(value="/addcategory")
public String addItem(@ModelAttribute("category") Category c){
		
		this.categoryDAO.saveOrUpdate(c);
		return "redirect:/Category";
		
	}
	@RequestMapping(value="/categoryeditItemById/{category_id}")
	public String editItem(@PathVariable("category_id") int category_id,RedirectAttributes redirectAttributes)
	{
		redirectAttributes.addFlashAttribute("category", this.categoryDAO.get(category_id));
		return "redirect:/Category";
		
}
	@RequestMapping(value="/categorydeleteById/{category_id}")
	public String deleteItem(@PathVariable("category_id") int category_id,Category category)
	{
		categoryDAO.delete(category);
		return "redirect:/Category";
		
}
	
}