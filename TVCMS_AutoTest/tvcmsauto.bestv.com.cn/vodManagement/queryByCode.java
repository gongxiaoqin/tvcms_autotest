package vodManagement;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import com.thoughtworks.selenium.DefaultSelenium;

public class queryByCode {
	DefaultSelenium selenium;

	@Test
	@Parameters({ "vodCode" })
	public void f(String vodCode) {
		// 进入菜单“内容管理->单剧集管理”
		selenium.selectFrame("leftFrame");
		selenium.click("//td[@onclick='showsubmenu(2);']");
		selenium.click("link=单剧集内容");

		// 根据CODE查询节目
		selenium.selectWindow(null);
		selenium.type("id=search_Channel_contentParam_code", vodCode);
		selenium.click("css=input.button");

		// 验证查询结果是否正确
		selenium.click("link=修改");
		// assert
		// selenium.getText("//form[@id='editContent']/table[2]/tbody/tr[2]/td/table/tbody/tr/td[4]")
		// == vodCode;
		System.out
				.print(selenium
						.getText("//form[@id='editContent']/table[2]/tbody/tr[2]/td/table/tbody/tr/td[4]"));
	}

	@BeforeClass
	@Parameters({ "BaseUrl", "LoginName", "Password" })
	public void beforeClass(String BaseUrl, String LoginName, String Password) {
		// 打开浏览器，登陆tvcms
		selenium = new DefaultSelenium("localhost", 4444, "*iexplore", BaseUrl);
		selenium.start();
		selenium.open("/tvcms");
		selenium.type("id=loginName", LoginName);
		selenium.type("id=password", Password);
		selenium.click("name=submit");
	}

	@AfterClass
	public void afterClass() {
		selenium.close();
		selenium.stop();
	}
}
