import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Templates as T

T.Button {
    id: control
    text: qsTr("Button")

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#353535" : "#d5d5d5"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        //font.family: "Roboto"
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        color: control.down ? "#757575" : "#515151"
        radius: 1.5*Screen.pixelDensity
    }
}

