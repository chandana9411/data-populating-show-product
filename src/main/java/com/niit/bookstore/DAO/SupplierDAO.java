package com.niit.bookstore.DAO;
import java.util.List;
import com.niit.bookstore.modal.*;

public interface SupplierDAO {

	public Boolean saveOrUpdate(Supplier supplier);
    public Boolean delete(Supplier supplier);
    public Supplier get(int supplier_id);
    public List<Supplier> list();

}
