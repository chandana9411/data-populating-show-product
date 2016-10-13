package com.niit.bookstore.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.bookstore.DAO.CategoryDAO;
import com.niit.bookstore.DAO.ProductDAO;
import com.niit.bookstore.DAO.SupplierDAO;
import com.niit.bookstore.modal.*;

@Controller
public class ProductController {
	@Autowired
  ProductDAO productDAO;
	@Autowired
 CategoryDAO categoryDAO;
	@Autowired
 SupplierDAO supplierDAO;
	//private Path path;
	
	
	 @RequestMapping(value = "/productgson" )
	 @ResponseBody
	 public String ProductGson() {
	  List<Product> list = productDAO.list();
	  Gson gson = new Gson();
	  String data = gson.toJson(list);
	  return data;
	 }
	 
	@RequestMapping(value="/Product",method = RequestMethod.GET)
	public ModelAndView landPage(@ModelAttribute("product")Product product,BindingResult result,Model model)
	{
		
		ModelAndView mv=new ModelAndView("/Product");
		mv.addObject("userclickedproduct", "true");
		mv.addObject("allproduct",productDAO.list());
		mv.addObject("allCategory",categoryDAO.list());
		mv.addObject("allSupplier",supplierDAO.list());
		return mv;
		
	}
	 
	/*@RequestMapping(value = { "addproduct" }, method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, HttpServletRequest request,
			RedirectAttributes attributes) {
		attributes.addFlashAttribute("SuccessMessage", "Product has been added/Updated Successfully");
		productDAO.saveOrUpdate(product);
		MultipartFile file = product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "\\resources\\image\\product\\" + product.getProduct_id() + ".jpg");
		if (file != null && !file.isEmpty()) {
			try {
				System.out.println("Image Saving Start");
				file.transferTo(new File(path.toString()));
				System.out.println("Image Saved");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error");
				throw new RuntimeException("item image saving failed.", e);
			}
		
		}
		
		return "redirect:/Product";
	}	*/
	@RequestMapping(value="/addProduct")
	public String addProduct(@ModelAttribute("product") Product product , Model model,HttpServletRequest request, MultipartFile file) throws IOException
	{
	            productDAO.saveOrUpdate(product);
	    		System.out.println("Data Inserted");
	            //String path = request.getSession().getServletContext().getRealPath("/resources/image/" + user.getUserid() + ".jpg");
	    		MultipartFile image = product.getImage();
	            //Path path;
	            String path = request.getSession().getServletContext().getRealPath("/resources/image/product/"+product.getProduct_id()+".jpg");
	            System.out.println("Path="+path);
	            System.out.println("File name = " + product.getImage().getOriginalFilename());
	          
	            if(image!=null && !image.isEmpty())
	            {
	            	try
	            	{
	            		image.transferTo(new File(path.toString()));
	            		System.out.println("Image saved  in:"+path.toString());
	            	}
	            	catch(Exception e)
	            	{
	            		e.printStackTrace();
	            		System.out.println("Image not saved");
	            	}
	            }
	    	
	     	    
	    return "redirect:/Product";
	
		
	}
	@RequestMapping(value="/producteditItemById/{product_id}")
	public String editItem(@PathVariable("product_id") int product_id,RedirectAttributes redirectAttributes)
	{
		redirectAttributes.addFlashAttribute("product",productDAO.get(product_id));
		return "redirect:/Product";
		
}
	@RequestMapping(value="/productdeleteById/{product_id}")
	public String deleteItem(@PathVariable("product_id") int product_id,Product product)
	{
		productDAO.delete(product);
		return "redirect:/Product";
		
}
}
