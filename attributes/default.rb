default[:postgresql][:backup][:path] = '/backups'
default[:postgresql][:backup][:hour] = 3
default[:postgresql][:backup][:minute] = 0
default[:postgresql][:backup][:keep_days] = 5
default[:postgresql][:users] = []

default[:postgresql][:kernel_sem]="4096\t6553555\t1600\t65535"
default[:postgresql][:effective_cache_size_percentage] = 0.75
default[:postgresql][:effective_cache_size] = ((node[:memory][:total].to_i * 1024) * default[:postgresql][:effective_cache_size_percentage]).to_i / 1024 / 1024
