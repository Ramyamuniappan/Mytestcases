*** Settings ***
Resource          my_keywords.robot

*** Test Cases ***
check the car light status is on
    [Tags]    test TC1
    [Setup]    Intialize the car    floor_number=1    timeout=0.3    door=OPEN
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=1

check the light status if no loads in car
    [Tags]    test TC2
    [Setup]    Intialize the car    floor_number=0    timeout=0.3    door=CLOSE
    press the door open key    door_open_button=OPEN    timeout=0.3
    check the light status    light=ON
    give car call    car_call_button=3    timeout=0.5
    check the door position is close    door=CLOSE
    check the car moving direction up    direction=UP
    check the car position    floor_number=3
    log    customer was exit at 3rd floor
    check the car position    floor_number=3
    check the car load status    load_in_car=noload    timeout=10
    check the light status    light=OFF
    [Teardown]    check the car position    floor_number=3

check the light status while serve in car call or landing call
    [Tags]    test TC3
    [Setup]    Intialize the car    floor_number=6    timeout=0.3    door=OPEN
    check the light status    light=ON
    give car call    car_call_button=2    timeout=0.5
    check the door position is close    door=CLOSE
    check the car moving direction down    direction=DOWN
    check the car position    floor_number=2    timeout=0.2
    log    customer was exit at 3rd floor
    check the door position is close    door=CLOSE
    press the landing call button    landing_call=0
    check the car position    floor_number=0    timeout=2
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=0

check the light status after power shutdown
    [Tags]    test TC4
    [Setup]    check the car position    floor_number=3
    check the door position is open    door=OPEN
    check the light status    light=ON
    give car call    car_call_button=1    timeout=0.5
    check the door position is close    door=CLOSE
    check the car moving direction up    direction=UP
    log    Inbetween the 2nd floor power shutdown
    check the time status    time_status=0.5
    log    power came after 5sec
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=1
