package com.lishoupeng.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lishoupeng.pojo.Goods;
import com.lishoupeng.pojo.QueryModel;

public interface MyService {

	List<Goods> getList(QueryModel m);
	
	int del(@Param("id")String id);
	
	Goods getGoods(@Param("id")int id);
	
	int add(Goods goods);
}
