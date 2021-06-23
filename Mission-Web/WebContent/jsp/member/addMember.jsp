<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
/* 	$(document).ready(function(){
		$('#goListBtn').click(function(){
			location.href="member.jsp"
		})

		$("input[name=id]").keyup(function(){
			
			var id = $("input[name=id]").val();
			
			window.name = "parentForm";
			
            window.open("checkId.jsp?id="+id,
                    "chkForm", "width=100, height=100, resizable = no, scrollbars = no");

            $("#checkIdtext").text(opener.document.getElementById("cInput").value);
			
		})
	})
	 */
	
	
	
</script>
</head>
<body>
	<div align=center >
		<hr width="80%">
		<h2>회원 목록</h2>
		<hr width="80%">
		<br>
		
		<form action="writeMember.jsp" method="post">
		<table id="dataTable" border = 1 style="width : 80%; text-align:center; ">
	          <tr>
	                <th width="25%">아이디</th>
					<td>
						<input type="text" size="60" name="id" placeholder="아이디를 입력하세요" required> <span style="color : red;	" id="checkIdtext">적합한 아이디를 입력하세요</span>
					</td>     
	          </tr>
	          <tr>
	                <th width="25%">이름</th>
					<td>
						<input type="text" size="60" name="name" placeholder="이름을 입력하세요" required>
					</td>     
	          </tr>  
	          <tr>
	                <th width="25%">비밀번호</th>
					<td>
						<input type="password" size="60" name="password" placeholder="비밀번호를 입력하세요"  required>
					</td>     
	          </tr>  
	          <tr>
	                <th width="25%">이메일</th>
					<td>
						<input type="email" size="60" name="email" placeholder="이메일을 입력하세요" required>
					</td>     
	          </tr>     
	          <tr>
	                <th width="25%">전화번호</th>
					<td>
						<input  type = "tel" name="phone" size="60" pattern="(010|011|017)-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx형식으로 입력하세요" required>
					</td>     
	          </tr>
	           <tr>
	                <th width="25%">우편번호</th>
					<td>
						<input type="text" size="60" name="post" placeholder="우편번호를 입력하세요" pattern="\d{4}-\d{4}" required>
					</td>     
	          </tr>
	          <tr>
	                <th width="25%">주소</th>
					<td>
						<input type="text" size="60" name="address" placeholder="주소를 입력하세요" required>
					</td>     
	          </tr>
	          <tr>
	                <th width="25%">상세주소</th>
					<td>
						<input type="text" size="60" name="detailAddress" placeholder="상세주소 입력하세요" required>
					</td>     
	          </tr>
	          <tr>
	                <th width="25%">유형</th>
					<td>
						<select name="type">
							<option value="U">일반 사용자</option>
							<option value="A">관리자</option>
						</select>
					</td>     
	          </tr>
	       </table>
	       <br>
	       <input type="submit" value="등록">
		   <input type="button" id="goListBtn" value="목록">
		</form>
	</div>
</body>
</html>