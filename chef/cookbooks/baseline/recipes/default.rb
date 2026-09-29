package %w(curl unzip) do
  action :install
end
file '/etc/motd' do
  content "Managed by Chef\n"
end
