const {Builder, Browser, By, Key, until} = require('selenium-webdriver');

(async function example() {
  let driver = await new Builder().forBrowser(Browser.CHROME).build();
  try {
    await driver.get('http://localhost:3000/');
    await driver.findElement(By.name('username')).sendKeys('random username');
    await driver.findElement(By.name('password')).sendKeys('random password');

    await driver.findElement(By.name('testWorksButton')).click();
    await driver.wait(until.urlIs('http://localhost:3000/?testWorks'), 2000);
  } finally {
    await driver.quit();
  }
})();