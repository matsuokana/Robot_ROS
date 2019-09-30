#!/usr/bin/env python
#encoding: utf8
import rospy
import new_motor_speed
import time

if __name__ == '__main__':
	rospy.init_node('motor')
	while not rospy.is_shutdown():
		new_motor_speed.init()
		new_motor_speed.move_left_wheel(2500)
		time.sleep(1)
