package kh.init.messages;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.init.friends.FriendDTO;
import kh.init.members.MemberDTO;

@RequestMapping("message")
@Controller
public class MessageController {

	@Autowired
	private MessageService service;

	@Autowired
	private HttpSession session;

	// 메시지 메인
	@RequestMapping("messageMain")
	public String toMsgList(FriendDTO fdto, String id, Model model) {
		return "messages/messageMain";
	}

	// 친구 목록
	@RequestMapping(value="friendList.msg", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String toFriendList(String my_id, Model model) {
		MemberDTO sessionDTO = null;
		try {
			sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		List<MessageDTO> result = service.friendList(sessionDTO.getEmail());
		//		List<MessageDTO> result = service.friendList("123@123.123"); // 123@부분 session id로 바꿔야 함

		Gson gs = new Gson();
		return gs.toJson(result);
	}

	// 메시지 미리 보기 목록
	@RequestMapping(value="previewList.msg", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String toPreviewList(MessageDTO dto, String to_id, Model model) {
		MemberDTO sessionDTO = null;
		try {
			sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		List<MessageDTO> resultF = service.selectMsgUser(sessionDTO.getEmail());
		//		List<MessageDTO> resultF = service.friendList(sessionDTO.getEmail());
		//		List<MessageDTO> resultF = service.friendList("123@123.123"); // 123@부분 session id로 바꿔야 함
		List<MessageDTO> result = new ArrayList<>();

		for(MessageDTO tmp : resultF) {
			MessageDTO result2 = service.previewMsg(sessionDTO.getEmail(), tmp.getEmail());
			//			MessageDTO result2 = service.previewMsg("123@123.123", tmp.getFr_id()); // 123@부분 session id로 바꿔야 함
			result.add(result2);
		}

		Gson gs = new Gson();
		return gs.toJson(result);
	}

	// 대화 내용 보기
	@RequestMapping(value="messageView.msg", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String toView(MessageDTO dto, String fr_id, String to_id, Model model) {
		MemberDTO sessionDTO = null;
		try {
			sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		List<MessageDTO> result = service.selectAll(sessionDTO.getEmail(), to_id);
		//		List<MessageDTO> result = service.selectAll("123@123.123", to_id); // 123@부분 session id로 바꿔야 함
		Gson gs = new Gson();
		return gs.toJson(result);
	}

	// 메시지 보내기
	@RequestMapping(value="sendFly.msg", produces="text/html; charset=utf8")
	@ResponseBody
	public String sendMsg(MessageDTO dto, String to_id) {
		MemberDTO sessionDTO = null;
		try {
			sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		int result = service.insertMsg(dto, sessionDTO.getEmail(), to_id);
		//		int result = service.insertMsg(dto, "123@123.123", to_id); // 123@부분 session id로 바꿔야 함
		JsonObject obj = new JsonObject();
		obj.addProperty("contents", dto.getContents());
		return obj.toString();
	}

	// new 알림 있는지
	@RequestMapping(value="/isNewMsg.msg", produces="text/html; charset=utf8")
	@ResponseBody
	public String checkNewMsg(String from_id) {
		MemberDTO sessionDTO = null;
		try {
			sessionDTO = (MemberDTO)session.getAttribute("loginInfo");
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		String result = Integer.toString(service.isNewMsg(sessionDTO.getEmail()));
		//		String result = Integer.toString(service.isNewMsg("123@123.123"));
		// 나중엔 이메일 부분 session id로 받을 것
		return result;
	}

	//	@RequestMapping(value="messageView.msg", produces="text/html; charset=UTF-8", method = RequestMethod.GET)
	//	@ResponseBody
	//	public Object toView(MessageDTO dto, String fr_id, String to_id, Model model) {
	//		System.out.println("message 상세 보기 도착");
	//		List<MessageDTO> result = service.selectThirty("123@123.123", fr_id);
	//		for(MessageDTO tmp : result) {
	//			System.out.println(tmp.getContents() + " : " + tmp.getWrite_date());
	//		}
	//		
	//		Map<String, Object> ret= new HashMap<String, Object>();
	//		ret.put("resp", result);
	//		
	//		return ret;
	//	}
}
