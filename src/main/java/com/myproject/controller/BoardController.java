package com.myproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myproject.dto.Criteria;
import com.myproject.dto.PageDTO;
import com.myproject.service.BoardService;
import com.myproject.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@GetMapping(value = "/write")
	public void write(@ModelAttribute("cri") Criteria cri) {
		log.info(cri);				
	}
	
	@PostMapping(value = "/write")
	public String write(BoardVO board, RedirectAttributes rttr) {
		log.info(board);
		rttr.addAttribute("result", service.write(board));
		return "redirect:/board/list";
	}
	
	@GetMapping(value = "/list")
	public void getListPaging(Criteria cri, Model model) {
		log.info(cri);
		model.addAttribute("list", service.getListPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal()));
	}
	
	@GetMapping(value = "/view")
	public void read(@RequestParam("bno") Long bno,Criteria cri, Model model) {
		log.info(bno);
		model.addAttribute("board", service.read(bno));
		model.addAttribute("cri", cri);
	}
	
	@PostMapping(value = "/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info(board);
		rttr.addAttribute("result", service.modify(board));
		rttr.addAttribute("bno", board.getBno());					
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("pageAmount", cri.getPageAmount());
		return "redirect:/board/view";
	}
	
	@GetMapping(value = "/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info(service.remove(bno));		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("pageAmount", cri.getPageAmount());
		return "redirect:/board/list";
	}	

}
