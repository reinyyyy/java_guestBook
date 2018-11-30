package board.bean;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.Data;

@Data
public class BoardPaging {
	private int currentPage;
	private int pageBlock;
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	 
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;

		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			pagingHTML.append("[<a id='paging' href='boardList.do?pg="+(startPage-1)+"'>이전</a>]");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id='currentPaging' href='boardList.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id='paging' href='boardList.do?pg="+i+"'>"+i+"</a>]");
		}
		if(endPage < totalP)
			pagingHTML.append("[<a id='paging' href='boardList.do?pg="+(endPage+1)+"'>다음</a>]");
	}
}



















		








