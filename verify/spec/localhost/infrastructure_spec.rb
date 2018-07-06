require 'spec_helper'

describe package('git') do
  it { should be_installed }
end

describe package('docker-ce') do
  it { should be_installed}
end

# java -version prints the version to the standard out!
describe command('java -version') do
  its(:stdout) { should match '' }
  its(:stderr) { should contain('1.8') }
end

describe package('atom') do
  it { should be_installed }
end

describe package('code') do
  it { should be_installed }
end

describe package('nodejs') do
  it { should be_installed }
end
