<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp</title>
</head>
<body>
		<%
		 session.invalidate(); //세션 종료
		 %>
		 <script>
		 	alert('로그아웃 되었습니다');
		 	location.href="login.jsp";
		 </script>
</body>
</html>