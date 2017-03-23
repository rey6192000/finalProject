package com.csc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.csc.model.Customer;
import com.csc.service.CustomerService;
import com.google.gson.Gson;

@Controller
public class IndexController {

	@Autowired
	private CustomerService service;
	
	public CustomerService getService() {
		return service;
	}

	public void setService(CustomerService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/")
	public String index(){
		return "index";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Map<String, Object> model){
		Customer userForm = new Customer();		
		model.put("userForm", userForm);
		
		return "Registration";
	}
	
	@RequestMapping(value = "/register" ,method = RequestMethod.POST)
	@ResponseBody
	public String doRegister(@ModelAttribute("userForm") Customer customer, Map<String, Object> model){
		service.saveOrUpdate(customer);
		return customer.toString();
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Map<String, Object> model){
		
		return "Search";
	}
	
	@RequestMapping(value = "/dosearch", method = RequestMethod.POST)
	public ModelAndView doSearch(HttpServletRequest request, @RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("Search");
        String searchField = request.getParameter("search-field");
		String inputValue = request.getParameter(searchField);
		List<Customer> customers = service.search(searchField, inputValue);
		String json = new Gson().toJson(customers);
		
		modelAndView.addObject("customerList", json);

        return modelAndView;
    }
	
	@RequestMapping(value = "/showall", method = RequestMethod.GET)
	public ModelAndView show(HttpServletRequest request, @RequestParam(required = false) Integer page){
		ModelAndView modelAndView = new ModelAndView("All");
		List<Customer> customers = service.getAll();
		
        PagedListHolder<Customer> pagedListHolder = new PagedListHolder<Customer>(customers);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount()) {
        	page=1;
        }

        modelAndView.addObject("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("customerList", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("customerList", pagedListHolder.getPageList());
        }

        return modelAndView;
	}
	
	@RequestMapping(value = "/insertsample", method = RequestMethod.GET)
	public String insetSample(Map<String, Object> model){
		service.insertSample();
		return "Success";
	}
}
