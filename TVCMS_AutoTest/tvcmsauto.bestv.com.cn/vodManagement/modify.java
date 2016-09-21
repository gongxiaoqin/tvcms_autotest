package vodManagement;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import com.thoughtworks.selenium.DefaultSelenium;

public class modify {
	DefaultSelenium selenium;
	String loginName = "bestv";
	String password = "bestv";

	@Test(enabled = false)
	public void f() {
		// 进入菜单“内容管理->单剧集管理”
		selenium.selectFrame("leftFrame");
		selenium.click("//td[@onclick='showsubmenu(2);']");
		selenium.click("link=单剧集内容");

		// 查询节目“全面回忆”
		selenium.selectFrame("main");
		selenium.type("id=search_Channel_contentParam_code", "1909874");
		String actorDisplay = selenium.getAttribute("id=actorDisplay");
		String writerDisplay = selenium.getAttribute("id=writerDisplay");
		selenium.type("id=actorDisplay", "autotest");
	}

	@BeforeClass
	public void beforeClass() {
		// 打开浏览器，登陆tvcms
		selenium = new DefaultSelenium("localhost", 4444, "*iexplore",
				"http://10.61.41.40:8085");
		selenium.start();
		selenium.open("/tvcms");
		selenium.type("id=loginName", loginName);
		selenium.type("id=password", password);
		selenium.click("name=submit");
	}

	@AfterClass
	public void afterClass() {
		selenium.close();
	}
}
