import QtQuick
import QtQuick.Controls.Basic as T

T.CheckBox {
    id: control
    text: ""
    height: 8*Screen.pixelDensity
    width: height
    property bool value: false
    checked: control.value
    indicator: Rectangle {
        height: parent.height
        width: parent.height
        radius: parent.height/2
        color: "#515151"
        Rectangle {
            width: parent.width/2
            height: parent.height/2
            radius: height/2
            x: parent.height/4
            y: parent.height/4
            color: control.checked ? "#e6e6e6" : "#353535"
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#17a81a" : "#21be2b"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
