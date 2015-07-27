<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<script language="javascript" src="<%=request.getContextPath()%>/script/jquery.min.js"></script>
<style>
*{
	font-family:Verdana, Arial, Helvetica, sans-serif; 
	margin-top:0px;
	margin-left:10%;
	margin-right:10%;
	margin-bottom:0px;	
}
#inputTab td{
	border:1px solid #fff;  
	}
#outputTab td{
	text-align:center;
	border:1px solid #ccc;  
	}
table{
	width:80%;	
	border-collapse:collapse;  
	}
td{
	
    width:33%;	
}
</style>
<script type="text/javascript">
function del(id){
$.ajax( {
	type : "POST",
	url : "<%=request.getContextPath()%>/student.do?method=del&id=" + id,
	dataType: "json",
	success : function(data) {
		if(data.del == "true"){
			alert("Delete Success！");
			$("#" + id).remove();
		}
		else{
			alert("Delete Fail！");
		}
	},
	error :function(){
		alert("Net Error！");
	}
});
}
function add(){
	var firstName=document.getElementById("firstName").value;
	var lastName=document.getElementById("lastName").value;
	
	$.ajax( {
		type : "POST",
		url : "<%=request.getContextPath()%>/student.do?method=save&firstName="+lastName+"&lastName="+lastName,
		dataType: "json",
		success : function(data) {					
		}		
	});
	window.location.href="<%=request.getContextPath() %>/student.do";
}
</script>
</head>
<body>
<table id="inputTab" width="80%">
	<tr><td colspan=3>AddUser</td></tr>
	<tr>
		<td align="right">FirstName</td>
		<td><input id="firstName" name="lastName" type="text" /></td>
		<td align="right"></td>
	</tr>
	<tr>
		<td align="right">LastName</td>
		<td align="left"><input id="lastName" name="lastName"  type="text" /></td>
		<td><input type="button" onclick="add()" value="Save"/>	</td>
	</tr>	
</table>
<div style="height:20px"/></div>
<table id="outputTab"  width="80%">
	<tr>
		<td>Number</td>
		<td>FirstName</td>
		<td>LastName</td>
		<td>Operation</td>
	</tr>
	<c:forEach items="${list}" var="student">
	<tr id="<c:out value="${student.id}"/>">
		<td><c:out value="${student.id}"/></td>
		<td><c:out value="${student.firstName}"/></td>
		<td><c:out value="${student.lastName}"/></td>
		<td>			
			<input type="button" onclick="del('<c:out value="${student.id}"/>')" value="删除"/>
		</td>
	</tr>
	</c:forEach>
	
</table>


</body>
</html>