pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic as T

T.ComboBox {
    id: control
    model: ["First", "Second", "Third", "First", "Second", "Third", "First", "Second", "Third", "First", "Second", "Third", "First", "Second", "Third", "First", "Second", "Third2"]

    delegate: ItemDelegate {
        id: delegate
        required property var model
        required property int index

        width: control.width
        contentItem: Text {
            text: delegate.model[control.textRole]
            color: "#000579"
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === index
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() { canvas.requestPaint(); }
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? "#b1b1b1" : "#b1b1b1";
            context.fill();
        }
    }

    contentItem: Text {
        leftPadding: 0
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        color: control.pressed ? "#d5d5d5" : "#d5d5d5"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        color: "#515151"
        implicitWidth: 120
        implicitHeight: 40
        radius: 8
    }

    popup: Popup {
        y: control.height - 1
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
            radius: 6
        }
    }
}
