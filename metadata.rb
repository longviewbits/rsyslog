name             'rsyslog'
maintainer       'Long View Bits'
maintainer_email 'aaron@longviewbits.com'
license          'MIT'
description      'Installs and configures rsyslog. Provides LWRP for creating rules.'
version          '0.0.7'
issues_url       'https://github.com/longviewbits/rsyslog/issues'
source_url       'https://github.com/longviewbits/rsyslog'

recipe           'rsyslog::default', 'Installs and configures rsyslog.'
recipe           'rsyslog::yum_official_repo', 'Setup official yum rsyslog repository with latest stable version'

supports         %w(ubuntu redhat)
