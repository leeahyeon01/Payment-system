package com.payment.www.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.payment.www.vo.BoardVO;
import com.payment.www.vo.MemberVO;

public interface PaymentServiceInter {

	public MemberVO login(Map<String, Object> map);

	public int insert(Map<String, Object> map);

	public int maxNum(String id);
	
	public List<Map<String, Object>> getHistory(String id);

	public List<Map<String, Object>> statusInsert(Map<String, Object> map);

	public List<Map<String, Object>> stateCheck(Map<String, Object> map);

	public List<Map<String, Object>> search(Map<String, Object> map);


 // public 돌려받을값 - 돌려받을 값이 없으므로 void  Method (보낼값);
	public void proxy(Map<String, Object> map);

	public List<BoardVO> list(Map<String, Object> map);

	public Map<String, Object> detail(Map<String, Object> dataMap);

	public List<BoardVO> getmember(Map res1);

	public Map<String, Object> getselectMem(Map<String, Object> map);

	public List<Map<String, Object>> getproxy(String name);





	












	

	




	





	



}
