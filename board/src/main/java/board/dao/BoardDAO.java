package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {
	
	public int boardWrite(Map<String,String> map);
	
	public List<BoardDTO> boardList(int startNum, int endNum);
	
	public int boardTotal();

}
