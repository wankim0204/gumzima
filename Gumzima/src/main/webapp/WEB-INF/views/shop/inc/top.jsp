<%@page import="com.gumzima.shopping.model.domain.Member"%>
<%@ page contentType="text/html; charset=utf-8"%>
<div class="py-1 bg-primary">
       <div class="container">
          <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
             <div class="col-lg-12 d-block">
                <div class="row d-flex">
                   <div class="col-md pr-4 d-flex topper align-items-center">
                      <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                      <span class="text">+ 1235 2355 98</span>
                   </div>
                   <div class="col-md pr-4 d-flex topper align-items-center">
                      <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                      <span class="text">gumzima@gumzima.com</span>
                   </div>
                   <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                      <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                   </div>
                </div>
             </div>
          </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="/">Gumzima</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
             <li class="nav-item active"><a href="/" class="nav-link">Home</a></li>
             <li class="nav-item active"><a href="/shop/product/list" class="nav-link">Products</a></li>
             <li class="nav-item active"><a href="/shop/recipe/list" class="nav-link">Recipes</a></li>
             <li class="nav-item active"><a href="/shop/notice/list" class="nav-link">Notice</a></li>
             <li class="nav-item active"><a href="/shop/customer/list" class="nav-link">1:1문의</a></li>
             <%Member mainMember=null; %>
             <%if(session.getAttribute("member")==null){ %>
             <li class="nav-item active"><a href="/shop/member/loginForm" class="nav-link">Sign In</a></li>
             <%}else{ %>
             	<%mainMember=(Member)session.getAttribute("member"); %>
             <li class="nav-item active"><a href="/shop/member/logout" class="nav-link">Sign Out</a></li>
             <%} %>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/shop/mypage/orderhistory">주문내역</a>
                <a class="dropdown-item" href="/shop/member/mypagehome">회원정보수정</a>
              </div>
              </li>
              <%if(mainMember==null || mainMember.getCode()!=1){ %>
             	<%if(session.getAttribute("cartItems")==null){ %>
	             	<li class="nav-item cta cta-colored"><a href="/shop/cart/list" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
             	<%}else{ %>
	             	<li class="nav-item cta cta-colored"><a href="/shop/cart/list" class="nav-link"><span class="icon-shopping_cart"></span>[<%=session.getAttribute("cartItems") %>]</a></li>
             	<%} %>
              <%}else{ %>
             	<li class="nav-item active"><a href="/admin" class="nav-link">관리자 페이지</a></li>
              <%} %>
           </ul>
         </div>
       </div>
     </nav>
    <!-- END nav -->