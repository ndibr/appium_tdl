# @threads = []
# @threads << Thread.new {
#     device_name = "52005c37523f8543"
#     port = 4723
#     system_port = 8200
  
#    pid = spawn "appium -p #{port}"
#    Process.detach(pid)
#    sleep(5)
  
#     execute = "bundle exec cucumber DEVICE_NAME=#{device_name} APPIUM_PORT=#{port} SYSTEM_PORT=#{system_port} --format html -o #{device_name}.html"
#     `#{execute}`
#   }

#   @threads << Thread.new {
#     device_name = "emulator-5554"
#     port = 4724
#     system_port = 8201
  
#     pid = spawn "appium -p #{port}"
#     Process.detach(pid)
#     sleep(5)
#     execute = "bundle exec cucumber DEVICE_NAME=#{device_name} APPIUM_PORT=#{port} SYSTEM_PORT=#{system_port} --format html -o #{device_name}.html"
#     `#{execute}`
#   }

#   p "Tests triggered, waiting"
#   @threads.each(&:join)
#   p "Tests done!"
#   p "Killing servers"
#   `pkill -f` "appium"
#   p "Servers killed"
require 'concurrent'

if ARGV.length == 1
  scenario = "-t @#{ARGV[0]}"
else
  scenario = ""
end

    device_array = []  
    devices = `adb devices`
    devices.gsub!('List of devices attached', '').gsub!("\n", '')
    device_id_array = devices.split("\tdevice")
    device_id_array.each_with_index do |device, index|
        device_array.push(device_id: device, appium_port: 4723 + index, system_ports: 8200 + index)
    end 
    p device_array

    pool = Concurrent::FixedThreadPool.new(device_array.length)

    device_array.each do |device|
        pool.post do
          pid = spawn "appium -p #{device[:appium_port]}"
          Process.detach(pid)
          sleep(5)
          system "bundle exec cucumber -t @wip DEVICE_NAME=#{device[:device_id]} APPIUM_PORT=#{device[:appium_port]} SYSTEM_PORT=#{device[:system_ports]} --format pretty --expand --format html -o #{device[:device_id]}.html"
        end
      end

      pool.shutdown
      pool.wait_for_termination

      `pkill -f appium` 

      # cucumber -t @history DEVICE_NAME=emulator-5554 APPIUM_PORT=4723 SYSTEM_PORT=8201 --format pretty --expand --format html -o emulator.html