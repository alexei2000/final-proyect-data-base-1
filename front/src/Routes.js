import { Switch, Route } from "react-router-dom";
import React from "react";

const Forms = React.lazy(() => import("pages/Forms"));
const Reports = React.lazy(() => import("pages/Reports"));

const Routes = () => {
  return (
    <Switch>
      <Route exact path="/">
        <Forms />
      </Route>
      <Route path="/forms">
        <Forms />
      </Route>
      <Route path="/reports">
        <Reports />
      </Route>
    </Switch>
  );
};

export default Routes;
