namespace CAP.Library;

using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';

entity Books : cuid, managed {
    title  : String @Mockdata: {hacker: 'phrase'};
    author : Association to Authors; // Managed association
    chapters : Composition of many Chapters
                on chapters.book = $self; // Composition with a managed association
};

entity Authors : cuid, managed {
    name  : String @Mockdata: {person: 'fullName'};
    books : Composition of many Books
                on books.author = $self; // Composition with a managed association
};

entity Chapters : cuid, managed {
    book   : Association to Books;
    number : Integer;
    title      : String;
    pages      : Integer;
};