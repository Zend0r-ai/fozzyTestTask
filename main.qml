import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

ApplicationWindow {
    minimumWidth: 300
    minimumHeight: 200
    width: 600
    height: 400
    visible: true
    title: qsTr("Task")

    MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr('&Add Library')
                onTriggered: fileDialog.open()
            }
            MenuSeparator { }
            MenuItem {
                text: qsTr('&Exit')
                onTriggered: Qt.quit();
            }
        }
        FileDialog{
            id: fileDialog
            selectMultiple: false
            selectFolder: false
            nameFilters: "*.dll"
            onAccepted:{
                var path = this.fileUrl.toString()
                path = path.replace(/^(file:\/{3})|(qrc:\/{2})|(http:\/{2})/,"")
                var cleanPath = decodeURIComponent(path)
                appCore.setLibraryPath(cleanPath)
            }

        }
    }
    ColumnLayout {
        anchors.centerIn: parent
        spacing: 5
        Connections {
            target: appCore
            function onSomethingHappened(res) {
                result.text = res
            }
        }
        TextField {
            id: dataField
            Layout.alignment: Qt.AlignCenter
            validator: IntValidator {bottom: -99; top: 99}
            placeholderText: qsTr("Enter value")
        }
        Button {
            Layout.alignment: Qt.AlignCenter

            text: "Ok"
            onClicked: appCore.nearestEven(dataField.text);
        }
        Text {
            Layout.alignment: Qt.AlignCenter
            text: "Result:"
        }
        Text {
            id: result
            Layout.alignment: Qt.AlignCenter

        }
    }
}
