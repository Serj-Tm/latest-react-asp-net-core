import React from 'react';
import { Link } from 'react-router-dom';


export function NavMenu() {
  return (
    <div>
      <Link to="/">Home</Link>
      <Link to="/counter">Counter</Link>
      <Link to="/fetch-data">Fetch data</Link>
    </div>
    );
}