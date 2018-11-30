package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Transactional
@Component
public class BoardDAOMybatis implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int boardWrite(Map<String,String> map) {
		return sqlSession.insert("boardSQL.boardWrite", map);
	}

	@Override
	public List<BoardDTO> boardList(int startNum, int endNum) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		return sqlSession.selectList("boardSQL.boardList", map);
	}

	@Override
	public int boardTotal() {
		return sqlSession.selectOne("boardSQL.boardTotal");
	}

}
