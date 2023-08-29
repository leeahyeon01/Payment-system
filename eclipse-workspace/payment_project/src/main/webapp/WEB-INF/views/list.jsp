<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
      body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        #headDiv {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }
        
        #innerDiv{
        border: 1px solid black;
        width: 600px ;
        height: 100px;
        
        }
        
       
        #logout {
            background-color: #64CD3C;
            color: white;
            border: none;
            padding: 10px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
        }
        #logout:hover {
            background-color: #d32f2f;
        }
        #writeButton {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
        }
        #writeButton:hover {
            background-color: #45a049;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 70%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
<script> 





//제이쿼리 ajax 비동기 검색 => 결재상태만 
$(function(){
	  $("#search_state").change(function(){
		  
		   var search_state = $(this).val(); 
		   console.log("하하핳"+search_state);  
		   
		   
		   var json ={"search_state": search_state }
		  
		   console.log(json);
		   
	 	   $.ajax({
			   url:"searchList",
			   data:$("#search_state").serialize(), 
			   type:"post",
			   success: function(dataMap){
				   alert("비동기 성공 "); 
				   
				   var bodyHtml = '';
				   
				   console.log("백에서 받은값 "+ dataMap.state);
				   
				   console.log(dataMap.state[0].ID);
			 

				      bodyHtml += '<tr>';
				     bodyHtml += '<th>번호</th>'
				     bodyHtml += '<th>작성자</th>'
		    	     bodyHtml += '<th>제목</th>'
	    	         bodyHtml += '<th>내용</th>'
   	                 bodyHtml += '<th>결제일</th>'
   	                 bodyHtml += '<th>결재자</th>'
   	                 bodyHtml += '<th>결제상태</th>'	
   	                 bodyHtml += '</tr>'; 
   	               for(var i = 0; i<dataMap.state.length; i++){ 
   	            	   
   	        
   	            	bodyHtml += '<tr >';
					   bodyHtml += '<td>'+dataMap.state[i].NO+'</td>';
					   bodyHtml += '<td>'+dataMap.state[i].NAME+'</td>';
					   bodyHtml += '<td>'+dataMap.state[i].TITLE+'</td>';
					   bodyHtml += '<td>'+dataMap.state[i].CONTENT+'</td>';
					   bodyHtml += '<td>'+dataMap.state[i].APPROVER+'</td>';
					   bodyHtml += '<td>'+dataMap.state[i].REG_DATE+'</td>';
					   bodyHtml += '<td>'+dataMap.state[i].SIGN_STATUS+'</td>';
					   bodyHtml += '</tr>';  
   	            	   
   	               }
					   
				  
				   
		 	   $("#ahyeon").html(bodyHtml);  
			 
			   },
			   error: function(){
				  alert("비동기 실패");
			
			   }
		   }) 

	}) 	

})



function goDetail(seq){
	   location.href= 'detail?seq='+seq;
} 


function gopopup(){   
	
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (document.body.offsetHeight / 2) - (300 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	
	var popsize = "width=600px, height=500px , left="+popupX+"px', top = "+popupY+"px";
	    
	   window.open('popup' ,"check",popsize)
	   
}

/*    $("select[name=search_write]").change(function(){
	   console.log($(this).val()); 
	   console.log($("select[name=search_write]option:selected").text());
}) */


  
 
</script>
</head>

<body>
<div id ="headDiv">
  <div>
		${sessionScope.memberMap.NAME }(${sessionScope.memberMap.RANK })님 환영합니다        <input type = "button" id = "logout" value = "로그아웃" onclick = "location.href='logout'">
 </div>  
 
 <div style="display: flex; justify-content: space-between; align-items: center;">
	<div><input type="button" value="글쓰기" onclick = "location.href='write'"></div>  



	<c:if test ="${SessionRank =='A'|| SessionRank == 'B' }">

      <p><input  type ="button" value ="대리결재" onclick="gopopup()"><p>

	</c:if> 
	</div>
	
	
<%-- 	
	<div>"${SessionName}"</div>
	<div>"${proxy[0].EMPLOYER }"</div>  --%>
<!-- 대리결재자  -->	



    	<c:forEach items="${proxy}"  var="proxyZ"> 
	<c:choose>
	<c:when test = "${proxyZ.EMPLOYER != null && proxyZ.EMPLOYER == sessionScope.memberMap.NAME }" >
	
	  <tr>
    
           <td>(<c:out value="${ proxyZ.EMPLOYER}"></c:out>)님의 권한을</td>
           <td>(<c:out value="${ proxyZ.EMPLOYEE}"></c:out>)이 부여했습니다</td>
          </tr>
<br>
	</c:when>
	</c:choose>
     </c:forEach> 
     
     
     <c:forEach items="${proxy}"  var="proxyZ"> 
	<c:choose>
	<c:when test = "${proxyZ.EMPLOYER != null && proxyZ.EMPLOYEE == sessionScope.memberMap.NAME }" >
	
	  <tr>
    
           <td>(<c:out value="${ proxyZ.EMPLOYER}"></c:out>)님의 권한을</td>
           <td>(<c:out value="${ proxyZ.EMPLOYEE}"></c:out>)이 부여받았습니다</td>
          </tr>
<br>
	</c:when>
	</c:choose>
     </c:forEach> 
     
     
     
     
     
     



	
	<div id="innerDiv">
   <!-- 검색 --> 
  	<form   name = "search"  action = "list">
	
		<div> 
			<select name="type" id="type">
				<option value="sel" ${search.search_write == 'sel' ? 'selected="selected"' : '' } >선  택</option>
				<option value="name" ${search.search_write  == 'name' ? 'selected="selected"' : '' }>작성자</option>
				<option value="appro"  ${search.search_write  == 'appro' ? 'selected="selected"' : '' }>결재자</option>
				<option value="title" ${search.search_write  == 'title' ? 'selected="selected"' : '' } >제목 + 내용</option>
			</select>

	<input type="text" name="content" value="${search.content}"></input>
			
			<select name ="search_state" id="search_state">
				<option  value="선결재상태" ${search.search_state == '선결재상태' ? 'selected="selected"' : '' } >선결재상태</option>
				<option  value="임시저장" ${search.search_state == '임시저장' ? 'selected="selected"' : '' }>임시저장</option>
				<option  value="결재대기" ${search.search_state == '결재대기' ? 'selected="selected"' : '' }>결재대기</option>
				<option value="결재중" ${search.search_state == '결재중' ? 'selected="selected"' : '' } >결재중</option> 
				<option value="결재요청" ${search.search_state == '결재요청' ? 'selected="selected"' : '' }>결재요청</option> 
				<option value="결재완료" ${search.search_state == '결재완료' ? 'selected="selected"' : '' }>결재완료</option> 
				<option value="반려" ${search.search_state == '반려' ? 'selected="selected"' : '' }>반려</option>
			</select>
			<br>
			
			<input name="date" type="date"> ~ <input name="date2" type="date">  
		</div>
		<button type="submit" id="btn" >검색</button>
	</form>
	
	
	</div>
	
	</div>
  <br>  
  
  
  
  <div style="text-align:center">
  
  <table  border="1" id="ahyeon"  >
<tr  >
   <th>번호</th>
   <th>작성자</th>
   <th>제목</th>
   <th>내용</th>
   <th>결제일</th>
   <th>결재자</th>
   <th>결제상태</th>
</tr> 

<%-- <p>"${SessionRank}"</p> --%>

<!--    (boardList.id == SessionID)&& --> 


<!-- 
   <tr>
   <td colspan ="7">    작성된 글 없음</td>
   </tr>
 -->

   <c:forEach items="${boardlist}" var="boardList"> 
   <c:choose>  

<%--  
    <c:when test ="${boardList == '[]' }">
    <tr>
   <td colspan ="7">    작성된 글 없음</td>
   </tr>
   </c:when> 
  --%>

   <c:when test ="${ (SessionRank =='C'|| SessionRank == 'D') && boardList.id == SessionID  }">
   <tr onclick="goDetail(${boardList.no})"  >
   	      <td><c:out value="${boardList.no}"></c:out></td>
	   <td><c:out value="${boardList.name}"></c:out></td>
	   <td><c:out value="${boardList.title}"></c:out></td>
	   <td><c:out value="${boardList.content}"></c:out></td>
	   <td><c:out value="${boardList.reg_date}"></c:out></td>
	   <td><c:out value="${boardList.approver}"></c:out></td>
	   <td><c:out value="${boardList.sign_status}"></c:out></td>
	 
   </tr>
   </c:when> 
   
   
      
     <c:when test ="${SessionRank == 'B' && boardList.name != SessionName && ( boardList.sign_status == '결재중' || boardList.sign_status == '결재완료' || (boardList.sign_status == '결재대기' && boardList.rank != 'A') ||boardList.sign_status == '반려' )}">
   <tr onclick="goDetail(${boardList.no})">
	   <td><c:out value="${boardList.no}"></c:out></td>
	   <td><c:out value="${boardList.name}"></c:out></td>
	   <td><c:out value="${boardList.title}"></c:out></td>
	   <td><c:out value="${boardList.content}"></c:out></td>
	   <td><c:out value="${boardList.reg_date}"></c:out></td>
	   <td><c:out value="${boardList.approver}"></c:out></td>
	   <td><c:out value="${boardList.sign_status}"></c:out></td>
   </tr> 
   </c:when>



  <c:when  test ="${SessionRank == 'B' && boardList.name == SessionName && ( boardList.sign_status == '결재중' || boardList.sign_status == '결재완료' || boardList.sign_status == '결재대기' ||boardList.sign_status == '결재'|| boardList.sign_status =='임시저장'|| ( boardList.approver= SessionName && boardList.sign_status =='반려' ) )}">
   <tr onclick="goDetail(${boardList.no})"  >
	   <td><c:out value="${boardList.no}"></c:out></td>
	   <td><c:out value="${boardList.name}"></c:out></td>
	   <td><c:out value="${boardList.title}"></c:out></td>
	   <td><c:out value="${boardList.content}"></c:out></td>
	   <td><c:out value="${boardList.reg_date}"></c:out></td>
	   <td><c:out value="${boardList.approver}"></c:out></td>
	   <td><c:out value="${boardList.sign_status}"></c:out></td>
   </tr> 
   </c:when>
   
   

   
     <c:when test ="${SessionRank == 'A' && boardList.name != SessionName && ( boardList.sign_status == '결재중' || boardList.sign_status == '결재완료'  ||boardList.sign_status == '결재'|| (  boardList.approver= SessionName && boardList.sign_status =='반려' )||(boardList.rank == 'B' && boardList.sign_status == '결재대기' ))}">
   <tr onclick="goDetail(${boardList.no})"  >
	   <td><c:out value="${boardList.no}"></c:out></td>
	   <td><c:out value="${boardList.name}"></c:out></td>
	   <td><c:out value="${boardList.title}"></c:out></td>
	   <td><c:out value="${boardList.content}"></c:out></td>
	   <td><c:out value="${boardList.reg_date}"></c:out></td>
		<td><c:out value="${boardList.approver}"></c:out></td>
	   <td><c:out value="${boardList.sign_status}"></c:out></td>
   </tr> 
   </c:when>
   
   
<%--      <c:when test ="${SessionRank == 'A' && boardList.name != SessionName && (boardList.rank == 'B' && boardList.sign_status == '결재대기' )}">
   <tr onclick="goDetail(${boardList.no})"  >
	   <td><c:out value="${boardList.no}"></c:out></td>
	   <td><c:out value="${boardList.name}"></c:out></td>
	   <td><c:out value="${boardList.title}"></c:out></td>
	   <td><c:out value="${boardList.content}"></c:out></td>
	   <td><c:out value="${boardList.reg_date}"></c:out></td>
		<td><c:out value="${boardList.approver}"></c:out></td>
	   <td><c:out value="${boardList.sign_status}"></c:out></td>
   </tr> 
   </c:when>
 --%>


  <c:when  test ="${SessionRank == 'A' && boardList.name == SessionName && ( boardList.sign_status == '결재대기' || boardList.sign_status == '결재완료'  ||boardList.sign_status == '결재중'||  boardList.sign_status =='반려' || boardList.sign_status =='임시저장')}">
   <tr onclick="goDetail(${boardList.no})"  >
	   <td><c:out value="${boardList.no}"></c:out></td>
	   <td><c:out value="${boardList.name}"></c:out></td>
	   <td><c:out value="${boardList.title}"></c:out></td>
	   <td><c:out value="${boardList.content}"></c:out></td>
	   <td><c:out value="${boardList.reg_date}"></c:out></td>
	   <td></td>
	   <td><c:out value="${boardList.sign_status}"></c:out></td>
   </tr>  
  
   </c:when> 
   
   
   
   <!--대리결재 권한 받았을때   -->
      <c:when test ="${ (proxyZ.EMPLOYER != null && proxyZ.EMPLOYEE == sessionScope.memberMap.NAME)}">
   <tr onclick="goDetail(${boardList.no})"  >
  	   <td><c:out value="${boardList.no}"></c:out></td>
	   <td><c:out value="${boardList.name}"></c:out></td>
	   <td><c:out value="${boardList.title}"></c:out></td>
	   <td><c:out value="${boardList.content}"></c:out></td>
	   <td><c:out value="${boardList.reg_date}"></c:out></td>
	   <td><c:out value="${boardList.approver}"></c:out></td>
	   <td><c:out value="${boardList.sign_status}"></c:out></td>
	 
   </tr>
   </c:when> 

  </c:choose> 
   </c:forEach>
  
  
  </table>
  </div>
    
  
</body>
</html>