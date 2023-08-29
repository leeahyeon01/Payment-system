<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<title>login</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
  }

  #login-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
  }

  #login-form {
    border: 1px solid #ccc;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    width: 300px;
  }

  #login-form div {
    margin-bottom: 10px;
  }

  #login-form input[type="text"],
  #login-form input[type="password"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
  }

  #login-form input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
  }

  #login-form input[type="submit"]:hover {
    background-color: #45a049;
  }
</style>
<script>
  $(function() {
    var loginChk = '${loginChk}';
    if (loginChk == 'ID') {
      alert("등록되지 않은 아이디");
    } else if (loginChk == 'PW') {
      alert("비밀번호가 틀렸습니다");
    }
  })
</script>
</head>
<body>
  <div id="login-container">
    <form id="login-form" action="loginCheck" method="post">
      <div>
        <div>아이디</div>
        <input type="text" id="id" name="id" value="${map.znid}" placeholder="아이디를 입력하시오">
      </div>
      <div>
        <div>비밀번호</div>
        <input type="password" id="pw" name="pw" value="${map.znpw}" placeholder="비밀번호를 입력하시오">
      </div>
      <input type="submit" value="로그인">
    </form>
  </div>
</body>
</html>