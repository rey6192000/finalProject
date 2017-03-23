package com.csc.service;

import java.util.List;

import com.csc.model.Customer;

public interface CustomerService {
	public void saveOrUpdate(Customer customer);
	public Customer getById(int id);
	public List<Customer> getAll();
	public List<Customer> search(String searchField, String inputValue);
	public void insertSample();
}
