package com.zzq.domain;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
	//当前页
	private int currentPage;
	//当前显示的条数
	private int currentCount;
	//总条数
	private int totalCount;
	//每页显示的条数
	private List<T> productList = new ArrayList<>();
	//显示总条数
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public List<T> getProductList() {
		return productList;
	}
	public void setProductList(List<T> productList) {
		this.productList = productList;
	}
	
}
