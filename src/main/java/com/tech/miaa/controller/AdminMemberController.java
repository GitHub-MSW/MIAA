package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.tech.miaa.dao.MemberDao;
import com.tech.miaa.dto.AdminInquirySearchDto;
import com.tech.miaa.dto.AdminMemberDto;
import com.tech.miaa.dto.AdminMemberSearchDto;
import com.tech.miaa.dto.MemberDto;
import com.tech.miaa.vopage.PageVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.tech.miaa.service.AdminMemberService;
import com.tech.miaa.service.MemberService;
import com.tech.miaa.serviceInter.AdminMemberServiceInter;
import com.tech.miaa.serviceInter.MemberServiceInter;

import java.util.List;

@Controller
public class AdminMemberController {
	@Autowired
	private SqlSession sqlSession;

	AdminMemberServiceInter adminMemberServiceInter;

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId){

		String result = "redirect:/";

		if (userId != null) {
			System.out.println("로그인 유저의 id : " + userId);
		} else if (userId == null) {
			System.out.println("로그인 하지 않았습니다.");
		}
		result = "admin_login.joinform_page.관리자 회원가입.1";
		model.addAttribute("userId", userId);

		return result;

	}

	@RequestMapping("admin_join")
	public String join(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		adminMemberServiceInter = new AdminMemberService();

		String result = adminMemberServiceInter.admin_join(model);

		return result;
	}

	@ResponseBody
	@RequestMapping("admin_idcheck")
	public int idcheck(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		adminMemberServiceInter = new AdminMemberService();

		int num = adminMemberServiceInter.admin_idchek(model);

		return num;
	}

	@ResponseBody
	@RequestMapping("admin_emailchk")
	public int emailchk(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		adminMemberServiceInter = new AdminMemberService();

		int num = adminMemberServiceInter.admin_emailchk(model);

		return num;
	}

	@ResponseBody
	@RequestMapping("admin_codechk")
	public int admin_codechk(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		adminMemberServiceInter = new AdminMemberService();

		int num = adminMemberServiceInter.admin_codechk(model);

		return num;
	}

	//jeongmin
	@RequestMapping("/admin_member_management_page")
	public String admin_member_management_page(HttpServletRequest request, Model model,
	PageVO pageVo,@ModelAttribute("dto") AdminMemberSearchDto dto) {
//		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
//		List<MemberDto> memberDtoList = memberDao.getMembers();
//		for (MemberDto a : memberDtoList){
//			System.out.println(a.getUser_id());
//			System.out.println(a.getUser_address());
//			System.out.println(a.getUser_grade());
//			System.out.println(a.getUser_join_date());
//			System.out.println(a.getUser_last_login());
//		}
//		model.addAttribute("list",memberDtoList);
		model.addAttribute("request", request);
		model.addAttribute("sqlSession",sqlSession);
		model.addAttribute("pageVo",pageVo);

		adminMemberServiceInter = new AdminMemberService();
		adminMemberServiceInter.member_list(model, pageVo);

		return "admin_member.management_page.회원 관리 게시판.3a";
	}
}
