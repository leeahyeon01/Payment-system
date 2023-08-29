<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .maindiv {
            background-color: white;
            border: 1px solid #ccc;
            padding: 20px;
            margin: 20px auto;
            max-width: 400px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        select, input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="button"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="button"]:hover {
            background-color: #0056b3;
        }
    </style>
 
 <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script> 
<script> 


//결재자 고르기 
function changeSelect(){	
	var selectbox = document.getElementById("employeeSelect");
	var test =  $("#employeeSelect").val()


	

 
 // 비동기통신 아이디 선택시 ,해당 직급이랑 이름 받아오기  -select
   $.ajax({
	 url:"selectMember",
	type:"post",
	data: {selected:test},
	success: function(selected_member){
/* 		 alert(" 대리결제자 선택 비동기 성공") */
		 
      var rank = selected_member.RANK;
	  var name = selected_member.NAME;

		 $("#select_rank").attr("value",rank);
          $("#select_text").attr("value",name);
	},
	error:function(){
		 alert("대리결제자 선택  비동기 실패")
	}
  })

}

  // 대리결재자 선택
  function choose(){
	 var selectedval = $("#select_text").val();
	 console.log(selectedval); 

	 
	 

 // js 비동기 통신 	 
	 $.ajax({
		 url:"proxy",
		 type:"post",
	     data:{employee:selectedval},
	     success: function(map){
	   
	    	
	  /*   	 var dataMap = JSON.parse(dataMap);
	    	 var employeeValue = dataMap.state.employee; */
	    	 
	    	 console.log("자료형" + typeof('map'));
	    	 console.log("백에서 받은값 " + map);  
	   
	    console.log(map.employee);
	    var name = map.employee; 
	    	 
	     	 var bodyHtml = '';  
	    	 
	    	 bodyHtml  += '<div>'+name+"(님)을 선택하셨습니다"+'</div>';
	
	    	 $("#aaa").html(bodyHtml)  
	    	 
	    	     	 

	     },
	     error: function(){
	    	 alert("대리결제 비동기 실패")
	     }
	 })
 } 
  
  
	 
	function cancle(){
		window.close();
	} 
	
	

 
</script>

</head>

<body> 


<%-- <div>"${member[0].name }"</div> --%>

<div class="maindiv">
 

<br>
<br>

 
  <lable for ="name-select">대리결재자:</lable>
 <select id="employeeSelect" onchange="changeSelect()">
	  <option >==선택==</option>
	<c:forEach items ="${member }" var ="member">
	  <c:choose>
	     <c:when test = "${member != null }">
	
	     <option>${member.id}</option>
	     </c:when>
	
	  </c:choose>
	</c:forEach>
 
 </select> 
 
 <br>
  <br>
   <lable for ="name-select">직급:</lable>
     <input id="select_rank" type="text" value ="직급">
     
      <br>
  <lable for ="name-select">대리자:</lable>
     <input  id="select_text"  type="text" value ="대리자이름">
<br>
<br>
<br>
<!--  <button>선택</button> -->
 <input type ="button" value ="취소" onclick="cancle()"> 

 <input type="button"  value="선택" onclick="choose()">  
   
 



<div id="aaa"></div>

</div>

</body>
</html>