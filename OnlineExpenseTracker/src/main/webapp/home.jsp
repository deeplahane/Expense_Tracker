<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%> mb-0">
		<%=m.getContent()%></div>
	<%
	}
	session.removeAttribute("msg");
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active ">
				<img class="d-block w-100" src="img/ex1.png" alt="First slide" height="560px">
				<div class="carousel-caption d-none d-md-block">
					
					<div class="text-light p-2 bg-dark "><h3>Shorten your needs, save money leads to work in indeed</h3></div>
				</div>
			</div>
			<div class="carousel-item ">
				<img class="d-block w-100" src="img/ex2.jpg" alt="Second slide" height="560px">
				<div class="carousel-caption d-none d-md-block">
					
					<div class="text-light p-2 bg-dark "><h3>Live your life according to your wish with the money</h3></div>
				</div>
			</div>
			<div class="carousel-item ">
				<img class="d-block w-100" src="img/ex3.jpg" alt="Third slide" height="560px">
				<div class="carousel-caption d-none d-md-block">
					<div class="text-light p-2 bg-dark "><h3>Don't treat others inferior just beat them with money</h3></div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

</body>
</html>