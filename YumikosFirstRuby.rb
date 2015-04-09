


require "rubygems"
require "serialport"
require './led'

RED   =  'FF0000'
GREEN =  '00FF00'
BLUE =   '0000FF'
BLACK  = '000000'
WHITE  = 'FFFFFF'
PURPLE = 'FF00FF'

# DONT WORRY ABOUT THIS STUFF IS JUST TO OPEN A CONNECTION TO THE CUBE
begin
sp = SerialPort.new("COM20",9600)
rescue
end

led_cube = LedCube.new
led_cube.all_off
sp.write( led_cube.cube_command)
led_cube.all_on
led = led_cube.get_led(0,0,0)
led.blue = 255
led.red = 255
sp.write( led_cube.cube_command)
sleep(10)



led_color = WHITE

x=0
y=0
z=0
counter = 0



while (counter < 10000)
    x = rand(4)
    y = rand(4)
    z = rand(4)
    led_color = GREEN
    if rand(4) == 0
       led_color = RED
    end
    cube_command = '{'+x.to_s+y.to_s+z.to_s+led_color+'}'
    sp.write(cube_command)
    counter = counter+1
    sleep(0.001)
end


sleep(5)
counter=0
while (counter < 1000)
  x = rand(4)
  y = rand(4)
  z = rand(4)
  cube_command = '{'+x.to_s+y.to_s+z.to_s+BLACK+'}'
  sp.write(cube_command)
  counter = counter+1
end

sp.close
sp = nil
