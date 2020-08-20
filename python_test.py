
def fun1(door_open,door_close):
    print("check the door position")
    door = {"door1": door_open, "door2": door_close}
    if door["door1"]=="on" and door["door2"]=="off":
        print("open")
        return "open"
    if door["door2"]=="on" and door["door1"]=="off":
        print("close")
        return "close"
    else:
        pass
