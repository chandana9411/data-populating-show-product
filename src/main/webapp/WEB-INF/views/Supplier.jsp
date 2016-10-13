<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<script
	src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/app-resources/css/style.css" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>
<title>Admin |supplier</title>

<style>
table {
	border-collapse: collapse;
	width: 60%;
}
.navbar-header {
	font-size: 10px;
}
th, td {
	text-align: left;
	padding: 8px;
}
tr:nth-child(even) {
	background-color: #f2f2f2
}
th {
	background-color: #4CAF50;
	color: white;
}
header {
	padding: 01em;
	color: blue;
	background-color: white;
	clear: left;
	text-align: center;
	font-family
	=algerian;
}
/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}
.navbar {
	margin-bottom: 5px;
	border-radius: 0;
}
</style>
<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'suppliergson'
			}).success(function(data, status, headers, config) {
				$scope.suppliers = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>
</head>
<body>

	<div class="page header">
		<div class="container text-center">
			<header>
				<h1>BIBLIO</h1>
				<p>
					Explore the world of books
					</p>
			</header>
		</div>
	</div>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="admin">Home</a></li>
					<li><a href="Product">Product</a></li>
					<li class="active"><a href="Supplier"> Supplier</a></li>
					<li><a href="Category"> Category</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="home">logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- var = predefined jstl keyword , c:=predefined tag in core library-->

	<c:url var="addAction" value="addsupplier"></c:url>

	<form:form action="${addAction}" modelAttribute="supplier" id="btn-add">
		<h3>
			<c:if test="${supplier.supplier_id==0}">
		       Add New Item
	            </c:if>
			<c:if test="${!empty supplier.supplier_id}">
		      Update Item for Id: <c:out value="${supplier.supplier_id}" />
				<form:hidden path="supplier_id" />
			</c:if>
		</h3>
		<table>
			<!-- test=predefined keyword -->
			<tr>
				<c:if test="${supplier.supplier_id!=0}">
					<td>supplier_id:</td>
					<td><form:input path="supplier_id" /></td>
				</c:if>
			<tr>
				<td>Name:</td>
				<td><form:input type="text" placeholder="supplier"
						class="form-control name" path="name" /></td>
			<tr>
				<td>Address:</td>
				<td><form:input type="text" placeholder="where you live?"
						class="form-control name" path="address" /></td>
			<tr>
				<td colspan="2"><c:if test="${supplier.supplier_id==0}">
						<input type="submit" value="Add" id="btn-add">
					</c:if> <c:if test="${supplier.supplier_id!=0}">
						<input type="submit" value="Update" id="btn-update">
					</c:if></td>
			<tr>
				<td colspan="2" class="success-msg"><c:out value="${msg}" /></td>
		</table>
		<div class="container" data-ng-app="myApp"
			data-ng-controller="MyController" data-ng-init="getDataFromServer()"
			style="overflow: auto; height: 400px; width: 70%">
			<form>
				<input class="w3-input w3-animate-input w3-border w3-round w3-small"
					data-ng-model="search" type="text" placeholder=" Search Supplier"
					style="width: 30%">

			</form>
			<br>

			<table class="table table-striped custab">
				<thead bgcolor="skyblue">
					<tr>
						<td>ID</td>
						<td>Name</td>
						<td>Address</td>
						<td colspan="2">Action</td>
					</tr>
				</thead>
				<%--  <c:forEach var="obj" items="${allSupplier}"> --%>
				<tr
					data-ng-repeat="supplier in suppliers | orderBy:sortType:sortReverse | filter:search">

					<td>{{supplier.supplier_id}}</td>
					<td>{{supplier.name}}</td>
					<td>{{supplier.address}}</td>

					<td><a class="btn btn-danger btn-xs"
						href="supplierdeleteById/{{supplier.supplier_id}}">Delete </a> <a
						class="btn btn-info btn-xs"
						href="suppliereditItemById/{{supplier.supplier_id}}">Edit</a></td>

				</tr>
				<%-- </c:forEach> --%>
			</table>
		</div>
	</form:form>
	<div class="container">
		<hr>
		<div class="text-center center-block">
			<p class="txt-railway">Biblio |All Copyrights Reserved@</p>
			<br /> <a href="https://www.facebook.com/bootsnipp"><i
				id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a> <a
				href="https://twitter.com/bootsnipp"><i id="social-tw"
				class="fa fa-twitter-square fa-3x social"></i></a> <a
				href="https://plus.google.com/+Bootsnipp-page"><i id="social-gp"
				class="fa fa-google-plus-square fa-3x social"></i></a> <a
				href="mailto:bootsnipp@gmail.com"><i id="social-em"
				class="fa fa-envelope-square fa-3x social"></i></a>
		</div>
		<hr>
	</div>

</body>
</html>