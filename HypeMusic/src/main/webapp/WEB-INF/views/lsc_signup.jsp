<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

.errorMessage { 
  	color: red;
}

.matchMessage {
  color: blue;
}

</style>
</head>
<body>
<a href="/main" title="메인"><button class="main">메인</button></a>
<table>
    <thead>
        <tr>
            <th>id</th>
            <th>pw</th>
            <th>age</th>
            <th>preference</th>
            <th>email</th>
            <th>nickname</th>
            <th>rank</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.pw}"/></td>
                <td><c:out value="${user.age}"/></td>
                <td><c:out value="${user.preference}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.nickname}"/></td>
                <td><c:out value="${user.rank}"/></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    <form method="post" action="/user">
    <label for="id">아이디 : </label>
    <input type="text" id="id" name="id" required><br>
    <label for="pw">비밀번호 : </label>
    <input type="password" id="pw" name="pw" required><br>
    <label for="pw">비밀번호 확인 : </label>
    <input type="password" id="pw-confirm" name="pw-confirm" required>
    <p id="pwMessage"></p>
    <label for="age">나이 : </label>
    <input type="text" id="age" name="age" required><br>
    <label for="preference">선호 장르 : </label>
    <input type="text" id="preference" name="preference" required><br>
    <label for="email">이메일 : </label>
    <input type="text" id="email" name="email" required><br>
    <label for="nickname">닉네임 : </label>
    <input type="text" id="nickname" name="nickname" required><br>
    </form>
    <button id="register" onclick="checkAll()">회원가입</button>
<script>

$(document).ready(function() {
	
	// 입력값 확인 함수
	// 매개변수 value, regex, errorMessage
	// value가 regex와 일치하는지 확인하는 메소드 test
	// 일치하지 않으면 errorMessage를 alert창으로 표시하고 false를 return
	// 일치하면 true를 return
    function validateInput(value, regex, errorMessage) {
        if (!regex.test(value)) {
            alert(errorMessage);
            return false;
        }
        return true;
    }
	
	// 회원가입 버튼 누르면
	// if문 안에서 validateInput 함수 실행
	// 모두 통과하면 duplicateCheck 함수 실행
    function checkAll() {
        let id = document.querySelector('input[name="id"]').value.trim();
        let email = document.querySelector('input[name="email"]').value.trim();
        let nickname = document.querySelector('input[name="nickname"]').value.trim();
        let pw = document.querySelector('input[name="pw"]').value.trim();
        let age = document.querySelector('input[name="age"]').value.trim();

        if (!validateInput(id, /^[a-zA-Z0-9]{1,10}$/, "아이디는 영문 또는 숫자의 조합 10자리 이하여야 합니다.")) {
            return;
        }
        if (!validateInput(email, /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/, "이메일 형식이 올바르지 않습니다.")) {
            return;
        }
        if (!validateInput(nickname, /^[가-힣a-zA-Z0-9]{2,10}$/, "닉네임은 특수문자와 공백을 제외한 2~10자 이하여야합니다")) {
            return;
        }
        if (!validateInput(pw, /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,16}$/, "비밀번호는 영문 숫자 조합 6자리 이상 16자리 이하이어야 합니다.")) {
            return;
        }
        if (!validateInput(age, /^(?:1[01][0-9]|0?[1-9][0-9]?|120)$/, "나이는 0부터 120까지 숫자만 입력 가능합니다.")) {
            return;
        }
        
        duplicateCheck(id, email, nickname);
    }
    document.querySelector('#register').addEventListener('click', checkAll);
    
    // json 파일에 대조해서 아이디, 이메일, 닉네임 중복체크하는 함수
    // 모두 통과하면 submitForm 함수 실행
    function duplicateCheck(id, email, nickname) {
        $.ajax({
            url: "http://localhost:8081/users",
            type: "GET",
            dataType: "JSON",
            success: function(data) {
                let isIdMatch = false;
                let isEmailMatch = false;
                let isNicknameMatch = false;

                for (let i = 0; i < data.length; i++) {
                    if (data[i].id == id) {
                        alert("사용중인 아이디입니다.");
                        isIdMatch = true;
                        break;
                    }
                    if (data[i].email == email) {
                        alert("사용중인 이메일입니다.");
                        isEmailMatch = true;
                        break;
                    }
                    if (data[i].nickname == nickname) {
                        alert("사용중인 닉네임입니다.");
                        isNicknameMatch = true;
                        break;
                    }
                }

                if (!isIdMatch && !isEmailMatch && !isNicknameMatch) {
                    submitForm();
                }
            }
        });
    }
	
    // 회원가입 작동 함수
    function submitForm() {
        document.querySelector("form").submit();
    }
    
    // 비밀번호 확인 함수
    // 비밀번호 확인 Input박스 아래에 문자열 출력
    let pw = document.querySelector("#pw");
    let pwConfirm = document.querySelector("#pw-confirm");
    let pwMessage = document.querySelector("#pwMessage");
    
    function checkPassword() {
        if (pw.value !== pwConfirm.value) {
          pwConfirm.setCustomValidity("비밀번호가 일치하지 않습니다.");
          pwMessage.textContent = "비밀번호가 일치하지 않습니다.";
          pwMessage.className = 'errorMessage';
        } else {
          pwConfirm.setCustomValidity("");
          pwMessage.textContent = "비밀번호가 일치합니다.";
          pwMessage.className = 'matchMessage';
        }
      }
      pw.addEventListener('input', checkPassword);
      pwConfirm.addEventListener('input', checkPassword);

});

</script>
</body>
</html>
