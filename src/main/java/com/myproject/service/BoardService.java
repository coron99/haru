package com.myproject.service;

import java.util.List;

import com.myproject.dto.Criteria;
import com.myproject.vo.BoardVO;

public interface BoardService {
	
	public boolean write(BoardVO board);
	
	public List<BoardVO> getListPaging(Criteria cri);
	
	public int getTotal();
	
	public BoardVO read(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);

}
