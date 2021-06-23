<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Connection conn = new ConnectionFactory().getConnection();
    StringBuilder sql = new StringBuilder();
    
    sql.append("SELECT ID, NAME, EMAIL_ID,EMAIL_DOMAIN,TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR, TYPE, REG_DATE ");
    sql.append("FROM T_MEMBER ORDER BY REG_DATE DESC");
    
    PreparedStatement pstmt = conn.prepareStatement(sql.toString());
    ResultSet rs = pstmt.executeQuery();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function (){
		$("#topchk").click(function(){
        	if($("#topchk").is(":checked")){
        		 $(".chkBox").prop('checked',true);
            	 $(".chkBox").attr('checked',true);  
        	}else{
        	 $(".chkBox").prop('checked',false);
           	 $(".chkBox").attr('checked',false); 
        		   		            		
        	}
        });//FUNCTION :: 체크박스 함수
        
        $('#addMember').click(function(){
			location.href="addMember.jsp"
		})
	})
	
</script>
</head>
<body>
	<div align=center >
		<hr width="80%">
		<h2>회원 목록</h2>
		<hr width="80%">
		<br>
		
		<table id="dataTable" border = 1 style="width : 80%; text-align:center; ">
	                   <tr>
	                     <th style="text-align:center;"><input id="topchk" type="checkbox" name="chkbox"/></th>
	                     <th >번호</th>
	                     <th >아이디</th>
	                     <th >이름</th>
	                     <th >이메일</th>
	                     <th >전화번호</th>
	                     <th >주소</th>
	                     <th >유형</th>
	                     <th >가입일</th>
	                   </tr>
	                   <%
	                	int i = 1;
	                   while(rs.next()) {
	                	   String id = rs.getString("ID");
	                	   String memberType = "?";
	                	   if(rs.getString("TYPE").equals("U")) {
		                    	 memberType = "사용자";
	                	   }else {
		                    	 memberType = "관리자";
	                		   
	                	   }
	                   %>
	                   <tr class="memberTable" onClick="location.href='memberDetail.jsp?id=<%=id %>'">
	                     <td onclick="event.cancelBubble=true" class="chkbox"><input class="chkBox" type="checkbox" name="chkbox"/></td>
	                     <td><%= i %></td>
	                     <td><%= rs.getString("ID") %></td>
	                     <td><%= rs.getString("NAME") %></td>
	                     <td><%= rs.getString("EMAIL_ID")+"@"+rs.getString("EMAIL_DOMAIN") %></td>
	                     <td><%= rs.getString("TEL1")+"-"+rs.getString("TEL2")+"-"+rs.getString("TEL3") %></td>
	                     <td><%= "["+rs.getString("POST")+"]"+rs.getString("BASIC_ADDR") + rs.getString("DETAIL_ADDR") %></td>
	                     <td><%=  memberType %></td>
	                     <td><%= rs.getString("REG_DATE") %></td>
	                    </tr>
                       <%
	                      i++;
	                   }
                       %>    
	       </table>
	       <br>
	       <input type="button" id="addMember" value="회원가입">
	</div>
</body>
</html>