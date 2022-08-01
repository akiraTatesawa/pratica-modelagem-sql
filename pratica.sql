CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"address" TEXT,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"main_pic_id" int NOT NULL,
	"type_id" int NOT NULL,
	"subtype_id" int NOT NULL,
	"size_id" int NOT NULL,
	"stock" int NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products_pics" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"product_id" int NOT NULL,
	CONSTRAINT "products_pics_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products_type" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "products_type_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products_subtype" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"product_type_id" int NOT NULL,
	CONSTRAINT "products_subtype_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cart_items" (
	"id" serial NOT NULL,
	"product_id" int NOT NULL,
	"user_id" int NOT NULL,
	"quantity" int NOT NULL,
	"status" TEXT NOT NULL,
	"order_address" TEXT NOT NULL,
	CONSTRAINT "cart_items_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("main_pic_id") REFERENCES "products_pics"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("type_id") REFERENCES "products_type"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("subtype_id") REFERENCES "products_subtype"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk3" FOREIGN KEY ("size_id") REFERENCES "sizes"("id");

ALTER TABLE "products_pics" ADD CONSTRAINT "products_pics_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");


ALTER TABLE "products_subtype" ADD CONSTRAINT "products_subtype_fk0" FOREIGN KEY ("product_type_id") REFERENCES "products_type"("id");


ALTER TABLE "cart_items" ADD CONSTRAINT "cart_items_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "cart_items" ADD CONSTRAINT "cart_items_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");







