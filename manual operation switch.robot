*** Settings ***
Resource          my_keywords.robot

*** Test Cases ***
checking the light status is on after pressing the light switch
    [Tags]    test TC1
    [Setup]    Intialize the car    floor_number=0    timeout=0.3    door=OPEN
    check the light status    light=OFF
    give input to the light switch on    light_switch=ON
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=0

check the light status is off after press the light switch off.
    [Tags]    test TC2
    [Setup]    Intialize the car    floor_number=3    timeout=0.3    door=CLOSE
    press the door open key    door_open_button=OPEN    timeout=0.3
    check the light status    light=ON
    give input to the light switch off    light_switch=LOW
    check the light status    light=OFF
    [Teardown]    check the car position    floor_number=3

check the light status in car off mode.
    [Tags]    test TC3
    [Setup]    check the car position    floor_number=6
    check the time status in car off mode    time_status=15min
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=6

check the light status again and again press the light the switch
    [Tags]    test TC4
    [Setup]    Intialize the car    floor_number=2    timeout=0.3    door=OPEN
    check the light status    light=ON
    give input to the light switch off    light_switch=LOW
    check the light status    light=OFF
    check the time status    time_status=0.2sec
    give input to the light switch on    light_switch=HIGH
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=2

check the light status is no loads in car
    [Tags]    test TC5
    [Setup]    Intialize the car    floor_number=5    timeout=0.3    door=OPEN
    check the light status    light=ON
    give car call    car_call_button=3    timeout=0.5
    check the door position is close    door=CLOSE
    check the car moving direction down    down=DOWN
    check the car position    floor_number=3    timeout=0.2
    check the door position is open    door=OPEN
    log    customer was exit at 3rd floor
    check the car position    floor_number=3
    check the car load status    load_in_car=noload    timeout=10
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=3

check the light status after power came
    [Tags]    test TC6
    [Setup]    Intialize the car    floor_number=1    timeout=0.3    door=OPEN
    check the light status    light=ON
    give car call    car_call_button=7    timeout=0.5
    check the door position is close    door=CLOSE
    check the car moving direction up    direction=UP
    log    Inbetween the 4nd floor power shutdown
    check the time status in car off mode    time_status=0.5sec
    log    power came after 5sec
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=7

check the light status while running mode
    [Tags]    test TC7
    [Setup]    Intialize the car    floor_number=8    timeout=0.3    door=OPEN
    check the light status    light=OFF
    give input to the light switch on    light_switch=HIGH
    check the light status    light=ON
    give car call    car_call_button=0    timeout=0.5
    check the door position is close    door=CLOSE
    check the car moving direction down    direction=DOWN
    check the light status    light=ON
    [Teardown]    check the car position    floor_number=7

*** Keywords ***
