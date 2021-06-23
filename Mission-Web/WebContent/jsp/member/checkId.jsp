<%@page import="java.sql.ResultSet"%>
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
     	
     	Connection conn = new ConnectionFactory().getConnection();
     	StringBuilder sql = new StringBuilder();
     	sql.append("SELECT * FROM T_MEMBER WHERE ID = ?");
     	
     	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
     	pstmt.setString(1, id);
     	
     	ResultSet rs = pstmt.executeQuery();
     	JDBCClose.close(conn,pstmt);
     	
    	if(rs.next() ){
    		out.write("<input id = 'cInput' value='아이디가 중복됩니다.' >");
    	}  else{
	    	out.write("<input id = 'cInput' value='사용가능한 아이디 입니다.' >");
    	}  	
     %>
<script>
	/* alert('새글 등록이 완료되었습니다.')
	location.href="member.jsp" */
</script>