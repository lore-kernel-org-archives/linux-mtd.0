Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWpB-0000DF-02
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:05:17 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 Aleksei Mamlin <mamlinav@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/17] mtd: nand: Do not expose the NAND manufacturer table
 directly
Date: Mon,  9 Jan 2017 11:04:14 +0100
Message-Id: <1483956264-3335-8-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no reason to expose the NAND manufacturer table. Provide an
helper function to find manufacturers by their ids.

We also turn the nand_manufacturers table into a const array, since its
members are not modified after the initial assignment.

Finally, we remove the sentinel manufacturer entry from the manufacturers
table (we already have the array size information given by ARRAY_SIZE()),
and add the nand_manufacturer_name() helper to handle the "Unknown" case
properly.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 23 +++++++++++------------
 drivers/mtd/nand/nand_ids.c  | 22 ++++++++++++++++++++--
 include/linux/mtd/nand.h     |  9 ++++++++-
 3 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index efb3ade568d8..e21fd3f3e08f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4012,9 +4012,10 @@ static bool find_full_id_nand(struct nand_chip *chip,
  */
 static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 {
+	const struct nand_manufacturer *manufacturer;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
-	int i, maf_idx;
+	int i;
 	u8 *id_data = chip->id.data;
 	u8 maf_id, dev_id;
 
@@ -4119,10 +4120,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 ident_done:
 
 	/* Try to identify manufacturer */
-	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
-		if (nand_manuf_ids[maf_idx].id == maf_id)
-			break;
-	}
+	manufacturer = nand_get_manufacturer(maf_id);
 
 	if (chip->options & NAND_BUSWIDTH_AUTO) {
 		WARN_ON(busw & NAND_BUSWIDTH_16);
@@ -4134,7 +4132,8 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 		 */
 		pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 			maf_id, dev_id);
-		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name, mtd->name);
+		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
+			mtd->name);
 		pr_warn("bus width %d instead of %d bits\n", busw ? 16 : 8,
 			(chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
 		return -EINVAL;
@@ -4167,14 +4166,14 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 		maf_id, dev_id);
 
 	if (chip->onfi_version)
-		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
-				chip->onfi_params.model);
+		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
+			chip->onfi_params.model);
 	else if (chip->jedec_version)
-		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
-				chip->jedec_params.model);
+		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
+			chip->jedec_params.model);
 	else
-		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
-				type->name);
+		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
+			type->name);
 
 	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 77a55ed0502b..0c5589bb4624 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -169,7 +169,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 };
 
 /* Manufacturer IDs */
-struct nand_manufacturer nand_manuf_ids[] = {
+static const struct nand_manufacturer nand_manufacturers[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba"},
 	{NAND_MFR_ESMT, "ESMT"},
 	{NAND_MFR_SAMSUNG, "Samsung"},
@@ -185,5 +185,23 @@ struct nand_manufacturer nand_manuf_ids[] = {
 	{NAND_MFR_SANDISK, "SanDisk"},
 	{NAND_MFR_INTEL, "Intel"},
 	{NAND_MFR_ATO, "ATO"},
-	{0x0, "Unknown"}
 };
+
+/**
+ * nand_get_manufacturer - Get manufacturer information from the manufacturer
+ *			   ID
+ * @id: manufacturer ID
+ *
+ * Returns a pointer a nand_manufacturer object if the manufacturer is defined
+ * in the NAND manufacturers database, NULL otherwise.
+ */
+const struct nand_manufacturer *nand_get_manufacturer(u8 id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(nand_manufacturers); i++)
+		if (nand_manufacturers[i].id == id)
+			return &nand_manufacturers[i];
+
+	return NULL;
+}
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 4673069d1b92..6d13c5917b71 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1064,8 +1064,15 @@ struct nand_manufacturer {
 	char *name;
 };
 
+const struct nand_manufacturer *nand_get_manufacturer(u8 id);
+
+static inline const char *
+nand_manufacturer_name(const struct nand_manufacturer *manufacturer)
+{
+	return manufacturer ? manufacturer->name : "Unknown";
+}
+
 extern struct nand_flash_dev nand_flash_ids[];
-extern struct nand_manufacturer nand_manuf_ids[];
 
 int nand_default_bbt(struct mtd_info *mtd);
 int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-- 
2.7.4
