
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
    width: 1600
    height: Constants.height * 0.8
    color: "#282828"
    border.width: 0
    property int scaleY:20

    ListModel { //модель на основе которой генерируется интерфейс настроек
        id: listMod1
        ListElement {
            name: "Red"
            attributes: [
                ListElement {
                    text: "Test"
                    type: "headline"
                },
                ListElement {
                    text: "Test"
                    type: "slider"
                    value: 2
                    min: 0
                    max: 10
                    fix: true
                },
                ListElement {
                    text: "TestTest"
                    type: "switch"
                    value: true
                },
                ListElement {
                    text: "Test"
                    type: "slider"
                    value: 2
                    min: -1
                    max: 2
                    fix: false
                },
                ListElement {
                    text: "Tes"
                    type: "combobox"
                    value: 0
                    array: [
                        ListElement{text:"Var1"},
                        ListElement{text:"Var2"},
                        ListElement{text:"Var3"},
                        ListElement{text:"Var4"},
                        ListElement{text:"Var5"}
                    ]
                },
                ListElement {
                    text: "TestTest"
                    type: "checkbox"
                    value: true
                },
                ListElement {
                    text: "Tes"
                    type: "slider"
                    value: 11
                    min: 0
                    max: 10
                    fix: false
                },
                ListElement {
                    text: "Tes"
                    type: "textfield"
                    value: 11
                    min: 0
                    max: 10
                    fix: false
                }
            ]
        }

        ListElement {
            name: "Red2"
            attributes: [
                ListElement {
                    text: "Test"
                    type: "slider"
                    value: 2
                    min: 0
                    max: 10
                    fix: false
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
            Layout.preferredHeight: parent.height / 15
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
                Layout.preferredWidth: parent.width / 4

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
                            height: Screen.pixelDensity * 9
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
                            roleValue: "slider"
                            delegate: RowLayout {
                                width: parent.width
                                height: stackLayout.height/scaleY
                                Text {
                                    text: model.text
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.leftMargin: 15
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.minimumWidth: 200
                                    Layout.maximumWidth: 200
                                    color: "#909090"
                                }

                                Slider {
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    value: model.value
                                    from: model.min
                                    to: model.max
                                    maxStop: model.fix
                                }
                            }
                        }
                        DelegateChoice {
                            roleValue: "switch"
                            delegate: RowLayout {
                                width: parent.width
                                height: stackLayout.height/scaleY
                                Text {
                                    text: model.text
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.leftMargin: 15
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.minimumWidth: 200
                                    Layout.maximumWidth: 200
                                    color: "#909090"
                                }
                                Item {
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Switch {
                                        anchors.verticalCenter: parent.verticalCenter
                                        height: parent.height
                                        value: model.value
                                    }
                                }
                            }
                        }
                        DelegateChoice {
                            roleValue: "checkbox"
                            delegate: RowLayout {
                                width: parent.width
                                height: stackLayout.height/scaleY
                                Text {
                                    text: model.text
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.leftMargin: 15
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.minimumWidth: 200
                                    Layout.maximumWidth: 200
                                    color: "#909090"
                                }
                                Item {
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    CheckBox {
                                        anchors.verticalCenter: parent.verticalCenter;
                                        height: parent.height
                                        value: model.value
                                    }
                                }
                            }
                        }
                        DelegateChoice {
                            roleValue: "combobox"
                            delegate: RowLayout {
                                width: parent.width
                                height: stackLayout.height/scaleY
                                Text {
                                    text: model.text
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.leftMargin: 15
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.minimumWidth: 200
                                    Layout.maximumWidth: 200
                                    color: "#909090"
                                }
                                ComboBox {
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    value: model.value
                                    model: array
                                }
                            }
                        }
                        DelegateChoice {
                            roleValue: "headline"
                            delegate: RowLayout {
                                width: parent.width
                                height: stackLayout.height/scaleY
                                Text {
                                    text: model.text
                                    font.pointSize: 15
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.minimumWidth: 200
                                    Layout.maximumWidth: 200
                                    color: "#e6e6e6"
                                }
                            }
                        }
                        DelegateChoice {
                            roleValue: "textfield"
                            delegate: RowLayout {
                                width: parent.width
                                height: stackLayout.height/scaleY
                                Text {
                                    text: model.text
                                    verticalAlignment: Text.AlignVCenter
                                    Layout.leftMargin: 15
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Layout.minimumWidth: 200
                                    Layout.maximumWidth: 200
                                    color: "#909090"
                                }
                                TextField {
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    text: model.value
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
                                interactive: false

                                bottomMargin: 20
                                leftMargin: 40
                                rightMargin: 30
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
                    Layout.preferredHeight: parent.height / 12
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
