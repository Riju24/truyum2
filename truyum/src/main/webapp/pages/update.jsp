<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Record</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<style>

.heading
{
	margin-top:-20px;
}

.footer
{
	bottom:0;
	width:100;

}
.jumbotron
{
	margin:20px;

}
.incont
{
	width:100%;
}
#name
{
	width:100%;
}
#id
{
	width:100%;
}
#price
{
	width:100%;
}
#acive
{
	width:100%;
}
#dateOfLaunch
{
	width:100%;
}
#category
{
	width:100%;
}

#rad
{
	width:100%;
	margin-top :8px;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="jumbotron">

<h1 class ="heading">Edit Menu Item</h1>
<br/>
<div class="container">
<form:form action ="update" method ="post" modelAttribute="MenuItem">

	<div class="row">
		<div class="col-lg-3 col-sm-12">
			Id:
			<form:input path="id" id ="id" value="${item.id}"/>
			<form:errors path="id" cssStyle="color: red;" />
		</div>
		<div class ="col-lg-9 col-sm-12">
			Name : <form:input path="name" id = "name" value="${item.name}"/>
			<form:errors path="name" cssStyle="color: red;" />
		</div>
	</div>
	<br/>
	<div class ="row">
		<div class="col-lg-3 col-sm-12">
			Price :<form:input path ="price" id = "price"  value="${item.price}"/>
			<form:errors path="price" cssStyle="color: red;" />
		</div>
		<div class="col-lg-2 col-sm-12">
			Active :
			<br/>
			<div id="rad">
			<form:radiobutton path="active" id = "yes" value="true"/>
			<label for ="yes">Yes</label>
			<form:radiobutton path="active" id = "no" value="false"/>
			<label for ="no">No</label>
			</div>
			<form:errors path="active" cssStyle="color: red;" />
		</div>
		<div class="col-lg-5 col-sm-12">
			DateofLaunch : <input type = "date" id = "dateOfLaunch" name ="dateOfLaunch" value="${item.dateOfLaunch}"required/>
		</div>
		
		<div class="col-lg-2 col-sm-12">
		Category :
		<form:select path="category" id = "category"  >
				<option value ="${item.category}">${item.category}</option>
				<option value ="Main Course">Main Course</option>
				<option value ="Starters">Starters</option>
				<option value ="Desert">Dessert</option>
				
			</form:select>
			<form:errors path="category" cssStyle="color: red;" />
		</div>
	</div>	
	<br/>
	<div class="row">
		<div class ="col-lg-3 col-sm-12">
			<form:checkbox path="free" id = "free" />
			 <label for="free">Free Delivery</label>
		</div>
	</div>
	<br/>
	<div class="incont">
	<input type="submit" class="btn btn-danger" style="float:left";>
	<input type ="reset" class="btn btn-danger" style="float:right";>
	</div>
</form:form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
