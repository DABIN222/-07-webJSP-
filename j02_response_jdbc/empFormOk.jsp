<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 에러가 발생하면 이동할 페이지 주소를 지시부에 명시한다. -->
<%@page errorPage="../j05_error_page/errorPage.jsp"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
   // 2. 드라이브로딩
   // 3. db연결
   public Connection getConnection(){
      Connection con = null;
      try{
         Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/demo","root","0000");         
      }catch(Exception e){
         System.out.println("DB연결 에러 발생...");
         e.printStackTrace();
      }
      return con;
   }
%>

<%
   request.setCharacterEncoding("utf-8");
   // 1. 폼의 데이터를 서버로 가져오기 : request
   int empno = Integer.parseInt(request.getParameter("empno"));
   String ename = request.getParameter("ename");
   int deptno = Integer.parseInt(request.getParameter("deptno"));
   
   // 3. DB연결
   Connection conn = getConnection();
   
   //4. preparedStatement만들기(sql)
   String sql = "insert into emp(empno, ename, deptno ) values (?, ?, ?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setInt(1, empno);
   pstmt.setString(2, ename);
   pstmt.setInt(3, deptno);
   
   
   
   //5. 실행
   //insert, delete, update -> executeUpdate() -> int
   //select -> executeQuery() -> resultSet
   int cnt = pstmt.executeUpdate();
   
   // 6. db닫기
   pstmt.close();
   conn.close();
   
   // 7. 페이지 이동
   
   /* if(cnt>0){//사원 등록
      //홈페이지로 이동
      response.sendRedirect(request.getContextPath()+"/index.jsp");
      
   }else{//사원등록 실패
      //사원등록폼으로 이동
      response.sendRedirect(request.getContextPath()+"/j02_response_jdbc/empForm.jsp");
   }
    */
    
   //javascript
   if(cnt>0){
      %>
	<script>
         alert("사원 등록 되었습니다.");
         location.href="<%=request.getContextPath()%>/index.jsp";
      </script>

	<%}else{
      %>
	<script>
      alert("사원 등록 실패하였습니다.");
      history.back();
      //location.href="<%=request.getContextPath()%>/j02_response_jdbc/empForm.jsp";
      
      </script>
	<%
   	}
   
	%>