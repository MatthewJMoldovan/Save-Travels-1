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
<title>Save Travels</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light sticky-top justify-content-between m-2 mb-2 px-4 rounded border">
		<h1 class="navbar-brand mb-0 fs-1">Edit Burger</h1>
		<div>
			<a class="btn btn-success" href="/">Home</a>
		</div>
	</nav>
	<div class="w-75 p-4 mx-auto">
		<div class="shadow mb-4 rounded border p-4 text-start">
			<form:form action="/expenses/edit/${oneExpense.id}" method="PUT"
				modelAttribute="oneExpense">
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