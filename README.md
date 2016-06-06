**ShutDone** a simple OS X app that turns on [iGetter](http://www.igetter.net/) (v2.9.4+) "Shut Down When Done" Tools menu command. This app works in background and waits for a system notification that iGetter is started, then it just clicks on the iGetter Tools menu command through an AppleScript (see the source code).

Here is what you need:

1. Download this app from the [Release](https://github.com/fiery-/ShutDone/releases) section. Then double click on it to unzip it (i.e. in your Downloads folder):

2. Open System Preferences > Users & Groups > Login Items tab. Click on the "+" button and navigate to ShutDone app in your Downloads folder. (This step will run the app in the background when you login.)

3. Open System Preferences > Security & Privacy > Privacy tab > Accessibility. Click on the "+" button and navigate to the ShutDone app. (This step will allow the app to click on the iGetter menu.)

4. Open your Downloads folder and control-click (right click) on the ShutDone app, then select the "Open" contextual menu command. (This step is necessary, because the app is not signed with an Apple Developer certificate.)

5. Log Out and Login your system. Now when you start iGetter, its "Shut Down When Done" command should be on (after some delay until iGetter enables its Tools menu). You can replace "Shut Down" function with "Sleep" or "Quit iGetter" at iGetter preferences, Advanced Panel.

To remove this app, Open System Preferences > Users & Groups > Login Items tab. Click on the "-" button to remove ShutDone app from the Login Items. Then Log Out and Login your system.

<p><b>System Requirements</b></p>
<ul>
<li>Mac OS X v10.6 (Snow Leopard) - 10.11 (El Capitan); Intel Mac</li>
<li>Project is created with Xcode v3.2.6 (OS X 10.6)</li>
</ul>
