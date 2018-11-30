package board.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Controller
public class BoardController {
	
	@Autowired
	public BoardDAO boardDAO;
	
	@Autowired
	public BoardDTO boardDTO;
	
	@RequestMapping(value="/main/index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "../template/body.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	@RequestMapping(value="/board/boardWriteForm.do", method = RequestMethod.GET)
	public ModelAndView boardWriteForm(@ModelAttribute ModelAndView mav) {
		mav.addObject("display", "../template/boardWriteForm.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	@RequestMapping(value="/board/boardWrite.do", method = RequestMethod.POST)
	public @ResponseBody int boardWrite(@RequestParam Map<String,String> map) {
		return boardDAO.boardWrite(map);
	}
	@RequestMapping(value="/board/boardList.do", method = RequestMethod.GET)
	public ModelAndView boardList(@ModelAttribute ModelAndView mav, @RequestParam(defaultValue="1",name="pg") int pg) {
		int endNum = pg*5;
		int startNum = endNum-4;
		
		ArrayList<BoardDTO> list = (ArrayList<BoardDTO>)boardDAO.boardList(startNum,endNum);
		
		int totalA = boardDAO.boardTotal();
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("display", "../template/boardList.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	

	

}
