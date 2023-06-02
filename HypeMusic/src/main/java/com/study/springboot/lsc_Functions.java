package com.study.springboot;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class lsc_Functions {
	
	
	/**
	 * @author 이승찬
	 * @return 유저 정보 리스트
	 * @throws IOException, ParseException
	 * 
	 * **/
		public List<User> getUserFromXlsx() throws IOException, ParseException {
    	// 엑셀 파일을 읽어들일 FileInputStream 객체 생성
    	// 경로는 사용자 환경에 맞게 세팅해주셔야합니다
		
    	FileInputStream fis = new FileInputStream(new File("C:\\Users\\User\\Desktop\\HypeMusic\\src\\main\\resources\\metadata\\user_test.xlsx"));
    	
    	// XSSFWorkbook 객체를 생성하여 엑셀 파일을 읽음
    	XSSFWorkbook workbook = new XSSFWorkbook(fis);
    	
    	// sheetIndex 변수에 0을 할당하여 첫 번째 시트를 선택함
    	int sheetIndex = 0;
    	
    	// sheet 변수에 XSSFWorkbook 객체에서 getSheetAt 메소드를 사용하여 SheetIndex에 해당하는
    	// 시트를 가져옴
    	XSSFSheet sheet = workbook.getSheetAt(sheetIndex);
    	
    	// 헤더 정보 추출
    	int colCnt = sheet.getRow(0).getPhysicalNumberOfCells();
    	String[] headers = new String[colCnt];
    	XSSFRow headerRow = sheet.getRow(0);
    	
    	// headerRow에 있는 셀 정보를 이용하여 헤더 정보를 추출 한 뒤 headers 배열에 저장
    	for (int i = 0; i<colCnt; i++) {
    		XSSFCell cell = headerRow.getCell(i);
    		headers[i] = cell.getStringCellValue();
    	}
    
    	List<User> users = new ArrayList<User>();
    	
    	// rowIterator 객체 생성
    	Iterator<Row> rowIterator = sheet.iterator();
    	// 첫 번째 줄(헤더) 제거
    	rowIterator.next();
    	
    	// rowIterator를 이용하여 엑셀 파일의 데이터를 추출하여 객체 생성
    	while(rowIterator.hasNext()) {
    		XSSFRow row = (XSSFRow)rowIterator.next();
    		User user = new User();
    		
    		// rowVariable을 이용하여 각 열 데이터를 추출하여 TrackInfo 객체의 변수에 세팅
    		for(int i = 0; i<headers.length; i++) {
    			XSSFCell cell = row.getCell(i);
    			// cell 값이 null일 경우 continue
    			if(cell == null) {
    				continue;
    			}
    			// cell의 type에 따라 처리할 범위 지정
    			switch (cell.getCellType()) {
    			case NUMERIC:
    				//release_date 값은 DATE타입으로 받아오기
    				if (headers[i].equals("age")) {
    					user.setAge((int)cell.getNumericCellValue());
    				} else if (headers[i].equals("rank")) {
    					user.setRank((int)cell.getNumericCellValue());
    				}
    				break;
    			case STRING:
    				if (headers[i].equals("id")) {
    					user.setId(cell.getStringCellValue());
    				} else if(headers[i].equals("pw")) {
    					user.setPw(cell.getStringCellValue());
    				} else if(headers[i].equals("preference")) {
    					user.setPreference(cell.getStringCellValue());
    				} else if(headers[i].equals("email")) {
    					user.setEmail(cell.getStringCellValue());
    				} else if(headers[i].equals("nickname")) {
    					user.setNickname(cell.getStringCellValue());
    				}
    				break;
    			}
    		}
    		users.add(user);
    	}
    	
    	workbook.close(); // XSSFWorkbook 닫기
    	fis.close(); // FileInputStream 닫기
    	
    	return users;
    }
	
		// 내부에서 사용할 cloumn을 받은 후 column 이름을 release_date와 대조하여 true, false를 리턴
	    // 아래 xlsx파일 읽는 함수에서 NUMERIC과 함께 release_date를 날짜 형식으로 입력할 때 사용
	    private boolean isDateColumn(String column) {
	        return column.equals("release_date");
	    }
	    
	    // release_date 값을 원하는 포맷으로 변경하는 함수
	    // "E MMM dd HH:mm:ss z yyyy" 형식에서 "yyyy.MM.dd" 형식으로 변경하여 반환하는 함수
	    private String formatDate(String date) throws ParseException {
	    	// 현재 출력되는 날짜 포맷
	        SimpleDateFormat inputDateFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
	        // 변경될 날짜 포맷
	        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy.MM.dd");
	        
	        // date 값을 현재 날짜 포맷으로 변환하여 Date 객체로 생성
	        Date parsedDate = inputDateFormat.parse(date);
	        // 변경할 날짜 포맷으로 Date객체를 문자열로 변환하여 리턴
	        return outputDateFormat.format(parsedDate);
	    }
	    // excel 파일로부터 데이터를 추출하여 List<TrackInfo> 객체로 반환하는 함수
	    	public List<TrackInfo> getTrackInfoFromXlsx() throws IOException, ParseException {
	    	// 엑셀 파일을 읽어들일 FileInputStream 객체 생성
	    	// 경로는 사용자 환경에 맞게 세팅해주셔야합니다
	    	FileInputStream fis = new FileInputStream(new File("C:\\Users\\User\\Desktop\\HypeMusic\\src\\main\\resources\\metadata\\music_all_230510(1).xlsx"));
	    	
	    	// XSSFWorkbook 객체를 생성하여 엑셀 파일을 읽음
	    	XSSFWorkbook workbook = new XSSFWorkbook(fis);
	    	
	    	// sheetIndex 변수에 0을 할당하여 첫 번째 시트를 선택함
	    	int sheetIndex = 0;
	    	
	    	// sheet 변수에 XSSFWorkbook 객체에서 getSheetAt 메소드를 사용하여 SheetIndex에 해당하는
	    	// 시트를 가져옴
	    	XSSFSheet sheet = workbook.getSheetAt(sheetIndex);
	    	
	    	// 헤더 정보 추출
	    	int colCnt = sheet.getRow(0).getPhysicalNumberOfCells();
	    	String[] headers = new String[colCnt];
	    	XSSFRow headerRow = sheet.getRow(0);
	    	
	    	// headerRow에 있는 셀 정보를 이용하여 헤더 정보를 추출 한 뒤 headers 배열에 저장
	    	for (int i = 0; i<colCnt; i++) {
	    		XSSFCell cell = headerRow.getCell(i);
	    		headers[i] = cell.getStringCellValue();
	    	}
	    	
	    	// TrackInfo 객체를 담을 ArrayList 생성
	    	List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
	    	
	    	// rowIterator 객체 생성
	    	Iterator<Row> rowIterator = sheet.iterator();
	    	// 첫 번째 줄(헤더) 제거
	    	rowIterator.next();
	    	
	    	// rowIterator를 이용하여 엑셀 파일의 데이터를 추출하여 객체 생성
	    	while(rowIterator.hasNext()) {
	    		XSSFRow row = (XSSFRow)rowIterator.next();
	    		TrackInfo trackInfo = new TrackInfo();
	    		
	    		// rowVariable을 이용하여 각 열 데이터를 추출하여 TrackInfo 객체의 변수에 세팅
	    		for(int i = 0; i<headers.length; i++) {
	    			XSSFCell cell = row.getCell(i);
	    			// cell 값이 null일 경우 continue
	    			if(cell == null) {
	    				continue;
	    			}
	    			// cell의 type에 따라 처리할 범위 지정
	    			switch (cell.getCellType()) {
	    			case NUMERIC:
	    				//release_date 값은 DATE타입으로 받아오기
	    				if (isDateColumn(headers[i])) {
	    					trackInfo.setRelease_date(formatDate(cell.getDateCellValue().toString()));
	    				} else if (headers[i].equals("track_id")) {
	    					trackInfo.setTrack_id((int)cell.getNumericCellValue());
	    				} else if (headers[i].equals("album_id")) {
	    					trackInfo.setAlbum_id((int)cell.getNumericCellValue());
	    				} else if (headers[i].equals("like_count")) {
	    					trackInfo.setLike_count((int)cell.getNumericCellValue());
	    				}
	    				break;
	    			case STRING:
	    				if (headers[i].equals("title")) {
	    					trackInfo.setTitle(cell.getStringCellValue());
	    				} else if(headers[i].equals("artist")) {
	    					trackInfo.setArtist(cell.getStringCellValue());
	    				} else if(headers[i].equals("album")) {
	    					trackInfo.setAlbum(cell.getStringCellValue());
	    				} else if(headers[i].equals("album_image")) {
	    					trackInfo.setAlbum_image(cell.getStringCellValue());
	    				} else if(headers[i].equals("lyrics")) {
	    					trackInfo.setLyrics(cell.getStringCellValue());
	    				} else if(headers[i].equals("genre")) {
	    					trackInfo.setGenre(cell.getStringCellValue());
	    				} else if(headers[i].equals("style")) {
	    					trackInfo.setStyle(cell.getStringCellValue());
	    				} else if(headers[i].equals("news1")) {
	    					trackInfo.setNews1(cell.getStringCellValue());
	    				} else if(headers[i].equals("news2")) {
	    					trackInfo.setNews2(cell.getStringCellValue());
	    				} else if(headers[i].equals("news3")) {
	    					trackInfo.setNews3(cell.getStringCellValue());
	    				} 
	    				break;
	    			}
	    		}
	    		trackInfos.add(trackInfo);
	    	}
	    	
	    	workbook.close(); // XSSFWorkbook 닫기
	    	fis.close(); // FileInputStream 닫기
	    	
	    	return trackInfos;
	    }
}
