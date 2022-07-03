mkdir local_modules
pushd local_modules
git clone -b custom https://github.com/lot36z/vuestic-ui.git
cd vuestic-ui
yarn install
yarn build
cd packages/ui
popd
cp -Rf local_modules/vuestic-ui/packages/ui/. node_modules/vuestic-ui/