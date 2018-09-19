<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物大厅</title>
</head>
<head>
<meta charset="UTF-8">
<title>购物商城</title>
<style type="text/css">
.clear {
	clear: both;
}

#page {
	border: 1px solid black;
	height: 1215px;
	width: 1300px;
	margin: 0 auto;
}

#top { /*border: 1px solid blue;*/
	width: 1300px;
	height: 60px;
}

#top_left {
	width: 300px;
	float: left;
}

#top_right {
	width: 400px;
	float: right;
	margin-top: 15px;
	font-size: 13px;
}

#top_right a {
	text-decoration: none;
	color: blue;
}

#top_right img {
	margin-bottom: -5px;
}

#menu {
	width: 1300px;
	height: 30px;
	text-align: center;
	/*border: 1px solid red;*/
	background-color: black;
	padding: 10px 0px;
}

#menu a {
	margin: 8px;
	text-decoration: none;
	text-align: center;
	color: white;
	font-weight: bold;
}

#search {
	width: 1300px;
	height: 40px;
	/*border: 1px solid red;*/
	background-color: #B6B684;
}

#search1 {
	float: right;
	margin-right: 200px;
	margin-top: 5px;
}

#search1 img {
	margin-bottom: -5px;
}
/*********************图书目录*******************************/
#content {
	width: 900px;
	height: 1100px;
	/*border: 1px solid red;*/
	margin: auto; /*居中显示*/
}

#content_top {
	width: 900px;
	height: 25px;
	/*border: 1px solid red;*/
}

#top1 {
	float: right;
	margin-right: 50px;
}

#top1 span {
	font-size: 14px;
}

#content_bottom {
	width: 880px;
	/*border: 1px solid blue;*/
	margin: auto;
}

#content_bottom h1 {
	display: inline; /*多个h1标签显示在同一行*/
	font-size: 15px;
}

#content_bottom span {
	font-size: 13px;
}

#product {
	margin: auto;
	/*border: 1px solid blue;*/
	width: 880px;
}

#product_list img {
	width: 880px;
	height: 50px;
}

#booklist {
	margin: auto;
	/*border: 1px solid red;*/
	width: 880px;
}

.book { /*border: 1px solid blue;*/
	float: left;
	width: 24%;
	text-align: center;
	padding: 10px 0px;
}

.book img {
	width: 130px;
	height: 196px;
}

#Countpage {
	text-align: center;
	margin-top: 20px;
}

#Countpage a {
	padding: 2px 6px;
	border: 1px solid #9AAFE5;
	text-decoration: none;
	color: #9AAFE5;
	text-decoration: none;
}

#bottom {
	width: 1300px;
	height: 65px;
	background-color: burlywood;
}

#bottom_left {
	float: left;
	margin-left: 200px;
}

#bottom img {
	margin: 10px;
	width: 200px;
	height: 50px;
}

#bottom_right {
	width: 800px;
}

#bottom a {
	text-decoration: none;
	float: right;
	text-align: center;
	margin: 20px;
	color: blue;
	font-size: 20px;
	font-weight: bold;
}
.active{
	background-color:blue;	
}
</style>
</head>
<body>
	<div id="page">
		<!--<div id="top">
			<div id="top_left">
				<img src="bookimages/logo.png" />
			</div>
			<div id="top_right">
				<img alt="" src="bookimages/cart.gif" /> <a href="#">购物车</a>| <a
					href="#">帮助中心</a>| <a href="#">我的账户</a>| <a
					href="/MyShopping/EntryRegister">新用户注册</a>
			</div>
		</div>  -->
		<div id="menu">
			<a href="#">文学</a> <a href="#">生活</a> <a href="#">计算机</a> <a href="#">外语</a>
			<a href="#">经管</a> <a href="#">数学</a> <a href="#">社科</a> <a href="#">学术</a>
			<a href="#">少儿</a> <a href="#">艺术</a> <a href="#">原版</a> <a href="#">科技</a>
			<a href="#">考试</a> <a href="#">生活百科</a> <a href="#">全部目录商品</a>
		</div>
		<!-- <div id="search">
			<div id="search1">
				<span>查找</span> <input type="text" /> <img
					src="bookimages/serchbutton.gif" />
			</div>
		</div> -->
		<div id="content">
			<!--<div id="content_top">
				<div id="top1">
					<span>首页&nbsp;&nbsp;&gt;购物大厅&nbsp;&nbsp;&gt;图书列表</span>
				</div>
			</div>  -->
			<div id="content_bottom">
				<h1>商品目录</h1>
				<hr />
				<h1>计算机类</h1>
				<span>共${pageBean.count}件商品</span>
				<hr />
			</div>
			<div id="product">
				<div id="product_list">
					<img src="bookimages/productlist.gif" />
				</div>
				<div id="booklist">
					<!-- 分页 -->
					<c:forEach items="${pageBean.productList}" var="product">
						<div class="book">
							<div class="bookimg">
								<img alt="" src="${product.image}">
							</div>
						<div class="bookIntr">
							<span>书名：${product.name }</span><br /> <span>售价：￥${product.price}</span>
						</div>
					</div>
					</c:forEach>
					<div class="clear"></div>
					<div id="Countpage">
						<c:if test="${pageBean.currentPage==1}" >
							<a href="javascript:void(0);" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
						<c:if test="${pageBean.currentPage!=1}">
							<a href="${pageContext.request.contextPath}/productList?currentPage=${pageBean.currentPage-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
						<!-- <a href="#">上一页</a> <a href="#">1</a> <a href="#">2</a> <a
							href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
						<a href="#">7</a> <a href="#">8</a> <a href="#">9</a> -->
						<c:forEach begin="1" end="${pageBean.totalCount}" var="page">
							<!-- 判断当前页 -->
							<c:if test="${pageBean.currentPage==page}">
								<a href="javascript:void(0);" class="active">${page}</a>
							</c:if>
							<c:if test="${pageBean.currentPage!=page}">
								<a href="${pageContext.request.contextPath}/productList?currentPage=${page}">${page}</a>
							</c:if>
						</c:forEach>
						<!-- 判断当前页是否是最后一页 -->
						<c:if test="${pageBean.currentPage==pageBean.totalCount}">
							<a href="javascript:void(0)" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>							
							</a>
						</c:if>
						<c:if test="${pageBean.currentPage!=pageBean.totalCount}">
							<a href="${pageContext.request.contextPath}/productList?currentPage=${pageBean.currentPage+1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
					</div>
					<!-- 分页 -->
				</div>
			</div>
		</div>
		<div id="bottom">
			<div id="bottom_left">
				<img src="bookimages/logo.png" />
			</div>
			<div id="bottom_right">
				<a href="#">关于我们</a> <a href="#">团队介绍</a>
			</div>

		</div>
	</div>
</body>
</html>