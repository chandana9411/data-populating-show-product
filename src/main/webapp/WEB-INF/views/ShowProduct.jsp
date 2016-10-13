<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SHOW PRODUCT</title>
</head>
<body>

<c:forEach items="${IndividualProduct}" var="product">
   <div class="col-xs-3 ">
    <div class="img"><a href="ShowProduct/${product.product_id}"></a>

<h4>ProductName: <c:out value="${product.name }"/></h4>
<div class="thumbnail">
<a href="ShowProduct/${product.product_id}" > <img height="250px" width="250px" alt="${product.product_id }"
 src="<c:url value="/resources/image/product/${product.product_id }.jpg"></c:url>"></a>
  </div>
  <div align="centre">
  ProductDescription: <c:out value="${product.description}"/><br>
  ProductPrice: <c:out value="${product.price }"/><br>
    </div>
    </div>
    </div>
</c:forEach>
</body>
</body>
</html>