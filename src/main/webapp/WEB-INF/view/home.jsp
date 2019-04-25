<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
	<title>Welcome to this Home Page</title>
</head>

<body>
	<h2>SunCorp Company Home Page</h2>
	<hr>

	<p>
	Welcome to the Company Home Page!
	</p>
	
	<hr>
	
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
	</p>
	
	
	
	<security:authorize access="hasRole('MANAGER')">
	<p>
		<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
				(Only for Managers)
	</p>
	</security:authorize>
	
	<security:authorize access="hasRole('ADMIN')">
	<p>
		<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
				(Only for Admins)
	</p>
	</security:authorize>
	<hr>
	
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
			   
			   <input type="submit" value="Logout" />
	
	</form:form>
	
</body>
</html>