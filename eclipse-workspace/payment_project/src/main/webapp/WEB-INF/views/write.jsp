<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script> 

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        #checkbox {
            width: 50%;
            margin: 0 auto;
        }
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 0 auto; 
            
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        textarea {
            width: 70%;
            height: 50%;
            padding: 6px 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 14px;
        }
        input[type="button"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        input[type="button

        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        #checkbox {
            width: 50%;
            margin: 0 auto;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        textarea {
            width: 70%;
            padding: 6px 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 14px;
        }
        input[type="button"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        input[type

        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        #checkbox {
            width: 50%;
            margin: 0 auto;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        textarea {
            width: 100%;
            padding: 6px 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 14px;
        }
        input[type="button"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        input[type="button"]:hover {
            background-color: #45a049;
        }
        .approval-table {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .approval-table th,
        .approval-table td {
            padding: 10px;
        }
        .disabled-checkbox {
            opacity: 0.5;
        }
    </style>
<script>

//임시저장
// function storage(){
	
// 	let title = $("[name=title]").val();
// 	let content= $("[name=content]").val();
// 	let signstatus = "결재대기";
// 	let id = $("[name=id]").val(); 
	
// 	if(title == ""){
// 	 alert("제목을 입력하시오")
// 	 $("[name=title]").focus();
// 	 return;
// 	}
// 	if(content == ""){
// 		alert("내용을 입력하시오")
// 		$("[name=content]").focus();
// 		return;
// 	}
	
// 	$.ajax({
// 		type:"post",
// 		url:""
// 	})
// } 




function request(){

	var title = $('input[name=title]').val();
	
	var status = "dd"; 
	console.log(title);
	

	$('input[name=no]').prop('value',"${seqNO}"); 
	$('input[name=id]').prop('value',"${sessionID.NAME}");
	$('input[name=title]').prop('value',title);
	$('input[name=content]').prop('value',"${content}");
	$('input[name=status]').prop('value',status); 
	$('input[name=rank]').prop('value',"${sessionID.RANK}"); 
	
	 document.getElementById("write").submit();
}


function temp(){
	
var temp = $('input[name=title]').val();
	
	var status = "cc";
	

	$('input[name=no]').prop('value',"${seqNO}"); 
	$('input[name=id]').prop('value',"${sessionID.NAME}");
	$('input[name=title]').prop('value',temp);
	$('input[name=content]').prop('value',"${content}");
	$('input[name=status]').prop('value',status); 
	$('input[name=rank]').prop('value',"${sessionID.RANK}"); 
	
	document.getElementById("write").submit();
}

</script>
</head>
<body> 


 <table border="1"> 
  
	   <th>결재요청</th>
	   <th>과장</th>
	   <th>부장</th> 
   <tr>
	 <td><input type="checkbox" name="help" value="plz" disabled="checked"> 결재요청</td>
     <td><input type="checkbox" name="help" value="ka" disabled="disabled"> 과장</td>
     <td><input type="checkbox" name="help" value="bu" disabled> 부장</td>
   </tr>
  
 </table>
  
  <br>
  <!-- 글쓰기  -->
 <form id="write" action="insert"> 
 	<div>번호: <input type="text" id="no" name="no" value="${seqNO}" readonly ></div> 
	 <div>작성자: <input type="text" id="id" name="id" value="${sessionID.NAME}" readonly></div>
	 <div>제목: <input  type="text" id="title" name="title" ></div>
	 <div>내용: <textarea row ="7" cols="50" name="content" id="content" value="${content }"></textarea></div> <br>
	 <input type ="hidden" name="status">
	 <input type= "hidden" name ="rank">
	 
 </form>  
 
  	<input type = "button"   name="request"  value = "결재요청"  onclick="request()" >&nbsp
  	<input type = "button"   name="temp"  value = "임시저장"  onclick="temp()">

<br>
 <br>
 
 <div>
 <table border ="1"> 
 <thead>
 <tr>
     <th>번호</th>
	 <th>결재일</th>
	 <th>결재자</th>
	 <th>결재상태</th> 
  </tr>
 </thead> 
  <tbody id ="tbody">
     <c:forEach items="${history}" var="history">
     <tr>
     <td>${history.ROWNUM}</td>
     <td>${history.SIGN_DATE}</td>
     <td>${history.APPROVER}</td>
     <td>${history.SIGN_STATUS}</td>
    </tr>
    </c:forEach>
  </tbody>
  
  

 </table> 
 
 
 </div>
</body>
</html>