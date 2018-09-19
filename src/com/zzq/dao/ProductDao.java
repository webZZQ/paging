package com.zzq.dao;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.zzq.domain.Product;
import com.zzq.utils.DataSourceUtils;

public class ProductDao {

	public List<Product> findAllProduct() throws SQLException {
		return new QueryRunner(DataSourceUtils.getDataSource()).query("select * from product", new BeanListHandler<Product>(Product.class));
	}

	//���ȫ������Ʒ����
	public int getTotalCount() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from product";
		Long query = (Long) runner.query(sql, new ScalarHandler());
		System.out.println("�ܹ���:"+query.intValue());
		return query.intValue();
	}

	//��÷�ҳ����Ʒ����
	public List<Product> findProductListForPageBean(int index,int currentCount) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product limit ?,?";
//		System.out.println("sql="+sql+","+index+","+currentCount);
		List<Product> list = runner.query(sql, new BeanListHandler<Product>(Product.class), index,currentCount);
		for (Product product : list) {
			System.out.println("-----------"+product.getImage()+product.getPrice());
		}
		return list;
	}

}
