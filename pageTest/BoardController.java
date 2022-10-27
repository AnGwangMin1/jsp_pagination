package pageTest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class BoardController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String ctx = request.getContextPath();
		String uri = request.getRequestURI();
		String cmd = uri.substring(ctx.length());
	
		String viewPage = "view/list.jsp";
		
		//System.out.println(cmd);
		
		if("/list.do".equals(cmd)) {
			ArrayList<String> list = new ArrayList<String>();
			
			for(int i=0; i<123; i++) {
				list.add(i + " | 게시판 테스트 글 목록.....");
			}
			
			// 현재 페이지가 있는 블럭위치
			int curBlock = 0;
			int currentPage = 1;
			int blockSize = 5;
			
			// 이전/다음 버튼을 클릭했을 때 블럭의 위치를 결정 or 클릭페이지를 다시 재설정
			if(request.getParameter("currentPage") !=null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				curBlock = (currentPage - 1)/blockSize;
			}
			
			
			request.setAttribute("curBlock", curBlock);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("list", list);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

}
