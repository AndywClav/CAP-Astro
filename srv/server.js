import cds from '@sap/cds';
import express from 'express';
import path from 'path';

cds.on('bootstrap', (app) => {
  const frontendPath = path.join(process.cwd(), 'app/library-ui/dist');

  app.get(['/index.html', '/library-ui/dist/index.html'], (_, res) => {
    res.status(404).send('Not Found');
  });

  app.use(express.static(frontendPath));

  app.get('/', (_req, res) => {
    res.sendFile(path.join(frontendPath, 'index.html'));
  });
});

export default cds.server;
