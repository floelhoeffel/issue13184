# issue13184

## Steps

1. `docker compose up -d`
2. create .env file and set connection string
3. `npx prisma migrate dev --create-only`
4. add custom sql for index `CREATE UNIQUE INDEX "Mixture_aromaId_boosterId_baseId_nicotine_key" ON "Mixture"(hash_record_extended(("aromaId", "boosterId", "baseId", "nicotine"), 0));`
5. run ``npx prisma migrate dev` to apply migration
6. migrate wants to create another migration as it doesn't match the generated index with the index in Prisma schema
7. error

```
Error: P3018

A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve

Migration name: 20220701133424_init2

Database error code: 42P07

Database error:
ERROR: relation "Mixture_aromaId_boosterId_baseId_nicotine_key" already exists

DbError { severity: "ERROR", parsed_severity: Some(Error), code: SqlState(E42P07), message: "relation \"Mixture_aromaId_boosterId_baseId_nicotine_key\" already exists", detail: None, hint: None, position: None, where_: None, schema: None, table: None, column: None, datatype: None, constraint: None, file: Some("index.c"), line: Some(869), routine: Some("index_create") }
```
