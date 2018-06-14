package com.bai.code.httpclient;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import javax.imageio.ImageIO;

import org.apache.http.NameValuePair;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import com.alibaba.fastjson.JSONObject;

public class test {

	public static String mobile = "13641325601";
	public static String uid = "15898015109%40163.com";
	public static String mark = "mobile_start";
	public static String vcode = "";
	// username=789&password=789
	public static String all = "mobile=15898015109&" + "uid=15898015109%40163.com&" + "mark=mobile_start&" + "vcode=";

	public static void main(String[] args) throws IOException {
		while (true) {
			aaa();
		}
	}
	public static void aaa() throws IOException {
		RequestConfig globalConfig = RequestConfig.custom().setCookieSpec(CookieSpecs.STANDARD).build();
		CookieStore cookieStore = new BasicCookieStore();
		// 创建HttpClient上下文
		HttpClientContext context = HttpClientContext.create();
		context.setCookieStore(cookieStore);
		CloseableHttpClient httpClient = HttpClients.custom().setDefaultRequestConfig(globalConfig)
				.setDefaultCookieStore(cookieStore).build();

		CloseableHttpResponse res = null;
		HttpPost post = new HttpPost("http://reg.email.163.com/unireg/call.do?" + "cmd=register.entrance&from=163mail");
		res = httpClient.execute(post, context);
		for (Cookie c : cookieStore.getCookies()) {
			System.out.println(c.getName() + ": " + c.getValue());
		}
		res.close();
		
		FileOutputStream out = new FileOutputStream(new File("C:/img/" + new Date().getTime() + ".bmp"));
		byte[] request = getRequest("http://reg.email.163.com/unireg/call.do?" + "cmd=register.verifyCode&"
				+ "v=common/verifycode/vc_en&" + "vt=mobile_acode&t=" + new Date().getTime(), "image/jpeg");
		out.write(request);

		out.close();
		
		List<NameValuePair> list = new ArrayList<NameValuePair>();
		BasicNameValuePair param1 = new BasicNameValuePair("mobile", mobile);
		BasicNameValuePair param2 = new BasicNameValuePair("uid", uid);
		BasicNameValuePair param3 = new BasicNameValuePair("mark", mark);
		Scanner sc = new Scanner(System.in);
		System.out.println("请输入验证码：");
		BasicNameValuePair param4 = new BasicNameValuePair("vcode", sc.nextLine());
		list.add(param1);
		list.add(param2);
		list.add(param3);
		list.add(param4);
		PostHttpRequest.post("http://reg.email.163.com/unireg/call.do?" + "cmd=added.mobileverify.sendAcode", list,context);

		// Response execute2 = yzm.ignoreContentType(true).execute();
		// System.out.println(execute2);
		// Element div = doc.getElementById("regMobile");

	}

	public static byte[] getRequest(String url, String repType) {
		String result = "";
		byte[] resByt = null;
		try {
			URL urlObj = new URL(url);
			HttpURLConnection conn = (HttpURLConnection) urlObj.openConnection();

			// 连接超时
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setConnectTimeout(25000);

			// 读取超时 --服务器响应比较慢,增大时间
			conn.setReadTimeout(25000);
			conn.setRequestMethod("GET");

			conn.addRequestProperty("Accept-Language", "zh-cn");
			conn.addRequestProperty("Content-type", repType);
			conn.addRequestProperty("User-Agent",
					"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");
			conn.connect();

			if ("image/jpeg".equals(repType)) {
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				BufferedImage bufImg = ImageIO.read(conn.getInputStream());
				ImageIO.write(bufImg, "jpg", outputStream);
				resByt = outputStream.toByteArray();
				outputStream.close();

			} else {
				// 取得输入流，并使用Reader读取
				BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));

				System.out.println("=============================");
				System.out.println("Contents of get request");
				System.out.println("=============================");
				String lines = null;
				while ((lines = reader.readLine()) != null) {
					System.out.println(lines);
					result += lines;
					result += "\r";
				}
				resByt = result.getBytes();
				reader.close();
			}

			// 断开连接
			conn.disconnect();
			System.out.println("=============================");
			System.out.println("Contents of get request ends");
			System.out.println("=============================");
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resByt;
	}

	private void regist(JSONObject json, String url) throws Exception {
		URL urlObj = new URL(url);
		HttpURLConnection conn = (HttpURLConnection) urlObj.openConnection();

		// 连接超时
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setConnectTimeout(25000);

		// 读取超时 --服务器响应比较慢,增大时间
		conn.setReadTimeout(25000);
		conn.setRequestMethod("post");

		conn.addRequestProperty("Accept-Language", "zh-cn");
		conn.addRequestProperty("Content-type", "application/json;charset=UTF-8");
		conn.addRequestProperty("User-Agent",
				"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");
		conn.connect();

		conn.disconnect();
	}

}
