<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainpage</title>
</head>
<body>
mainpage
<a href="//localhost:8081/chart">차트</a>
<form action="/search" method="get" id="search-form">
	<input type="text" name="keyword" placeholder="곡 또는 가수를 입력하세요" class="search_box">
		<div class="search-icon-container">
			<button type="submit" class="search-btn"><img src="/img/search_icon3.jpg" width="35px" height="35px" alt="검색아이콘" class="search-btn-img"></button>
		</div>
</form>
<c:choose>
	<c:when test="${empty id}">
		<a href="/login" title="로그인"><button class="login_btn">로그인</button></a>
	    <a href="/signup" title="회원가입"><button class="signup_btn">회원가입</button></a>
	</c:when>
	<c:otherwise>
		<a href="/myinfo" title="내정보"><button class="myInfo_btn">내정보</button></a>
		<a href="/logout" title="로그아웃"><button class="logout_btn">로그아웃</button></a>
	</c:otherwise>
</c:choose>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		const form = document.querySelector('#search-form'); // form 태그 가져오기
		const input = document.querySelector('input[name=keyword]'); // input 태그 가져오기
	
		form.addEventListener('submit', function(event) { // form submit 이벤트 리스너 등록
		    event.preventDefault(); // 기본 동작(새로고침) 막기
	
		    const keyword = input.value; // 검색어 가져오기
	
		    if (keyword.trim().length === 0) {
		        alert("검색어를 입력해주세요.");
		        event.preventDefault();
		    } else {
		        const url = '/search/' + keyword; // URL 생성
		        window.location.href = url; // URL 변경
		    }
		});		
	</script>
</body>
</html>