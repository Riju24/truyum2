<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Cart</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>

.wrapper {
  position: relative;
  display: inline-block;
  width:100%;
}

img {
  width: 100%;
  height: 20vw;
  border: 1px solid;
}
.search-wrapper {
  position: absolute;
  top: 0;
  left:0 ;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  
}

.search-wrapper input {
  width: 100%;
  padding-left:40px;
  margin-left:60px;
  margin-right:60px;
}
.food
{
 position: absolute;
  top: 20%;
  margin-left:20px;
  padding-left:40px;
  color:yellow;
}

      .course
      {
        font-size: 12px;
      }
      .mes
{
	color:green;
}
</head>


<body>
<jsp:include page="headercus.jsp"></jsp:include>
<div class="wrapper"> 
	<img src="photos\banner.jpg" class="img-fluid" style="max-height:200px;" width=100% alt="Responsive image">
	<div class="search-wrapper">
		<h3 class="food">Find Food</h3>
		<input type="search" placeholder="Search..">
	</div>
</div>
<div class ="container-fluid m-1">
<p class="mes">${msg}</p>
<div class ="row">
	<div class ="col-lg-10 col-sm-12 border">
		<h2>Menu Items</h2>
		<div class="row">
			<c:forEach items="${menuitems}" var="menu">
				<div class="col-lg-4 col-sm-12 col-md-6 mb-2">
           			<div class="card" style="width: 18rem;">
  						<img class="card-img-top" src="photos\<c:out value ="${menu.id}"/>.jpg" alt="Card image cap">
  						<div class="card-body">
    						<div class="row">
   								 <div class="col-8">
        							<h5 class="card-title text-left">${menu.name}</h5>
    							 </div>
    							 <div class="col-4">
      								<span><p class="text-right">Rs.${menu.price}</p></span>
    							 </div>
  							</div>
  							<div class="row">
    							<div class="col-8">
    							<c:choose>
    							<c:when test="${menu.active == true}">
     								<span class="badge badge-success">Active</span><small><span class="course">  ${menu.category}</span></small>
								</c:when>
								<c:otherwise>
									<span class="badge badge-danger">Inactive</span><small><span class="course">  ${menu.category}</span></small>
								</c:otherwise>
								</c:choose>
    							</div>
    							<div class="col-4">
    							<c:choose>
    							<c:when test="${menu.free==true}">
     							 	<div class="badge badge-info float-right">
     							 	
     							 	Free </div>
     							 	</c:when>
     							 	
     
     							</c:choose>
    							</div>
  							</div>
  							<br>
  							<div class="row">
      							
      							<div class="col-12">
        							<a href="addtocart?id=<c:out value="${menu.id}"/>" class="btn btn-danger btn-block">Add to Cart</a>
  								</div>
     					 	</div>
  						</div>
  					
  					</div>
  					</div>
 </c:forEach>
 </div>
 </div>
<div class="col-lg-2 col-sm-12">
<h2> Cart</h2>
<ul class="list-group">
	<c:forEach items="${custitems}" var="menu">
      <li class="list-group-item">
      <div class="row">
          <div class="col-6">${menu.name}</div>
          <div class="col-6 p-2 text-right">Rs.${menu.price}</div>
      </div>
      <div class="row">
        <div class="col-12"><a href = "remove?id=<c:out value="${menu.id}"/>">
        <div class="badge badge-danger float-right">X</div>
        </a>
      </div>
    </li>
      </c:forEach>
       <li class="list-group-item list-group-item-dark">
      <div class="row">
        <div class="col-6">Total</div>
        <div class="col-6 p-1 text-right">Rs.${total}</div>
      </div>
    </li>
     </ul>
	<br><br>
	<a href = "checkout"><button type = "button" class="btn btn-danger">Checkout</button></a>
	
	</div>
	
	</div>
</div>
	<br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>