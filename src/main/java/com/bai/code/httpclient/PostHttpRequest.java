package com.bai.code.httpclient;

import java.util.List;

import org.apache.http.Consts;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;


/**
 * 发送请求
 *
 */
public class PostHttpRequest {
	public static void post(String url, List<NameValuePair> list) {
		try {
			// 创建 httpclient实例，采用默认的参数配置
	        CloseableHttpClient httpClient = HttpClients.createDefault();
	        HttpPost post = new HttpPost(url);
	        // 请求的参数配置，分别设置连接池获取连接的超时时间，连接上服务器的时间，服务器返回数据的时间
	        RequestConfig config = RequestConfig.custom()
	                                           .setConnectionRequestTimeout(30000)
	                                           .setConnectTimeout(30000)
	                                           .setSocketTimeout(30000)
	                                           .build()
	                                           ;
	        
	        // 配置信息添加到 Post请求中
	        post.setConfig(config);
	        // 使用URL实体转换工具
	        UrlEncodedFormEntity entityParam = new UrlEncodedFormEntity(list, "UTF-8");
	        post.setEntity(entityParam);
	        // 通过 httpclient的 execute提交请求 ，并用 CloseableHttpResponse接受返回信息
	        CloseableHttpResponse response = httpClient.execute(post);
	        // 服务器返回的状态
	        int statusCode = response.getStatusLine().getStatusCode() ;
	        // 判断返回的状态码是否是200 ，200 代表服务器响应成功，并成功返回信息
	        System.out.println(statusCode);
	        if(statusCode == HttpStatus.SC_OK || statusCode == HttpStatus.SC_MOVED_TEMPORARILY){
	            // EntityUtils 获取返回的信息。官方不建议使用使用此类来处理信息
	            System.out.println("post -------->" + EntityUtils.toString(response.getEntity() , Consts.UTF_8));
	        }else {
	            System.out.println("post -------->" + "获取信息失败");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
