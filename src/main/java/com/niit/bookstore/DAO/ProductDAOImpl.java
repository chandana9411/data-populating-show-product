package com.niit.bookstore.DAO;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.bookstore.modal.Product;


@SuppressWarnings("deprecation")
@Repository
public class ProductDAOImpl implements ProductDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;


	public ProductDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean saveOrUpdate(Product product){
		try {
			   logger.debug("Session started");
			sessionFactory.getCurrentSession().saveOrUpdate(product);
			   logger.debug("Product has been saved:"+product.getProduct_id());
			return true;
		} catch (Exception e) {
			   logger.error("Operation failed");
			e.printStackTrace();
			return false;
		}
	
	} 

	@Transactional
	public boolean delete(Product product)
	    {     
		try {
			logger.info("Product deletion started");
			sessionFactory.getCurrentSession().delete(product);
			  logger.info("Product Id:"+product.getProduct_id()+"has been deleted");
			return true;
		}
		 catch (Exception e){
			  logger.error("Delete operation failed");
			e.printStackTrace();
		
		return false;
		}
		}

	@Transactional
	public Product get(int product_id) {
		String hql = "from"+" Product"+" where product_id=" +product_id;
		//@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) query.list();
		
		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		
		return null;
	}
	
	//@SuppressWarnings("deprecation")

	@Transactional
  public List<Product> list(){
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>)
		sessionFactory.getCurrentSession()
		.createCriteria(Product.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listProduct;
	}
	@Transactional
	public Object getproduct(int product_id) {
		
		  @SuppressWarnings("unchecked")
		  
		 
		   String hql="from Product where product_id= "+product_id;
		   @SuppressWarnings("rawtypes")
		   Query query = sessionFactory.getCurrentSession().createQuery(hql);
		   List<Product> listProduct = (List<Product>) query.list();
		   return listProduct;
		  }

	}



