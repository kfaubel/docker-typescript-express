//import express from "express";
//import * as express from 'express';
import express, { Express } from "express";
import bodyParser from "body-parser";
 
//const express = require('express');
 
// Constants declaration
const PORT = 8080;
const HOST = '0.0.0.0';
 
// App
const app: Express = express();
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.disable('etag'); // Don't check cache, return a new item each time. Prevents http status 304 errors.

app.get('/', (req: any, res: { send: (arg0: string) => void; }) => {
  res.send('Hello World');
});
 
app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});