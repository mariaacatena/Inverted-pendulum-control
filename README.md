# Inverted Pendulum Control
Group project developed for the Automatic Controls 2 exam – Automation Engineering

## Objective
The system consists of an inverted pendulum mounted on a mobile cart.
-	Input: external force applied to the cart.
-	Outputs: pendulum angle and cart position.
The main goals are:
-	Stabilize the pendulum at its unstable equilibrium position (angle=0);
-	Achieve a settling time < 1.2 s
-	Achieve zero overshoot
-	Stabilize the cart at the center of the track

## Design
Starting from the linearized equations of motion around the unstable equilibrium position, two SISO state-space models were derived, one with the pendulum angle as the output, one with the cart position as the output). The controller design was divided into three parts:
1.	Pendulum angle stabilization: the controller was designed using root-locus analysis. It consists of an integrator, two zeros  in -4 and a physical realizability pole in -100. The closed-loop system is stabilized with a gain of k = 2500.
2.	Performance specification controller: The controller was designed using a frequency-domain approach. A static part (gain and integrator) and a dynamic part (lead-lag network) were used to obtain a crossover frequency of 6 rad/s.
3.	Cart position stabilization: in order to decouple position and angle control, a new transfer function was derived by considering the angle as the input and the position as the output (obtained as the ratio of the two initial transfer functions), so as to achieve a cascaded control structure.
   
## Discretization
The controllers were discretized using the Tustin method. The sampling time was selected within the admissible range calculated from the crossover frequency.
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


## Images
### 1. Angle Controller - Root Locus
<img width="1584" height="1066" alt="image" src="https://github.com/user-attachments/assets/c3c828c8-60cc-4471-ba34-44f5ca111e3f" />

### 2. Angle Stabilization - Step response
<img width="1582" height="1048" alt="image" src="https://github.com/user-attachments/assets/350d38cb-ecd5-423f-b67f-b3a1360087d1" />

### 3. Specification Controller - Bode Plot
<img width="1586" height="1054" alt="image" src="https://github.com/user-attachments/assets/00205cd0-91e6-416d-b1da-57f2a2e40a04" />

### 4. Specification Controller - Step response
<img width="1564" height="1038" alt="image" src="https://github.com/user-attachments/assets/bac0945c-3cc7-4897-8666-d9f427c154b4" />

### 5. Position Controller - Root Locus
<img width="1580" height="1048" alt="image" src="https://github.com/user-attachments/assets/50713391-d18d-4230-9f16-eaae8e02c292" />

### 6. Position Controller - Step response
<img width="1652" height="1038" alt="image" src="https://github.com/user-attachments/assets/c7cc9a40-ec52-4c45-8ad4-2cb97977b20f" />

### 7. Laboratory test
<img width="422" height="562" alt="image" src="https://github.com/user-attachments/assets/b7bc2c95-4a9a-48c9-978c-1e89955579de" />

