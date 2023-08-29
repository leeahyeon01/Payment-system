package com.payment.www.dao;

import java.util.List;
import java.util.Map;

import com.payment.www.vo.BoardVO;

//vo에서 import 받아온다

import com.payment.www.vo.MemberVO;

public interface PaymentDaoInter {



public String login(Map<String, Object> map);

public int insert(Map<String, Object> map);



public int maxNum(String id);

List<Map<String, Object>> getHistory(String id);

public List<Map<String, Object>> statusInsert(Map<String, Object> map);

public List<Map<String, Object>> search(Map<String, Object> map);

public List<Map<String, Object>> stateCheck(Map<String, Object> map);

public void proxy(Map<String, Object> map);

public List<BoardVO> list(Map<String, Object> map);


public Map<String, Object> detail(Map<String, Object> dataMap);

public List<BoardVO> getmember(Map res1);

public Map<String, Object> getselectMem(Map<String, Object> map);

public List<Map<String, Object>> getproxy(String name);


































}
