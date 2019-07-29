# Create asp.net core project with latest create-react-app

1. create.bat: rename my-app
2. run create.bat
3. ClientApp\src\index.js: replace serviceWorker  
    import * as serviceWorker from './serviceWorker';  
    // If you want your app to work offline and load faster, you can change unregister() to register() below. Note this comes with some pitfalls.  
    // Learn more about service workers: http://bit.ly/CRA-PWA  
  serviceWorker.unregister();  
4. ClientApp\components\NavMenu.tsx: Component => Component<{}, { collapsed: boolean }>, constructor(props) -> constructor(props:any)
5. ClientApp\public\index.html: add &lt;base href='%PUBLIC_URL%/' /&gt;
 
