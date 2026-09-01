# Inverted Pendulum Control
Group project developed for the Automatic Controls 2 exam – Automation Engineering

## Objective
The system consists of an inverted pendulum mounted on a mobile cart.
-	Input: external force applied to the cart.
-	Outputs: pendulum angle and cart position.
The main goals are:
-	Stabilize the pendulum at its unstable equilibrium position (angle=0);
-	Achieve a settling time < 1,2s
-	Achieve zero overshoot
-	Stabilize the cart at the center of the track

## Design
Starting from the linearized equations of motion around the unstable equilibrium position, two SISO state-space models were derived, one with the pendulum angle as the output, one with the cart position as the output). The controller design was divided into three parts:
1.	Pendulum angle stabilization: the controller was designed using root-locus analysis. It consists of an integrator, two zeros  in -4 and a physical realizability pole in -100. The closed-loop system is stabilized with a gain of k = 2500.
2.	Performance specification controller: The controller was designed using a frequency-domain approach. A static part (gain and integrator) and a dynamic part (lead-lag network) were used to obtain a crossover frequency of 6 rad/s.
3.	Cart position stabilization: in order to decouple position and angle control, a new transfer function was derived by considering the angle as the input and the position as the output (obtained as the ratio of the two initial transfer functions), so as to achieve a cascaded control structure.
   
## Discretization
The controllers were discretized using the Tustin method. The sampling time was selected within the admissible range calculated from the crossing pulsation.
## Laboratory test
The controllers were implemented in an Arduino program (provided by the university) and were tested on a real physical pendulum. This allowed comparison between the real behavior and the simulated one.

## Tools
•	MATLAB
•	Control System Toolbox
•	State-space modeling
•	Transfer functions
•	Root-locus analysis
•	Bode analysis
•	Time-domain analysis
•	Tustin discretization

## How to run the project
Clone the repository
Open MATLAB
Run:
matlab
run('src/main.m')

## Requirements
MATLAB R2020+
Control System Toolbox
