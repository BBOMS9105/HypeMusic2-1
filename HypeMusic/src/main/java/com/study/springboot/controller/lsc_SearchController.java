package com.study.springboot.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.springboot.TrackInfo;
import com.study.springboot.lsc_Functions;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class lsc_SearchController {
	
	@RequestMapping("/search/{keyword}")
    public String search(@PathVariable("keyword") String keyword, Model model, HttpServletRequest request) {
    	
        // 세션에 리스트 생성
        HttpSession session = request.getSession();
        List<TrackInfo> list = (List<TrackInfo>) session.getAttribute("trackInfoList");
        
        // 소문자 처리용 메소드
        String lowerCaseKeyword = keyword.toLowerCase();

        // getTrackInfoFromXlsx() 메소드를 사용해 데이터 불러오기
        List<TrackInfo> trackInfoList = null;
        try {
        	lsc_Functions lscFunctions = new lsc_Functions();
            trackInfoList = lscFunctions.getTrackInfoFromXlsx();
        } catch(IOException | ParseException e) {
            e.printStackTrace();
        }

        // 검색어에 맞는 데이터들을 찾아서 filteredList에 저장
        List<TrackInfo> filteredList = trackInfoList.stream()
                .filter(trackInfo ->
                        trackInfo.getAlbum_image().toLowerCase().contains(lowerCaseKeyword)
                                || trackInfo.getTitle().toLowerCase().contains(lowerCaseKeyword)
                                || String.valueOf(trackInfo.getTrack_id()).toLowerCase().contains(lowerCaseKeyword)
                                || trackInfo.getArtist().toLowerCase().contains(lowerCaseKeyword)
                                || trackInfo.getAlbum().toLowerCase().contains(lowerCaseKeyword)
                                || trackInfo.getRelease_date().toLowerCase().contains(lowerCaseKeyword)
                                || String.valueOf(trackInfo.getLike_count()).toLowerCase().contains(lowerCaseKeyword))
                .collect(Collectors.toList());

        // searchResults를 뷰로 전달
        model.addAttribute("searchResults", filteredList);

        // search.jsp 뷰를 반환
        return "lsc_search";
    }
}
