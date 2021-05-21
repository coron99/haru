package com.myproject.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myproject.dto.Criteria;
import com.myproject.vo.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	public void write() {
		BoardVO board = new BoardVO();
		board.setTitle("5¹ø±Û");
		board.setContent("555555555555");
		board.setWriter("test2");
		log.info(board);
		mapper.insert(board);
		
	}
	
	
	public void list() {
		Criteria cri = new Criteria(2,10);
		log.info(mapper.list(cri));
	}
	
	@Test
	public void remove() {
		log.info(mapper.delete(642L));
	}

}
