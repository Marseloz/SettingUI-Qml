
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.7
import QtQuick.Controls 6.7
import UntitledProject
import QtQuick.Layouts
import Qt.labs.qmlmodels
import MyStyle

Rectangle {
    id: rectangle
    width: 1300
    height: Constants.height * 0.8
    color: "#282828"
    border.width: 0

    ListModel { //модель на основе которой генерируется интерфейс настроек
        id: listMod1
        ListElement {
            name: "Red"
            attributes: [
                ListElement {
                    type: "a"
                    text: "Test"
                    var1: 2
                },
                ListElement {
                    type: "a"
                    text: "TestTest"
                    var1: 6
                },
                ListElement {
                    type: "a"
                    text: "Tes"
                    var1: 0
                },
                ListElement {
                    type: "a"
                    text: "TestTest"
                    var1: -1
                },
                ListElement {
                    type: "a"
                    text: "Tes"
                    var1: 11
                }
            ]
        }

        ListElement {
            name: "Red2"
            attributes: [
                ListElement {
                    type: "a"
                    text: "Test"
                    var1: 2
                }
            ]
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Rectangle {
            id: rectangle1
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent.width / 11
            Layout.maximumHeight: rectangle1.Layout.preferredHeight
            color: "#353535"

            Text {
                id: _text1
                text: qsTr("Настройки")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: (parent.height - font.pixelSize) / 2
                verticalAlignment: Text.AlignTop
                font.styleName: "Regular"
                anchors.verticalCenterOffset: 0
                font.family: "Roboto"
                font.pointSize: 12
                color: "#b1b1b1"
            }
        }

        RowLayout {
            id: rowLayout
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            ColumnLayout {
                spacing: 3
                id: columnLayout
                Layout.topMargin: 22
                Layout.margins: 20
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width / 3

                ListView {
                    id: listView
                    interactive: false
                    orientation: ListView.Vertical
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: listMod1
                    delegate: Row { //делегат отвечающий за отображение разделов настроек
                        id: row
                        spacing: 5
                        Item {
                            height: columnLayout.height / 20
                            width: columnLayout.width
                            Rectangle {
                                id: rectangle3
                                color: listView.currentIndex === index ? "#515151" : "#3e3e3e"
                                radius: 9
                                anchors.fill: parent
                                visible: mouse_area1.containsMouse
                                         || (listView.currentIndex === index) ? true : false
                            }
                            Text {
                                width: 100
                                text: name
                                color: listView.currentIndex != index ? "#909090" : "#e6e6e6"
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignLeft
                                leftPadding: (parent.height - font.pixelSize) / 2
                                font.pointSize: 10
                                font.family: "Roboto"
                            }
                            MouseArea {
                                id: mouse_area1
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: listView.currentIndex = index
                            }
                        }
                    }
                    focus: true
                }
            }

            ColumnLayout {
                id: columnLayout1
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width - parent.width / 3
                spacing: 0
                Rectangle {
                    id: rectangle7
                    Layout.fillWidth: true
                    height: 4
                    color: "#282828"
                }
                Item {
                    id: name

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Rectangle {
                        id: rectangle5
                        color: "#353535"
                        anchors.fill: parent
                    }

                    DelegateChooser { //делегат отвечающий за логику отображения пунктов настроек
                        id: chooser
                        role: "type"
                        DelegateChoice {
                            roleValue: "a"
                            delegate: RowLayout {
                                id: rowLayout1
                                width: parent.width
                                height: 100
                                Text {
                                    text: model.text
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.maximumWidth: 200
                                    color: "#909090"
                                }

                                Slider {
                                    //Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    value: model.var1
                                }
                            }
                        }
                        DelegateChoice {
                            roleValue: "b"
                            delegate: Rectangle {
                                height: 25
                                width: 100
                                Text {
                                    text: model.text
                                }
                            }
                        }
                        DelegateChoice {
                            roleValue: "c"
                            delegate: Rectangle {
                                height: 25
                                width: 100
                                Text {
                                    text: model.text
                                }
                            }
                        }
                    }

                    StackLayout {
                        id: stackLayout
                        currentIndex: listView.currentIndex
                        width: parent.width
                        height: parent.height
                        Repeater {//отвечает за генерацию листов с настройками
                            model: listMod1
                            ListView {
                                id: listView1

                                anchors.fill: parent
                                //anchors.margins: 20
                                interactive: false

                                bottomMargin: 20
                                leftMargin: 20
                                rightMargin: 20
                                topMargin: 20

                                boundsBehavior: Flickable.StopAtBounds

                                spacing: 10
                                clip: true
                                ScrollBar.vertical: ScrollBar {//active: true
                                    policy: contentHeight > height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
                                }
                                model: attributes
                                delegate: chooser
                                MouseArea{
                                    anchors.fill: parent
                                    z:-1
                                    onWheel: (event)=>{
                                        let scroll_flick = event.angleDelta.y * 5;
                                        if(parent.verticalOvershoot !== 0.0 ||
                                        (scroll_flick>0 && (parent.verticalVelocity<=0)) ||
                                        (scroll_flick<0 && (parent.verticalVelocity>=0))) {
                                            parent.flick(0, (scroll_flick - parent.verticalVelocity));
                                            return;
                                        }
                                        else {
                                            parent.cancelFlick();
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Component {
                        id: myComponent
                        Rectangle {
                            width: 100
                            height: 100
                            color: "red"
                        }
                    }
                }
                Rectangle {
                    id: rectangle6
                    Layout.fillWidth: true
                    height: 4
                    color: "#282828"
                }

                Rectangle {
                    id: rectangle2
                    color: "#353535"
                    Layout.preferredHeight: parent.width / 6
                    Layout.maximumHeight: rectangle2.Layout.preferredHeight
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Row {
                        id: row1
                        width: parent.width
                        height: parent.height
                        rightPadding: parent.height / 5
                        spacing: parent.height / 6
                        layoutDirection: Qt.RightToLeft

                        Button {
                            id: button1
                            width: 260
                            height: (parent.height / 5) * 3
                            text: qsTr("Применить")
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Roboto"
                        }

                        Button {
                            id: button2
                            width: 200
                            height: (parent.height / 5) * 3
                            text: qsTr("Отмена")
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Roboto"
                        }

                        Button {
                            id: button3
                            width: 200
                            height: (parent.height / 5) * 3
                            text: qsTr("Ок")
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Roboto"
                        }
                    }
                }
            }
        }
    }
}
