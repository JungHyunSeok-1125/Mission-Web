<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 
    	작업순서
    	1. 파라미터(제목, 작성자, 내용) 추출
    	2. 추출된 데이터를 DB(t_board)에 삽입
    	3. 목록페이지 이동
     -->
     
     
     <%
     	request.setCharacterEncoding("utf-8");
     
     	String id = request.getParameter("id");
     	String name = request.getParameter("name");
     	String password = request.getParameter("password");
     	String email = request.getParameter("email");
     	String phone = request.getParameter("phone");
     	String post = request.getParameter("post");
     	String address = request.getParameter("address");
     	String detailAddress = request.getParameter("detailAddress");
     	String type = request.getParameter("type");
     	
     	String emailList[] =  email.split("@");
     	String phoneList[] = phone.split("-");
     	
     	
     	Connection conn = new ConnectionFactory().getConnection();
     	StringBuilder sql = new StringBuilder();
     	sql.append("INSERT INTO T_MEMBER (ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST,BASIC_ADDR,DETAIL_ADDR, TYPE) ");
     	sql.append("VALUES(?,?,?,?,?,?,?,?,?,?,?,?) ");
     	
     	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
     	pstmt.setString(1, id);
     	pstmt.setString(2, name);
     	pstmt.setString(3, password);
     	pstmt.setString(4, emailList[0]);
     	pstmt.setString(5, emailList[1]);
     	pstmt.setString(6, phoneList[0]);
     	pstmt.setString(7, phoneList[1]);
     	pstmt.setString(8, phoneList[2]);
     	pstmt.setString(9, post);
     	pstmt.setString(10, address);
     	pstmt.setString(11, detailAddress);
     	pstmt.setString(12, type);
     	
     	pstmt.executeUpdate();
     	
     	JDBCClose.close(conn,pstmt);
     %>
<script>
	alert('새글 등록이 완료되었습니다.')
	location.href="member.jsp"
</script>