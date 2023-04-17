<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Save Travel</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light sticky-top justify-content-between m-2 mb-2 px-4 rounded border">
		<h1 class="navbar-brand mb-0 fs-1">Save Travel</h1>
		<div>
			<a class="btn btn-success" href="/">Home</a>
		</div>
	</nav>
	<div class="w-75 p-4 mx-auto">
		<div class="shadow mb-4 rounded border p-4 text-start">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">Expense</th>
						<th class="text-center">Vendor</th>
						<th class="text-center">Amount</th>
						<th class="text-center" colspan=2>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="eachExpense" items="${expenseList }">
						<tr>
							<td class="text-center align-middle"><a
								href="/expenses/${eachExpense.id}"><c:out
										value="${eachExpense.expenseName }"></c:out></a></td>
							<td class="text-center align-middle"><c:out
									value="${eachExpense.vendor }"></c:out></td>
							<td class="text-center align-middle"><c:out
									value="${eachExpense.amount }"></c:out></td>


							<td class="d-flex justify-content-evenly"><a
								class="btn btn-outline-warning"
								href="/expenses/edit/${eachExpense.id}">Edit</a>
								<form action="/expenses/${eachExpense.id }" method="POST">
									<input type="hidden" name="_method" value="delete">
									<button class="btn btn-outline-danger" type="submit">Delete</button>
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="shadow mb-4 rounded border p-4 text-start">
			<form:form action="/process" method="POST"
				modelAttribute="newExpense">
				<div class="formGroup">
					<div>
						<form:label path="expenseName"> Expense Name </form:label>
						<form:input class="form-control" type="text" path="expenseName" />
						<form:errors path="expenseName" />
					</div>
					<div>
						<form:label path="vendor"> Vendor </form:label>
						<form:input class="form-control" type="text" path="vendor" />
						<form:errors path="vendor" />
					</div>
					<div>
						<form:label path="amount">Amount</form:label>
						<form:input class="form-control" type="text" path="amount" />
						<form:errors path="amount" />
					</div>
					<div>
						<form:label path="description"> description </form:label>
						<form:textarea class="form-control" path="description" />
						<form:errors path="description" />
					</div>
					<button class="mt-2 btn btn-primary" type="submit">Submit</button>
				</div>
			</form:form>
		</div>

	</div>
</body>
</html>