// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.7
import UntitledProject

Window {
    width: 3840
    height: 2160
    visible: true
    minimumHeight: mainScreen.height
    minimumWidth: mainScreen.width
    title: "UntitledProject"

    Screen01 {
        id: mainScreen
    }

}

