package com.lishoupeng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.lishoupeng.mapper.MyMapper;
import com.lishoupeng.pojo.Goods;
import com.lishoupeng.pojo.QueryModel;

@Service
public class MyServiceImpl implements MyService{

	@Autowired
	private MyMapper mapper;

	public List<Goods> getList(QueryModel m) {
		PageHelper.startPage(m.getPageNum(), m.getPageSize());
		List<Goods> list = mapper.getList(m);
		return list;
	}

	public int del(String id) {
		// TODO Auto-generated method stub
		return mapper.del(id);
	}

	public Goods getGoods(int id) {
		// TODO Auto-generated method stub
		return mapper.getGoods(id);
	}

	public int add(Goods goods) {
		// TODO Auto-generated method stub
		return mapper.add(goods);
	}
}
