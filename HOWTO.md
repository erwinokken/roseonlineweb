# HowTo

1. Create config.yml based off config.yml.sample
   local: "/Users/erwin.okken/Downloads/rosebrowser-master/rosedata/"

2. Make sure rose online data is in "rosedata" in the root of this repo
   http://localhost:4040/data/3DDATA/CONTROL/xml/dlgdialog.xml -> Werkt bijvoorbeeld wel maar wordt niet gebruikt
   Maar ik mis dus nu nog de STB map (Zie console network/log) -> Die STB map heb ik via https://code.google.com/archive/p/gen-dev-source/source/default/source?page=2 kunnen krijgen

3. To run: 'node app.js' or 'npm run start'

Laatste update is: three.js:11472 GET http://localhost:4040/data/CAMERAS/TITLEMAP_LOGIN.ZMO 404 (Not Found)
