package com.payment.www.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payment.www.vo.BoardVO;
import com.payment.www.vo.MemberVO;

@Repository
public class PaymentDaoClass implements PaymentDaoInter {
	
	@Inject
	 public SqlSessionTemplate sqlSession;

	@Override
	public String login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.loginCheck",map);
	}

	@Override
	public int insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.insert", map);
	}

	@Override
	public int maxNum(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.maxNum", id);
	}

	@Override
	public List<Map<String, Object>> getHistory(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.getHistory", id);
	}

	@Override
	public List<Map<String, Object>> statusInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.statusInsert", map);
	}

	@Override
	public List<Map<String, Object>> search(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.searchSql", map);
	}

	@Override
	public List<Map<String, Object>> stateCheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.stateCheck",map);
	}

	
	//return 은 mapper에서 받을값 을 적는다 ,
	// mapper에서 값을 안받을 것이므로 return을 뺴고 보낼거만 적는다 
	// public void(받을값) 메소드명 (파라미터 보낼값)
	
	@Override
	public void proxy(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.selectList("mapper.proxy",map);
		
	}



	@Override
	public List<BoardVO> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.list", map);
	}


	//💥map값을 mapper로 넘길때는 selectOne을 사용해야한다 !!한줄이므로 🦖✨
	@Override
	public Map<String, Object> detail(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.detail",dataMap);
	}

	@Override
	public List<BoardVO> getmember(Map res1) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.getmember", res1);
	}

	@Override
	public Map<String, Object> getselectMem(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.getselectMem", map);
	}

	@Override
	public List<Map<String, Object>> getproxy(String name) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.getproxy", name);
	}

	


	

	


	
	










	







	
	

	



	





}
