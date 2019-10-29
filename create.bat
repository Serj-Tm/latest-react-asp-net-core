set name=%1
set reactAppName=%2
set rname=r-%name%(tmp)

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

ren %name%\ClientApp\src\components\Home.js Home.tsx
ren %name%\ClientApp\src\components\NavMenu.js NavMenu.tsx

copy /Y %rname%\src\serviceWorker.ts %name%\ClientApp\src\
del %name%\ClientApp\src\registerServiceWorker.js

cmd /c "ts-node transform.ts %name%\ClientApp\src\index.js %name%\ClientApp\src\index.js"

copy /Y template\.editorconfig %name%

pushd %name%\ClientApp
cmd /c "npm install"
cmd /c "npm install --save bootstrap"
cmd /c "npm install --save reactstrap react-router-dom react-router-bootstrap"
cmd /c "npm install --save typescript @types/node @types/react @types/react-dom @types/jest"
cmd /c "npm install --save @types/reactstrap @types/react-router-dom"
popd

echo "1. ClientApp\components\NavMenu.tsx: Component -> Component<{}, { collapsed: boolean }>, constructor(props) -> constructor(props:any)"
echo "2. ClientApp\public\index.html: add  <base href='%PUBLIC_URL%/' />"
