import { BrowserRouter as Router } from "react-router-dom";
import MainLayout from "layouts/MainLayout";
import Routes from "Routes";

const App = () => {
  return (
    <Router>
      <MainLayout>
        <Routes />
      </MainLayout>
    </Router>
  );
};

export default App;
