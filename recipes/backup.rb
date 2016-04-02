config = node.postgresql.backup

directory config.path do
  owner 'root'
  group 'root'
  mode 00700
  action :create
end

template '/usr/local/bin/pgbackup' do
  source 'pgbackup.erb'
  owner 'root'
  mode 00700
  variables path: config.path
end

template '/usr/local/bin/pgbackup.sh' do
  source 'pgbackup.sh.erb'
  owner 'root'
  mode 00700
  variables path: config.path,
            days: config.keep_days
end

cron "perform postgresql backup" do
  hour config.hour
  minute config.minute
  command "/usr/local/bin/pgbackup.sh > /var/log/pgbackup.log 2>&1"
end
