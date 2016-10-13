package com.niit.bookstore.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.bookstore.DAO.*;
import com.niit.bookstore.modal.Product;

@Controller
public class HomeController {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
    
	
@RequestMapping(value={"/Home"},method=RequestMethod.GET)
public String homepage(Model m){
	m.addAttribute("userclickedhome", "true");
	m.addAttribute("product",new Product());
	m.addAttribute("allCategory", categoryDAO.list());
	m.addAttribute("allproduct",productDAO.list());
	
	return "Home";
}
@RequestMapping(value ="ShowProduct/{product_id}" )
public String ShowProduct(@PathVariable("product_id") int product_id,RedirectAttributes attributes,Model m) {
m.addAttribute("userclickedShowProduct", "true");
	m.addAttribute("IndividualProduct", productDAO.getproduct(product_id));
	return "ShowProduct";
}
}
