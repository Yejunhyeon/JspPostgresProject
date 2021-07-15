<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="user" class="user.User" scope="page" /> <!--  id= 이름  class= 패키지명을 포함한 클래스 경로 scope=사용범위 -->
    <jsp:setProperty name="user" property="userID" />  			 <!--회원가입 페이지에서 받아온 사용자의 정보를 각각 property에 저장  -->
    <jsp:setProperty name="user" property="userPassword" />
    <jsp:setProperty name="user" property="userName" />
    <jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAction.jsp</title>
</head>
<body>
<% 
		//현재 세션 상태를 체크한다
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		// 이미 로그인했으면 회원가입을 할 수 없게 한다
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다')");
			script.println("location.href='mypage.jsp'");
			script.println("</script>");
		}

//회원가입 도중 입력하지 못한 칸이 있으면 경고창을 띄워주고 다시 이전 화면으로 
 if(user.getUserID()== null || user.getUserPassword() == null || user.getUserName() == null ||user.getUserEmail() == null) {
	 	PrintWriter script = response.getWriter();
	 	script.println("<script>");
	 	script.println("alert('입력이 안 된 항목이 있습니다')");
	 	script.println("history.back()");
	 	script.println("</script>");	 	
 } else{
	 UserDAO userDAO = new UserDAO();
	 int result = userDAO.join(user);
	 if(result == -1) {
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("alert('이미 존재하는 아이디입니다')"); //userid는 primarykey로 설정하여 중복을 허용x
		 script.println("history.back()");				//혹여 같은 id를 입력하면 -1을 반환
		 script.println("</script>");	
	 }else {
		 session.setAttribute("userID", user.getUserID()); // 회원가입에 성공했을 때 세션 부여
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("alert('회원가입 성공')");
		 script.println("location.href='mypage.jsp'");
		 script.println("</script>");	
	 }
 }
 %>
</body>
</html>