package com.bai.code.httpclient;

import java.util.LinkedList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.junit.Test;

public class TestPostHttpRequest {
	@Test
	public void testPost() {
		// 创建请求参数
		List<NameValuePair> list = new LinkedList<>();
		BasicNameValuePair param1 = new BasicNameValuePair("userId", "524557198535aLHyC");
		BasicNameValuePair param2 = new BasicNameValuePair("pwd", "ZKhtzsT");
		BasicNameValuePair param3 = new BasicNameValuePair("dataFormat", "json");
		BasicNameValuePair param4 = new BasicNameValuePair("interfaceId", "getSurfEleByTimeRangeAndStaID");
		BasicNameValuePair param5 = new BasicNameValuePair("dataCode", "SURF_CHN_MUL_HOR");
		BasicNameValuePair param6 = new BasicNameValuePair("timeRange", "[20180425000000,20180426000000]");
		BasicNameValuePair param7 = new BasicNameValuePair("staIDs", "54511");
		BasicNameValuePair param8 = new BasicNameValuePair("elements", "Station_Id_C,Year,Mon,Day,Hour,TEM");
		list.add(param1);
		list.add(param2);
		list.add(param3);
		list.add(param4);
		list.add(param5);
		list.add(param6);
		list.add(param7);
		list.add(param8);
		PostHttpRequest.post("http://api.data.cma.cn:8090/api", list);
	}
	
}
