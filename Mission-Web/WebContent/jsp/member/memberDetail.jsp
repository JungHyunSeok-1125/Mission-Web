<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String boardId = request.getParameter("id");
    
    Connection conn = new ConnectionFactory().getConnection();
    StringBuilder sql = new StringBuilder();
    
    sql.append("SELECT ID, NAME, EMAIL_ID,EMAIL_DOMAIN,TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR, TYPE, REG_DATE ");
    sql.append("FROM T_MEMBER WHERE ID = ?");
    
    PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, boardId);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#toHome').click(function(){
			location.href="member.jsp"
		})
	})
</script>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>회원 상세</h2>
		<hr width="80%">
		<br>
		<table border="1" style="width:80%">
			<tr>
				<th width="25%">아이디</th>
				<td><%= rs.getString("ID") %></td>
			</tr>
			<tr>
				<th width="25%">이름</th>
				<td><%= rs.getString("NAME") %></td>
			</tr>
			<tr>
				<th width="25%">이메일</th>
				<td><%= rs.getString("EMAIL_ID")+"@"+rs.getString("EMAIL_DOMAIN") %></td>
			</tr>
			<tr>
				<th width="25%">전화번호</th>
				<td><%= rs.getString("TEL1")+"-"+rs.getString("TEL2")+"-"+rs.getString("TEL3") %></td>
			</tr>
			<tr>
				<th width="25%">주소</th>
				<td><%= "["+rs.getString("POST")+"]"+rs.getString("BASIC_ADDR") + rs.getString("DETAIL_ADDR") %></td>
			</tr>
			<tr>
				<th width="25%">유형</th>
				<td><%= rs.getString("TYPE") %></td>
			</tr>
			<tr>
				<th width="25%">가입일</th>
				<td><%= rs.getString("REG_DATE") %></td>
			</tr>
		</table>
		<br>
		<button id="toHome">메인으로</button>
	</div>
</body>
</html>