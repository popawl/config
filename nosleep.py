# -*- coding: utf-8 -*-
"""This is a simple script to prevent the computer from locking
due to inactivity. It simply moves the volume up and down.

"""
import logging
import time

import pyautogui


def main():
    logging.basicConfig(level=logging.INFO)
    logging.info('Started')
    while True:
        pyautogui.press('volumedown')
        time.sleep(1)
        pyautogui.press('volumeup')
        time.sleep(300)
    logging.info('Finished')
    

if __name__ == '__main__':
    main()