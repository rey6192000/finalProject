<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>
<style>
	.search_result {
	   border: 1px solid black;
	}
</style>
<link href="http://mottie.github.io/tablesorter/css/theme.default.css" rel="stylesheet">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script>
    $(function(){
      $("#search-result").tablesorter({widgets: ['zebra']});
    });
</script>
</head>
<body>
	<div align="center">
		<table id="search-result" class="tablesorter search_result">
			<thead>
				<tr>
					<th class="search_result">FirstName</th>
					<th class="search_result">LastName</th>
					<th class="search_result">Email</th>
					<th class="search_result">Age</th>
					<th class="search_result">Address</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList}" >
					<tr>
						<td class="search_result">${customer.firstName}</td>
						<td class="search_result">${customer.lastName}</td>
						<td class="search_result">${customer.email}</td>
						<td class="search_result">${customer.age}</td>
						<td class="search_result">${customer.address}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pagination">

		    <c:url value="showall" var="prev">
		        <c:param name="page" value="${page-1}"/>
		    </c:url>
		    <c:if test="${page > 1}">
		        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
		    </c:if>
		
		    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
		        <c:choose>
		            <c:when test="${page == i.index}">
		                <span>${i.index}</span>
		            </c:when>
		            <c:otherwise>
		                <c:url value="showall" var="url">
		                    <c:param name="page" value="${i.index}"/>
		                </c:url>
		                <a href='<c:out value="${url}" />'>${i.index}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		    <c:url value="showall" var="next">
		        <c:param name="page" value="${page + 1}"/>
		    </c:url>
		    <c:if test="${page + 1 <= maxPages}">
		        <a href='<c:out value="${next}" />' class="pn next">Next</a>
		    </c:if>
		</div>
	</div>
</body>
</html>