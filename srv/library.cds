using CAP.Library as db from '../db/library';

service LibraryService {
    entity Books   as projection on db.Books;
    entity Authors as projection on db.Authors;
}
