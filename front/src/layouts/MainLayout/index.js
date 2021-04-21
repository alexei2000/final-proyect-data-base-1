import React, { Suspense } from "react";
import LinearProgress from "@material-ui/core/LinearProgress";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import Button from "@material-ui/core/Button";
import styles from "./MainLayout.module.css";
import { Link } from "react-router-dom";

const MainLayout = ({ children }) => {
  return (
    <Suspense fallback={<LinearProgress />}>
      <AppBar position="static">
        <Toolbar className={styles.topbar}>
          <Typography variant="h5">Farmacia</Typography>
          <div>
            <Link to="/forms">
              <Button color="inherit">Formularios</Button>
            </Link>

            <Link to="/reports">
              <Button color="inherit">Reportes</Button>
            </Link>
          </div>
        </Toolbar>
      </AppBar>
      {children}
    </Suspense>
  );
};

export default MainLayout;
