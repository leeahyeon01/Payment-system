<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>
<body> 

 <script>
 function send(){
	 alert("하이루");
	 $('#form').submit();
 }
 
 
  var table = document.getElementsByTagName("table"); 
  var table2 = document.body.children; 
  
  var tr = table.item(0)
  console.log(table)
  console.log(table2);
  console.log(tr);

 
 </script>
 
 <form id="form" action="test">
<input type="text" name="tortoise" id="tortoise" value="" >
<input type="hidden" name="torCount" id ="torCount" value="3">
   <button type="submit" > 버튼</button>
<!--   <button type="button" onclick="send()" ></button> -->
 </form>


<hr>  

<table border="1">
<th>이름</th>
<th>나이</th>
<th>직업</th> 
<tr>
<td>kim</td>
<td>20</td>
<td>student</td>
</tr>
<tr>
<td>lee</td>
<td>25</td>
<td>programmer</td>
</tr>
<tr>
<td>choi</td>
<td>30</td>
<td></td>
</tr>
</table>




</body>
</html>