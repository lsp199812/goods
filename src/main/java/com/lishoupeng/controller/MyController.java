package com.lishoupeng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.lishoupeng.pojo.Goods;
import com.lishoupeng.pojo.QueryModel;
import com.lishoupeng.service.MyService;

@Controller
public class MyController {

	@Autowired
	private MyService service;
	
	@RequestMapping("getList.do")
	public String getList(QueryModel m, Model model){
		List<Goods> list = service.getList(m);
		PageInfo<Goods> pi = new PageInfo<Goods>(list);
		model.addAttribute("pi", pi);
		model.addAttribute("m", m);
		return "list";
	}
	
	@RequestMapping("del.do")
	@ResponseBody
	public boolean del(String id){
		try {
			service.del(id);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	@RequestMapping("getGoods.do")
	@ResponseBody
	public Goods getGoods(int id){
		Goods goods = service.getGoods(id);
		return goods;
	}
	
	@RequestMapping("add.do")
	public String add(Goods goods){
		service.add(goods);
		return "redirect:getList.do";
	}
}
