import QtQuick
import QtQuick.Controls.Basic as T

T.TextField {
    id: control
    placeholderText: qsTr("Введите значение")
    color: "#d5d5d5"
    leftPadding: height/3.5
    focusPolicy: Qt.ClickFocus
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        radius: 2*Screen.pixelDensity
        color: "#212121"
    }
    onAccepted:{
        if(activeFocus === true){
            focus = false
        }
    }
}
