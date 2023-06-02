<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내정보</h1>
<a href="/main" title="메인"><button class="main">메인</button></a>
    <div class="wrapper">
    
		        <div class="info-item">
		            <div class="info-label">ID:</div>
		            <span class="info-value">${id}</span>
		        </div>
		        <div class="info-item">
		            <div class="info-label">닉네임:</div>
		            <span class="info-value">${nickname}</span>
		        </div>
		        <div class="info-item_age">
		            <div class="info-label">나이:</div>
		            <span class="info-value">${age}</span>
		        </div>
		        <div class="info-item_age">
		            <div class="info-label">이메일:</div>
		            <span class="info-value">${email}</span>
		        </div>
		        <div class="info-item_genre">
		            <div class="info-label">취향:</div>
		            <span class="info-value">${preference}</span>
		        </div>
		        <div class="info-item_level">
		            <div class="info-label">등급:</div>
		            <span class="info-value">${rank}</span>
		        </div>
	    	
  
    </div>
<a href="/infoUpdate" title="정보수정"><button class="update">수정</button></a>
<a href="/infoUpdate" title="비밀번호 변경"><button class="update">비밀번호 변경</button></a>
</body>
</html>