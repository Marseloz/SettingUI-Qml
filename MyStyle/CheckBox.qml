import QtQuick
import QtQuick.Controls.Basic as T

T.CheckBox {
    id: control
    text: ""
    property bool value: false
    checked: value
    height: 100
    width: height
    indicator: Rectangle {
        anchors.fill: parent
        radius: height/2
        color: "#515151"

        Rectangle {
            width: parent.width/2
            height: parent.height/2
            radius: height/2
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
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
