#!/bin/bash

cd ..
mkdir "ms-$1-default"
cd "ms-$1-default"
mkdir "source"
npm init -y
cd "source"
mkdir constants controllers services errors routes validations
cd ..
npm install -D typescript nodemon
npm i express zod @prisma/client @types/express bcryptjs @types/bcryptjs dotenv prisma uuid 

echo "import express from 'express';
import 'dotenv/config'
import routes from './source/routes/routes';

const app = express();
app.use(express.json());
app.use(routes());

app.listen(process.env.PORT, ()=>{console.log('Server is on in port '+process.env.PORT)})" >> server.ts
cd /home/ryladant/boilerplate/microservico/ms-generate-default/
cp ./tsconfig.json ../"ms-$1-default"/
cp -r ./default_files/routes/ ../"ms-$1-default"/source/

