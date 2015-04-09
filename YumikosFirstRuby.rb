


require "rubygems"
require "serialport"
require './led'

class YumikosLedCube < LedCube
  ON = 255
  OFF = 0

  def draw_patter1
    all_off
    all_on
    led = get_led(0,0,0)
    led.blue = ON
    led.red = ON
 end

end

ON = 255
OFF = 0
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
led_cube.all_on
led = led_cube.get_led(2,2,2)
led.turn_off
led.blue = ON
led = led_cube.get_led(1,1,1)
led.turn_off
led.blue = ON
sp.write( led_cube.cube_command)
sleep(10)
led_cube.all_off
sp.write( led_cube.cube_command)


sp.close
sp = nil
