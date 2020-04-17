package com.cognizant.validation;

import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cognizant.model.MenuItem;

@Component
public class MenuValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		
		return MenuItem.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		MenuItem menu = (MenuItem)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id","","Cannot be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name","","Item Name is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price","","Price is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price","","Price can only contain numbers");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "active","","Select in stock status");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "category","","Select at least one category");
		
		if(menu.getName().length()>200)
		{
			errors.rejectValue("name", "", "Item name cannot exceed 200 characters");
		}
		
		
	}

	
}
