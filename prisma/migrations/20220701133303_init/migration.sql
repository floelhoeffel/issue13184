-- CreateTable
CREATE TABLE "Mixture" (
    "id" TEXT NOT NULL,
    "volume" DECIMAL(10,2) NOT NULL,
    "content" DECIMAL(10,2) NOT NULL,
    "available" DECIMAL(10,2) NOT NULL,
    "diff" DECIMAL(10,2) NOT NULL,
    "nicotine" DECIMAL(10,2) NOT NULL,
    "nicotineToRound" INTEGER NOT NULL,
    "vg" DECIMAL(10,2) NOT NULL,
    "pg" DECIMAL(10,2) NOT NULL,
    "vgToMl" DECIMAL(10,2) NOT NULL,
    "vgToRound" INTEGER NOT NULL,
    "pgToMl" DECIMAL(10,2) NOT NULL,
    "pgToRound" INTEGER NOT NULL,
    "aromaId" TEXT NOT NULL,
    "boosterId" TEXT,
    "boosterCount" INTEGER NOT NULL,
    "baseId" TEXT,
    "baseMl" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "Mixture_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Mixture_aromaId_boosterId_baseId_nicotine_key" ON "Mixture"(hash_record_extended(("aromaId", "boosterId", "baseId", "nicotine"), 0));
