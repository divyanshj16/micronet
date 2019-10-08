conda env create -f environment.yml
source activate torch
wget https://www.cs.toronto.edu/~kriz/cifar-100-python.tar.gz
tar -xf cifar-100-python.tar.gz
mv cifar-100-python cifar100
mkdir cifar100/models
cp FINAL_WRN_NO_FL.pth cifar100/models
python prepare_data.py
rm cifar-100-python.tar.gz