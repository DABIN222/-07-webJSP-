<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>forTokens : 특정문자를 기준으로 조각내기</h1>
<ul>
	<c:forTokens var="i" items="빨강색, 노랑색.파랑색, 보라색., 오렌지색-갈색!검정색^^^남색" delims=",.-!^">
		<li>${i }</li>
	</c:forTokens>
</ul>

</body>
</html>