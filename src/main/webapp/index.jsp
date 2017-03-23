<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Management</title>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<style>
/* .center {
    margin: auto;
    width: 60%;
    border: 3px solid #73AD21;
    padding: 10px;
} */
</style>
</head>
<body>
<div class="center">
	<h2 style="text-align:center"><a href="register">Create Customer</a></h2>
</div>
<div class="center">
	<h2 style="text-align:center"><a href="search">Search</a></h2>
</div>
<div class="center">
	<h2 style="text-align:center"><a href="showall">All Customers</a></h2>
</div>
<div class="center">
	<h2 style="text-align:center"><a href="insertsample">Insert Sample Customers</a></h2>
</div>
</body>
</html>