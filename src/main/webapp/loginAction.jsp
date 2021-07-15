<%@page import="java.io.PrintWriter"%>							<!-- 자바스크립트를 사용하기 위해 -->
<%@page import="user.UserDAO"%>								<!-- 직접 만든 클래스 사용 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>  				<!-- 넘어온 한글 데이터 깨짐 방지 -->
<jsp:useBean id="user" class="user.User" scope="page" />		<!--  id= 이름  class= 패키지명을 포함한 클래스 경로 scope=사용범위 -->
<jsp:setProperty name="user" property="userID" />				<!-- 로그인 페이지에서 받아온 사용자 ID를 'userID'에 저장 -->
<jsp:setProperty name="user" property="userPassword" />			<!-- 로그인 페이지에서 받아온 사용자 ID를 'userPassword'에 저장 -->
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if(result == 1){
			session.setAttribute("userID", user.getUserID());  //로그인 성공 후 세션 부여
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>