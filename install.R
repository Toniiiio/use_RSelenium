script <- paste('sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install -y docker-engine
sudo service docker start
sudo docker run hello-world
sudo docker run -d -p 4445:4444 selenium/standalone-firefox:2.53.0
sudo docker ps
')
writeLines(text = script, con = "installer2.sh")

system("chmod +x installer.sh")
system("./installer.sh")

library(RSelenium)
remDr <- remoteDriver(port = 4445L)
remDr$open()
