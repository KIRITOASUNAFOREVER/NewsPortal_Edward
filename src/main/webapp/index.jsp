<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="entity.Article"%>
<%@ page import="java.util.List"%>

<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	    integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	    crossorigin="anonymous"></script>
	
	    <title>INDONESIAN LIVE NEWS WEB APPLICATION </title>
</head>

<link href="src/webapp/views/css/news.css" rel="stylesheet">

<body>
    <header>
 <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-md mt-2">
        <div class="container-fluid">
            <a class="navbar-brand navbar-text" href="${pageContext.request.contextPath}">   <strong>INDONESIAN LIVE NEWS WEB APPLICATION </strong> </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>
                    
                <form class="d-flex" method="post" action="${pageContext.request.contextPath}/?#search">
                    <input class="form-control me-2" required="required" type="search" id="cari" placeholder="Search" name="search1" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
</header>

	
		
		

	

<section class="jumbotron bg-dark m-3 p-2 rounded-2 fixed">

 <div  class="row gy-2 gx-3 align-items-center">
    <div id="carouselExampleCaptions" class="carousel slide center" data-bs-ride="carousel">
  <ol class="carousel-indicators">
    <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"></li>
    <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></li>
    <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"></li>
      <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3"></li>
    <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4"></li>
      <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5"></li>
    <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6"></li>
      <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="7"></li>
    <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="8"></li>
  </ol>
  <div class="carousel-inner">
   <div class="carousel-item active">
      <img src="https://image.freepik.com/free-vector/stylish-happy-new-year-minimal-style-banner_1017-29310.jpg" class="d-block" alt="..." style="visibility: hidden;">
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>
    
    <%
        	Article toparticle = null;
    		List<Article> topArticles = null;
    		String APIkey8 = "de7e867f9aed4f0da117feca066407e2";  
    		String topurl = "http://newsapi.org/v2/top-headlines?country=id&apiKey="+APIkey8;
        	
        	try {
        		
    			//URL Connection
    			URL urlObj = new URL(topurl);
    			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
    			
    			//Response code
    			int ResponseCode =	con.getResponseCode();
    			
    			//Test
    			System.out.println("URL :"+topurl);
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
    			
    				topArticles = new ArrayList<Article>();
    			
    			
    			
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
    					toparticle = new Article();
    					
    					toparticle.setTitle(jsonObject.getJSONArray("articles").getJSONObject(i).get("title").toString());
    					toparticle.setAuthor(jsonObject.getJSONArray("articles").getJSONObject(i).get("author").toString());
    					toparticle.setContent(jsonObject.getJSONArray("articles").getJSONObject(i).get("content").toString());
    					toparticle.setName(jsonObject.getJSONArray("articles").getJSONObject(i).getJSONObject("source").get("name").toString());
    					toparticle.setId(jsonObject.getJSONArray("articles").getJSONObject(i).getJSONObject("source").get("id").toString());
    					toparticle.setDescription(jsonObject.getJSONArray("articles").getJSONObject(i).get("description").toString());
    					toparticle.setUrl(jsonObject.getJSONArray("articles").getJSONObject(i).get("url").toString());
    					toparticle.setUrlToImage(jsonObject.getJSONArray("articles").getJSONObject(i).get("urlToImage").toString());
    									
    					topArticles.add(toparticle);
    				}		
    			}
    			} catch (Exception e) {
    				System.out.println();
    				e.getStackTrace();
    			}
        	
		%>
    
 <h5 class="text-muted">Today's Top Headlines</h5>
    <div class="carousel-item" id="tophead">     
		    <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(topArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(topArticles.get(0).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(topArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(topArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(topArticles.get(1).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(topArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(topArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(topArticles.get(2).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(topArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(topArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(topArticles.get(3).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(topArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(topArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(topArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(topArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
            <!-- Cards End -->
 
                </div>
    </div>
  </div>
  
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </a>
</div>
</div>  
   	
</section>

<section class="bg-dark p-5 m-3 rounded-2">
    <header>

    </header>


    <article>

        <ul class="nav nav-tabs " id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link link-light active" id="home-tab" data-bs-toggle="tab" href="#TECHNOLOGY" role="tab" aria-controls="home"
                    aria-selected="true">TECHNOLOGY NEWS</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link link-light" id="profile-tab" data-bs-toggle="tab" href="#BUSINESS" role="tab" aria-controls="profile"
                    aria-selected="false">BUSINESS NEWS</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link link-light" id="profile-tab" data-bs-toggle="tab" href="#SPORTS" role="tab" aria-controls="profile"
                    aria-selected="false">SPORTS NEWS</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link link-light" id="profile-tab" data-bs-toggle="tab" href="#SCIENCE" role="tab" aria-controls="profile"
                    aria-selected="false">SCIENCE NEWS</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link link-light" id="profile-tab" data-bs-toggle="tab" href="#HEALTH" role="tab" aria-controls="profile"
                    aria-selected="false">HEALTH NEWS</a>
            </li>
             <li class="nav-item" role="presentation">
                <a class="nav-link link-light" id="profile-tab" data-bs-toggle="tab" href="#ENTERTAINMENT" role="tab" aria-controls="profile"
                    aria-selected="false">ENTERTAINMENT NEWS</a>
            </li>
             <li class="nav-item" role="presentation">
                <a class="nav-link link-light" id="profile-tab" data-bs-toggle="tab" href="#GENERAL" role="tab" aria-controls="profile"
                    aria-selected="false">GENERAL NEWS</a>
            </li>
           
        </ul>
        <div class="tab-content " id="myTabContent">
            <div class="tab-pane fade text-white mt-3 show active" id="TECHNOLOGY" role="tabpanel" aria-labelledby="home-tab"> 
        
        <!-- Technology NEWS TAB -->  
        
           <%
        	Article article = null;
    		List<Article> techArticles = null;
    		String APIkey = "de7e867f9aed4f0da117feca066407e2";  
    		String url = "https://newsapi.org/v2/top-headlines?country=id&category=technology&apiKey="+APIkey;
        	
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
    			
    			techArticles = new ArrayList<Article>();
    			
    			
    			
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
    									
    					techArticles.add(article);
    				}		
    			}
    			} catch (Exception e) {
    				System.out.println();
    				e.getStackTrace();
    			}
        	
		%>
		
        <!-- Cards -->
            
           <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(techArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(techArticles.get(0).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(techArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(techArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(techArticles.get(1).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(techArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(techArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(techArticles.get(2).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(techArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(techArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(techArticles.get(3).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(techArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(techArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(techArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(techArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
            <!-- Cards End -->
 
                </div>

         
         
          <div class="tab-pane fade text-white mt-3" id="BUSINESS" role="tabpanel" aria-labelledby="home-tab"> 
        
        <!-- BUSINESS NEWS TAB -->
        
        <%
        	Article businessarticle = null;
    		List<Article> businessArticles = null;
    		String APIkey2 = "de7e867f9aed4f0da117feca066407e2";  
    		String businessurl = "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey="+APIkey2;
        	
        	try {
        		
    			//URL Connection
    			URL urlObj = new URL(businessurl);
    			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
    			
    			//Response code
    			int ResponseCode =	con.getResponseCode();
    			
    			//Test
    			System.out.println("URL :"+businessurl);
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
    			
    			businessArticles = new ArrayList<Article>();
    			
    			
    			
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
    									
    					businessArticles.add(article);
    				}		
    			}
    			} catch (Exception e) {
    				System.out.println();
    				e.getStackTrace();
    			}
        	
		%>
     
            
            <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(businessArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(businessArticles.get(0).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(businessArticles.get(0).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(businessArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(businessArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(businessArticles.get(1).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(businessArticles.get(1).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(businessArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(businessArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(businessArticles.get(2).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(businessArticles.get(2).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(businessArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(businessArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(businessArticles.get(3).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(businessArticles.get(3).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(businessArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(businessArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(businessArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(businessArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
           
          
            
            <!-- Cards End -->
                </div>

          <div class="tab-pane fade text-white mt-3" id="SPORTS" role="tabpanel" aria-labelledby="home-tab"> 
        
        <!-- SPORTS NEWS TAB -->
        
        <%
        	Article sportarticle = null;
    		List<Article> sportArticles = null;
    		String APIkey3 = "de7e867f9aed4f0da117feca066407e2";  
    		String sporturl = "https://newsapi.org/v2/top-headlines?country=id&category=sports&apiKey="+APIkey3;
        	
        	try {
        		
    			//URL Connection
    			URL urlObj = new URL(sporturl);
    			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
    			
    			//Response code
    			int ResponseCode =	con.getResponseCode();
    			
    			//Test
    			System.out.println("URL :"+sporturl);
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
    			
    				sportArticles = new ArrayList<Article>();
    			
    			
    			
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
    									
    					sportArticles.add(article);
    				}		
    			}
    			} catch (Exception e) {
    				System.out.println();
    				e.getStackTrace();
    			}
        	
		%>
     
            
            <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(sportArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(sportArticles.get(0).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(sportArticles.get(0).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(sportArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(sportArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(sportArticles.get(1).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(sportArticles.get(1).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(sportArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(sportArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(sportArticles.get(2).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(sportArticles.get(2).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(sportArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(sportArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(sportArticles.get(3).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(sportArticles.get(3).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(sportArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(sportArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(sportArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(sportArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
           
          
            
            <!-- Cards End -->
                </div>
        
                
          <div class="tab-pane fade text-white mt-3" id="SCIENCE" role="tabpanel" aria-labelledby="home-tab"> 
        
        <!-- SCIENCE NEWS TAB -->
        
        <%
        	Article sciencearticle = null;
    		List<Article> scienceArticles = null;
    		String APIkey4 = "de7e867f9aed4f0da117feca066407e2";  
    		String scienceurl = "https://newsapi.org/v2/top-headlines?country=id&category=science&apiKey="+APIkey4;
        	
        	try {
        		
    			//URL Connection
    			URL urlObj = new URL(scienceurl);
    			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
    			
    			//Response code
    			int ResponseCode =	con.getResponseCode();
    			
    			//Test
    			System.out.println("URL :"+scienceurl);
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
    			
    				scienceArticles = new ArrayList<Article>();
    			
    			
    			
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
    									
    					scienceArticles.add(article);
    				}		
    			}
    			} catch (Exception e) {
    				System.out.println();
    				e.getStackTrace();
    			}
        	
		%>
     
            
            <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(scienceArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(scienceArticles.get(0).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(scienceArticles.get(0).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(scienceArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(scienceArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(scienceArticles.get(1).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(scienceArticles.get(1).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(scienceArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(scienceArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(scienceArticles.get(2).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(scienceArticles.get(2).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(scienceArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(scienceArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(scienceArticles.get(3).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(scienceArticles.get(3).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(scienceArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(scienceArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(scienceArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(scienceArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
           
          
            
            <!-- Cards End -->
                </div>
         
          <div class="tab-pane fade text-white mt-3" id="HEALTH" role="tabpanel" aria-labelledby="home-tab"> 
        
        <!-- HEALTH NEWS TAB -->
        
        <%
        	Article healtharticle = null;
    		List<Article> healthArticles = null;
    		String APIkey5 = "de7e867f9aed4f0da117feca066407e2";  
    		String healthurl = "https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey="+APIkey5;
        	
        	try {
        		
    			//URL Connection
    			URL urlObj = new URL(healthurl);
    			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
    			
    			//Response code
    			int ResponseCode =	con.getResponseCode();
    			
    			//Test
    			System.out.println("URL :"+healthurl);
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
    			
    				healthArticles = new ArrayList<Article>();
    			
    			
    			
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
    									
    					healthArticles.add(article);
    				}		
    			}
    			} catch (Exception e) {
    				System.out.println();
    				e.getStackTrace();
    			}
        	
		%>
     
            
            <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(healthArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(healthArticles.get(0).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(healthArticles.get(0).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(healthArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(healthArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(healthArticles.get(1).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(healthArticles.get(1).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(healthArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(healthArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(healthArticles.get(2).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(healthArticles.get(2).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(healthArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(healthArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(healthArticles.get(3).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(healthArticles.get(3).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(healthArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(healthArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(healthArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(healthArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
           
          
            
            <!-- Cards End -->
                </div>
         
          <div class="tab-pane fade text-white mt-3" id="ENTERTAINMENT" role="tabpanel" aria-labelledby="home-tab"> 
        
        <!-- ENTERTAINMENT NEWS TAB -->
        
        <%
        	Article entertainmentarticle = null;
    		List<Article> entertainmentArticles = null;
    		String APIkey6 = "de7e867f9aed4f0da117feca066407e2";  
    		String entertainmenthurl = "https://newsapi.org/v2/top-headlines?country=id&category=entertainment&apiKey="+APIkey6;
        	
        	try {
        		
    			//URL Connection
    			URL urlObj = new URL(entertainmenthurl);
    			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
    			
    			//Response code
    			int ResponseCode =	con.getResponseCode();
    			
    			//Test
    			System.out.println("URL :"+entertainmenthurl);
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
    			
    				entertainmentArticles = new ArrayList<Article>();
    			
    			
    			
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
    									
    					entertainmentArticles.add(article);
    				}		
    			}
    			} catch (Exception e) {
    				System.out.println();
    				e.getStackTrace();
    			}
        	
		%>
     
            
            <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(entertainmentArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(entertainmentArticles.get(0).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(entertainmentArticles.get(0).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(entertainmentArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(entertainmentArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(entertainmentArticles.get(1).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(entertainmentArticles.get(1).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(entertainmentArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(entertainmentArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(entertainmentArticles.get(2).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(entertainmentArticles.get(2).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(entertainmentArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(entertainmentArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(healthArticles.get(3).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(entertainmentArticles.get(3).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(entertainmentArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(entertainmentArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(entertainmentArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(entertainmentArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
           
          
            
            <!-- Cards End -->
                </div>
          
         <div class="tab-pane fade text-white mt-3" id="GENERAL" role="tabpanel" aria-labelledby="home-tab"> 
        
        <!-- GENERAL NEWS TAB -->
        
        <%
        	Article generalarticle = null;
    		List<Article> generalArticles = null;
    		String APIkey7 = "de7e867f9aed4f0da117feca066407e2";  
    		String generalurl = "https://newsapi.org/v2/top-headlines?country=id&category=general&apiKey="+APIkey7;
        	
        	try {
        		
    			//URL Connection
    			URL urlObj = new URL(generalurl);
    			HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
    			
    			//Response code
    			int ResponseCode =	con.getResponseCode();
    			
    			//Test
    			System.out.println("URL :"+generalurl);
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
    			
    				generalArticles = new ArrayList<Article>();
    			
    			
    			
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
    									
    					generalArticles.add(article);
    				}		
    			}
    			} catch (Exception e) {
    				System.out.println();
    				e.getStackTrace();
    			}
        	
		%>
     
            
            <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(generalArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(generalArticles.get(0).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(generalArticles.get(0).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(generalArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(generalArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(generalArticles.get(1).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(generalArticles.get(1).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(generalArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(generalArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(generalArticles.get(2).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(generalArticles.get(2).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(generalArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(generalArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(generalArticles.get(3).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(generalArticles.get(3).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(generalArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(generalArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(generalArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(generalArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
           
          
            
            <!-- Cards End -->
                </div>
    </article>
</section>


<section class="bg-dark p-5 m-3 rounded-2">

	
	<header> <h4 id="search" class="text-muted text-center"> <strong> SEARCH RESULT </strong> </h4>	</header>
		
		<article>
		
		
		
		
	<div class="row">		               	
        <!-- Cards -->
        <% 
	        Article searcharticle = null;
			List<Article> searchArticles = null;
			String date = java.time.LocalDate.now().toString();
			String APIkey9 = "de7e867f9aed4f0da117feca066407e2";  
			
			String hasil = request.getParameter("search1");
			System.out.println(hasil);
			String searchurl = "http://newsapi.org/v2/everything?q="+hasil+ "&language=id" + "&apiKey="+APIkey9;
	    	
	    	try {
	    		
				//URL Connection
				URL urlObj = new URL(searchurl);
				HttpURLConnection  con = (HttpURLConnection) urlObj.openConnection();
				
				//Response code
				int ResponseCode =	con.getResponseCode();
				
				//Test
				System.out.println("URL :"+searchurl);
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
				
					searchArticles = new ArrayList<Article>();
				
				
				
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
										
						searchArticles.add(article);
					}		
				}
				
				} catch (Exception e) {
					System.out.println();
					e.getStackTrace();
				}
	    	System.out.println("f :"+searchArticles.get(0).getTitle());
        %>
        <div class="container px-5 py-5">
        <div class="row">
            <div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(searchArticles.get(0).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(searchArticles.get(0).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(searchArticles.get(0).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(searchArticles.get(0).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(searchArticles.get(1).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(searchArticles.get(1).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(searchArticles.get(1).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(searchArticles.get(1).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(searchArticles.get(2).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(searchArticles.get(2).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(searchArticles.get(2).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(searchArticles.get(2).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(searchArticles.get(3).getTitle()); 
                    	 	%>
                    	 </h5>
                    	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - <% 
                    	 		out.print(searchArticles.get(3).getAuthor()); 
                    	 	%>
                           
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${businessNews.urlToImage}">
                            <p class="card-text text-center text-dark"> 
								<% 
                    	 			out.print(searchArticles.get(3).getDescription()); 
                    	 		%>
							</p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(searchArticles.get(3).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
            <div class="col mx-1">
            	<div class="col mx-1">
            	<div class="card h-100">
                    	<div class="card-header bg-white">
                    	 <h5 class="card-title text-center text-dark">
                    	 	<% 
                    	 		out.print(searchArticles.get(4).getTitle()); 
                    	 	%>
                    	 </h5>	
                		</div>
                        <div class="card-body">
                           <pre><span class="badge bg-light text-dark">Author - 
                           		<% out.print(searchArticles.get(4).getAuthor()); %>
                           </span></pre>
                           <img alt="image" class="img-fluid rounded float-end" src="${technologyNews.urlToImage}">
                            <p class="card-text text-center text-dark"> </p>
                            
                        </div>
                        <div class="card-footer text-center text-dark">
                       
                    		<a target="_blank" href="<% out.print(searchArticles.get(4).getUrl()); %>" class="btn btn-primary btn-sm btn-center d-block"> <strong class=""> Read More </strong> </a>	
                    
                        </div>
                    </div>
            </div>
            </div>
        </div>
    </div>
           
          
            
            <!-- Cards End -->
                </div>
		</div>
		
		
		</article>


</section>


<footer></footer>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
   
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</body>

</html>
