# # encoding: utf-8

# Inspec test for recipe MovidiusNCSDK::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
  describe user('vagrant') do
    it { should exist }
  end
  describe directory('/NeuralComputeStick/workspace') do
    it { should exist }
    its('mode') { should cmp '0655' }
  end
  describe file('/NeuralComputeStick/workspace/ncsdk/examples/apps/hello_ncs_py/hello_ncs.py') do
    it { should exist }
    it { should be_file }
    it { should be_readable }
    its('type') { should cmp 'file' }
    its('mode') { should cmp '0644' }
  end
  describe command('python3.5 /NeuralComputeStick/workspace/ncsdk/examples/apps/hello_ncs_py/hello_ncs.py') do
    its('stdout') { should include "NCS device working.\n"}
    its('exit_status') { should eq 0 }
  end
end
