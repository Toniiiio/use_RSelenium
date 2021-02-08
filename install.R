# Michael Ruttner key error: 
# solved here https://www.bentoh.my/post/gpg-key-problem/

# In case of dpkg errors run https://askubuntu.com/questions/219545/dpkg-error-dpkg-status-database-is-locked-by-another-process

script <- paste('
sudo apt-key del "E298 A3A8 25C0 D65D FD57 CBB6 5171 6619 E084 DAB9"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install -y docker-engine
sudo service docker start
sudo docker run hello-world
sudo docker run -d -p 4445:4444 selenium/standalone-firefox
sudo docker ps
')
writeLines(text = script, con = "installer.sh")

system("chmod +x installer.sh")
system("./installer.sh")

library(RSelenium)
remDr <- remoteDriver(port = 4445L)
remDr$open()
