if defined? :monitrc
  monitrc 'postgresql' do
    template_source 'monit.conf.erb'
    template_cookbook 'postgresql-bits'
  end
end
