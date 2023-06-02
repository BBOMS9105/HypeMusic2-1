package com.study.springboot;



public class TrackInfo {
	
	private String title;
	private String artist;
	private String album;
	private int track_id;
	private int album_id;
	private String album_image;
	private String lyrics;
	private int like_count;
	private String genre;
	private String style;
	private String release_date;
	private String news1;
	private String news2;
	private String news3;
	
	
	public TrackInfo(String title, String artist, String album, int track_id, int album_id, 
					 String album_image, String lyrics, int like_count,
					 String genre, String style, String release_date, String news1, String news2, 
					 String news3) {
		this.title = title;
		this.artist = artist;
		this.album = album;
		this.track_id = track_id;
		this.album_id = album_id;
		this.album_image = album_image;
		this.lyrics = lyrics;
		this.like_count = like_count;
		this.genre = genre;
		this.style = style;
		this.release_date = release_date;
		this.news1 = news1;
		this.news2 = news2;
		this.news3 = news3;
	}
	public TrackInfo() {
		// TODO Auto-generated constructor stub
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public int getTrack_id() {
		return track_id;
	}
	public void setTrack_id(int track_id) {
		this.track_id = track_id;
	}
	public int getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}
	public String getAlbum_image() {
		return album_image;
	}
	public void setAlbum_image(String album_image) {
		this.album_image = album_image;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public String getNews1() {
		return news1;
	}
	public void setNews1(String news1) {
		this.news1 = news1;
	}
	public String getNews2() {
		return news2;
	}
	public void setNews2(String news2) {
		this.news2 = news2;
	}
	public String getNews3() {
		return news3;
	}
	public void setNews3(String news3) {
		this.news3 = news3;
	}
	@Override
	public String toString() {
		return "TrackInfo [title=" + title + ", artist=" + artist + ", album=" + album + ", album_image=" + album_image
				+ ", lyrics=" + lyrics + ", genre=" + genre + ", style=" + style + ", release_date=" + release_date
				+ ", news1=" + news1 + ", news2=" + news2 + ", news3=" + news3 + "]";
	}

	
}
