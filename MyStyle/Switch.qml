import QtQuick
import QtQuick.Controls.Basic as T

T.Switch {
    id: control
    text: ""
    height: 8*Screen.pixelDensity
    width: height*2
    property bool value: false
    checked: control.value
    indicator: Rectangle {
        radius: parent.height/2
        anchors.fill: parent
        color: "#515151"

        Rectangle {
            x: control.checked ? parent.width - width - (parent.height-height)/2 : (parent.height-height)/2
            width: control.height*0.82
            height: width
            radius: height/2
            y: parent.height / 2 - height / 2
            color: control.checked ? "#e6e6e6" : "#353535"

        }
    }
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: "#21be2b"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }

}
