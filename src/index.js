import { Elm } from './Main.elm';
import './index.scss';
import * as M from '../node_modules/materialize-css/dist/js/materialize';

M.AutoInit();

Elm.Main.init({
  node: document.querySelector('main'),
});
