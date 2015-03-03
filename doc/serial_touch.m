

# load isntrumental control package
pkg load instrument-control
graphics_toolkit('gnuplot');
# Open default serial port ttyUSB0 in default configuration of 115200, 8-N-1
s0 = serial();
# Opens serial port ttyUSB1 with baudrate of 115200 (config defaults to 8-N-1)
s1 = serial("/dev/ttyUSB0", 19200);
# Flush input and output buffers
srl_flush(s1); 
# Blocking write call, currently only accepts strings
# srl_write(s1, "Hello world!") 
# Blocking read call, returns uint8 array of exactly 12 bytes read
%data = srl_read(s1, 16)  

sample_len = 16;
iterations = 100;
sense_plot_data = zeros(1,sample_len*iterations);
mean_plot_data = zeros(1,sample_len*iterations);
touch = zeros(1,sample_len*iterations);
touch_deriv = zeros(1,sample_len*iterations);
deriv = zeros(1,sample_len*iterations);
deriv_lp = zeros(1,sample_len*iterations);

%determine initial settings
cur_avg = mean(double(srl_read(s1, sample_len)) );
threshold = 10.0;
long_avg = cur_avg;
cur_avg_plot = zeros(1,sample_len);
long_avg_plot = zeros(1,sample_len);


%get initial values



%while (1)
for x = 0:1:iterations

  new_data = double(srl_read(s1, sample_len));  
  
  for y = 1:1:sample_len
    cur_avg = 0.95 * cur_avg + 0.05 * new_data(y);
    long_avg = 0.999 * long_avg + 0.001 * (new_data(y));
    cur_avg_plot(y) = cur_avg;
    long_avg_plot(y) = long_avg;
    
  end
  
  sense_plot_data((x*sample_len)+1:(x+1)*sample_len) = cur_avg_plot; 
  mean_plot_data((x*sample_len)+1:(x+1)*sample_len) = long_avg_plot; 
    
end


for x = 1:1:sample_len*iterations

  if abs(sense_plot_data(x) - mean_plot_data(x)) > threshold;
    touch(x) = 50.0;
  end

end

figure(1);
hold off;
plot(sense_plot_data);
hold on;
plot(mean_plot_data,'color','red');
hold on;
plot(touch);

ylim([0, 256])

%figure(2);
%deriv_lp(1) = 0.13538;
%deriv(1) = 0.13538;
%for x = 2:1:sample_len*iterations-1
%
%  deriv_lp(x) = 0.9999*deriv_lp(x-1) + 0.0001*abs(sense_plot_data(x+1)-sense_plot_data(x));
%  deriv(x) = 0.99*deriv_lp(x-1) + 0.01*abs(sense_plot_data(x+1)-sense_plot_data(x));
%
%end
%
%for x = 1:1:sample_len*iterations
%
%  if sense_plot_data(x) > mean_plot_data(x)
%    touch_deriv(x) = 1.0;
%  end
%
%end
%
%hold off;
%plot(deriv);
%hold on;
%plot(deriv_lp,'color','red');

srl_close(s0);
%plot(plot_data);
%endwhile