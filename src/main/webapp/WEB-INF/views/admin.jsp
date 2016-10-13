<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Admin</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 5px;
      border-radius: 0;
    }
    .bg-1 {
      background-color: #1abc9c;
      color: #ffffff;
  }
 div.container
{
width: 100%;
}
header
{
 padding:01em;color:blue; background-color :white ;clear: left;text-align: center;font-family=algerian;
 }
 
 /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
</style>

</head>
<body>
<div class="page header">
  <div class="container text-center">
  <header>
    <h1>BIBLIO</h1>      
    <p> Explore the world of books</p>
  
  </header>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="Home">Home</a></li>
        <li><a href="Product">Product</a></li>
        <li><a href="Supplier"> Supplier</a></li>
        <li><a href="Category"> Category</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="home">logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid bg-1 text-center">
  <div class="container text-center"> 
    <h3 class="margin">BOOK STORE</h3>
    <img src="C:/Users/saichandana/Desktop/html book/imgBooksSlider.gif" class="img-circle" alt="Bird" width="350" height="350">
    <h3>ENTER INTO ADMIN'S WORLD</h3>
    </div>
  </div>


${msg}
<c:choose>
<c:when test="${userclickedsupplier }">
<c:import url="/WEB-INF/views/Supplier.jsp"/>
</c:when>
</c:choose>
<c:choose>
<c:when test="${userclickedproduct }">
<c:import url="/WEB-INF/views/Product.jsp"/>
</c:when>
</c:choose>
<c:choose>
<c:when test="${userclickedcategory }">
<c:import url="/WEB-INF/views/Category.jsp"/>
</c:when>
</c:choose>
<c:choose>
<c:when test="${userclickedhome}">
<c:import url="/WEB-INF/views/Home.jsp"/>
</c:when>
</c:choose>


<div class="container">
    <hr>
        <div class="text-center center-block">
            <p class="txt-railway">Biblio |All Copyrights Reserved@</p>
            <br />
                <a href="https://www.facebook.com/bootsnipp"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
	            <a href="https://twitter.com/bootsnipp"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
	            <a href="https://plus.google.com/+Bootsnipp-page"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
	            <a href="mailto:bootsnipp@gmail.com"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a>
</div>
    <hr>
</div>

</body>
</html>