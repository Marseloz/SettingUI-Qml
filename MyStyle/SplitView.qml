import QtQuick 2.15
import QtQuick.Controls 2.15 as T

T.SplitView {
    id: splitView
    anchors.fill: parent

    handle: Rectangle {
        implicitWidth: 4
        implicitHeight: 4
        color: SplitHandle.pressed ? "#81e889"
            : (SplitHandle.hovered ? Qt.lighter("#c2f4c6", 1.1) : "#c2f4c6")
    }

    Rectangle {
        implicitWidth: 150
        color: "#444"
    }
    Rectangle {
        implicitWidth: 50
        color: "#666"
    }
}
