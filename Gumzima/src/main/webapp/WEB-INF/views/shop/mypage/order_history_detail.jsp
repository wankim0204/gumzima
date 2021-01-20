
<%@page import="com.gumzima.shopping.model.common.Formatter"%>
<%@page import="com.gumzima.shopping.model.domain.OrderStatus"%>
<%@page import="com.gumzima.shopping.model.domain.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.gumzima.shopping.model.domain.Orders"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
Orders orders =(Orders)request.getAttribute("Orders");
	List<OrderDetail> order_detail_list = orders.getOrder_detail_list();
	List<OrderStatus> orderStatusList = (List)request.getAttribute("OrderStatusList");
%>
<!DOCTYPE html>
<html>
<head>
	<title>Vegefoods - Free Bootstrap 4 Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- include haeader -->
 	<%@ include file="../inc/header.jsp" %>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 50%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}
.checked {
  color: orange;
}
</style>
</head>
<body>
	
	<%@ include file="../inc/top.jsp"%>
	<!-- For Product List -->
	<div class="container d-flex justify-content-center mt-50 mb-50">
    <div class="row">
    		<div class="col-md-10">
    		<h1>주문 상세</h1>
    		<hr >
					<!-- 주문정보 테이블 -->
					<form id="detail_form">
						<p>
							<table>
								<thead>
									<h3>수취인 정보</h3>
								</thead>
								<tbody>
									<tr>
										<td colspan="1">주문번호
										<input name="orders_id" type="hidden" value="<%=orders.getOrders_id()%>"></input>
										</td>
										<td colspan="2"><%=orders.getOrders_id()%></td>
										<td colspan="1">주문일자</td>
										<td colspan="2"><%=orders.getOrder_date() %></td>
									</tr>
									<tr>
										<td colspan="1">결제방법</td>
										<td colspan="2"><%=orders.getPaymethod_id() %></td>
										<td colspan="1">입금인</td>
										<td colspan="2"><%=orders.getMoney_sender() %></td>
									</tr>
									<tr>
										<td colspan="1">운송장번호</td>
										<td colspan="2"><%=orders.getInvoice_number()%></td>
										<td colspan="1">발송일자</td>
										<td colspan="2"><%=orders.getShipment_date() %></td>
									</tr>
									<tr>
										<td colspan="1">처리상태:</td>
										<td colspan="2">										
											<%for(OrderStatus orderStatus :orderStatusList){%>
												<%if(orderStatus.getOrder_status_id()==orders.getOrder_status_id()){%>
													<%=orderStatus.getOrder_status_name() %>
												<%}%>
											<%}%>
										</td>
										<td colspan="6"></td>
									</tr>
								</tbody>
							</table>	
						</p>
				
				  	<!-- 수취인 정보 테이블 -->
				  <hr>
					<h3>수취인 정보</h3>
						<p>
							<table>
								<tr>
									<td colspan="1">수취인명</td>
									<td colspan="2"><%=orders.getReceiver_name() %></td>
									<td colspan="1"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td colspan="1">전화번호</td>
									<td colspan="2"><%=orders.getReceiver_cellphone()%></td>
									<td colspan="1"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td colspan="1">우편번호</td>
									<td colspan="2"><%=orders.getReceiver_postcode() %></td>
									<td colspan="1"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td colspan="1">주소</td>
									<td colspan="4"><%=orders.getReceiver_address1()%></td>
								</tr>
								<tr>
									<td colspan="1">상세주소</td>
									<td colspan="4"><%=orders.getReceiver_address2()%></td>
								</tr>
								<tr>
									<td colspan="1">주문요청사항</td>
									<td colspan="4"><%=orders.getReceiver_request()%></td>
								</tr>
								<tr>
									<td colspan="1">주문 취소 사유</td>
									<td colspan="4"><%=orders.getReceiver_cancle_reason()%></td>
								</tr>
							</table>	
						</p>
					</form>
    		</div>
        <div class="col-md-10">
        	<%for(int i=0; i<order_detail_list.size(); i++){ %>
            <div class="card card-body mt-3">
                <div class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
                    <div class="mr-2 mb-3 mb-lg-0"> <img src="/resources/data/basic/<%=order_detail_list.get(i).getProduct_id()%>.<%=order_detail_list.get(i).getFilename()%>" width="150" height="150" alt=""> </div>
                    <div class="media-body">
                        <h6 class="media-title font-weight-semibold"> <a href="/shop/product/detail?product_id= <%=order_detail_list.get(i).getProduct_id()%> " data-abc="true"><h3 style="color:green;"><%=order_detail_list.get(i).getProduct_name() %></h3></a> </h6>
                      	<br>
                        <ul class="list-inline list-inline-dotted mb-0">
                            <li class="list-inline-item"><h5>수량: <%=order_detail_list.get(i).getQuantity() %></h5></li>
                        </ul>
                    </div>
                    <div class="mt-3 mt-lg-0 ml-lg-3 text-center">
                        <h3 class="mb-0 font-weight-semibold"><%=Formatter.getCurrency(order_detail_list.get(i).getProduct_price())%></h3>
                        <!--리뷰쓰기 모달 버튼-->
                        <!-- Trigger/Open The Modal -->
						<button id="myBtn">리뷰달기</button>
						
						<!-- The Modal -->
						<div id="myModal" class="modal">
						
						  <!-- Modal content -->
						  <div class="modal-content">
						    <div class="modal-header">
						      <span class="close">&times;</span>
						    </div>
						    <div align="right">
						      	<p><h2><span class="fa fa-star" id="1">
						      	</span><span class="fa fa-star"  id="2">
						      	</span><span class="fa fa-star"  id="3">
						      	</span><span class="fa fa-star"  id="4">
						      	</span><span class="fa fa-star"  id="5"></span></h2></p>
						    </div>
						      	<form accept-charset="UTF-8" action="" method="post">
                        		<input id="ratings-hidden" name="rating" type="hidden"> 
                        		<textarea class="form-control animated" cols="30" id="review" name="review" rows="5"></textarea>
        
                        		<div class="text-right">
                            	<button id="reviewbt" class="btn btn-success btn-lg" type="button">리뷰 달기</button>
                        </div>
                    </form>
						    <div class="modal-body">
						    </div>
						  </div>
						
						</div>
						<!-- modal end -->
                    </div>
                </div>
            </div>
					<%}%>
        </div>
    </div>
	</div>  
  
	<!-- footer -->
	<%@ include file="../inc/footer.jsp" %>
    
</body>
<script>
//Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</html>
