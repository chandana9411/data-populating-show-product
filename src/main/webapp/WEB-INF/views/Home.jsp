 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home|user page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
   <!-- Bootstrap Core CSS -->
    <link href="C:/Users/saichandana/Desktop/html book/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="C:/Users/saichandana/Desktop/html book/css/shop-homepage.css" rel="stylesheet">
</head>
<body>
<div class="header shop-header">
<body class="animated-all" style="background-color:#E9FBDD;">
  <div class="container">
    
  </div>
  <section class="shop-section ">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-12 col-xs-12 mobile-center">
          <div class="blog-logo text-left logoText">
          
          <img src="C:/Users/saichandana/Desktop/html book/img/logo.png" class="martop">
          <a href="Home.html">BIBLIO</a>
		  <small>Explore the world of books</small> 
          </div>
        </div>
        <div class="col-md-6  col-xs-12 mobile-center margiTop25">
          <div class="input-group top-search">
            <div class="input-group-btn search-panel ">
              <button type="button" class="btn btn-pink dropdown-toggle" data-toggle="dropdown"> <span id="search_concept">Filter by</span> <span class="caret"></span> </button>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#contains">Entertainment</a></li>
                <li><a href="#its_equal">Arts & Photography</a></li>
                <li><a href="#greather_than">Greather than </a></li>
                <li><a href="#less_than">Biography </a></li>                
                <li><a href="#all">Any Book</a></li>
              </ul>
            </div>
            <input type="hidden" name="search_param" value="all" id="search_param">
            <input type="text" class="form-control" name="x" placeholder="Search term...">
            <span class="input-group-btn">
            <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span></button>
            </span> </div>
        </div>
        
      </div>
    </div>
  </section>
  
  <div class="navbar yamm navbar-default ">
  <div class="container-fluid">  
      <div class="navbar yamm">
        <div class="container">
          <nav id="navbar-collapse-1" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active" ><a href="Home.jsp"><i class="fa fa-home"></i> HOME</a></li>
              <li><a href="SIGNIN.html"><i class="fa fa-lock"></i> SIGN IN</a></li>
              <li><a href="REGISTER.html"><i class="fa fa-edit"></i> REGISTER</a></li>
              <li><a href="ABOUTUS.html"><i class="fa fa-user"></i> ABOUT US</a></li>
              <li ><a href="CONTACTUS.html"><i class="fa fa-globe"></i> CONTACT US</a></li>             
              
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
      <div class="thumbnail">
        <img src="C:/Users/saichandana/Desktop/html book/img/451793.jpg" alt="Chania" width="460" height="345">
      </div>
      </div>

      <div class="item">
       <div class="thumbnail">
        <img src="C:/Users/saichandana/Desktop/html book/img/451793(1).jpg" alt="Chania" width="460" height="345">
      </div>
      </div>
    
      <div class="item">
      <div class="thumbnail">
        <img src="C:/Users/saichandana/Desktop/html book/img/books-wallpaper2.jpg" alt="Flower" width="460" height="345">
      </div>
      </div>
</div>
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  
</div>


	 <c:forEach items="${allproduct}" var="product">
	 <div class="responsive">
	 <div class="img">
 		
 		
 		  <div class="thumbnail">
 			 <div class="col-md-4">
						<a href="ShowProduct/${product.product_id}"> <img height="200px"
							width="200px" alt="${product.product_id }"
							src="<c:url value="/resources/image/product/${product.product_id }.jpg"></c:url>"></a>
 	      
 	        <div class="desc">
         	<c:out value="${product.name}" />
         	<sec:authorize access="isAuthenticated()">
			<c:url var="action" value="addtocart/${product.product_id}"></c:url>
			<form:form action="${action}" commandName="cart">
			<input type="submit" class="btn btn-primary" value="Add To Cart" />
			
			</form:form>
			</sec:authorize>
			</div>
			</div>
			</div>
			</div>
			</c:forEach>
			<div ng-view></div>
			$IndividualProduct
<c:choose>
<c:when test="${userclickedShowProduct}">
        <c:import url="/WEB-INF/views/ShowProduct.jsp"/>
</c:when>
</c:choose>

<!-- <div class="row">
            <div class="col-lg-12">
                <h3>Latest Collections</h3>
            </div>
        </div>



<div col-md-9>
                <div class="row">

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">250/-</h4>
                                <h4><a href="#">First Product</a>
                                </h4>
                                <p>book.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$64.99</h4>
                                <h4><a href="#">Second Product</a>
                                </h4>
                                <p>book.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">12 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$74.99</h4>
                                <h4><a href="#">Third Product</a>
                                </h4>
                                <p>book.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$84.99</h4>
                                <h4><a href="#">Fourth Product</a>
                                </h4>
                                <p>book.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">6 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$94.99</h4>
                                <h4><a href="#">Fifth Product</a>
                                </h4>
                                <p>book.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
               </div>
</div>
 -->
 <footer class="footer footer-shop">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12">
        <p>All Copyrights Reserved.</p>
        
      </div>
      
      
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        
        <div class="icons">         
          
            <ul class="social-links">
                           <a  href="https://www.facebook.com/"><i class="fa fa-facebook" style="font-size:20px;color:white"></i></a>
              <a target="_blank" href="https://twitter.com/"><i class="fa fa-pinterest-p" style="font-size:20px;color:white"></i></a>
              <a target="_blank" href="https://www.pinterest.com"><i class="fa fa-twitter" style="font-size:20px;color:white"></i></a>
              <a target="_blank" href="https://www.google.com"><i class="fa fa-google-plus" style="font-size:20px;color:white"></i></a>
            </ul>
         
        </div>
      </div>
    </div>
  </div>
</footer>

</body>

</html>