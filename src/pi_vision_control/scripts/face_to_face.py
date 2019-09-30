#!/usr/bin/env python
#encoding: utf8
import rospy, cv2
import new_motor_speed
import servo_motor
import random
import speak
import time
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String

class FaceToFace():
    def __init__(self):
        sub = rospy.Subscriber("/cv_camera/image_raw", Image, self.get_image)
        self.bridge = CvBridge()
        self.image_org = None
        self.pub = rospy.Publisher("face", Image, queue_size=1)
        rospy.Subscriber("rec", String, self.omawari)

    def monitor(self, rect, org):
        if rect is not None:
            cv2.rectangle(org, tuple(rect[0:2]), tuple(rect[0:2]+rect[2:4]), (0, 255, 255), 4)

            self.pub.publish(self.bridge.cv2_to_imgmsg(org, "bgr8"))

    def get_image(self, img):
        try:
            self.image_org = self.bridge.imgmsg_to_cv2(img, "bgr8")
        except CvBridgeError as e:
            rospy.logerr(e)

    def detect_face(self):
        if self.image_org is None:
            return None

        org = self.image_org

        gimg = cv2.cvtColor(org, cv2.COLOR_BGR2GRAY)
        classifier = "/usr/share/opencv/haarcascades/haarcascade_frontalface_default.xml"
        cascade = cv2.CascadeClassifier(classifier)
        face = cascade.detectMultiScale(gimg, 1.1, 1, cv2.CASCADE_FIND_BIGGEST_OBJECT)

        if len(face) == 0:
            self.monitor(None, org)
            return None

        r = face[0]
        self.monitor(r, org)
        return r

    def omawari(self, data):
        new_motor_speed.init()
        com = data.data
        while True:
            r = self.detect_face()
            if r is None:
                #ずっと回転させる
                new_motor_speed.move_left_wheel(7500)
                print "no"
            else:
                ##スピードゼロにして止めて、回ったりわまらなかったりのif文を入れる
                new_motor_speed.move_both_wheels(0, 0)
                print "ditect"
                #0-9のランダムな数字がrandnumに入る
                randnum = random.randrange(10)
                if randnum <= 4:
                    speak.speak1()
                elif randnum >= 5:
                    speak.speak2()
                    new_motor_speed.move_left_wheel(7500)
                    time.sleep(32)
                    break
                #new_otor_speed.move_both_wheels(0,0)
                #servo_motor.Tail()
        #com = data.data
        #if com == "omawari":
            #print com
            #while True:
                #r = self.detect_face()
                #if r is None:
			              #ずっと回転させる
	                  #print "no"
                    ##return 0
                #else:
			              ##スピードゼロにして止めて、回ったりわまらなかったりのif文を入れる
                    #print "ditect"
                    #break

def omawari2():
    fd = FaceToFace()
    while True:
        r = fd.detect_face()
        if r is None:
            ##ずっと回転させる
            print "no"
        else:
            ##スピードゼロにして止めて、回ったりわまらなかったりのif文を入れる
            print "ditect"
            break

if __name__ == '__main__':
    rospy.init_node('face_to_face')
    fd = FaceToFace()

    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        #rospy.loginfo(fd.detect_face())
        #fd.omawari()
        #omawari2()
        #rospy.Subscriber("rec", String, fd.omawari)
        #rospy.Subscriber("rec", String, omawari2)
        rate.sleep()
