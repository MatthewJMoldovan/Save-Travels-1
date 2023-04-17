package com.mattmoldovan.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.mattmoldovan.savetravels.models.Expense;

public interface ExpenseRepository extends CrudRepository<Expense,Long> {
	List<Expense> findAll();
}
