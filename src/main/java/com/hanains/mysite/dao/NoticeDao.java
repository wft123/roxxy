package com.hanains.mysite.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanains.mysite.vo.NoticeVo;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public NoticeDao(){
	}
	
	public void insert(NoticeVo vo){
		sqlSession.insert("notice.insert",vo);
	}
	
	public NoticeVo getView(long no){
		NoticeVo vo = sqlSession.selectOne("notice.getView", no);
		return vo;
	}
	
	public void upCount(long no){
		sqlSession.update("notice.upViewCount",no);
	}
	
	public void modify(NoticeVo vo){
		sqlSession.update("notice.modify",vo);
	}
	
	public void delete(long no){
		sqlSession.delete("notice.delete",no);
	}

	public long getNoticeSize(String kwd, String searchType){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd", kwd);
		map.put("searchType", searchType);
		return sqlSession.selectOne("notice.getNoticeSize",map);
	}
	
	public long getMaxGroup(){
		return sqlSession.selectOne("notice.getMaxGroup");
	}
	
	public long getMaxOrder(long group_no){
		return sqlSession.selectOne("notice.getMaxOrder", group_no);
	}
	
	public List<NoticeVo> getListPage(long pageNo, String kwd, String searchType, int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd", kwd);
		map.put("searchType", searchType);
		map.put("start", 1+(pageNo-1)*pageSize);
		map.put("end", pageNo*pageSize);
		
		List<NoticeVo> list = sqlSession.selectList("notice.getListPage",map);
		return list;
	}
	
}
