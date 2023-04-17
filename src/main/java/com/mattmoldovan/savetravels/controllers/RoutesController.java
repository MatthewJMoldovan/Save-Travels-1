package com.mattmoldovan.savetravels.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.mattmoldovan.savetravels.models.Expense;
import com.mattmoldovan.savetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
public class RoutesController {
	@Autowired
	private ExpenseService expenseService;
	
	@GetMapping("/")
	public String dashboard(Model model) {
		model.addAttribute("expenseList", expenseService.allExpenses());
		model.addAttribute("newExpense", new Expense());
		return "dashboard.jsp";
	}
	
	@PostMapping("/process")
	public String processDashboardCreate(@Valid @ModelAttribute("newExpense") Expense newExpense, BindingResult result,
	Model model ) {
		if(result.hasErrors()) {
			model.addAttribute("expenseList", expenseService.allExpenses());
			return "dashboard.jsp";
		} else {
			expenseService.createExpense(newExpense);
			return"redirect:/";
		}
		
	}
	
	@GetMapping("/expenses/{id}")
	public String displayOneExpense(@PathVariable("id")Long id, Model model)
	{
		Expense oneExpense = expenseService.findExpense(id);
		model.addAttribute("oneExpense", oneExpense);
		return "oneExpense.jsp";
	}
	
	@GetMapping("/expenses/edit/{id}")
	public String editOneExpense(@PathVariable("id")Long id, Model model)
	{
		Expense oneExpense = expenseService.findExpense(id);
		model.addAttribute("oneExpense", oneExpense);
		return "editExpense.jsp";
	}
	
	@PutMapping("/expenses/edit/{id}")
	public String processEdit(@Valid @ModelAttribute("oneExpense") Expense oneExpense, BindingResult result,
			@PathVariable("id")Long id, Model model) {
		if(result.hasErrors()) {
			return "editExpense.jsp";
		} else {
			expenseService.updateExpense(oneExpense);
			return "redirect:/expenses/{id}";
		}
	}
	
	@DeleteMapping("/expenses/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/";
	}
}
