*** Keywords ***
Intialize the car
    [Arguments]    ${floor_number}    ${timeout}    ${door}
    call the car    ${floor_number}
    check the car position    ${floor_number}    ${timeout}
    check the door position is open    ${door}
call the car
    [Arguments]    ${floor_number}
    no operation
    log    ${floor_number}

check the car position
    [Arguments]    ${floor_number}    ${timeout}=2
    check the car position in floor    ${floor_number}    ${timeout}

check the car position in floor
    [Arguments]    ${floor_number}    ${timeout}
    no operation
    log    ${floor_number}
    log    ${timeout}

check the light status
    [Arguments]    ${light}
    light status is    ${light}

light status is
    [Arguments]    ${light}
    no operation
    log    ${light}

check the door position is open
    [Arguments]    ${door}
    door is open    ${door}

door is open
    [Arguments]    ${door}
    no operation
    log    ${door}

check the door position is close
    [Arguments]    ${door}
    door is close    ${door}

door is close
    [Arguments]    ${door}
    no operation
    log    ${door}

press the door close key
    [Arguments]    ${door_close_button}
    door close button    ${door_close_button}

door close button
    [Arguments]    ${door_close_button}
    no operation
    log    ${door_close_button}

press the door open key
    [Arguments]    ${door_open_button}    ${timeout}
    door open button    ${door_open_button}
    log    ${timeout}

door open button
    [Arguments]    ${door_open_button}
    no operation
    log    ${door_open_button}

give car call
    [Arguments]    ${car_call_button}    ${timeout}
    press the car call button    ${car_call_button}    ${timeout}

press the car call button
    [Arguments]    ${car_call_button}    ${timeout}
    no operation
    log    ${car_call_button}
    log    ${timeout}

check the car moving direction up
    [Arguments]    ${direction}
    car moving direction up    ${direction}

car moving direction up
    [Arguments]    ${direction}
    no operation
    log    ${direction}

check the car moving direction down
    [Arguments]    ${direction}
    car moving direction down    ${direction}

car moving direction down
    [Arguments]    ${direction}
    no operation
    log    ${direction}

check the car load status
    [Arguments]    ${load_in_car}    ${timeout}
    checking the load in car    ${load_in_car}
    log    ${timeout}

checking the load in car
    [Arguments]    ${load_in_car}
    no operation
    log    ${load_in_car}

check the time status in car off mode
    [Arguments]    ${time_status}
    check the time status    ${time_status}

check the time status
    [Arguments]    ${time_status}
    no operation
    log    ${time_status}

press the landing call button
    [Arguments]    ${landing_call}
    give the landing call    ${landing_call}

give the landing call
    [Arguments]    ${landing_call}
    no operation
    log    ${landing_call}

give input to the light switch on
    [Arguments]    ${light_switch}
    car light switch    ${light_switch}

give input to the light switch off
    [Arguments]    ${light_switch}
    car light switch    ${light_switch}

car light switch
    [Arguments]    ${light_switch}
    log    ${light_switch}
