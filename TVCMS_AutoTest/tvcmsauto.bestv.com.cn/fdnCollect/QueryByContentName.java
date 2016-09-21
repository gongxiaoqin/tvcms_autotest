package fdnCollect;

import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import com.thoughtworks.selenium.DefaultSelenium;

import common.Login;

public class QueryByContentName {
	DefaultSelenium driver;
	String contentName = "80后脱口秀";

	@Test
	public void f() {
		// 进入菜单“内容采集->FDN采集”
		driver.selectFrame("leftFrame");
		driver.click("link=FDN采集");

		// 根据内容名称查询节目
		driver.selectWindow("null");
		driver.type("id=search_content_name",contentName );
		driver.click("css=input.button");
		
		//验证查询结果是否正确
		Assert.assertEquals(driver.getText("css=td.statusTool > nobr"), "共284条记录,显示1到20");
			
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
