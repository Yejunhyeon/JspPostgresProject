<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- 새로 만든 css 파일을 참조 -->
<link rel="stylesheet" href="css/custom.css">
<title>BBS</title>
</head>
<body>
<div class="container">		<!-- 하나의 영역 생성 -->
		<div class="col-lg-4">	<!-- 영역 크기 -->
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">Jsp Project</h3>
					<input type="button" class="btn btn-primary form-control" onclick="location.href='login.jsp'" value="환영합니다 여기를 클릭해 주세요!">
				</form>
			</div>
		</div>	
	</div>
</body>
</html>