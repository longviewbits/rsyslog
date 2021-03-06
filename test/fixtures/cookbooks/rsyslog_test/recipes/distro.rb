include_recipe 'apt'

case node['platform']
when 'ubuntu'
  if node['platform_version'].to_f == 12.04
    node.default['rsyslog']['version'] = '5'
  elsif node['platform_version'].to_f == 16.04
    node.default['rsyslog']['version'] = '8'
  end
end

include_recipe 'rsyslog'

# rule_input lwrp
rsyslog_rule_input 'apt' do
  filename '/var/log/apt/history.log'
end

# template lwrp
rsyslog_template 'gelf' do
  type 'list'
  statement 'constant(value="{\"version\":\"1.1\",")
  constant(value="\"host\":\"")
  property(name="hostname")
  constant(value="\",\"short_message\":\"")
  property(name="msg" format="json")
  constant(value="\",\"timestamp\":\"")
  property(name="timegenerated" dateformat="unixtimestamp")
  constant(value="\",\"level\":\"")
  property(name="syslogseverity")
  constant(value="\"}")'
end

# action lwrp
rsyslog_action 'gelf_output' do
  priority 30
  type 'omfwd'
  rule 'target="192.168.200.2" port="12201" protocol="udp" template="gelf"'
end

# Property based filter
rsyslog_property_based_filter 'cron_exceptions' do
  property ':msg'
  operator 'regex'
  match_string '\[YII\].*'
  log_file '-/var/log/cron_exceptions'
end
