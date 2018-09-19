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
	//��ҳ����
	public PageBean<Product> findPageBean(int currentPage, int currentCount) throws Exception {
		ProductDao dao = new ProductDao();
		//��װһ��PageBean����
		PageBean pageBean = new PageBean<>();
		//1.��ǰҳ
		pageBean.setCurrentPage(currentPage);
		//2.��ǰҳ��ʾ������
		pageBean.setCurrentCount(currentCount);
		//3.������
		int totalCount = dao.getTotalCount();
		pageBean.setCount(totalCount);
		//4.��ҳ��
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalCount(totalPage);
		System.out.println("�ܹ��ж���ҳ��"+pageBean.getTotalCount());
		//5.ÿҳ��ʾ������
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
