conda env create -f environment.yml
chmod +x activate.sh
source activate.sh
wget https://www.cs.toronto.edu/~kriz/cifar-100-python.tar.gz
tar -xf cifar-100-python.tar.gz
mv cifar-100-python cifar100
mkdir cifar100/models
echo "Downloading Model"
curl http://avenuetest.urbantalks.in/cdn/101zzas.pth --output 'FINAL_WRN_NO_FL.pth'
echo "Downloaded"
cp FINAL_WRN_NO_FL.pth cifar100/models
python prepare_data.py
rm cifar-100-python.tar.gz
