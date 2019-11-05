# Create asp.net core project with latest create-react-app

Usage:

1. run: create.bat <Csharp.Project.Name> <react-app-name>
2. change manually:
    1. ClientApp\components\NavMenu.tsx: Component => Component<{}, { collapsed: boolean }>, constructor(props) -> constructor(props:any)
    2. ClientApp\public\index.html: add &lt;base href='%PUBLIC_URL%/' /&gt;

Additional actions:

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

[ts-optchain][1]:

        // tsconfig.json
        {
            "compilerOptions": {
                "plugins": [
                    { "transform": "ts-optchain/transform" },
                ]
            },
        }

[1]: https://github.com/rimeto/ts-optchain
