package common;

import org.testng.annotations.Test;
import com.thoughtworks.selenium.DefaultSelenium;

public class Login {
	DefaultSelenium driver;
	String baseUrl="http://10.61.41.73:8080/tvcms/";
	String loginName="tvcms_auto";
	String password="tvcms_auto";

	@Test
	public DefaultSelenium f() {
		// 启动selenium Driver
		// Log.info("登陆"+BaseUrl);
		driver = new DefaultSelenium("localhost", 4444, "*iexplore", baseUrl);
		driver.start();
		driver.open("/tvcms");

		// 输入账号密码并登陆
		driver.type("id=loginName", loginName);
		driver.type("id=password", password);
		driver.click("name=submit");

		// 验证是否登陆成功
		assert driver.getText("link=退出系统") != null;
		
		return driver;
	}

}
