package com.payment.www.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payment.www.dao.PaymentDaoClass;
import com.payment.www.dao.PaymentDaoInter;
import com.payment.www.vo.BoardVO;
import com.payment.www.vo.MemberVO;

import oracle.jdbc.proxy.annotation.SetDelegate;



@Service
public class PaymentService implements PaymentServiceInter { 
 

@Inject 
public PaymentDaoInter dao;


@Override
public MemberVO login(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int insert(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return dao.insert(map);
}





//글 생성시 자동으로 seq 생성  =>id별 글 생성 번호  (히스토리에)
@Override
public int maxNum(String id) {
	// TODO Auto-generated method stub
	return dao.maxNum(id);
}

//히스토리에 저장된 글 띄울려고 id에 맞는 글 db에서 받아옴 
@Override
public List<Map<String, Object>> getHistory(String id) {
	// TODO Auto-generated method stub
	return dao.getHistory(id);
}




@Override
public List<Map<String, Object>> statusInsert(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return dao.statusInsert(map);
}

@Override
public List<Map<String, Object>> stateCheck(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return dao.stateCheck(map);
}

@Override
public List<Map<String, Object>> search(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return dao.search(map);
}

@Override
public void proxy(Map<String, Object> map) {
	//리턴받을 값이 없으므로 return을 뺴준다 @@!!!
	dao.proxy(map);
	// TODO Auto-generated method stub
	
}



@Override
public List<BoardVO> list(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return dao.list(map);
}



@Override
public Map<String, Object> detail(Map<String, Object> dataMap) {
	// TODO Auto-generated method stub
	return dao.detail(dataMap);
}

@Override
public List<BoardVO> getmember(Map res1) {
	// TODO Auto-generated method stub
	return dao.getmember(res1);
}

@Override
public Map<String, Object> getselectMem(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return dao.getselectMem(map);
}

@Override
public List<Map<String, Object>> getproxy(String name) {
	// TODO Auto-generated method stub
	return dao.getproxy(name);
}










}





  
	




