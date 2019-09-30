; Auto-generated. Do not edit!


(cl:in-package pi_ros-msg)


;//! \htmlinclude MotorFreqs.msg.html

(cl:defclass <MotorFreqs> (roslisp-msg-protocol:ros-message)
  ((left_hz
    :reader left_hz
    :initarg :left_hz
    :type cl:fixnum
    :initform 0)
   (right_hz
    :reader right_hz
    :initarg :right_hz
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MotorFreqs (<MotorFreqs>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorFreqs>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorFreqs)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pi_ros-msg:<MotorFreqs> is deprecated: use pi_ros-msg:MotorFreqs instead.")))

(cl:ensure-generic-function 'left_hz-val :lambda-list '(m))
(cl:defmethod left_hz-val ((m <MotorFreqs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pi_ros-msg:left_hz-val is deprecated.  Use pi_ros-msg:left_hz instead.")
  (left_hz m))

(cl:ensure-generic-function 'right_hz-val :lambda-list '(m))
(cl:defmethod right_hz-val ((m <MotorFreqs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pi_ros-msg:right_hz-val is deprecated.  Use pi_ros-msg:right_hz instead.")
  (right_hz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorFreqs>) ostream)
  "Serializes a message object of type '<MotorFreqs>"
  (cl:let* ((signed (cl:slot-value msg 'left_hz)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_hz)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorFreqs>) istream)
  "Deserializes a message object of type '<MotorFreqs>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_hz) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_hz) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorFreqs>)))
  "Returns string type for a message object of type '<MotorFreqs>"
  "pi_ros/MotorFreqs")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorFreqs)))
  "Returns string type for a message object of type 'MotorFreqs"
  "pi_ros/MotorFreqs")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorFreqs>)))
  "Returns md5sum for a message object of type '<MotorFreqs>"
  "921a8bc2b9eda90f5d3ca620a3549e13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorFreqs)))
  "Returns md5sum for a message object of type 'MotorFreqs"
  "921a8bc2b9eda90f5d3ca620a3549e13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorFreqs>)))
  "Returns full string definition for message of type '<MotorFreqs>"
  (cl:format cl:nil "int16 left_hz~%int16 right_hz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorFreqs)))
  "Returns full string definition for message of type 'MotorFreqs"
  (cl:format cl:nil "int16 left_hz~%int16 right_hz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorFreqs>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorFreqs>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorFreqs
    (cl:cons ':left_hz (left_hz msg))
    (cl:cons ':right_hz (right_hz msg))
))
