*** Settings ***
Resource          my_keywords.robot

*** Test Cases ***
check the light status in normal mode
    [Tags]    test TC1
    [Setup]    Intialize the car    floor_number=1    timeout=3    door=OPEN
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=1

check the light status after press the impulse switch
    [Tags]    test TC2
    [Setup]    Intialize the car    floor_number=0    timeout=3    door=CLOSE
    press the door open key    door=OPEN    timeout=0.3
    check the light status    light=OFF
    give input to the impulse switch    impulse_switch=HIGH
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=0

check the light status again and again pressing the impulse switch
    [Tags]    test TC3
    [Setup]    check the car position    floor_number=4
    check the door position is open    door=OPEN
    check the light status    light=ON

*** Keywords ***
give input to the impulse switch
    [Arguments]    ${impulse_switch}
    press the impulse switch    ${impulse_switch}

press the impulse switch
    [Arguments]    ${impulse_switch}
    log    ${impulse_switch}
