<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .maindiv {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
     /*        border: 1px solid #ccc;
            border-radius: 10px; */
        /*     background-color: #f5f5f5; */
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
        input[type="button

        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .maindiv {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f5f5f5;
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
        input[type="

        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .maindiv {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f5f5f5;
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
        
   input[type="button"][value="임시저장"],
  input[type="button"][value="결제요청"] {
    background-color: #4caf50; /* Green color */
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
        .maindiv {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f5f5f5;
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
        .bu {
            background-color: #1e90ff;
        }
        .disabled-checkbox {
            opacity: 0.5;
        }
    </style>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

</head>


<body>


 <script>  
 
 
 function gaw_refu(){
	 alert("반려");  
	 $('input[name=boardSignStatus]').prop('value',"반려"); 
	 $('input[name=flag]').prop('value',"ee");
	 $('input[name=approver]').prop('value',"${sessionID.NAME}");
	 document.getElementById("form_test").submit();
 }

 function gaw_appro(){
	 alert("과장 승인");  
	 $('input[name=boardSignStatus]').prop('value',"결재중"); 
	 $('input[name=flag]').prop('value',"bb");
	 $('input[name=approver]').prop('value',"${sessionID.NAME}");
/* 	 $("#gwa_approve").attr("action",'approve').submit(); */
     document.getElementById("form_test").submit(); 
 }

 
 function bubu(){
	 alert("부장 승인");  
	$('input[name=boardSignStatus]').prop('value',"결재완료"); 
	$('input[name=flag]').prop('value',"aa");  
	$('input[name=approver]').prop('value',"${sessionID.NAME}");
	
    document.getElementById("form_test").submit(); 

    
/*    console.log("하하하하...") */
	  
 } 
 
 
 function bu_refuse() {
	  // bu_refuse 함수의 구현 내용을 추가해야 합니다.
	  alert("반려");
		$('input[name=boardSignStatus]').prop('value',"반려"); 
		$('input[name=flag]').prop('value',"ee");

	    document.getElementById("form_test").submit();
	}  
 
 
 function request(){
		$('input[name=boardSignStatus]').prop('value',"결재대기"); 
		$('input[name=flag]').prop('value',"dd");
		  document.getElementById("form_test").submit(); 
 }
 
 
 function save(){
		$('input[name=boardSignStatus]').prop('value',"임시저장");
		$('input[name=flag]').prop('value',"cc");
		  document.getElementById("form_test").submit(); 
}

 


</script>


 
 <!-- 결제요청 체크박스  --> 
 
<%--  	   <div>"${detail[0].SIGN_STATUS}</div> --%>
 
 <div class="maindiv">
 

<%--  작성자: <input type="text" name="name" id="name" value="${vo.employee}" readonly> --%>


  <table border="1"> 
	   <th>결재요청</th>
	   <th>과장</th>
	   <th>부장</th> 
	   

	   


<c:choose>
	<c:when test ="${detail[0].SIGN_STATUS == '임시저장' || detail.SIGN_STATUS == null || detail.SIGN_STATUS == '반려' }">   
	  <tr>
	<td><input type="checkbox" name="request" value="request" > 결재요청</td>
	<td><input type="checkbox" name="kwa_appro" value="kaw_appro" disabled> 과장</td>
	<td><input type="checkbox" name="bu_appro" value="bu_appro"  disabled> 부장</td>
	  </tr>
	</c:when>
	
	<c:when test = "${detail.SIGN_STATUS == '결재대기'}">   
	  <tr>
	<td><input type="checkbox" name="request" value="request" checked="checked" disabled> 결재요청</td>
	<td><input type="checkbox" name="kwa_appro" value="kaw_appro"   disabled> 과장</td>
	<td><input type="checkbox" name="bu_appro" value="bu_appro" disabled> 부장</td>
	  </tr>
	</c:when>
	
	<c:when test = "${detail.SIGN_STATUS == '결재중' }">   
	  <tr>
	<td><input type="checkbox" name="request" value="request" checked="checked" disabled> 결재요청</td>
	<td><input type="checkbox" name="kwa_appro" value="kaw_appro" checked="checked" > 과장</td>
	<td><input type="checkbox" name="bu_appro" value="bu_appro" disabled> 부장</td>
	  </tr>
	</c:when>
	
	<c:when test = "${detail.SIGN_STATUS == '결재완료' }">   
	  <tr>
	<td><input type="checkbox" name="request" value="request" checked="checked" disabled> 결재요청</td>
	<td><input type="checkbox" name="kwa_appro" value="kaw_appro" checked="checked" disabled> 과장</td>
	<td><input type="checkbox" name="bu_appro" value="bu_appro" checked="checked" > 부장</td>
	  </tr>
	</c:when>

 </c:choose>
 </table> 
 	   <br>
 
 
 <p>"${vo.sign_status}"</p>
 
 <!-- 글쓰기 --> 
 
 <form  id="form_test" action="approve">
 <div>
 번호: <input type="text" name="no"  id="no" value="${detail.NO}" readonly >
 <br>
 작성자: <input type="text" name="name" id="name" value="${detail.NAME}" readonly>
 <br>
 제목: <input type ="text" name="title" id="title" value="${detail.TITLE}" readonly>
 <br>
 내용: <textarea rows="7" cols="30" name="content"  id="content">${detail.CONTENT}</textarea>
 
 
 </div>
 
 
 <input type="hidden" name="boardSignStatus"/>  
 <input type="hidden" name ="flag"/>
 <input type="hidden" name ="approver">
 <input type ="hidden" name ="date">
 
 
 
 
 </form> 
 
<br>
 
 <!-- 계급별 결제/반려 버튼  -->
<form >
 <c:choose>
 
   <c:when test="${sessionID.RANK == 'C' ||sessionID.RANK == 'D' }">
  <input type ="button" class="bu" id ="leeahyeon"  value="결재요청"  onclick="request()" >
   <input type ="button"   name="refuse"  value="임시저장" onclick="save()">
 </c:when>
 
  <c:when test="${sessionID.RANK == 'A' && sessionID.NAME != detail.NAME}">
  <input type ="button" class="bu" id ="leeahyeon"  value="결재"  onclick="bubu()" >
   <input type ="button"   name="refuse"  value="반려" onclick="bu_refuse()">
 </c:when>
 
 
   <c:when test="${sessionID.RANK == 'A' && sessionID.NAME == detail.NAME}">
  <input type ="button"  id ="gwa_approve" value="임시저장"  onclick="save()" >
   <input type ="button"   name="refuse" value="결제요청"  onclick="request()" >
 </c:when>
 
   <c:when test="${sessionID.RANK == 'B' && sessionID.NAME != detail.NAME}">
  <input type ="button"  id ="gwa_approve" value="결제"  onclick="gaw_appro()" >
   <input type ="button"   name="refuse" value="반려"  onclick="gaw_refu()" >
 </c:when> 
 
  <c:when test="${sessionID.RANK == 'B' && sessionID.NAME == detail.NAME}">
  <input type ="button"  id ="gwa_approve" value="임시저장"  onclick="save()" >
   <input type ="button"   name="refuse" value="결제요청"  onclick="request()" >
 </c:when>
 
   <c:when test ="${ detail.SIGN_STATUS =='임시저장' && (SessionID.RANK == 'C' || Session.RANK == 'D')}" >
  <input type ="button"  id ="request" name="request">
 </c:when> 

 
 </c:choose>
 </form>


 </div>
 
</body>
</html>