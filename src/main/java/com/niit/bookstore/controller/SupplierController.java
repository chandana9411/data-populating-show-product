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
public class SupplierController {
	@Autowired
	private SupplierDAO supplierDAO;

	 @RequestMapping(value = "/suppliergson" )
	 @ResponseBody
	 public String SupplierGson() {
	  List<Supplier> list = supplierDAO.list();
	  Gson gson = new Gson();
	  String data = gson.toJson(list);
	  return data;
	 }
	
	@RequestMapping(value="/Supplier",method = RequestMethod.GET)
	public ModelAndView landPage(@ModelAttribute("supplier")Supplier supplier,BindingResult result,Model model)
	{
		ModelAndView mv= new ModelAndView("/Supplier");
		mv.addObject("userclickedsupplier", "true");
		mv.addObject("allSupplier",supplierDAO.list());
		return mv;
	}
	 
	
	@RequestMapping(value="/addsupplier")
public String addItem(@ModelAttribute("supplier")Supplier supplier){
	
		this.supplierDAO.saveOrUpdate(supplier);
		return "redirect:/Supplier";
		
	}
	@RequestMapping(value="/suppliereditItemById/{supplier_id}")
	public String editItem(@PathVariable("supplier_id") int supplier_id,RedirectAttributes redirectAttributes)
	{
		redirectAttributes.addFlashAttribute("supplier", this.supplierDAO.get(supplier_id));
		return "redirect:/Supplier";
		
}
	@RequestMapping(value="/supplierdeleteById/{supplier_id}")
	public String deleteItem(@PathVariable("supplier_id") int supplier_id,Supplier supplier)
	{
		supplierDAO.delete(supplier);
		return "redirect:/Supplier";
		
}
	}