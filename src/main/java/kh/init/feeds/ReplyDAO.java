package kh.init.feeds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int registerReply(FeedDTO dto)throws Exception{
		return jdbc.insert("Feed.registerReply", dto);
	}
	public int deleteReply(String col,int val)throws Exception{
		Map<String,Object> param = new HashMap<>();
		param.put("col", col);
		param.put("val", val);
		return jdbc.delete("Feed.deleteReply",param);
	}
	public List<ReplyDTO> viewReply(int feed_seq)throws Exception{
		return jdbc.selectList("Feed.viewReply",feed_seq);
	}
}
