package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.dto.AnimalDto;
import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.dto.matchingAlarmDto;
import com.tech.miaa.dto.matchingAlarmListDto;
import com.tech.miaa.service.LostItemService;
import com.tech.miaa.service.MatchingAlarmService;
import com.tech.miaa.serviceInter.LostItemServiceInter;
import com.tech.miaa.serviceInter.MypageMatchingAlarmServiceInter;

//원진호_알림목록_0401추가
@Controller
public class MypageMatchingAlarmController {
	@Autowired
	private SqlSession sqlSession;
	MypageMatchingAlarmServiceInter mypageMatchingAlarmServiceInter;
	/* 원진호_0409추가 */
	LostItemServiceInter itemService;
	/* 원진호_0415_추가 */

	/* 원진호_0401추가 */
	/* 원진호_0409_수정 */
	@RequestMapping(value = "mypage_matching_alarm_list_page", method = RequestMethod.GET)
	public String mypage_matching_alarm_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		/* 원진호_0409추가 */
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		try {
			/* 현재 session에 있는 id에 해당하는 키워드글들 가져오기 */
			ArrayList<ItemDto> item_list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			ArrayList<AnimalDto> ani_list = mypageMatchingAlarmServiceInter.matching_alarm_anilist(model);
			
			ArrayList<matchingAlarmDto> alert_item_list = mypageMatchingAlarmServiceInter.alert_item_list(model);
			
			ArrayList<matchingAlarmListDto> master_list = new ArrayList<matchingAlarmListDto>();
			System.out.println("컨트롤러실행확인");
			for(matchingAlarmDto list : alert_item_list) {
				for(ItemDto ilist : item_list) {
					if(ilist.equals(list.getTotal_id())) {
						matchingAlarmListDto dto = new matchingAlarmListDto();
						dto.setTotal_id(list.getTotal_id());
						System.out.println("아이템 토탈 아이디 : "+dto.getTotal_id());
						dto.setItem_dto(ilist);
						master_list.add(dto);
						
					}
				}
				for(AnimalDto anilist : ani_list) {
					if(anilist.equals(list.getTotal_id())) {
						matchingAlarmListDto dto = new matchingAlarmListDto();
						dto.setTotal_id(list.getTotal_id());
						System.out.println("아이템 토탈 아이디 : "+dto.getTotal_id());
						dto.setAnimal_dto(anilist);
						master_list.add(dto);
					}
				}
			}
			model.addAttribute("list", master_list);
			
//         model.addAttribute("list", list);
//         model.addAttribute("alert_item_list", alert_item_list);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_list_page.알림 목록.3";
	}

	/* 원진호_0409_수정 */
	@RequestMapping(value = "mypage_matching_alarm_keyword_list_page", method = RequestMethod.GET)
	public String mypage_matching_alarm_keyword_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		/* 원진호_0409추가 */
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);

		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_keyword_list_page.알림 목록.3";
	}

	/* 원진호_0409_수정 */
	@RequestMapping("mypage_matching_alarm_detail_list_page")
	public String mypage_matching_alarm_detail_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		/* 원진호_0409추가 */
		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_detail_list_page.알림 목록.3";
	}

	/* weonjinho_0410추가 */
	@RequestMapping(value = "mypage_matching_alarm_ani_list_page", method = RequestMethod.GET)
	public String mypage_matching_alarm_ani_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		/* 원진호_0409추가 */
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_ani_list_page.알림 목록.3";
	}

	/* weonjinho_0410추가 */
	@RequestMapping(value = "mypage_matching_alarm_item_list_page", method = RequestMethod.GET)
	public String mypage_matching_alarm_item_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		/* 원진호_0409추가 */
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_item_list_page.알림 목록.3";
	}

	// 원진호_0416_추가
	@RequestMapping(value = "/mypage_alarm_delete")
	public String mypage_alarm_delete(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		String[] ajaxMsg = request.getParameterValues("valueArr");
		System.out.println(ajaxMsg);
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			mypageMatchingAlarmServiceInter.mypage_alarm_delete(ajaxMsg[i], model);
		}
		return "redirect:mypage_customer_inquiry_list_page";
	}

}