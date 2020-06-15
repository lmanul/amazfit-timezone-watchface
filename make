#!/usr/bin/python3

import os

def copy_image_to_index(img, idx):
    out = str(idx).zfill(4)
    os.system("cp " + img + " out/" + out + ".png")

os.system("rm -rf out")
os.mkdir("out")

os.system("cp layout.json out/")

lines = 5
for i in range(10):
    os.system("./mkdigitcolumn " + str(i) * lines)
    copy_image_to_index("out.png", 1 + i)

# Weather
weather_img_index = 100
weather_imgs = sorted(["weather/" + f for f in os.listdir("weather/")])
for i in range(len(weather_imgs)):
    copy_image_to_index(weather_imgs[i], weather_img_index + i)

copy_image_to_index("background.png", 0)
