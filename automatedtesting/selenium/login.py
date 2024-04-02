# #!/usr/bin/env python
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
# from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.edge.options import Options as ChromeOptions

def login (user, password):
    print ('Starting the browser...')
    # --uncomment when running in Azure DevOps.
    # options = ChromeOptions()
    # options.add_argument("--headless") 
    # driver = webdriver.Chrome(options=options)
    driver = webdriver.Edge()
    print ('Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')


    driver.find_element(By.ID, "user-name").send_keys(user)
    driver.find_element(By.ID, "password").send_keys(password)
    driver.find_element(By.ID, "login-button").click()
    print ('logged as standard_user')
    time.sleep(2)
    
    #Add all items to cart
    items = driver.find_elements(By.CLASS_NAME, "inventory_item")
    for item in items:
        item_name = item.find_element(By.CLASS_NAME, "inventory_item_name").text
        item.find_element(By.TAG_NAME, "button").click()
    
    num_cart = driver.find_element(By.CLASS_NAME, "shopping_cart_badge").text
    assert num_cart == '6'
    print ('Added all items to cart')
    time.sleep(5)

    #Remove from cart
    driver.find_element(By.CLASS_NAME, "shopping_cart_link").click()
    items = driver.find_elements(By.CLASS_NAME, "cart_item")
    assert len(items) == 6
    for item in items:
        item_name = item.find_element(By.CLASS_NAME, "inventory_item_name").text
        item.find_element(By.TAG_NAME, "button").click()
    time.sleep(5)
    remaining_items = driver.find_elements(By.CLASS_NAME, "cart_item")
    assert len(remaining_items) == 0
    print ('Removed all items from cart')
    return

login('standard_user', 'secret_sauce')
