#!/bin/bash

# comando adicionado: ./generate.sh flux nomeFluxo metódo /endpoint/assim

if [[ "$1" == "flux" ]]; then

    echo "import express from 'express'
import * as $2 from '../controllers/$2.controller'
import 'dotenv/config'

export const "$2Route" = express()

"$2Route".$3('$4', async (req, res) => {
    try{
        const result = await $2.run('')
        res.status(result.statusCode).json(result)
    }catch(e){
        res.status(500).json(e)
    }
});" > ./source/routes/$2.route.ts

    echo "import * as service from '../services/$2.service'
export async function run(login: string) {
    try {
        const result = await service.run(login);
        return result;
    } catch (e) {
        return {
            message: e,
            statusCode: 500
        }
    }
}" > ./source/controllers/$2.controller.ts

    echo "import * as repository from '../repository/$2.repository'
export async function run(login: string) {
    try {
        return {
            message: '$2 here!',
            statusCode: 200
        }
    } catch (e) {
        return {
            message: e,
            statusCode: 500
        }
    }
}" > ./source/services/$2.service.ts

    echo "
export async function $2(login: string) {
    try {

    } catch (e) {
        return {
            message: e,
            statusCode: 500
        }
    }
}" > ./source/repository/$2.repository.ts
fi