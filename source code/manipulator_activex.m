
%actxcontrollist %to find out name of the actxcontrol
c = actxcontrol('TrioPC64.TrioPCCtrl.1')
c.Open(2,3240)%2 = port type = Ethernet , 3240 = asynchronous sending data(0,1 ,3240)

%TO MOVE THE ROBOT'S BASE TO 10 UNITS (COMMENT THE LINES BELOW IF YOU DO
%NOT WANT THIS PROCESS TO HAPPEN)[change 8 to 9,10,11 and 13 for moving
%other joints]
c.Base(1,8)
c.Move(1,10)
%TO change to  linear mode 
c.SetVr(756,1) % 1 = linear ; 0 = joint [after setting vr home the robot again]
%To operate in linear mode [warning!!! - home position is not 0 anymore in
%linear mode. [x y z u v]= [420.5 , 0 ,840 0 0] [u is rotation, i.e 90 will rotate by 90 degrees] 
c.Base(1,8)
c.move(1,10)
%Code for running any command to move the robot [change value of meas_seq
%to move robot]
joint_seq = [8 9 10 11 13] % Enter the corresponding joint to move
meas_seq = [420.5 0 840 0 0] % Which point the corresponding joint moves to abs coordinates
for i = 1:size(joint_seq, 2)
    c.Base(1,joint_seq(i)) ;
    c.MoveAbs(1,meas_seq(i));
end
%to turn on suction pump and gripper
%suction pump
c.setVR(842,1)
%gripper
c.setVR(842,2)
%set them as 0 to switch off

%add c accordingly
%IN LINEAR MODE 

%---------------------------------------------------------

%[initialization]

%x = 420.5 (+ = GO FRONT)
%Y = 0 (+ = GO RIGHT)
%Z = 839.428 (- = GO DOWN)

%[TO MOVE TO CENTER OF WHITEBOARD---change Z accordingly]

%BASE(8,9,10,11)
%'CENTER OF WHITEBOARD
%''x = 380
%'y = 375
%'z = 470
%'u = 90
%MOVEABS(380,375,470,90)%

c.Close  % to close the port
c.Run('DATUMING') %to run homing