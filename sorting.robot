*** Settings ***
Library    Selenium2Library
Library    Collections
Resource   login_keywords.robot

*** Test Cases ***
Sort products Z to A
    Login with standard user
    click element    class:product_sort_container
    click element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get All Product Names
    Verify Z to A Sorting    ${product_names}




*** Keywords ***
Get All Product Names
    ${products}=    Create List
    @{products_elements}=    Get WebElements    class:inventory_item_name
    FOR    ${element}    IN    @{products_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN    ${products}

Verify Z to A Sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE  0  ${length} - 1
        ${current}    Get From List    ${product_names}    ${index}
        ${next}       Get From List    ${product_names}    ${index + 1}

        Should Be True    '${current}' >= '${next}'    Sorting is not Z to A at index ${index}

    END

Verify A to Z Sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE  0  ${length} - 1
        ${current}    Get From List    ${product_names}    ${index}
        ${next}       Get From List    ${product_names}    ${index + 1}

        Should Be True    '${current}' <= '${next}'    Sorting is not A to Z at index ${index}

    END

    