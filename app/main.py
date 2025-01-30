from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

# Set up Chrome options
chrome_options = Options()

# Run Chrome in headless mode (no UI)

# Specify a user data directory (you can customize the path)
chrome_options.add_argument('user-data-dir=/tmp/chrome-data')  # Use a different path if necessary

# Disable the sandbox (for certain environments like Docker or restricted systems)
# chrome_options.add_argument('--no-sandbox')

# Ensure you use the correct path for the ChromeDriver binary if it's not in your PATH
# chrome_options.binary_location = '/path/to/chrome'

# Initialize the WebDriver with the options
driver = webdriver.Chrome(options=chrome_options)

# Open the webpage
url = 'https://a202210270738125920001994.szwego.com/weshop/store/A202210270738125920001994'
driver.get(url)

# Wait for the page to load
time.sleep(3)

# Optionally, you can extract text here if needed (you can use page source or JavaScript)
# page_content = driver.page_source

# Wait for the page to load, then find the category button and click it
try:
    category_button = driver.find_element_by_id('categoryButton')  # Replace with actual element locator
    category_button.click()
    print("Clicked on the category button!")
except Exception as e:
    print(f"Could not find or click the category button: {e}")

# Wait for interaction to complete
time.sleep(3)

# Close the browser when done
driver.quit()
