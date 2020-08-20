*** Settings ***
Library    python_test.py
Library    Collections
*** Variables ***
#&{opencontact}    open=on    close=off
#&{closecontact}    open=off    close=on

*** Test Cases ***
checking the door position
    ${door_status}=    fun1    door_close=on    door_open=off
    log    ${door_status}

check the door condition
    door condition    condition=open
    door condition    condition=close

*** Keywords ***
door condition
    [Arguments]    ${condition}
    ${opencontact}    Create Dictionary    open=on    close=off
    ${closecontact}    Create Dictionary    open=off    close=on

    ${open}=    get from dictionary    ${opencontact}    ${condition}
    ${close}=    get from dictionary    ${closecontact}    ${condition}


    door open contact    ${open}
    door close contact    ${close}

door open contact
    [Arguments]    ${opencontact}
    no operation

door close contact
    [Arguments]    ${closecontact}
    no operation
