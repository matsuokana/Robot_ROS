;; Auto-generated. Do not edit!


(when (boundp 'pi_ros::TimedMotion)
  (if (not (find-package "PI_ROS"))
    (make-package "PI_ROS"))
  (shadow 'TimedMotion (find-package "PI_ROS")))
(unless (find-package "PI_ROS::TIMEDMOTION")
  (make-package "PI_ROS::TIMEDMOTION"))
(unless (find-package "PI_ROS::TIMEDMOTIONREQUEST")
  (make-package "PI_ROS::TIMEDMOTIONREQUEST"))
(unless (find-package "PI_ROS::TIMEDMOTIONRESPONSE")
  (make-package "PI_ROS::TIMEDMOTIONRESPONSE"))

(in-package "ROS")





(defclass pi_ros::TimedMotionRequest
  :super ros::object
  :slots (_left_hz _right_hz _duration_ms ))

(defmethod pi_ros::TimedMotionRequest
  (:init
   (&key
    ((:left_hz __left_hz) 0)
    ((:right_hz __right_hz) 0)
    ((:duration_ms __duration_ms) 0)
    )
   (send-super :init)
   (setq _left_hz (round __left_hz))
   (setq _right_hz (round __right_hz))
   (setq _duration_ms (round __duration_ms))
   self)
  (:left_hz
   (&optional __left_hz)
   (if __left_hz (setq _left_hz __left_hz)) _left_hz)
  (:right_hz
   (&optional __right_hz)
   (if __right_hz (setq _right_hz __right_hz)) _right_hz)
  (:duration_ms
   (&optional __duration_ms)
   (if __duration_ms (setq _duration_ms __duration_ms)) _duration_ms)
  (:serialization-length
   ()
   (+
    ;; int16 _left_hz
    2
    ;; int16 _right_hz
    2
    ;; uint32 _duration_ms
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _left_hz
       (write-word _left_hz s)
     ;; int16 _right_hz
       (write-word _right_hz s)
     ;; uint32 _duration_ms
       (write-long _duration_ms s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _left_hz
     (setq _left_hz (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _right_hz
     (setq _right_hz (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint32 _duration_ms
     (setq _duration_ms (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass pi_ros::TimedMotionResponse
  :super ros::object
  :slots (_success ))

(defmethod pi_ros::TimedMotionResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass pi_ros::TimedMotion
  :super ros::object
  :slots ())

(setf (get pi_ros::TimedMotion :md5sum-) "d80c56ffd8662963140a2b3157f57615")
(setf (get pi_ros::TimedMotion :datatype-) "pi_ros/TimedMotion")
(setf (get pi_ros::TimedMotion :request) pi_ros::TimedMotionRequest)
(setf (get pi_ros::TimedMotion :response) pi_ros::TimedMotionResponse)

(defmethod pi_ros::TimedMotionRequest
  (:response () (instance pi_ros::TimedMotionResponse :init)))

(setf (get pi_ros::TimedMotionRequest :md5sum-) "d80c56ffd8662963140a2b3157f57615")
(setf (get pi_ros::TimedMotionRequest :datatype-) "pi_ros/TimedMotionRequest")
(setf (get pi_ros::TimedMotionRequest :definition-)
      "int16 left_hz
int16 right_hz
uint32 duration_ms
---
bool success

")

(setf (get pi_ros::TimedMotionResponse :md5sum-) "d80c56ffd8662963140a2b3157f57615")
(setf (get pi_ros::TimedMotionResponse :datatype-) "pi_ros/TimedMotionResponse")
(setf (get pi_ros::TimedMotionResponse :definition-)
      "int16 left_hz
int16 right_hz
uint32 duration_ms
---
bool success

")



(provide :pi_ros/TimedMotion "d80c56ffd8662963140a2b3157f57615")


