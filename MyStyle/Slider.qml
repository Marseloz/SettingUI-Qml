import QtQuick
import QtQuick.Effects
Item {
    id: control
    property double value: 3 //значение по умолчанию
    property double from: 2 //минимальное значение ползунк
    property double to: 10 //максимальное значение ползунка
    property bool maxStop: false //указывает что делать при достижении максимума ползунка (цифры должны идти дальше или остановиться)
    property double stepSize: 0.01 //шаг с которым должен смещаться ползунок
    property int temp: 100 //ширина окошка, где показывается значение ползунка
    property int scaleText: 12
    width: 50
    height: 8*Screen.pixelDensity
    opacity: enabled ? 1.0 : 0.3
    Rectangle {
        id: sourceItem
        width: control.width
        height: control.height
        visible: false
        Rectangle { //фон
            x: 0
            width: control.width
            height: control.height
            color: "#515151"
            Rectangle {//линия ползунка
                   id: tItem
                   x: control.temp
                   width: ((control.width - control.temp) / (control.to - control.from)) * (control.value - control.from)
                   height: control.height
                   color: "#909090"
            }
            Rectangle { //голова ползунка
                   x: control.value > control.to ? control.width - width : control.temp + ((control.width - control.temp) / (control.to - control.from)) * (control.value - control.from)
                   width: control.value > control.to ? 16 : 4
                   height: control.height
                   color: "#e6e6e6"
            }
        }
    }

    MultiEffect { //эффект обрезки
        source: sourceItem
        anchors.fill: sourceItem
        maskEnabled: true
        maskSource: mask
    }

    Rectangle { //маска которая обрезает
        id: mask
        layer.enabled: true
        visible: false
        width: sourceItem.width
        height: sourceItem.height
        radius: 2*Screen.pixelDensity
        color: "black"
    }

    MouseArea {
        anchors.fill: control
        onPressed: { //сигнал при клике
            control.value = mouseX > control.temp ? ((mouseX - control.temp) / (control.width - control.temp)) * (control.to - control.from) + control.from: control.from;
            control.value = (Math.trunc(control.value / control.stepSize) * control.stepSize).toFixed(5)
        }

        onPositionChanged: { //сигнал при изменении позиции курсора после зажатия
            control.value = mouseX > control.temp ? ((mouseX - control.temp) / (control.width - control.temp)) * (control.to - control.from) + control.from: control.from;
            control.value = (Math.trunc(control.value / control.stepSize) * control.stepSize).toFixed(5)
            if(control.maxStop && control.value > control.to) control.value = control.to;
        }
    }

    TextInput {
        id: textControl
        x: 0
        text: control.value
        font.family: "Roboto"
        font.pointSize: control.scaleText
        color: "#d5d5d5"
        width: control.temp
        height: control.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        focusPolicy: Qt.ClickFocus
        Keys.onReturnPressed: {
            textControl.focus = false
            let n = 0.0
            if(Number(textControl.text) > control.to) {
                if(control.maxStop)
                    n = control.to
                else
                    n = Number(textControl.text)
            }
            else if(Number(textControl.text) < control.from) {
                n = control.from
            }
            else {
                n = Number(textControl.text)
                if (isNaN(n)) n = control.value
            }
            control.value = (n).toFixed(5)
            textControl.text = Qt.binding(function() { return control.value }) //связываем параметр со свойством, так как иначе оно отвязывается
        }

    }
}

