CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "address" TEXT
);

CREATE TABLE "products_pics" (
    "id" SERIAL PRIMARY KEY,
    "url" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL
);

CREATE TABLE "products_types" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "products_subtype" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "product_type_id" INTEGER NOT NULL REFERENCES "products_types"(id)
);

CREATE TABLE "sizes" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "products" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "main_pic_id" INTEGER NOT NULL REFERENCES "products_pics"(id),
    "type_id" INTEGER NOT NULL REFERENCES "products_types"(id),
    "subtype_id" INTEGER NOT NULL REFERENCES "products_subtype"(id),
    "size_id" INTEGER NOT NULL REFERENCES "sizes"(id),
    "stock" INTEGER NOT NULL
);

CREATE TYPE SALE_STATUS AS ENUM ('created', 'paid', 'finished', 'canceled');

CREATE TABLE "order_items" (
    "id" SERIAL PRIMARY KEY,
    "product_id" INTEGER NOT NULL REFERENCES "products"(id),
    "user_id" INTEGER NOT NULL REFERENCES "users"(id),
    "quantity" INTEGER NOT NULL,
    "status" SALE_STATUS NOT NULL,
    "order_address" TEXT NOT NULL,
    "creation_date" TIMESTAMP NOT NULL DEFAULT NOW(),
    "finished_date" TIMESTAMP
);

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("main_pic_id") REFERENCES "products_pics"("id");

ALTER TABLE "products_pics" ADD CONSTRAINT "products_pics_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");







