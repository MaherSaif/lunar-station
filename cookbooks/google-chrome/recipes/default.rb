base_url = "https://dl-ssl.google.com/linux/direct/"

case node[:platform]
when 'fedora'
  yum_repository "google" do
    name "Google Repository"
    url "http://dl.google.com/linux/rpm/stable/i386"
    key "https://dl-ssl.google.com/linux/linux_signing_key.pub"
  end

  package 'google-chrome-stable'

when 'ubuntu'
  apt_repository "google-chrome" do
    uri "http://dl.google.com/linux/chrome/deb/"
    components ["stable", "main"]
    key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
    action :add
  end

  package 'google-chrome-stable'

when 'mac_os_x'
  dmg_package "Google Chrome" do
    dmg_name "googlechrome"
    source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
    action :install
  end
end
