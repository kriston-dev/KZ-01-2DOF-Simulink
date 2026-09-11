open_system("ELECTRIC_RC_AIRCRAFT_simulink")
m = 1.83;
g = 9.81;
fuselage_length = 0.5;
Velocity_initial = 20;
Wing_Surface_Area = 0.4575; % 
chord_length= 0.25;
chord_length_tail = 0.17;
tail_leading_edge = 0.45;
wing_span = 1.83;
n = 0.78; % effieieny of pitch
AoA = [-5 0 5 10 15];
CD = [0.037 0.033 0.052 0.040 -0.128];
CL = [-0.249 0.205 0.752 1.190 1.316];
CM = [0.0550 0.0260 -0.0854 -0.1805];
Tail_Wing_Area = 0.136;
average_x_CG = 0.235; % NEed ot do the math to figure out X-CG
COG = 1.83-0.0003; % need to integrate to show change of cog
%Tail_moment_arm = x_AC_tail - CG will be represented in Simulink

x_AC_OnTail = 0.25*chord_length_tail;
x_AC_tail = tail_leading_edge + x_AC_OnTail;
tail_moment_arm = x_AC_tail - average_x_CG;
C_mse = -n*(Tail_Wing_Area/Wing_Surface_Area)*(tail_moment_arm/chord_length_tail);
C_mq = -2*((Tail_Wing_Area/Wing_Surface_Area)*(tail_moment_arm/chord_length_tail));  %Pitch damping
Inertia = (m/12)*(fuselage_length^2+wing_span^2);


set_param(bdroot,'EnablePacing','on')
set_param(bdroot,'PacingRate','1')


%Turbofan engine block
%Sea-level static thrust specific fuel consumption: is set to 0 due to it
%being electric.
%Setting the Turboofan engine system block to have input 0 for altitude and
%will be changed in the future to model heights where thrust is low.

%forces and moments block
%Due to not modeling yaw and roll we do not need the motion.


%CG
%dm/dt is when mass changed over time such as fuel burning over time.
%The parameters are simple due to the aircraft being electrical so same
%mass over time and that the CG wont change due to consistent weight ie no
%gas.

%Dynamic Pressure
% We are using the COESA model to model the height of air density

%Current Problems
%We need to make weight = lift, we were trying to stabilize aircraft with
%elevators but when applied, the velocity in the z component needs to slow
%down. Thus we can represent actuators when passed 100m by activating Vz to a
%speed so lift = weight.

%This is like final just incase, i believe the graph of actual position is
%wrong. We will use flihgt gear to actually model motion. Second if its
%correct again as back up we will just bring down lift and say it is due to
%the elevator, this is the ocncept of it acting as one

%Success:
%Graphing specific components of the aircarafts movements
%Having the net force (no turbulence yet)
%