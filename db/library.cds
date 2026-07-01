namespace CAP.Library;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Books : cuid, managed {
    title  : String;
    author : Association to Authors; // Managed association
};

entity Authors : cuid, managed {
    name  : String;
    books : Composition of many Books
                on books.author = $self; // Composition with a managed association
};
