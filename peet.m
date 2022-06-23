%{
Purpose: Computation of time-constant and time-random bias pointing error

Author: Anubhav Gupta
Creation Date:  Feb. 27, 2018
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Begins

function e = peet(msg, ch)

% data extraction
e_max = msg.e_max;
N = msg.num_of_realizations;
unit = msg.error_unit;
A = msg.amplitude;
mu = msg.mean;
sigma = msg.standard_deviation;
T = msg.time;
dt = msg.dt;

% time-constant, e=f(k), k represents realizations
if ch == 1
    e_k = unifrnd(-0.05*60,0.05*60,[1,N]);
    % e_k = normrnd(0,0.5*60,[1,N]);
    
    figure()
    plot(ones(1,length(e_k))*e_max, '--')
    hold on
    plot(-ones(1,length(e_k))*e_max, '--')
    plot(e_k)
    title("time-constant")
    xlabel("Runs/Realizations")
    ylabel("Error [" + unit + "]")
    legend('+ 3\sigma','- 3\sigma','e_k')
    axis([0 N -2*e_max 2*e_max])
    text(50, 1.6*e_max, ['e_{rms} = ' num2str(rms(e_k)),' ', num2str(unit)])
    text(50, 1.4*e_max, ['   3\sigma = ' num2str(e_max),' ', num2str(unit)])
    
    e = e_k;
    
    % time-random bias, e=f(t)
else
    t = 0:dt:T;
    et = zeros(1,length(t));
    A = 10;
    f = normrnd(mu, sigma);
    phi = unifrnd(-pi/2, pi/2);
    % Q = normrnd(3,0.3);
    Q = unifrnd(-abs(A)/2,abs(A)/2);
    for i=1:length(t)
        et(i) = A*sin(2*pi*f*t(i) + phi) + Q;
    end
    
    figure()
    plot(t, ones(1,length(et))*e_max, '--')
    hold on
    plot(t, -ones(1,length(et))*e_max, '--')
    plot(t, et)
    title("time-random bias")
    xlabel("Time [s]")
    ylabel("Error [" + unit + "]")
    legend('+ 3\sigma','- 3\sigma','e(t)')
    axis([0 t(end) -2*max(et) 2*max(et)])
    text(1, 1.6*max(et), ['e_{rms} = ' num2str(rms(et)),' ', num2str(unit)])
    text(1, 1.4*max(et), ['   3\sigma = ' num2str(e_max),' ', num2str(unit)])
    e = et;
end

end

% Script Ends
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%