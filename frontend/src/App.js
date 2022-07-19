import React from "react";
import logo from "./logo.svg";
import "./App.css";

function App() {
  const [data, setData] = React.useState(null);


  // TODO: the form should execute asychronously (maybe using AJAX)
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />

        <form method="post" action="http://localhost:3001/register" enctype="application/x-www-form-urlencoded">
          Username: <input name="username" />
          Password: <input name="password" />
          <input type="submit" />
        </form>


        <br />
        <form method="get" action="http://localhost:3001/testWorks" enctype="application/x-www-form-urlencoded">
          <input name="testWorksButton" type="submit" value="Test Works"/>
        </form>
      </header>
    </div>
  );
}

export default App;