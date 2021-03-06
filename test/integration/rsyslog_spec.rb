require 'spec_helper'

describe package('rsyslog') do
  it { should be_installed }
end

describe service('rsyslog') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/rsyslog.conf') do
  it { should be_file }
end

describe file('/etc/rsyslog.d/50-default.conf') do
  it { should_not be_file }
end

describe file('/etc/rsyslog.d/10-auth.conf') do
  it { should be_file }
end

describe file('/etc/rsyslog.d/10-negauth.conf') do
  it { should be_file }
end

describe file('/etc/rsyslog.d/10-kernel.conf') do
  it { should be_file }
end

describe file('/etc/rsyslog.d/15-mail.conf') do
  it { should be_file }
end

describe file('/etc/rsyslog.d/15-mail-error.conf') do
  it { should be_file }
end

describe file('/etc/rsyslog.d/10-emergency.conf') do
  it { should be_file }
end

describe file('/etc/rsyslog.d/20-apt.conf') do
  it { should be_file }
end

# gelf template
describe file('/etc/rsyslog.d/10-gelf.conf') do
  it { should be_file }
end

# gelf action
describe file('/etc/rsyslog.d/30-gelf_output.conf') do
  it { should be_file }
end

# property_based_filter
describe file('/etc/rsyslog.d/20-cron_exceptions.conf') do
  it { should be_file }
end
