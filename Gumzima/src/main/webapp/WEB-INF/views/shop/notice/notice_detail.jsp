<%@page import="com.gumzima.shopping.model.domain.Notice"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	//정말로 포워딩이 요청을 유지햇는지 테스트해보자!!
	Notice notice =(Notice)request.getAttribute("notice"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<%@ include file="../inc/header.jsp" %>
<style>
.noticetext {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
.noticebutton {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
.noticebutton:hover {
  background-color: #45a049;
}
.noticecontainer {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script>
$(function(){
	CKEDITOR.replace("content"); //textarea의 id가 content인 컴포넌트를 편집기 스킨으로 변경
});
</script>
</head>
<head>
</head>
<body>
<%@ include file="../inc/top.jsp"%>	
<div class="noticecontainer">
  <form>
    <input type="hidden" name="notice_id" value="<%=notice.getNotice_id()%>"> 
    <input class="noticetext" type="text" name="title" value="<%=notice.getTitle()%>">
    <input class="noticetext" type="text" name="writer" value="<%=notice.getWriter()%>">
    <textarea class="noticetext" id="content" name="content" style="height:200px"><%=notice.getContent() %></textarea>
    
    <input  class="noticebutton" type="button" value="목록보기" onClick="location.href='/shop/notice/notice_list'"> 
  </form>
</div>

<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
          	<span>Get e-mail updates about our latest shops and special offers</span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            <form class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
 	<%@ include file="../inc/footer.jsp" %>
</body>
</html>
