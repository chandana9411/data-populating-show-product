package com.niit.bookstore.DAO;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.bookstore.modal.*;

@Repository
public class SupplierDAOImpl implements SupplierDAO{
	@Autowired
	private SessionFactory sessionFactory;


	public SupplierDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public Boolean saveOrUpdate(Supplier supplier) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(supplier);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	
	}
@Transactional
	public Boolean delete(Supplier supplier) {
		
	{     
		try {
			sessionFactory.getCurrentSession().delete(supplier);
			return true;
		}
		 catch (Exception e){
			e.printStackTrace();
		
		return false;
		}
	}
}	
@Transactional
	public List<Supplier> list() {
	@SuppressWarnings({ "unchecked", "deprecation" })
	List<Supplier> listSupplier= (List<Supplier>)
	sessionFactory.getCurrentSession()
	.createCriteria(Supplier.class)
	.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	return listSupplier;

	
}
@Transactional
public Supplier get(int supplier_id) {
	String hql = "from"+" Supplier"+" where supplier_id=" +supplier_id;
	@SuppressWarnings("rawtypes")
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	
	@SuppressWarnings( { "unchecked", "deprecation" })
	List<Supplier> listSupplier = (List<Supplier>) query.list();
	
	if (listSupplier != null && !listSupplier.isEmpty()) {
		return listSupplier.get(0);
	}
	return null;
}


}
