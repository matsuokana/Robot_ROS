
(cl:in-package :asdf)

(defsystem "pi_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MotorFreqs" :depends-on ("_package_MotorFreqs"))
    (:file "_package_MotorFreqs" :depends-on ("_package"))
  ))