<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="boardWriteForm" id="boardWriteForm">
	<table class="center" cellspacing="0" cellpadding="5" border="1" align="center">
		<colgroup>
			<col width="100px"/>
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<td class="table_th"><span>*</span>작성자</td>
				<td class="table_td">
					<input type="text" class="w100" id="name" name="name" />
				</td>
			</tr>
			<tr>
				<td class="table_th">이메일</td>
				<td>
					<input type="text" class="w100" id="email" name="email" />
				</td>
			</tr>
			<tr>
				<td class="table_th"><span>*</span>제목</td>
				<td>
					<input type="text" class="w100" id="subject" name="subject" />
				</td>
			</tr>
			<tr>
				<td class="table_th"><span>*</span>내용</td>
				<td>
					<textarea rows="5" class="w100" id="content" style="resize:none;" name="content"></textarea>
					
				</td>
			</tr>
			<tr>
				<td colspan="2" class="button_td">
					<div id="contentDiv"></div>
					<input type="button" id="boardWriteBtn" value="글쓰기"/>
					<input type="reset" value="다시작성"/>
				</td>
			</tr>
		</tbody>
	</table>
</form>