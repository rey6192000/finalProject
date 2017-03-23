package com.csc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.csc.dao.CustomerDAO;
import com.csc.model.Customer;

@Service
@Transactional
@EnableTransactionManagement
public class CustomerServiceImpl implements CustomerService {

	private CustomerDAO customerDAO;
	
	public CustomerDAO getCustomerDAO() {
		return customerDAO;
	}

	@Autowired
	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	public void saveOrUpdate(Customer customer) {
		customerDAO.saveOrUpdate(customer);
	}

	public Customer getById(int id) {
		return customerDAO.getById(id);
	}

	public List<Customer> getAll() {
		return customerDAO.getAll();
	}

	public List<Customer> search(String searchField, String inputValue) {
		return customerDAO.search(searchField, inputValue);
	}

	public void insertSample()
	{
		customerDAO.insertSample();
	}
}
