pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components
import QtQuick.Controls.Basic as T

T.ComboBox {
    id: control
    model: ["First", "Second", "Third", "First", "Second", "Third", "First", "Second", "Third", "First", "Second", "Third", "First", "Second", "Third", "First", "Second", "Third2"]

    delegate: ItemDelegate {
        id: delegate
        required property var model
        required property int index
        background: Rectangle {
            visible: parent.hovered ? true : false
            anchors.fill: parent
            radius: 2*Screen.pixelDensity
            color: "#757575"
        }
        height: control.height
        width: control.width
        contentItem: Text {
            leftPadding: control.height/4
            text: delegate.model[control.textRole]
            color: "#d5d5d5"
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === index
    }

    indicator: Canvas {
        id: canvas

        width: control.height/3
        height: control.height/3.5
        contextType: "2d"
        TriangleItem {
            x: control.width - width - control.rightPadding
            y: control.topPadding + (control.availableHeight - height) * 0.54
            width: parent.width
            height: parent.height
            radius: 10

            scale: -1
            fillColor: "#b1b1b1"
            arcRadius: 5

            strokeWidth: 0
            //strokeColor: "#808080"
        }
        /*onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? "#b1b1b1" : "#b1b1b1";
            context.fill();
        }*/
    }

    contentItem: Text {
        leftPadding: control.height/3
        //rightPadding: control.indicator.width + control.spacing
        text: control.displayText
        horizontalAlignment: Text.AlignLeft
        font: control.font
        color: "#d5d5d5"
        verticalAlignment: Text.AlignVCenter
        //elide: Text.ElideRight
    }

    background: Rectangle {
        color: "#515151"
        //implicitWidth: 120
        //implicitHeight: 40
        anchors.fill: parent
        radius: 2*Screen.pixelDensity
    }

    popup: Popup {
        y: control.height + 3
        width: control.width
        implicitHeight: count > 6 ? control.height*6 : control.height*count
        padding: 1

        contentItem: ListView {
            boundsBehavior: Flickable.StopAtBounds
            delegate: Rectangle{
                color: "#000000"
            }
            clip: true
            //implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            ScrollBar.vertical: ScrollBar {
                policy: count > 6 ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
            }
        }

        background: Rectangle {
            color: "#515151"
            radius: 2*Screen.pixelDensity
        }
    }
}
