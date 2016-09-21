package fdnCollect;

import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import com.thoughtworks.selenium.DefaultSelenium;

import common.Login;

public class QueryByType {
	DefaultSelenium driver;
	
	@Test
	public void f() {
		// 进入菜单“内容采集->FDN采集”
		driver.selectFrame("leftFrame");
		driver.click("link=FDN采集");

		// case1、类型为电影
		driver.selectWindow("null");
		driver.select("search_content_type","电影");
		driver.click("css=input.button");
		//验证查询结果是否正确
		Assert.assertEquals(driver.getText("css=td.statusTool > nobr"), "共286条记录,显示1到20");
		
		// case2、类型为连续剧
		driver.selectWindow("null");
		driver.select("search_content_type","连续剧");
		driver.click("css=input.button");
		//验证查询结果是否正确
		Assert.assertEquals(driver.getText("css=td.statusTool > nobr"), "共1条记录,显示1到1");
		
		// case3、类型为剧集
		driver.selectWindow("null");
		driver.select("search_content_type","剧集");
		driver.click("css=input.button");
		//验证查询结果是否正确
		Assert.assertEquals(driver.getText("css=td.statusTool > nobr"), "共45条记录,显示1到20");
		
			
	}

	@BeforeClass
	public void beforeClass() {
		// 登录tvcms系统
		Login login = new Login();
		driver = login.f();
	}

	@AfterClass
	public void afterClass() {
		driver.close();
	}

}
