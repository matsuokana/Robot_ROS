#!/usr/bin/env python
#encoding: utf8
import rospy
import time
from geometry_msgs.msg import Twist

class Test():
    def __init__(self):
        self.pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)

    # 直進
    def pub_x(self):
        # 目的の距離と速度を設定
        dist = 1.0 # [m]
        speed = 0.2 # [m/s]
        target_time = dist / speed # [s]

        # Twist 型のデータ
        t = Twist()
        t.linear.x = speed
        t.angular.z = 0
            
        # 開始の時刻を保存
        start_time = time.time()
        # 経過した時刻を取得
        end_time = time.time()

        # target_time を越えるまで走行
        rate = rospy.Rate(30)
        while end_time - start_time <= target_time:
            self.pub.publish(t)
            end_time = time.time()
            rate.sleep()

    # 旋回
    def pub_z(self):
        # 目的の角度と速度を設定
        theta = 180.0 # [deg]
        speed = 90.0 # [deg/s]
        target_time = theta / speed # [s]

        # Twist 型のデータ
        t = Twist()
        t.linear.x = 0
        t.angular.z = speed * 3.1415 / 180.0 # [rad]
            
        # 開始の時刻を保存
        start_time = time.time()
        # 経過した時刻を取得
        end_time = time.time()

        # target_time を越えるまで走行
        rate = rospy.Rate(30)
        while end_time - start_time <= target_time:
            self.pub.publish(t)
            end_time = time.time()
            rate.sleep()

if __name__ == '__main__':
    rospy.init_node('tcmdvel_publisher')
    test = Test()
    # 直進
    test.pub_x()
    # 旋回
    test.pub_z()
