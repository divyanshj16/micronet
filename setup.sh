conda env create -f environment.yml
chmod +x activate.sh
source activate.sh
wget https://www.cs.toronto.edu/~kriz/cifar-100-python.tar.gz
tar -xf cifar-100-python.tar.gz
mv cifar-100-python cifar100
mkdir cifar100/models
echo "Downloading Model"
curl --header 'Host: doc-08-as-docs.googleusercontent.com' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --referer 'https://drive.google.com/' --header 'DNT: 1' --header 'Upgrade-Insecure-Requests: 1' 'https://doc-08-as-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/fo52t8juvj01rd4ql70n7qjecgl0rts7/1570636800000/01302573485376766868/*/118VEH2uqc1t7CB0_wAJdT_9CftfnwsFY?e=download' --output 'FINAL_WRN_NO_FL.pth'
echo "Downloaded"
cp FINAL_WRN_NO_FL.pth cifar100/models
python prepare_data.py
rm cifar-100-python.tar.gz