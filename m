Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYSB-0004CV-NF
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:41:34 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 11/12] mtd: nand: rename the id filed of 'struct
 nand_flash_dev'
Date: Mon,  4 Mar 2013 18:42:28 +0200
Message-Id: <1362415349-7107-12-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The 'id' is a bit confusing name because NAND IDs are multi-byte. Re-name
it to 'dev_id' to make it clear that this is the "device ID" part (the second
byte).

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/doc2000.c     |    2 +-
 drivers/mtd/devices/doc2001.c     |    2 +-
 drivers/mtd/devices/doc2001plus.c |    2 +-
 drivers/mtd/nand/nand_base.c      |    2 +-
 drivers/mtd/nand/nandsim.c        |    6 +++---
 drivers/mtd/nand/pxa3xx_nand.c    |    2 +-
 include/linux/mtd/nand.h          |   14 +++++++-------
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index a4eb8b5..363ec3c 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -379,7 +379,7 @@ static int DoC_IdentChip(struct DiskOnChip *doc, int floor, int chip)
 
 	/* Print and store the manufacturer and ID codes. */
 	for (i = 0; nand_flash_ids[i].name != NULL; i++) {
-		if (id == nand_flash_ids[i].id) {
+		if (id == nand_flash_ids[i].dev_id) {
 			/* Try to identify manufacturer */
 			for (j = 0; nand_manuf_ids[j].id != 0x0; j++) {
 				if (nand_manuf_ids[j].id == mfr)
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index f692795..00644bb 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -206,7 +206,7 @@ static int DoC_IdentChip(struct DiskOnChip *doc, int floor, int chip)
 
 	/* FIXME: to deal with multi-flash on multi-Millennium case more carefully */
 	for (i = 0; nand_flash_ids[i].name != NULL; i++) {
-		if ( id == nand_flash_ids[i].id) {
+		if ( id == nand_flash_ids[i].dev_id) {
 			/* Try to identify manufacturer */
 			for (j = 0; nand_manuf_ids[j].id != 0x0; j++) {
 				if (nand_manuf_ids[j].id == mfr)
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 4f2220a..1b0c12f 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -314,7 +314,7 @@ static int DoC_IdentChip(struct DiskOnChip *doc, int floor, int chip)
 		return 0;
 
 	for (i = 0; nand_flash_ids[i].name != NULL; i++) {
-		if (id == nand_flash_ids[i].id) {
+		if (id == nand_flash_ids[i].dev_id) {
 			/* Try to identify manufacturer */
 			for (j = 0; nand_manuf_ids[j].id != 0x0; j++) {
 				if (nand_manuf_ids[j].id == mfr)
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e607565..8dacd1e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3128,7 +3128,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		type = nand_flash_ids;
 
 	for (; type->name != NULL; type++)
-		if (*dev_id == type->id)
+		if (*dev_id == type->dev_id)
 			break;
 
 	chip->onfi_version = 0;
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 7199acc..eb1238f 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -766,9 +766,9 @@ static int init_nandsim(struct mtd_info *mtd)
 	}
 
 	/* Detect how many ID bytes the NAND chip outputs */
-        for (i = 0; nand_flash_ids[i].name != NULL; i++) {
-                if (second_id_byte != nand_flash_ids[i].id)
-                        continue;
+	for (i = 0; nand_flash_ids[i].name != NULL; i++) {
+		if (second_id_byte != nand_flash_ids[i].dev_id)
+			continue;
 	}
 
 	if (ns->busw == 16)
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 37ee75c..dec80ca 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -989,7 +989,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	}
 
 	pxa3xx_flash_ids[0].name = f->name;
-	pxa3xx_flash_ids[0].id = (f->chip_id >> 8) & 0xffff;
+	pxa3xx_flash_ids[0].dev_id = (f->chip_id >> 8) & 0xffff;
 	pxa3xx_flash_ids[0].pagesize = f->page_size;
 	chipsize = (uint64_t)f->num_blocks * f->page_per_block * f->page_size;
 	pxa3xx_flash_ids[0].chipsize = chipsize >> 20;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index f7f198e..7af6600 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -543,23 +543,23 @@ struct nand_chip {
  * A helper for defining older chips which did not have page size and
  * eraseblock size encoded in the chip ID bytes.
  */
-#define TABLE_NAND(nm, devid, pagesz, chipsz, erasesz, opts) \
-	{ .name = (nm), .id = (devid), .pagesize = (pagesz), \
-	  .chipsize = (chipsz), .erasesize = (erasesz),      \
+#define TABLE_NAND(nm, devid, pagesz, chipsz, erasesz, opts)     \
+	{ .name = (nm), .dev_id = (devid), .pagesize = (pagesz), \
+	  .chipsize = (chipsz), .erasesize = (erasesz),          \
 	  .options = (opts) }
 
 /*
  * A helper for defining newer chips which report their page size and
  * eraseblock size via the extended ID bytes.
  */
-#define EXTENDED_ID_NAND(nm, devid, chipsz, opts)            \
-	{ .name = (nm), .id = (devid), .chipsize = (chipsz), \
+#define EXTENDED_ID_NAND(nm, devid, chipsz, opts)                \
+	{ .name = (nm), .dev_id = (devid), .chipsize = (chipsz), \
 	  .options = (opts) }
 
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
  * @name:	Identify the device type
- * @id:		device ID code
+ * @dev_id:	device ID code
  * @pagesize:	Pagesize in bytes. Either 256 or 512 or 0
  *		If the pagesize is 0, then the real pagesize
  *		and the eraseize are determined from the
@@ -570,7 +570,7 @@ struct nand_chip {
  */
 struct nand_flash_dev {
 	char *name;
-	int id;
+	int dev_id;
 	unsigned long pagesize;
 	unsigned long chipsize;
 	unsigned long erasesize;
-- 
1.7.10.4
