# HowTo

## Client
1. Create config.yml based off config.yml.sample
   local: "/Users/erwin.okken/Downloads/rosebrowser-master/rosedata/"

2. Make sure rose online data is in "rosedata" in the root of this repo
   http://localhost:4040/data/3DDATA/CONTROL/xml/dlgdialog.xml -> Werkt bijvoorbeeld wel maar wordt niet gebruikt
   Maar ik mis dus nu nog de STB map (Zie console network/log) -> Die STB map heb ik via https://code.google.com/archive/p/gen-dev-source/source/default/source?page=2 kunnen krijgen

3. To run: 'node app.js' or 'npm run start'

Laatste update is: three.js:11472 GET http://localhost:4040/data/CAMERAS/TITLEMAP_LOGIN.ZMO 404 (Not Found)


## Server
1. Download MySql and install (https://dev.mysql.com/downloads/installer/)
2. Create "roseon" db in MySql (CREATE DATABASE roseon;)
3. In "ServerFiles" fill "database_installer" with the correct files and run it
4. Delete "osrose_backup" file which is created
5. loginserver.conf/charserver.conf/worldserver.conf in Binary folder => Mysql settings + local IP
6. Add account to "accounts" mysql table: username: test - password: 098f6bcd4621d373cade4e832627b4f6 - accesslevel: 500 - lasttime: 0. password is MD5 for "test". accesslevel 500 is Admin.
6. Run LoginServer, CharServer, WorldServer in Binary folder

## Current status

- Fixed CryptoJS (md5) files 404 (eenmalig, hoeft niet later in de lijst)
- Character select in screenshot is niet hetzelfde (mapId 7) als wat ik heb (mapId 4) en daar hoort ook een andere versie van Adventure Plains bij dus ik gok dat het een andere client is. Ik gok dat mijn client te "oud" is. Zie ook deze link: https://forum.roseonlinegame.com/topic/498-the-many-changes-of-adventurers-plains/ en versie 2 is naROSE. Brett19 had het over naROSE. En zijn screenshot lijkt daar ook wel op.
- Bij character create krijg je een error. Dit kan 2 redenen hebben. De client data wordt gebruikt en klopt niet. Of de ServerFiles zijn niet compatible.