// Auto-generated. Do not edit!

// (in-package pi_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MotorFreqs {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left_hz = null;
      this.right_hz = null;
    }
    else {
      if (initObj.hasOwnProperty('left_hz')) {
        this.left_hz = initObj.left_hz
      }
      else {
        this.left_hz = 0;
      }
      if (initObj.hasOwnProperty('right_hz')) {
        this.right_hz = initObj.right_hz
      }
      else {
        this.right_hz = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorFreqs
    // Serialize message field [left_hz]
    bufferOffset = _serializer.int16(obj.left_hz, buffer, bufferOffset);
    // Serialize message field [right_hz]
    bufferOffset = _serializer.int16(obj.right_hz, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorFreqs
    let len;
    let data = new MotorFreqs(null);
    // Deserialize message field [left_hz]
    data.left_hz = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [right_hz]
    data.right_hz = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pi_ros/MotorFreqs';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '921a8bc2b9eda90f5d3ca620a3549e13';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 left_hz
    int16 right_hz
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorFreqs(null);
    if (msg.left_hz !== undefined) {
      resolved.left_hz = msg.left_hz;
    }
    else {
      resolved.left_hz = 0
    }

    if (msg.right_hz !== undefined) {
      resolved.right_hz = msg.right_hz;
    }
    else {
      resolved.right_hz = 0
    }

    return resolved;
    }
};

module.exports = MotorFreqs;
