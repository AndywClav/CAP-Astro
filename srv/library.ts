import cds from '@sap/cds';
import { Books, Chapters, Authors } from '#cds-models/LibraryService';

export class LibraryService extends cds.ApplicationService {
  init() {
    this.before(['CREATE', 'UPDATE'], Books, async (req) => {
      console.log('Before CREATE/UPDATE Books', req.data);
    });

    this.on('READ', Books, async (req, next) => {
      console.log('On READ Books', req.data);
      return next();
    });

    return super.init();
  }
}
