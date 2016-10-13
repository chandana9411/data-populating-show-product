package com.niit.bookstore.DAO;
import java.util.List;

import com.niit.bookstore.modal.Category;

public interface CategoryDAO {
public Boolean saveOrUpdate(Category category);
	
	public Boolean delete(Category category);
	
	public Category get(int category_id);
	
	public List<Category> list();
}