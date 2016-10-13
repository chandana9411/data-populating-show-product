<html lang="en">
<head>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <title>BIBLIO | Online Book Store</title>
<html>
<head>

<script type="text/javascript">
function checkAndSubmit()
{
document.formID.submit();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


  <style>
table {
    border-collapse: collapse;
    width: 100%;
}
th, td {
    text-align: left;
    padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
th {
    background-color: black;
    color: white;
}
</style>
</head>
<body background="" ng-app="myApp">
<h1>Your Cart</h1>
${emptycart}


<table style="width:100%">
<tr>
<th>Product Name</th>
<th>price</th>
<th>Delete</th>
<th>quantity</th>
</tr>


<c:forEach items="${cartList}" var="cart">
<tr>
<td><c:out value="${cart.productname }"/></td>
<td><c:out value="${cart.price }"/></td>
<td><a href="delete/${cart.id}">delete</a></td>
<td><c:out value="${cart.quantity }"></c:out></td>

</c:forEach></table>

      
    <tfoot>
      <tr class="visible-xs">
       <td class="text-center"><strong>Total : Rs ${cartprice}</strong></td>
      </tr>
      <tr>
      <br>
       <td><a href="Home" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
    
       <td colspan="2" class="hidden-xs"></td>
       <br>
   <form action="placeorder">
  <div  class="col-xs-3"></div>
 <td><a href="checkoutFlow" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
      </tr>
     </tfoot>
</body>
</html>
</body>

</html>