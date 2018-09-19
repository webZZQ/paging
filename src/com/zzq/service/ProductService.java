package com.zzq.service;

import java.util.List;

import com.zzq.dao.ProductDao;
import com.zzq.domain.PageBean;
import com.zzq.domain.Product;

public class ProductService {

	public List<Product> findAllProduct(int currentPage, int currentCount) throws Exception {
		ProductDao dao = new ProductDao();
		return dao.findAllProduct();
	}
	//分页操作
	public PageBean<Product> findPageBean(int currentPage, int currentCount) throws Exception {
		ProductDao dao = new ProductDao();
		//封装一个PageBean返回
		PageBean pageBean = new PageBean<>();
		//1.当前页
		pageBean.setCurrentPage(currentPage);
		//2.当前页显示的条数
		pageBean.setCurrentCount(currentCount);
		//3.总条数
		int totalCount = dao.getTotalCount();
		pageBean.setCount(totalCount);
		//4.总页数
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalCount(totalPage);
		System.out.println("总共有多少页："+pageBean.getTotalCount());
		//5.每页显示的数据
		int index = (currentPage-1)*currentCount;
		List<Product> productList = dao.findProductListForPageBean(index,currentCount);
		pageBean.setProductList(productList);
		List<Product> productList2 = pageBean.getProductList();
		for (Product product : productList2) {
			System.out.println("service:"+product.getImage());
		}
		return pageBean;
	}


}
