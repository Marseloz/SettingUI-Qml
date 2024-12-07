import QtQuick
import QtQuick.Controls.Basic

Switch {
    id: control
    text: ""

    indicator: Rectangle {
        width: 16*Screen.pixelDensity
        height: 8*Screen.pixelDensity
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 4*Screen.pixelDensity
        color: "#515151"

        Rectangle {
            x: control.checked ? parent.width - width - (parent.height-height)/2 : (parent.height-height)/2
            width: 6.4*Screen.pixelDensity
            height: 6.4*Screen.pixelDensity
            radius: 3.2*Screen.pixelDensity
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
