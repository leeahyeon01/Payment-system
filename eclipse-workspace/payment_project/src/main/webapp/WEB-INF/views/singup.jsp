<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head> 
 <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // īī�� �ּ�api
    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���� �׸� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    
    } 
    
    $(function(){
    	
        
        $('#mail-Check-Btn').click(function() {
    		const email = $('#userEmail1').val() + $('#userEmail2').val(); // �̸��� �ּҰ� ������!
    		console.log('�ϼ��� �̸��� : ' + email); // �̸��� ������ Ȯ��
    		const checkInput = $('.mail-check-input') // ������ȣ �Է��ϴ°� 
    		
    		$.ajax({
    			type : 'get',
    			url : '<c:url value ="/mailCheck?email="/>'+email,// GET����̶� Url �ڿ� email�� �������ִ�.
    			success : function (dataMap) {
    				console.log("dataMap : " +  dataMap);
    				checkInput.attr('disabled',false);
    				code =email;
    				alert('������ȣ�� ���۵Ǿ����ϴ�.')
    			}			
    		}); // end ajax
    	}); // end send eamil
    
   
    	//������ȣ �� 
    	// blur -> focus�� ����� ��� �߻�
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('������ȣ�� ��ġ�մϴ�.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('������ȣ�� ����ġ �մϴ�. �ٽ� Ȯ�����ּ���!.');
			$resultMsg.css('color','red');
		}
    	
    	
    	
    	
    })
    
    
    
    

    
</script>


<body>  




<h4>ȸ������<h4>
<div>
���̵�: <input type="text" placeholder ="���̵� �Է��ϼ���"> <input type="button" value="�ߺ�üũ"><br>
��й�ȣ: <input  type="text" placeholder ="��й�ȣ�� �Է��ϼ���"><br>
��й�ȣ Ȯ��: <input type="text" placeholder ="��й�ȣ�� �Է��ϼ���"><br>
�̸�: <input type="text" placeholder ="�̸��� �Է��ϼ���"> <br>


<br>
<input type="text" id="sample4_postcode" placeholder="�����ȣ">
<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
<input type="text" id="sample4_roadAddress" placeholder="���θ��ּ�">
<input type="text" id="sample4_jibunAddress" placeholder="�����ּ�">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" placeholder="���ּ�">
<input type="text" id="sample4_extraAddress" placeholder="�����׸�">
<br>
<br>


<div class="form-group email-form">
	 <label for="email">�̸���</label>
	 <div class="input-group">
	<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="�̸���" >
	<select class="form-control" name="userEmail2" id="userEmail2" >
	<option>@naver.com</option>
	<option>@daum.net</option>
	<option>@gmail.com</option>
	<option>@hanmail.com</option>
	 <option>@yahoo.co.kr</option>
	</select>
	
<div class="input-group-addon">
	<button type="button" class="btn btn-primary" id="mail-Check-Btn">��������</button>
</div>
	<div class="mail-check-box">
<input class="form-control mail-check-input" placeholder="������ȣ 6�ڸ��� �Է����ּ���!" disabled="disabled" maxlength="6">
</div>
	<span id="mail-check-warn"></span>
</div>

<br>
<br>


����ó:<input type="text" placeholder="��ȣ�� �Է��ϼ���"> <input type="button" value="������ȣ"><br>
      <input type="text" placehodler="������ȣ�� �Է��ϼ���"> <input type="button" value="Ȯ��">  <br>
      <br>
      <input type="button" value="ȸ������">

</div>

</body>
</html>