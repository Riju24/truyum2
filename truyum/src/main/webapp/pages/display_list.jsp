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
#search
{
	color:white;
	width:100%;
	margin:auto;
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
<div class ="container-fluid">

<div class ="row">
	<div class ="col-lg-12 col-sm-12">
		<h2>Menu Items</h2>
		<p class="mes">${msg}</p>
		<div class="row">
			<c:forEach items="${items}" var="menu">
				<div class="col-lg-4 col-sm-12 col-md-6 mb-2">
           			<div class="card" style="width: 18rem;">
  						<img class="card-img-top" src="photos\<c:out value ="${menu.id}"/>.jpg" alt="Card image cap">
  						<div class="card-body">
    						<div class="row">
   								 <div class="col-8">
        							<h5 class="card-title text-left">${menu.name}</h5>
    							 </div>
    							 <div class="col-4">
      								<span><p class="text-right">${menu.price}</p></span>
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
  							<div class="row">
      							<div class="col-8">
        								<p class="course mt-0 mb-1">Launch</p>
        								<p class="course">${menu.dateOfLaunch}</p>
      							</div>

      							<div class="col-4">
        							<a href="update?id=<c:out value="${menu.id}"/>" class="btn btn-danger float-right">Edit</a>
  								</div>
     					 	</div>
  						</div>
  					
  					</div>
  					</div>
 </c:forEach>
 </div>
 </div>

</div>
	<br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>