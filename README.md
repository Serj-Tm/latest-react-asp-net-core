# Create asp.net core project with latest create-react-app

Usage:

1. run: create.bat <Csharp.Project.Name> <react-app-name>
2. change manually:
    1. ClientApp\components\NavMenu.tsx: Component => Component<{}, { collapsed: boolean }>, constructor(props) -> constructor(props:any)
    2. ClientApp\public\index.html: add &lt;base href='%PUBLIC_URL%/' /&gt;

Additional actions:

        Install-Package NitroBolt.Functional
        Install-Package System.Collections.Immutable
        Install-Package NitroBolt.Immutable
        Install-Package Serilog
        Install-Package Serilog.Sinks.File
        Install-Package NSwag.AspNetCore
        
        Install-Package Microsoft.AspNetCore.Mvc.NewtonsoftJson

        npm i axios
        npm i react-table @types/react-table

        npm i antd

        NavMenu.tsx: <Container> => <Container fluid>
        Layout.js: <Container> => <Container fluid>
        
        npm i moment 
        npm i react-leaflet @types/react-leaflet
        npm i victory @types/victory
        npm i @fortawesome/react-fontawesome @fortawesome/free-solid-svg-icons @fortawesome/free-regular-svg-icons
        
[AntD][Antd]:

      //App.cs:      
      @import '~antd/dist/antd.css';

[NSwag][1]:

        public void ConfigureServices(IServiceCollection services)
        {
            ..
            services.AddSwaggerDocument();
        }
        public void Configure(IApplicationBuilder app)
        {
            ..
            app.UseOpenApi();
            app.UseSwaggerUi3();
            .. 
            
            app.UseMvc();
        }

[Newtonsoft.Json with Asp.Net core 3][3]:
    
        services.AddControllers()
            .AddNewtonsoftJson();

Bootstrap themes
- Themes - https://bootswatch.com/
- Theme builder - https://bootstrap.build/

[1]: https://docs.microsoft.com/en-us/aspnet/core/tutorials/getting-started-with-nswag?view=aspnetcore-3.0&tabs=visual-studio
[3]: https://docs.microsoft.com/en-us/aspnet/core/migration/22-to-30?view=aspnetcore-3.0&tabs=visual-studio#jsonnet-support
[AntD]: https://ant.design/docs/react/recommendation
