<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 목록 보기</h2>
	
	<%
		ArrayList<String> list = null;
	
		if(request.getAttribute("list") !=null){
			
			list = (ArrayList<String>)request.getAttribute("list");
			
			// 전체 게시글 수
			int totalCnt = list.size();
			
			// 페이지당 게시글 수
			int limit = 10;
			
			// 현재 페이지 번호의 시작
			int currentPage = 1;
			
 			if(request.getAttribute("currentPage") !=null){
				currentPage = Integer.parseInt(request.getAttribute("currentPage").toString());
			} 
			
/* 			for(int i=0; i<list.size(); i++){
				out.println(list.get(i)+"<br/>");		
			} */
			
			out.println("<hr>");
			
			//**************** 게시글 출력 부분 ******************* 
			// begin : 각페이지의 시작게시글 번호 
			int begin = (currentPage-1)*limit;
			// System.out.println(begin+limit);
			int end = begin+limit;
			// end는 : 각페이지의 마지막 게시글 번호
			// end는 전체게시글 수를 초과할 수 없음. 초과할 경우에는 totalCnt로 변경
			if(end > totalCnt) end = totalCnt;
			
/* 			for(int i=begin; i<begin+limit; i++){
				out.println(list.get(i)+"<br/>");
			} */

			for(int i=begin; i<end; i++){
				out.println(list.get(i)+"<br/>");
			}
			//*************************************************
			out.println("<hr>");
			
			// int blockSize = 5;
			// parseInt(문자열), request.getAttribute("blockSize")=>Object
			int blockSize = Integer.parseInt(request.getAttribute("blockSize").toString());
			
			// curBlock이 0이면 첫번째 블럭
			int curBlock = 0;
			curBlock = Integer.parseInt(request.getAttribute("curBlock").toString());
			
			// 전체 페이지수
			int totalPage = (int)Math.ceil((double)totalCnt/limit);
			
			
			// 블럭의 시작값
			// 첫번째블럭, 두번째블럭, 세번째 블럭,....
			// 0*5+1=1, 1*5+1=6, 2*5+1=11,...
			int blockStart = curBlock*blockSize + 1;
			
			// 블럭의 마지막값
			// 첫번째블럭, 두번째블럭, 세번째 블럭,....
			// 1+4=5, 6+5=10, 11+4=15,....
			int blockEnd = blockStart + (blockSize - 1);
			
			// blockEnd는 totalPage보다 클수가 없다. totalPage보다 크면 totalPage로 변경
			if(blockEnd > totalPage) blockEnd = totalPage;
			
			out.println("<hr>");
			/******************* PAGINATION **************************
			/* 이전 페이지 버튼 */
			if(blockStart -1 > 0){
				%>
					<a href="list.do?currentPage=<%=blockStart - 1%>">이전</a>
				<%
			}
			
			// 해당블럭의 페이지 번호를 출력하기
			for(int i = blockStart; i<=blockEnd; i++){
			%>
				<a href="list.do?currentPage=<%=i%>"><%=i%></a>
			<%
			}
			
			if(blockEnd < totalPage){
				%>
					<a href="list.do?currentPage=<%=blockEnd + 1%>">다음</a>
				<%
			}
			/*****************************************************  */
			out.println("<hr>");
			
			// 이전 버튼을 출력하기
			if(blockStart -1 > 0){
				%>
					<a href="list.do?currentPage=<%=blockStart - 1%>">이전</a>
				<%
			}
			
			out.println("<hr>");
			// 다음 버튼을 출력하기
			
			if(blockEnd < totalPage){
				%>
					<a href="list.do?currentPage=<%=blockEnd + 1%>">다음</a>
				<%
			}
		}
	
	%>

</body>
</html>