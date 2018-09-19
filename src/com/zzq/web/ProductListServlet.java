package com.zzq.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zzq.domain.PageBean;
import com.zzq.domain.Product;
import com.zzq.service.ProductService;
@WebServlet("/productList")
public class ProductListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService service = new ProductService();
		//假设当前是第一页
		String currentPageStr = request.getParameter("currentPage");
		if(currentPageStr==null)
			currentPageStr = "1";
		int currentPage = Integer.valueOf(currentPageStr);
		//每页显示12条
		int currentCount = 12;
		PageBean<Product> pageBean=null;
		try {
			pageBean = service.findPageBean(currentPage, currentCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Product> productList = pageBean.getProductList();
		for (Product product : productList) {
			System.out.println(product.getImage());
		}
		request.setAttribute("pageBean",pageBean);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
