# SQL vs NoSQL - one paragraph each, when to use each

SQL is an abbreviation for Structured Query Language.
It consist of rows and columns like spreadsheet.
It can be used when data are well structured. example is SQL server
SQL is use majorly for financial transactions

NoSQL is a key value pair data. It has a flexible table
Eg DynamoDB
It is use for logs, metrics, incident records etc


## ACID - what it stands for and why it matters for Paydirect

Atomicity - It either completes transaction or fails
Consistency - It is either the transaction is valid or fails
Isolation - It does not interfere in another transaction
Durability - means once a transaction is committed, it survives crash.

## Indexing — what it is and the trade-off

Indexing is used when searching for data. It makes the search faster when it is set.

Trade-off is indexes speed up reads but slow down writes

## Replication — what it is and why it matters

Replication is having a copy of primary data and is efficient incase there is a disaster
Primary handles writes while replicas handles reads
If primary crashes with no replica, all processes stops