package com.cognizant.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cognizant.model.Customer;
import com.cognizant.model.MenuItem;
import com.cognizant.service.CartService;
import com.cognizant.service.MenuService;
import com.cognizant.service.UserService;
import com.cognizant.validation.MenuValidator;

@Controller
public class TruyumController {

	@Autowired
	MenuService menuService;
	
	@Autowired
	CartService cartService;
	
	@Autowired 
	UserService userService;
	
	@Autowired
	MenuValidator menuValidator;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder)
	{
		binder.addValidators(menuValidator);
	}
	
	
	
	
	
	@RequestMapping(value="index")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	
	@RequestMapping(value="adminlog")
	public ModelAndView log()
	{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("log");
		
		return mv;
	}
	
	
	@RequestMapping(value="adminlog", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("redirect:admin");
		
		if(request.getParameter("id").equalsIgnoreCase("admin"))
		{
			if(request.getParameter("password").equalsIgnoreCase("admin"))
			{
				return mv;
			}
		}
		
		return log();
	}
	
	
	@RequestMapping(value="admin")
	public ModelAndView admin()
	{
		ModelAndView mv = new ModelAndView();
		
		List<MenuItem> items = menuService.getItems();
		for(MenuItem m: items)
		{
			System.out.println(m);
		}
		mv.addObject("items", items);
		mv.setViewName("display_list");
		return mv;
	}
	
	@RequestMapping(value="update")
	public ModelAndView update(@ModelAttribute("MenuItem") MenuItem menuItem, @RequestParam("id") int id)
	{
		ModelAndView mv = new ModelAndView();
		
		MenuItem m =menuService.getMenuItem(id);
		System.out.println(m);
		mv.addObject("item", m);
		mv.setViewName("update");
		return mv;
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public ModelAndView update1(@ModelAttribute("MenuItem") @Validated MenuItem menuItem, BindingResult result)
	{
		ModelAndView mv = new ModelAndView();
		
		if(result.hasErrors())
		{
			mv.setViewName("update");
			return mv;
		}
		
		menuService.updateMenuItem(menuItem);
		mv = admin();
		mv.addObject("msg", "Record Updated Sucessfully");
		return mv;
	}
	
	@RequestMapping(value="delete")
	public ModelAndView delete(@RequestParam("id") int id)
	{
		ModelAndView mv = new ModelAndView();
		
		menuService.deleteItem(id);
		mv = admin();
		mv.addObject("msg", "Record Deleted Sucessfully");
		return mv;
		
	}
	
	
	@RequestMapping(value="insert")
	public ModelAndView insert()
	{
		ModelAndView mv = new ModelAndView();
		int size = menuService.getItems().size()+1;
		
		mv.addObject("count",size);
		mv.setViewName("insert");
		return mv;
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public ModelAndView insert1(@ModelAttribute("MenuItem") @Validated MenuItem m)
	{
		ModelAndView mv = new ModelAndView();
		
		menuService.insertMenuItem(m);
		
	
		mv = admin();
		mv.addObject("msg", "Record Inserted Sucessfully");
		return mv;
	}
	
	
	
	//-------------------------------------Customer----------------------------------------------------

	@RequestMapping(value="customer")
	public ModelAndView customerMenu()
	{
		ModelAndView mv = new ModelAndView();
		List<MenuItem> items = cartService.getMenuItems();
		List<MenuItem> custItems = cartService.getCustomerItems();
		
		double amount = cartService.checkout();
		mv.setViewName("checkout");
		mv.addObject("total", amount);
		
		
		mv.addObject("menuitems",items);
		mv.addObject("custitems",custItems);
		mv.setViewName("customermenu");
		return mv;
	}
	@RequestMapping(value="addtocart")
	public ModelAndView addToCart(@RequestParam("id") int id)
	{
		ModelAndView mv = new ModelAndView("redirect:customer");
		
		cartService.addCart(id);
		
		return mv;
	}
	@RequestMapping(value="remove")
	public ModelAndView remove(@RequestParam("id") int id)
	{
		ModelAndView mv = new ModelAndView("redirect:customer");
		
		cartService.removeCart(id);
		
		mv.addObject("msg", "Removed from Cart Sucessfully");
		return mv;
	}
	@RequestMapping(value="checkout")
	public ModelAndView checkout()
	{
		ModelAndView mv = new ModelAndView();
	
		double amount = cartService.checkout();
		mv.setViewName("checkout");
		
		double tax =amount*0.1;
		double total=amount+tax;
		
		List<MenuItem> custItems = cartService.getCustomerItems();
		Customer cus = userService.getDetails();
		mv.addObject("cus",cus);
		mv.addObject("items",custItems);
		mv.addObject("tax",tax);
		mv.addObject("amount",total);
		mv.addObject("total", amount);
		return mv;
	}
	
	@RequestMapping(value="register")
	public ModelAndView register()
	{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("register");
		return mv;
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public ModelAndView register1(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("redirect:customer");
		
		
		userService.putDetails(request);
		return mv;
	}
	
	@RequestMapping(value="done")
	public ModelAndView done()
	{
		ModelAndView mv = new ModelAndView("redirect:index");
		
		userService.deleteCart();
		return mv;
	}
	

}
