from selenium import webdriver
from selenium.webdriver.chrome.options import Options

# Set up the remote WebDriver to connect to the Selenium Grid Hub
options = Options()
options.add_argument("--headless")  # Optional: to run without UI
options.add_argument("--disable-gpu")  # Optional: to disable GPU acceleration
options.add_argument("--no-sandbox")  # Optional: to avoid sandbox issues in certain environments

driver = webdriver.Remote(
    command_executor="http://localhost:4444/wd/hub",
    options=options
)

# Perform test actions
driver.get("https://www.example.com")
print(driver.title)

# End the session
driver.quit()
