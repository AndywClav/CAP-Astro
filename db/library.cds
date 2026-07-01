namespace CAP.Library;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Books : cuid, managed {
    title  : String @Mockdata: {hacker: 'phrase'};
    author : Association to Authors; // Managed association
};

entity Authors : cuid, managed {
    name  : String @Mockdata: {person: 'fullName'};
    books : Composition of many Books
                on books.author = $self; // Composition with a managed association
};
