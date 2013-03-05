Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCrj6-0006vW-BM
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:16:20 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/11] mtd: nand: rename the id field of 'struct
 nand_flash_dev'
Date: Tue,  5 Mar 2013 15:17:23 +0200
Message-Id: <1362489444-27762-11-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
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

While on it, clean-up the commentary for 'struct nand_flash_dev'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/doc2000.c     |    2 +-
 drivers/mtd/devices/doc2001.c     |    2 +-
 drivers/mtd/devices/doc2001plus.c |    2 +-
 drivers/mtd/nand/nand_base.c      |    2 +-
 drivers/mtd/nand/nandsim.c        |    6 +++---
 drivers/mtd/nand/pxa3xx_nand.c    |    2 +-
 include/linux/mtd/nand.h          |   19 +++++++++----------
 7 files changed, 17 insertions(+), 18 deletions(-)

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
index a79cd82..a8ea8ac 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3126,7 +3126,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
index 59dee20..1178ce3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -541,19 +541,18 @@ struct nand_chip {
 
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
- * @name:	Identify the device type
- * @id:		device ID code
- * @pagesize:	Pagesize in bytes. Either 256 or 512 or 0
- *		If the pagesize is 0, then the real pagesize
- *		and the eraseize are determined from the
- *		extended id bytes in the chip
- * @erasesize:	Size of an erase block in the flash device.
- * @chipsize:	Total chipsize in Mega Bytes
- * @options:	Bitfield to store chip relevant options
+ * @name: a human-readable name of the NAND chip
+ * @dev_id: the device ID (the second byte of the full chip ID array)
+ * @pagesize: size of the NAND page in bytes; if 0, then the real page size (as
+ *            well as the eraseblock size) is determined from the extended NAND
+ *            chip ID array)
+ * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
+ * @chipsize: total chip size in MiB
+ * @options: stores various chip bit options
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
