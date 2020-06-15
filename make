#!/usr/bin/python3

import os

def copy_image_to_index(img, idx, move=False):
    out = str(idx).zfill(4)
    cmd = "mv" if move else "cp"
    os.system(cmd + " " + img + " out/" + out + ".png")

def digit_images(idx):
    lines = 6
    for i in range(10):
        os.system("./mkdigitcolumn " + str(i) * lines)
        copy_image_to_index("out.png", idx + i, move=True)

def weather_images(idx):
    weather_imgs = sorted(["weather/" + f for f in os.listdir("weather/")])
    for i in range(len(weather_imgs)):
        copy_image_to_index(weather_imgs[i], idx + i)

def battery_images(idx):
    battery_imgs = sorted(["battery/" + f for f in os.listdir("battery/")])
    for i in range(len(battery_imgs)):
        copy_image_to_index(battery_imgs[i], idx + i)

if __name__ == "__main__":
    os.system("rm -rf out")
    os.mkdir("out")

    os.system("cp layout.json out/")
    copy_image_to_index("background.png", 0)

    digit_images(1)
    #weather_images(100)
    #battery_images(200)
