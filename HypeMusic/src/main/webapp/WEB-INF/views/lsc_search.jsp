<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collections" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.study.springboot.TrackInfo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${keyword}에 대한 검색결과</title>
<link rel="stylesheet" href="/Mainpage.css?after">
</head>
<header>       
</header>
<style>
body {
	
	width:85%;
	display: inline-block;
	margin-left: 120px;
}

h1 {
	color:gray;
	margin-left:40px;
	margin-bottom:0;
	padding-bottom:0;
}
h2 {
	text-align:center;
	color:gray;
	margin:0;
	padding:0;
}
.section_3 {
	margin-top:0;
	margin-bottom:0;
}

.music_btn {
	display:flex;
	gap:10px;
    background-color: white;
    color: gray;
    padding: 15px 15px;
    font-size: 20px;
    margin-top:0;
    margin-bottom:0;
  
    
}
.suffle_listen,
.all_listen,
.listen,
.put,
.down,
.FLAC,
.present
{
	width: 75px;
	height:35px;
	border: 1px solid gray;
	border-radius: 20px;
	color: gray;
	background-color: white;
	font-size: 13px;
	
}

.suffle_listen:hover,
.all_listen:hover,
.listen:hover,
.put:hover,
.down:hover,
.FLAC:hover,
.present:hover
 {
    background-color:#04aa6d;
    color: white;
    cursor: pointer;
}	
tabel{
	border-collapse:collapse;
	
}

table,th, td{
	border: none;
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
}
th, td{
	padding-left: 20px;
	padding-right: 20px;
	color: gray;
	
	
}

.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    width: 20px;
    height: 20px;
    background-color: #eee;
}

.checkmark::after {
    content: '';   
    position: absolute;
    top: 3px;
    left: 7px;
    width: 4px;
    height: 8px;
    border: solid white;
    border-width: 0 3px 3px 0;  /* top right bottom left */
    transform: rotate(45deg);
    color: #04aa6d;
}


.track {
	display: inline-block;
	position: relative;
	overflow: hidden;
	width: 100px;
	height: 100px;
	margin:12px 12px 12px 12px;
	
}

.track img{
	width: 100px;
	height: 100px;
	margin:0px 5px 8px 1px;
	
}

.track .caption {
    position: absolute;
    top:0;
    bottom: 0;
    left: 0;
    width: 100px;
    background-color: rgba(0, 0, 0, 0.7);
    color: #fff;
    padding:0;
    margin:0;
    opacity: 0;
    transition: opacity 0.3s ease;
} 
.track .caption p{
	font-size: 10px;
	margin-top:15px;
	padding:5px;
	padding-top:0;
}       
.track:hover .caption {
    opacity: 1;
} 

.logo1,
.logo2,
.logo3,
.logo4
 {
	width:45px;
	height:45px;
}

#category {
	font-size: 30px;
	color: grey;
	font-weight: bold;
	padding-left: 30px;
	padding-top: 30px;
}

.caption-a {
	color: white;
	text-decoration: none;
}


.caption1-a {
	color: grey;
	text-decoration: none;
}

.caption1-a :hover {
	color: black;
	text-decoration: none;
}
</style>
<body>
<h1 id="ment">"${keyword }"&nbsp에 대한 검색결과입니다.</h1>
<div id="category">음악</div>
<div class="section_3">
	<div class="music_btn">
	
			<button class="suffle_listen">셔플듣기</button>
			<button class="all_listen">모두듣기</button>
			<button class="listen">듣기</button>
			<button class="put">담기</button>
			<button class="down">다운</button>
			<button class="FLAC">FLAC</button>
			<button class="present">선물</button>
	</div>		
		<table>		
			<thead>				
					<th><input type="checkbox" name="check" id="checkbox">
                            <div class="checkmark"></div></th>
					<th></th>
					<th></th>
					<th></th>
					<th>곡정보</th>
					<th>앨범</th>
					<th>Like</th>
					<th>듣기</th>
					<th>담기</th>
					<th>다운</th>
					<th>뮤비</th>
				</tr>
			</thead>			
    	<tbody>    	
    	<c:forEach var="searchResult" items="${searchResults}" begin="0" end="9" varStatus="loop">				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>					
					<td>
						${loop.index + 1}
					</td>					
					<!--  곡정보 이미지 추가 -->
					<td><a href="/musicInfo?track_id=${searchResult.track_id }" id="info"><img src = "/img/music_info_icon2.jpg" style="border: none; width: 25px; height: 30px;"></a></td>
					<td>
						 <div class="track">
          				 <img src="${searchResult.album_image}">
        				 	<div class="caption">
                			<a class="caption-a" >${searchResult.title}</a>
                			<a class="caption-a" >${searchResult.artist}</a>
            				</div>
        				 </div>
					</td>
					<td>
					<div class="caption1">
				      <a class="caption1-a" href="/musicInfo?track_id=${searchResult.track_id }"><p>${searchResult.title}</p></a>
				      <a class="caption1-a" href="/musicInfo?track_id=${searchResult.track_id }"><p>${searchResult.artist}</p></a>
				    </div>
					</td>
					<td>
					<div class="caption2">
      				<p>${searchResult.album}</p>
      				</div>
					</td>
					<td>
					<div class="caption3">
     				<p>${searchResult.like_count}</p>
					</td>
					<td><a href="#"><img src="/img/hjs_play.png" class="logo1" style="border: none; width: 20px; height: 20px;"></a></td>
					<td>					<!-- 담기 버튼 -->
					    <c:if test="${rank == null || rank < 1}">
					        <a href="#" onclick="showLoginAlert()">
					            <img src="/img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
					        </a>
					    </c:if>
					    <c:if test="${rank != null && rank >= 1}">
					    		<!--  onclick 이벤트 jsp 불러오는 함수에 맞게 꼭 변경해주세요! -->
					        <a href="#" onclick="addTrack('${searchResult.track_id}')">
					            <img src="/img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
					        </a>
					        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
						    <script>
						        function showLoginAlert() {
						            alert("로그인이 필요합니다.");
						        }
						        // ajax 방식으로 변경
						        function addTrack(trackId) {
						            $.ajax({
						                url: '/addTrack',
						                type: 'POST',
						                data: { addTrack: trackId },
						                success: function(response) {
						                    alert("음악 담기 성공!"); // 음악 담기 성공시 알림창 띄우기
						                    console.log(response);  
						                },
						                error: function(error) {
						                    alert("이미 담겨 있는 음악입니다!"); // 이미 담겨 있는 음악일시 알림창 띄우기
						                    console.log(error);  
						                }
						            });
						        }
						    </script>
					    </c:if>
					<!-- 여기까지가 담기 버튼입니다 -->	</td>
					<td><a href="#"><img src="/img/hjs_down.png" class="logo3" style="border: none; width: 20px; height: 20px;"></a></td>
					<td><a href="#"><img src="/img/hjs_muve.png" class="logo4" style="border: none; width: 20px; height: 20px;"></a></td>					
				</tr>    	 
    	 </c:forEach>    	
				</tbody>
		</table>
</div>


</body>
<footer>  
</footer>
</html>