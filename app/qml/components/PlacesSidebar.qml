/*
* Files app - File manager for Papyros
* Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
*               2015 Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.2
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
import Fluid.Controls 1.0

Sidebar {
    id: placesSidebar

    Column {
        anchors {
            left: parent.left
            right: parent.right
        }

        Subheader {
            text: qsTr("Places")
        }

        Repeater {
            model: folderModel.places

            delegate: ListItem {
                id: listItem

                iconName: folderModel.pathIcon(path)
                text: folderModel.pathTitle(path)
                highlighted: folderModel.path == path

                onClicked: folderModel.goTo(path)
            }
        }

        ListItem {
            id: trashItem

            iconName: "action/delete"
            text: qsTr("Trash")

            onClicked: pageStack.push(Qt.resolvedUrl("../TrashPage.qml"));
        }
    }
}
