<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>
<link href="<c:url value="/resources/css/search.css" />" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/tabletools/2.2.3/css/dataTables.tableTools.css">
<link href="http://mottie.github.io/tablesorter/css/theme.default.css" rel="stylesheet">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.js"></script>
</head>
<body>
	<div align="center">
		<form:form action="dosearch" method="post" commandName="searchForm">
			<table id="searchTable" class="tablesorter search_result">
				<tr><h2>Search Customer</h2></tr>
				<tr>
					<td>
						<input type="radio" name="search-field" value="firstName">First Name:
					</td>
					<td>
						<input type="text" name="firstName">
					</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="search-field" value="lastName">Last Name:
					</td>
					<td>
						<input type="text" name="lastName">
					</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="search-field" value="email">Email:
					</td>
					<td>
						<input type="text" name="email">
					</td>
					<td>
						<input type="submit" name="search" value="Search">
					</td>
				</tr>
			</table>
		</form:form>
		<table id="search_result" style="overflow-x:auto" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th class="search_result">FirstName</th>
					<th class="search_result">LastName</th>
					<th class="search_result">Email</th>
					<th class="search_result">Age</th>
					<th class="search_result">Address</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
    var data =eval('${customerList}');
    var table = $('#search_result').DataTable( {
          "aaData": data,
          "aoColumns": [
            { "mData": "firstName"},
            { "mData": "lastName"},
            { "mData": "email"},
            { "mData": "age"},
            { "mData": "address"}
          ],
          "paging":true,
          "pageLength":10,
          "ordering":true,
          "order":[0,"asc"]
        });
});
$(function(){
    $("#searchTable").tablesorter({widgets: ['zebra']});
  });
</script>