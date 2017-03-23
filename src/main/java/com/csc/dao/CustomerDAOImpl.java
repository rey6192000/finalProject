package com.csc.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csc.model.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	private SessionFactory sessionFatory;
	
	public void saveOrUpdate(Customer customer) {
		sessionFatory.openSession().saveOrUpdate(customer);
	}

	public SessionFactory getSessionFatory() {
		return sessionFatory;
	}
	
	@Autowired
	public void setSessionFatory(SessionFactory sessionFatory) {
		this.sessionFatory = sessionFatory;
	}

	public Customer getById(int id) {
		return (Customer) sessionFatory.openSession().get(Customer.class, id);
	}

	public List<Customer> getAll() {
		return sessionFatory.openSession().createQuery("From CUSTOMER").list();
	}

	public List<Customer> search(String searchField, String inputValue) {
		List<Customer> result = new ArrayList<Customer>();
		if (searchField != null && inputValue != null) {
			Criteria crit = sessionFatory.openSession().createCriteria(Customer.class);
			crit.add(Restrictions.like(searchField, inputValue,  MatchMode.ANYWHERE));
			result = crit.list();
		}
		return result;
	}

	public void insertSample() {
		List<String> fName = Arrays.asList("Peter", "Gabe", "Sinbad", "May", "Kim", "Obama", "Sydney", "Putin", "Alex", "Pepe");
		List<String> lName = Arrays.asList("Hame", "Jame", "Stark", "Lannister", "Joy", "Bush", "Taka", "Andre", "Modred", "Raina");
		
		for(int i = 0; i <50; i++) {
			Customer cust = new Customer();
			Random randomGenerator = new Random();
			int randomNumbFName = randomGenerator.nextInt(10);
			int randomNumbLName = randomGenerator.nextInt(10);
			int randomAge = randomGenerator.nextInt(60 - 18 + 1) + 18;
			cust.setFirstName(fName.get(randomNumbFName));
			cust.setLastName(lName.get(randomNumbLName));
			cust.setEmail(fName.get(randomNumbFName)+"@gmail.com");
			cust.setAge(randomAge);
			cust.setAddress("Test Address");
			sessionFatory.openSession().save(cust);
		}
		
	}
}
