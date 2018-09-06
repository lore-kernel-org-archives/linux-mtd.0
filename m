Received: from mout.perfora.net ([74.208.4.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy1rb-0007lD-SW
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 21:30:57 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH v2 1/2] mtd: rawnand: reorder NAND manufacturer IDs
Date: Thu,  6 Sep 2018 23:30:19 +0200
Message-Id: <20180906213020.7493-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder NAND manufacturer IDs for clarity.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Subject prefix s/nand:/rawnand:/ as well as upper-case: s/nand/NAND/
  and s/id/ID/ in the commit log as suggested by Miquèl.
- Reordering the macro definitions too as suggested by Boris.

 drivers/mtd/nand/raw/nand_ids.c | 20 ++++++++++----------
 include/linux/mtd/rawnand.h     | 28 ++++++++++++++--------------
 2 files changed, 24 insertions(+), 24 deletions(-)

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
index efb2345359bb..20516fc28b74 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1422,21 +1422,21 @@ static inline void *nand_get_manufacturer_data(struct nand_chip *chip)
 /*
  * NAND Flash Manufacturer ID Codes
  */
-#define NAND_MFR_TOSHIBA	0x98
+#define NAND_MFR_AMD		0x01
+#define NAND_MFR_ATO		0x9b
+#define NAND_MFR_EON		0x92
 #define NAND_MFR_ESMT		0xc8
-#define NAND_MFR_SAMSUNG	0xec
 #define NAND_MFR_FUJITSU	0x04
-#define NAND_MFR_NATIONAL	0x8f
-#define NAND_MFR_RENESAS	0x07
-#define NAND_MFR_STMICRO	0x20
 #define NAND_MFR_HYNIX		0xad
-#define NAND_MFR_MICRON		0x2c
-#define NAND_MFR_AMD		0x01
+#define NAND_MFR_INTEL		0x89
 #define NAND_MFR_MACRONIX	0xc2
-#define NAND_MFR_EON		0x92
+#define NAND_MFR_MICRON		0x2c
+#define NAND_MFR_NATIONAL	0x8f
+#define NAND_MFR_RENESAS	0x07
+#define NAND_MFR_SAMSUNG	0xec
 #define NAND_MFR_SANDISK	0x45
-#define NAND_MFR_INTEL		0x89
-#define NAND_MFR_ATO		0x9b
+#define NAND_MFR_STMICRO	0x20
+#define NAND_MFR_TOSHIBA	0x98
 #define NAND_MFR_WINBOND	0xef
 
 
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
