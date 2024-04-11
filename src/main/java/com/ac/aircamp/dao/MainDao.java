package com.ac.aircamp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ac.aircamp.model.Camp;
import com.ac.aircamp.model.Tour;

@Mapper
public interface MainDao {
	
	//관광지 추천리스트
	List<Tour> getTourList(String loc);
	
	// 캠핑장 추천리스트
	List<Camp> getCampList(String loc);
	
	//추천 지역 선별
	String getRecommendLoc();

}
