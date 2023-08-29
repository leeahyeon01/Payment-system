package com.payment.www.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.payment.www.service.MailSendService;

import com.payment.www.service.PaymentService;
import com.payment.www.service.PaymentServiceInter;
import com.payment.www.vo.BoardVO;
import com.payment.www.vo.MemberVO;

@Controller
public class PaymentController {

	@Autowired
	SqlSessionTemplate sqlSession; 

	@Inject
	public PaymentServiceInter service; 
	
	@Autowired
public MailSendService mailservice;
	
	@RequestMapping("login")
	public String login(String loginChk, Model model) {

		model.addAttribute("loginChk", loginChk);
		return "login";
	}

//로그인 버튼 입력시 
	@RequestMapping("loginCheck")
	public String loginCheck(String id, String pw, Model model, HttpSession session) {

//	service, dao 거치치 않고 바로 mapper랑 연결 
		Map<String, Object> map = sqlSession.selectOne("mapper.loginCheck", id);
//   
//		Map<String,Object> res = new HashMap<String,Object>();
//		res.put("id", id);
//		res.put("pw",pw);

		if (map == null) {
			model.addAttribute("loginChk", "ID");
			System.out.println("아이디틀림");
			return "redirect:login";

			// session에 저장하면 자료형이object로 바뀌기 떄문에 session 값을 꺼내 쓸려면
			// 데이터에 맞는 형변환을 해줘야한다.
		} else if (!pw.equals(map.get("PW").toString())) {
			System.out.println("비번틀림");
			model.addAttribute("loginChk", "PW");
			return "redirect:login";
		} else {
			System.out.println("로그인성공");
			session.setAttribute("memberMap", map);//✨💗💥로그인세션 정보
			return "redirect:list";
		}

	}

	@RequestMapping("logout")
	public String logOut(HttpSession session) {
		session.invalidate();

		return "redirect:login";
	}

// ,HttpSession session
//글쓰는곳로 넘어감 
	@RequestMapping("write")
	public String write(Model model, Map<String, Object> map, HttpSession session) {

		// 로그인 session 정보를 받아와 map에 넣어줌
		Map res1 = (Map) session.getAttribute("memberMap");
		System.out.println("로그인세션값" + res1);

		model.addAttribute("sessionID", res1);
		String id = res1.get("ID").toString();

		System.out.println("로그인한 아이디가 이거다!!!!!" + id);

		// 글 생성시 자동으로 seq 생성 =>id별 글 생성 번호 (히스토리에)
		// 뒤에서 받을 거 = 뒤로 보낼꺼
		int boardNum = service.maxNum(id);
		System.out.println("받은 숫자다!!" + boardNum);
		model.addAttribute("seqNO", boardNum);

		// 임시저장🐥🦖
      List<Map<String, Object>> history = new ArrayList<Map<String, Object>>();
       history = service.getHistory(id);
		  
		  model.addAttribute("history", history);
		 System.out.println("history"+ history); 

		return "write";
	}

//write값 입력시  list에 값 추가하고  list페이지 반환하기 
	@RequestMapping("insert")
	public String insert(@RequestParam Map<String, Object> map) {
	//	map.put("status", "결재요청");
		System.out.println("insert!!!" + map);
		

		
		int insert = service.insert(map);

//리스트로 가서 

//  jsp에 값을 보낼떄 Model을 사용함, list 값을  띄움	 	
		/*
		 * model.addAttribute("bbbb", list); model.addAttribute("boardPager",
		 * boardPager);
		 */

		if ((map.get("title").toString()) == null) {
			System.out.println("제목을 입력하시오");
			return "redirect:write";

		} else if ((map.get("content").toString()) == null) {
			System.out.println("내용을 입력하시오");
			return "redirect:write";
		} else {
			return "redirect:list";

		}

	}

//main 페이지에 list를 띄어줌
	@RequestMapping("list")

	public String list(Model model ,HttpSession session ,@RequestParam Map<String,Object> map) {
		
		System.out.println("검색값" + map); 
		List<Map<String,Object>> search = new ArrayList<Map<String,Object>>();
		
		
		//로그인 세션값 받아와서 id값만 추출
		Map res1 = (Map) session.getAttribute("memberMap");
		String id = res1.get("ID").toString(); 
		String rank = res1.get("RANK").toString();
		String name = res1.get("NAME").toString();
		model.addAttribute("SessionID", id); 
	    model.addAttribute("SessionRank", rank);   
	   model.addAttribute("SessionName",name);
	    
	    System.out.println(res1);
	    System.out.println(id);
	    System.out.println(rank);
	    System.out.println(name);

   //vo 자료형을 사용하여 db lee_board의list값을 받아옴 	
		List<BoardVO> list = new ArrayList<BoardVO>();
		

	    
  //list메소드를 통해 service단으로 보냄
		list =service.list(map); 
		
		System.out.println("쿠쿠쿠"+list);
  
			System.out.println("캬ㅑㅑ"+map);

		// jsp에 값을 넘길떄 model 사용함
		model.addAttribute("boardlist", list); 

		model.addAttribute("search", map); 
		
		
		//proxy 값을 받아오기 위한 service
		List<Map<String,Object>> dataMap = new ArrayList<Map<String,Object>>();
		

		   dataMap =service.getproxy(name);
	 
		   System.out.println("proxy값 받은거 ~~"+ dataMap); 
		   
		   model.addAttribute("proxy",dataMap);

		return "list";

	} 
	
	//비동기 
    @ResponseBody 
	@RequestMapping("searchList")
    public Map<String, Object> searchList(Model model ,@RequestParam Map<String, Object> map , HttpSession session) {
    	System.out.println(map); 
    	
    	Map res1 = (Map) session.getAttribute("memberMap"); //map에 담아서 보낸다.
    	
    String id = (String) res1.get("ID");
   	
    	map.put("id" , id);  
    	
    	//비동기로 받은값 
     	System.out.println("3333333"+map); 
   	
/*   for(Map.Entry<String, Object> entry : map.entrySet()) 
   {
	   System.out.println("key" + entry.getValue()); 
	   
	   String key = (String) entry.getValue();
	   
	   System.out.println(key);  

	   
   }*/
   
   
   List<Map<String,Object>> state = new ArrayList<Map<String,Object>>();
   state = service.stateCheck(map);
   
   System.out.println("하이222222222" +state); 
   
   model.addAttribute("mapper_state", state );
   Map<String, Object> dataMap = new HashMap<String,Object>();
    	
   dataMap.put("state", state);
	  
	  return dataMap;
	
    }


//제목을 클릭하면 해당 글의 seq값을 받아옴 
	@RequestMapping("detail")
	public String detail(int seq, Model model, HttpSession session) {

		System.out.println("7777777777777777"+seq);
		
		
		Map res1 = (Map)session.getAttribute("memberMap");
		System.out.println("detail 로그인값" + res1);
		String name = res1.get("NAME").toString();
				String id = res1.get("ID").toString();
				
				
		 Map<String, Object> dataMap = new HashMap<String,Object>();
		 dataMap.put("seq", seq);
		 dataMap.put("name", name);
		 dataMap.put("id", id);
		 System.out.println("detail에서 mapper로 보낼값@@"+dataMap);
		
		
/*           List<BoardVO> data = new ArrayList<BoardVO>();
		BoardVO vo = service.detail(dataMap);
		 data = service.detail(dataMap);*/
		 

		 Map<String, Object> data = new HashMap<String,Object>();
		 
		 
		 data = service.detail(dataMap); 
		 

		 
		 
		model.addAttribute("detail", data);
		System.out.println("detail값 ^&^&^&^"+data);

		// 로그인 session 정보를 받아와 map에 넣어줌

		System.out.println("detail 로그인값" + res1);

	//jsp에  넘겨줌 
		model.addAttribute("sessionID", res1);

		return "view";

	} 
	//결제상태 값 받음  submit 
	@RequestMapping("statusInsert") 
	public String statusInsert(@RequestParam Map<String, Object> map) {
		System.out.println("결제상태 !!" + map);
		return null;
		
	} 
	
	
	// view에서 결제 값 받아오기 
	@RequestMapping("approve") 
	public String approve(@RequestParam Map<String, Object> map) { 
	
		System.out.println("결제 승인 값 !!!!"+map);  
		
	
		
		/*String status = map.get("boardSignStatus").toString();
		System.out.println("STATUS : !!" + status);*/
		
		//받은 결재상태를 service단으로 보내서 list에서의  결재상태를 바꿔줌
		List<Map<String,Object>> status = new ArrayList<Map<String,Object>>();
		System.out.println("결제상태"+ map);
		status = service.statusInsert(map); 
	
		return "redirect:/list";
	}
 
	

	
	//회원가입페이지 
	@RequestMapping("singup") 

	public String singup() {
		return null;
	}  
	
	
	//signup 이메일 인증 -비동기
	@RequestMapping("mailCheck")
	@ResponseBody
	public String singup(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);  
		mailservice.joinEmail(email);
		String email2 = email;
		System.out.println("변수"+ email);
		
		 Map<String, Object> dataMap = new HashMap<String,Object>();
		 dataMap.put("email", email);
		return dataMap;
		
		return "";
		
	}
	
	
	
	// 시험 test
	@RequestMapping("test") 
	public String test(@RequestParam Map<String,Object> map) {

		System.out.println(map);
		return null;
	} 
	
	
	//검색 	
/*	@RequestMapping("searchFrm") 
	public String searchFrm(@RequestParam Map<String,Object> map) {
		System.out.println("검색값" + map); 
		
		List<Map<String,Object>> search = new ArrayList<Map<String,Object>>();
		search = service.search(map);
		
		System.out.println("검색 결과값 @@@"+search);
		return "redirect:/list";
	}
 
*/ 

	@RequestMapping("popup") 
	public String popup(@RequestParam Map<String,Object> map , Model model ,HttpSession session) {
	/*	System.out.println("선택된 직원@@@@"+map);*/
	
		
		//로그인 세션값 받아와서 id값만 추출
		Map res1 = (Map) session.getAttribute("memberMap");
		String id = res1.get("ID").toString(); 
		String rank = res1.get("RANK").toString();
		String name = res1.get("NAME").toString();
		model.addAttribute("SessionID", id); 
	    model.addAttribute("SessionRank", rank);   
	     model.addAttribute("SessionName",name);
		
		
	  System.out.println("ㅎㅎㅎㅎㅎㅎㅎㅎㅎ"+res1);

		List<BoardVO> membermap = new ArrayList<BoardVO>();
		membermap = service.getmember(res1);
	System.out.println("mepper에서 받은 popup :"+ membermap); 
	  model.addAttribute("member", membermap);

			  return "popup";

	} 
	
	
    @ResponseBody 
	@RequestMapping("proxy") 
    public Map<String, Object> proxy(@RequestParam Map<String,Object> map,HttpSession session ,Model model) {
    
    	//로그인 값 
    			Map res1 = (Map) session.getAttribute("memberMap");
    			System.out.println("로그인세션값" + res1);
    			String id = res1.get("ID").toString();
    			String names = res1.get("NAME").toString();
    			
    			String name = (String) map.get("employee"); 
    			map.put("login_name", names); 
    			System.out.println("로그인 아이디 추가한값" + map);
    			service.proxy(map);
    			model.addAttribute("aaa", name);
    				
    	return map;
    }
   
    
    @ResponseBody 
    @RequestMapping("selectMember")
    public Map<String, Object> selectMember(@RequestParam Map<String,Object> map ) {
    	
    	System.out.println("대리결제자 선택"+map); 
    
		 Map<String, Object> selected_member = new HashMap<String,Object>();
		selected_member = service.getselectMem(map);
		System.out.println("최종값"+selected_member);

    	return selected_member; 
    	
    }
	


	
}