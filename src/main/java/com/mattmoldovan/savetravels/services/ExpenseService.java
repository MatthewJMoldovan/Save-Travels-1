package com.mattmoldovan.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mattmoldovan.savetravels.models.Expense;
import com.mattmoldovan.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	@Autowired
	private ExpenseRepository expenseRepo;

	public List<Expense> allExpenses() {
		return expenseRepo.findAll();
	}

	public Expense createExpense(Expense newExpense) {
		return expenseRepo.save(newExpense);
	}

	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepo.findById(id);
		if (optionalExpense.isPresent()) {
			return optionalExpense.get();
		}
		return null;
	}

	public void deleteExpense(Long id) {
		expenseRepo.deleteById(id);
	}

	public Expense updateExpense(Expense oneExpense) {
		return expenseRepo.save(oneExpense);
	}
}
