<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
	
	<h2>Udemy Company Home Page</h2>
	<hr>
	<p> Welcome to the udemy company home page! </p>
	
	<hr>
		<!-- display user name and role -->
		<p>
			User: <security:authentication property="principal.username"/>
			<br><br>
			Role(s): <security:authentication property="principal.authorities"/>
		</p>
		
		<security:authorize access="hasRole('MANAGER')">
			
		<!-- Add a link to point to /leaders... this is for managers -->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
			(Only for Managers)
		</p>
		</security:authorize>
		
		<security:authorize access="hasRole('ADMIN')">
		<!-- Add a link to point to /systems... this is for admins -->
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admin)
		</p>
		</security:authorize>
		
		
	<hr>
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="logout"/>
	</form:form>

</body>
</html>