package com.Berita.Berita;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;

import entity.Article;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

/**
 * Root resource (exposed at "myresource" path)
 */
@Path("myresource")
public class MyResource {
    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
//	String APIkey = "1b590ac703dc42dfa3e09415f52d57f7";
//	@GET
//    @Produces(MediaType.APPLICATION_JSON)
//	public String ubahkeJSON() {
//		String url = "https://newsapi.org/v2/top-headlines?country=id&category=technology&apiKey="+APIkey;
//		
//		List<Article> ubah = getIt(url);
//		
//		return new Gson().toJson(ubah);
//	}
	
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public List<Article> getIt(String url) {
    	Article article = null;
		List<Article> listArticles = null;
    	
    	try {
			//URL Connection
			URL urlObj = new URL(url);
			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
			
			//Response code
			int ResponseCode =	con.getResponseCode();
			
			//Test
			System.out.println("URL :"+url);
			System.out.println("ResponseCode : "+ResponseCode);
			
			// Check ResponseCode is Correct Or not
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));	
			String inputString;
			StringBuffer response1 = new StringBuffer();
			
			while ((inputString = in.readLine()) != null) {
				response1.append(inputString);			
			}
			
			in.close();
			
			//System.out.println(response.toString());
			//JSONArray jsonArray = new JSONArray(response.toString());
			
			JSONObject jsonObject = new JSONObject(response1.toString());
			
			if (ResponseCode == 200) {
			
			listArticles = new ArrayList<Article>();
			
			
			
			// Set Status and totalResults
			//article.setStatus(jsonObject.get("status").toString());
			//article.setTotalResults(jsonObject.get("totalResults").toString());
			
			//Test
			//System.out.println("Status :"+jsonObject.get("status"));
			//System.out.println("totalResults :"+jsonObject.get("totalResults"));
			
			// JSON Object To JSON array
			JSONArray jsonArray = jsonObject.getJSONArray("articles");
			//Test
			System.out.println("Article Length :"+jsonArray.length());
			
				for (int i = 0; i < jsonArray.length(); i++) {
					article = new Article();
					
					article.setTitle(jsonObject.getJSONArray("articles").getJSONObject(i).get("title").toString());
					article.setAuthor(jsonObject.getJSONArray("articles").getJSONObject(i).get("author").toString());
					article.setContent(jsonObject.getJSONArray("articles").getJSONObject(i).get("content").toString());
					article.setName(jsonObject.getJSONArray("articles").getJSONObject(i).getJSONObject("source").get("name").toString());
					article.setId(jsonObject.getJSONArray("articles").getJSONObject(i).getJSONObject("source").get("id").toString());
					article.setDescription(jsonObject.getJSONArray("articles").getJSONObject(i).get("description").toString());
					article.setUrl(jsonObject.getJSONArray("articles").getJSONObject(i).get("url").toString());
					article.setUrlToImage(jsonObject.getJSONArray("articles").getJSONObject(i).get("urlToImage").toString());
									
					listArticles.add(article);
				}		
			}
			} catch (Exception e) {
				System.out.println();
				e.getStackTrace();
			}
    	System.out.println("Article :"+listArticles);
    	
        return listArticles;
 
}
    
}
