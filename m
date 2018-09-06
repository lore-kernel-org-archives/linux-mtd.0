Received: from mout.perfora.net ([74.208.4.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxpzE-0004f5-4o
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 08:50:01 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 1/2] mtd: nand: reorder nand manufacturer ids
Date: Thu,  6 Sep 2018 10:49:21 +0200
Message-Id: <20180906084922.14845-1-marcel@ziswiler.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder NAND manufacturer ids for clarity.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 drivers/mtd/nand/raw/nand_ids.c | 20 ++++++++++----------
 include/linux/mtd/rawnand.h     |  8 ++++----
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 5423c3bb388e..0851cd86bf19 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -169,21 +169,21 @@ struct nand_flash_dev nand_flash_ids[] = {
 
 /* Manufacturer IDs */
 static const struct nand_manufacturer nand_manufacturers[] = {
-	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
+	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
+	{NAND_MFR_ATO, "ATO"},
+	{NAND_MFR_EON, "Eon"},
 	{NAND_MFR_ESMT, "ESMT"},
-	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
 	{NAND_MFR_FUJITSU, "Fujitsu"},
-	{NAND_MFR_NATIONAL, "National"},
-	{NAND_MFR_RENESAS, "Renesas"},
-	{NAND_MFR_STMICRO, "ST Micro"},
 	{NAND_MFR_HYNIX, "Hynix", &hynix_nand_manuf_ops},
-	{NAND_MFR_MICRON, "Micron", &micron_nand_manuf_ops},
-	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
+	{NAND_MFR_INTEL, "Intel"},
 	{NAND_MFR_MACRONIX, "Macronix", &macronix_nand_manuf_ops},
-	{NAND_MFR_EON, "Eon"},
+	{NAND_MFR_MICRON, "Micron", &micron_nand_manuf_ops},
+	{NAND_MFR_NATIONAL, "National"},
+	{NAND_MFR_RENESAS, "Renesas"},
+	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
 	{NAND_MFR_SANDISK, "SanDisk"},
-	{NAND_MFR_INTEL, "Intel"},
-	{NAND_MFR_ATO, "ATO"},
+	{NAND_MFR_STMICRO, "ST Micro"},
+	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
 	{NAND_MFR_WINBOND, "Winbond"},
 };
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index efb2345359bb..ca134851d211 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1541,12 +1541,12 @@ nand_manufacturer_name(const struct nand_manufacturer *manufacturer)
 
 extern struct nand_flash_dev nand_flash_ids[];
 
-extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
-extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
-extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
-extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
+extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
+extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
+extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
+extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 
 int nand_create_bbt(struct nand_chip *chip);
 int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-- 
2.14.4
