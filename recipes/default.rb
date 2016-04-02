include_recipe 'sysctl'
include_recipe 'postgresql::server'

config = node.postgresql

if config.attribute? :database
  postgresql_database config.database
end

config.users.each do |user|
  postgresql_user user.name do
    password user.password
  end
end

include_recipe 'postgresql-bits::monit'
