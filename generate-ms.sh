#!/bin/bash

cd ..
mkdir "ms-$1-default"
cd "ms-$1-default"
mkdir "source"
echo "
    node_modules
    dist
    .env
    package-lock.json
" > .gitignore
npm init -y
cd "source"
mkdir constants controllers services errors routes validations interfaces responses repository
cd ..

echo "import express from 'express';
import 'dotenv/config'
import { routes } from './source/routes/routes';

const app = express();
app.use(express.json());
app.use(routes());

app.listen(process.env.PORT, ()=>{console.log('Server is on in port '+process.env.PORT)})" >> server.ts
cd /home/ryladant/boilerplate/microservico/ms-generate-default/
cp ./tsconfig.json ../"ms-$1-default"/
cp ./.env ../"ms-$1-default"/
cp -r ./default_files/routes/ ../"ms-$1-default"/source/
cp ./package.json ../"ms-$1-default"/
cp ./generate.sh ../"ms-$1-default"/
cd /home/ryladant/boilerplate/microservico/ms-$1-default/
cd source
npm install
npx tsc
git init

