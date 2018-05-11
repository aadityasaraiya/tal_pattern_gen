

joint_seq = [8 9 10 11] % Enter the corresponding joint to move
%meas_seq = [420.5 0 839.428 0] % Which point the corresponding joint moves to abs coordinates
% meas_seq = [380 0 840 0]
%  meas_seq = [290 -360 840 0]% ball position 1
%  meas_seq = [290 -360 368 0]% ball position 2
%  meas_seq = [290 -360 500 0]% ball position 3
%  meas_seq = [430 -80 500 0]% ball position 4
%   meas_seq = [430 -80 290 0]% ball position 5
% meas_seq = [420.5 0 840 0]% back to home
%---------------------------------------------
 meas_seq = [380 375 550 90]    %Whiteboard centre with red attached marker % 15 7 17 Hypotrochoid
meas_seq = [420.5 0 839.428 0]
% syms x y t %for defining cartesian system of whiteboard
% t=0:0.01:7;
% x = 380 + 25*sin(2*t);
% y = 375 + 25*sin(3*t);
for j = 1:size(t,2)
   meas_seq = [x(j) y(j) 428 90]; 
   for i = 1:size(joint_seq, 2)
   c.Base(1,joint_seq(i)) ;
   c.MoveAbs(1,meas_seq(i));
   end
end

% c.SetVr(842,1)% to suck the ball
% c.SetVr(842,0)% release the ball
 for i = 1:size(joint_seq, 2)
  c.Base(1,joint_seq(i)) ;
  c.MoveAbs(1,meas_seq(i));
  end


