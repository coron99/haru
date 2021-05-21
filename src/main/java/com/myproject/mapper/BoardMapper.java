package com.myproject.mapper;

import java.util.List;

import com.myproject.dto.Criteria;
import com.myproject.vo.BoardVO;

public interface BoardMapper {
	
	public int insert(BoardVO board);
	
	public List<BoardVO> list(Criteria cri);
	
	public int getTotal();
	
	public BoardVO view(Long bno);
	
	public int modify(BoardVO board);
	
	public int delete(Long bno);
}
