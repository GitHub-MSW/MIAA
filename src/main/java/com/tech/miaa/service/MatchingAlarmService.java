package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.MatchingAlarmDao;
import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.dto.matchingAlarmDto;
import com.tech.miaa.serviceInter.MypageMatchingAlarmServiceInter;

/* 원진호_0409_추가 */
public class MatchingAlarmService implements MypageMatchingAlarmServiceInter {

	@Override
	public ArrayList<ItemDto> matching_alarm_list(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("userId");
		MatchingAlarmDao dao = sqlSession.getMapper(MatchingAlarmDao.class);
		ArrayList<ItemDto> list = null;
		try {
			list = dao.matching_alarm_list(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	// weon_0416추가
	@Override
	public ArrayList<matchingAlarmDto> alert_item_list(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("userId");
		MatchingAlarmDao dao = sqlSession.getMapper(MatchingAlarmDao.class);
		ArrayList<matchingAlarmDto> alert_item_list = null;
		try {
			alert_item_list = dao.alert_item_list(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return alert_item_list;
	}

	/* 원진호_0417_추가 _등록된 분실물에서 소분류 추출 */
//	@Override
//	public ArrayList<matchingAlarmDto> lost_item_upr_cd(Model model) {
//		Map<String, Object> map = model.asMap();
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
//		HttpSession session = request.getSession();
//
//		String id = (String) session.getAttribute("userId");
//		MatchingAlarmDao dao = sqlSession.getMapper(MatchingAlarmDao.class);
//		ArrayList<matchingAlarmDto> lost_item_upr_cd = null;
//		try {
//			lost_item_upr_cd = dao.lost_item_upr_cd(id);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return lost_item_upr_cd;
//	}

	
	
	
	
	
	/* 원진호_0412_원글삭제기능추가 */
	@Override
	public void mypage_alarm_delete(String string, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		MatchingAlarmDao dao = sqlSession.getMapper(MatchingAlarmDao.class);
		dao.mypage_alarm_delete(string, id);
	}

	

}