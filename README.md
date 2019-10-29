# Create asp.net core project with latest create-react-app

1. create.bat: rename my-app
2. run create.bat
3. ClientApp\components\NavMenu.tsx: Component => Component<{}, { collapsed: boolean }>, constructor(props) -> constructor(props:any)
4. ClientApp\public\index.html: add &lt;base href='%PUBLIC_URL%/' /&gt;

        Install-Package NitroBolt.Functional
        Install-Package NitroBolt.Immutable
        Install-Package Serilog
        Install-Package Serilog.Sinks.File
        Install-Package NSwag.AspNetCore

        npm i ts-optchain
        npm i axios
        npm i react-table @types/react-table

        NavMenu.tsx: <Container> => <Container fluid>
        Layout.js: <Container> => <Container fluid>
        
        npm i moment 
        npm i react-leaflet @types/react-leaflet
        npm i victory @types/victory
        npm i @fortawesome/react-fontawesome @fortawesome/free-solid-svg-icons @fortawesome/free-regular-svg-icons

ts-optchain:

        // tsconfig.json
        {
            "compilerOptions": {
                "plugins": [
                    { "transform": "ts-optchain/transform" },
                ]
            },
        }
