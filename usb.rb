require "libusb"
require "pp"

# Docs
# http://www5a.biglobe.ne.jp/~nkgwtty/njaLinuxUSB01.html

usb = LIBUSB::Context.new
devices = usb.devices
devices.each do |device|
  if device.serial_number == "01498A4D15005015"
    p device.idVendor             # => 1256
    p device.idProduct            # => 26720
    p device.serial_number        # => "01498A4D15005015"
    #device.open.reset_device                   # =>
    #device.open.control_transfer # =>
    device.configurations       # => [#<LIBUSB::Configuration 1>]
    conf = device.configurations[0]       # => #<LIBUSB::Configuration 1>
    conf.bLength                          # => 9
    conf.interfaces                       # => [#<LIBUSB::Interface 0>, #<LIBUSB::Interface 1>]
    device.open.kernel_driver_active?(conf.interfaces[0]) # => false
    device.open.kernel_driver_active?(conf.interfaces[1]) # => false
  end
end
#device.open_interface(0) do |handle|
#  handle.control_transfer(:bmRequestType => 0x40, :bRequest => 0xa0, :wValue => 0xe600, :wIndex => 0x0000, :dataOut => 1.chr)
#end
# >> 1256
# >> 26720
# >> "01498A4D15005015"
