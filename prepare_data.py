from pathlib import Path
import pickle
import numpy as np
from PIL import Image
import matplotlib.pyplot as plt

path = Path('cifar100')
train_file = 'train'
test_file = 'test'

def unpickle(file):
    with open(file, 'rb') as f:
        data = pickle.load(f, encoding='latin1')
    return data

def convert_to_folder_format(data, split, resize_to):
    folder = path / split
    if not folder.exists():
        folder.mkdir() 
    for i, filename in enumerate(data['filenames']):
        print(i, end='\r')
        img = data['data'][i]
        class_folder = folder / str(data['fine_labels'][i])
        if not class_folder.exists():
            class_folder.mkdir()
        img = np.array(Image.fromarray(img.reshape(3, 32, 32).transpose(1, 2, 0)).resize((size, size), Image.BICUBIC))
        plt.imsave(class_folder / filename, img)       

train_data = unpickle(path / train_file)
test_data = unpickle(path / test_file) 

size = 32
print('Preparing training data')
convert_to_folder_format(train_data, split=f'train_data', resize_to=size)
print('preparing test data')
convert_to_folder_format(test_data, split=f'valid_data', resize_to=size)