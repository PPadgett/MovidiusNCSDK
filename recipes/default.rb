#
# Cookbook:: MovidiusNCSDK
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
############################################################################################################
# While Recipe is running you will need to select the Movidius Stick from the Settings, usb, select filter #
# Until Issue with kitchen not supporting Vagrant USB Filter Options this will be a manual process         #
############################################################################################################
include_recipe 'MovidiusNCSDK::installNCSDK'
