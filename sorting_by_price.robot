*** Settings ***
Library    Selenium2Library
Library    Collections
Resource   login_keywords.robot

*** Test Cases ***
Sorting products by price low to high
     Login with standard user
     click element    class:product_sort_container
     click element    //*[@id="header_container"]/div[2]/div/span/select/option[3]
     ${product_prices}=    Get All Product Prices
     Verify Low to High Sorting    ${product_prices}
    
*** Keywords ***
Get All Product Prices
     ${prices}=    Create List
     @{price_elements}=    Get WebElements    class:inventory_item_price
     FOR    ${element}    IN    @{price_elements}
         ${price_text}=    Get Text    ${element}
         ${price}=    Convert To Number    ${price_text.replace('$', '')}
         Append To List    ${prices}    ${price}
     END
     RETURN    ${prices}

Verify Low to High Sorting
     [Arguments]    ${product_prices}
     ${length}=    Get Length    ${product_prices}
     FOR    ${index}    IN RANGE  0  ${length} - 1
         ${current}    Get From List    ${product_prices}    ${index}
         ${next}       Get From List    ${product_prices}    ${index + 1}

         Should Be True    ${current} <= ${next}    Sorting is not Low to High at index ${index}

     END