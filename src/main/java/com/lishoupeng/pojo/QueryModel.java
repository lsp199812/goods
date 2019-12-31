package com.lishoupeng.pojo;

public class QueryModel {

	private String key;
	private int pageNum;
	private int pageSize=2;
	private int pgaes;
	public QueryModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPgaes() {
		return pgaes;
	}
	public void setPgaes(int pgaes) {
		this.pgaes = pgaes;
	}
	
}
