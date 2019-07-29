set name=my-app
set reactAppName=%name%
set rname=r-%name%

cmd /c "npx create-react-app %reactAppName% --typescript"
ren %reactAppName% %rname%
mkdir %name%
pushd %name%
dotnet new react
popd

copy /Y %rname%\tsconfig.json %name%\ClientApp\
copy /Y %rname%\package.json %name%\ClientApp\
del %name%\ClientApp\package-lock.json
copy /Y %rname%\README.md %name%\ClientApp\

copy /Y %rname%\public\index.html %name%\ClientApp\public\
copy /Y %rname%\public\manifest.json %name%\ClientApp\public\

copy /Y %rname%\src\serviceWorker.ts %name%\ClientApp\src\
del %name%\ClientApp\src\registerServiceWorker.js
ren %name%\ClientApp\src\components\Home.js Home.tsx
ren %name%\ClientApp\src\components\NavMenu.js NavMenu.tsx

pushd %name%\ClientApp
cmd /c "npm install"
cmd /c "npm install --save bootstrap"
cmd /c "npm install --save reactstrap react-router-dom react-router-bootstrap"
cmd /c "npm install --save typescript @types/node @types/react @types/react-dom @types/jest"
cmd /c "npm install --save @types/reactstrap @types/react-router-dom"
popd

echo "1. ClientApp\src\index.js: replace serviceWorker"
echo "import * as serviceWorker from './serviceWorker';"
echo "// If you want your app to work offline and load faster, you can change unregister() to register() below. Note this comes with some pitfalls."
echo "// Learn more about service workers: http://bit.ly/CRA-PWA"
echo "serviceWorker.unregister();"

echo "2. ClientApp\components\NavMenu.tsx: Component -> Component<{}, { collapsed: boolean }>, constructor(props) -> constructor(props:any)"
echo "3. ClientApp\public\index.html: add  <base href="%PUBLIC_URL%/" />"
