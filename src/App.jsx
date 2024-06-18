import { Route, createBrowserRouter, createRoutesFromElements, RouterProvider } from 'react-router-dom';
import TestPage from './pages/TestPage';

const router = createBrowserRouter(
  createRoutesFromElements(<Route index element={<TestPage />}/>)
);

const App = () => {
  return (
    <RouterProvider router={router}/>
  )
}

export default App
