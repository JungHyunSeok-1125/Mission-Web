package kr.ac.kopo.pinfo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PInfoInput
 */
@WebServlet("/PInfoInput")
public class PInfoInput extends HttpServlet {
	
	private static final long serialVersionUID = 1L;



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		//String[] mail = request.getParameterValues("mail");
		String job = request.getParameter("job");
		String gongji = request.getParameter("gongji");
		String gwanggo = request.getParameter("gwanggo");
		String baesong = request.getParameter("baesong");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("	<head>");
		out.println("		<title>개인정보 출력</title>");
		out.println("	</head>");
		out.println("	<body>");
		out.println("		<h1>개인정보출력</h1>" );
		out.println("		<span>이름 : </span>" + name +  "<br />");
		out.println("		<span>아이디 : </span>" + id +  "<br />");
		out.println("		<span>암호 : </span>" +pwd +  "<br />");
		if(gender.equals("f")) {
			out.println("		<span>성별 :</span> 여자<br />");
		}	else {
			out.println("		<span>성별 :</span> 남자<br />");
		}
		
		if(	gongji==null) {
			
			out.println("		<span>공지메일 : </span> 받지 않음 <br />");
		}else {
			out.println("		<span>공지메일 : </span> 받음 <br />");
		}
		System.out.println(gwanggo);
		if(	gwanggo==null) {
			out.println("		<span>광고메일 : </span> 받지 않음 <br />");
			
		}else {
			out.println("		<span>광고메일 : </span> 받음 <br />");
		}
		if(	baesong==null) {
			out.println("		<span>배송확인메일 : </span> 받지 않음 <br />");
			
		}else {
			out.println("		<span>배송확인메일 : </span> 받음 <br />");
		}
		
		System.out.println(job);
		if(job.equals("company")) {
			out.println("		<span>직업 : </span> 회사원<br />");
		} else if(job.equals("student")) {
			out.println("		<span>직업 : </span> 학생<br />");
		}else {
			out.println("		<span>직업 : </span> 기타<br />");
		}
		
		out.println("	</body>");
		out.println("</html>");
		
		out.flush();
		out.close();
		
	}

}
