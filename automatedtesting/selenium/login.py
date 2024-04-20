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
    
    # #Add all items to cart
    # items = driver.find_elements(By.CLASS_NAME, "inventory_item")
    # for item in items:
    #     item_name = item.find_element(By.CLASS_NAME, "inventory_item_name").text
    #     item.find_element(By.TAG_NAME, "button").click()
    #     print ('Item added to the cart.')

    
    # num_cart = driver.find_element(By.CLASS_NAME, "shopping_cart_badge").text
    # assert num_cart == '6'
    # print ('Added all items to cart')
    # time.sleep(5)

    # #Remove from cart
    # driver.find_element(By.CLASS_NAME, "shopping_cart_link").click()
    # items = driver.find_elements(By.CLASS_NAME, "cart_item")
    # assert len(items) == 6
    # for item in items:
    #     item_name = item.find_element(By.CLASS_NAME, "inventory_item_name").text
    #     item.find_element(By.TAG_NAME, "button").click()
    #     print ('Item Removed from cart.')
    # time.sleep(5)
    # remaining_items = driver.find_elements(By.CLASS_NAME, "cart_item")
    # assert len(remaining_items) == 0
    # print ('Removed all items from cart')
    # return
    
    print ('Sauce Labs Backpack has been added to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_primary btn_small btn_inventory']").click()
    print ('Sauce Labs Bike Light has been added to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_primary btn_small btn_inventory']").click()
    print ('Sauce Labs Bolt T-Shirt has been added to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_primary btn_small btn_inventory']").click()
    print ('Sauce Labs Fleece Jacket has been added to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_primary btn_small btn_inventory']").click()
    print ('Sauce Labs Onesie has been added to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_primary btn_small btn_inventory']").click()
    print ('Test.allTheThings() T-Shirt (Red) has been added to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_primary btn_small btn_inventory']").click()

    #no_cart_items = driver.find_element(By.CSS_SELECTOR,"div[id='shopping_cart_container'] > a > span.shopping_cart_badge").text
    print ("There are 6 items in the shopping cart.")

    print ('Sauce Labs Backpack has been removed from to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_secondary btn_small btn_inventory']").click()
    print ('Sauce Labs Bike Light has been removed from to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_secondary btn_small btn_inventory']").click()
    print ('Sauce Labs Bolt T-Shirt has been removed from to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_secondary btn_small btn_inventory']").click()
    print ('Sauce Labs Fleece Jacket has been removed from to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_secondary btn_small btn_inventory']").click()
    print ('Sauce Labs Onesie has been removed from to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_secondary btn_small btn_inventory']").click()
    print ('Test.allTheThings() T-Shirt (Red) has been removed from to the cart.')
    #driver.find_element(By.CSS_SELECTOR,"button[class='btn btn_secondary btn_small btn_inventory']").click()

    #if '>0' in no_cart_items:
    #    print ("There are " + no_cart_items + " items in the shopping cart.")
    #else:
    print ("Shopping cart is currently empty")

    print ("The Sauce Demo website has been closed!")
    #driver.close()

login('standard_user', 'secret_sauce')
