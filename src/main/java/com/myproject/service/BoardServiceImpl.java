package com.myproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myproject.dto.Criteria;
import com.myproject.mapper.BoardMapper;
import com.myproject.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService{
	
	
	private BoardMapper mapper;
		
	@Override
	public boolean write(BoardVO board) {		
		return mapper.insert(board) == 1;
	}

	@Override
	public List<BoardVO> getListPaging(Criteria cri) {		
		return mapper.list(cri);
	}

	@Override
	public BoardVO read(Long bno) {
		return mapper.view(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		return mapper.modify(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {		
		return mapper.delete(bno) == 1;
	}

	@Override
	public int getTotal() {		
		return mapper.getTotal();
	}

}
