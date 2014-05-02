Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wg1hh-0003IB-AU
 for linux-mtd@lists.infradead.org; Fri, 02 May 2014 00:51:53 +0000
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v5] mtd: nand: Add support to use nand_base poi databuf as
 bounce buffer
Date: Thu, 1 May 2014 20:51:19 -0400
Message-ID: <1398991879-2448-1-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_base can be passed a kmap()'d buffers from highmem by
filesystems like jffs2. This results in failure to map the
physical address of the DMA buffer on various contoller
driver on different platforms. This change adds a chip option
to use preallocated databuf as bounce buffers used in
nand_do_read_ops() and nand_do_write_ops().
This allows for specific nand controller driver to set this
option as needed.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---

Changes since v4:
* Made code more readable as per review comments

 drivers/mtd/nand/nand_base.c | 37 +++++++++++++++++++++++++++++++------
 include/linux/mtd/nand.h     |  5 +++++
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9d01c4d..c2142c1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -37,6 +37,7 @@
 #include <linux/err.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/mm.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
@@ -1501,6 +1502,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		mtd->oobavail : mtd->oobsize;
 
 	uint8_t *bufpoi, *oob, *buf;
+	int use_bufpoi;
 	unsigned int max_bitflips = 0;
 	int retry_mode = 0;
 	bool ecc_fail = false;
@@ -1523,9 +1525,20 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
 
+		if (!aligned)
+			use_bufpoi = 1;
+		else if (chip->options & NAND_USE_BOUNCE_BUFFER)
+			use_bufpoi = !virt_addr_valid(buf);
+		else
+			use_bufpoi = 0;
+
 		/* Is the current page in the buffer? */
 		if (realpage != chip->pagebuf || oob) {
-			bufpoi = aligned ? buf : chip->buffers->databuf;
+			bufpoi = use_bufpoi ? chip->buffers->databuf : buf;
+
+			if (use_bufpoi && aligned)
+				pr_debug("%s: using read bounce buffer for buf@%p\n",
+						 __func__, buf);
 
 read_retry:
 			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
@@ -1547,7 +1560,7 @@ read_retry:
 				ret = chip->ecc.read_page(mtd, chip, bufpoi,
 							  oob_required, page);
 			if (ret < 0) {
-				if (!aligned)
+				if (use_bufpoi)
 					/* Invalidate page cache */
 					chip->pagebuf = -1;
 				break;
@@ -1556,7 +1569,7 @@ read_retry:
 			max_bitflips = max_t(unsigned int, max_bitflips, ret);
 
 			/* Transfer not aligned data */
-			if (!aligned) {
+			if (use_bufpoi) {
 				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
 				    !(mtd->ecc_stats.failed - ecc_failures) &&
 				    (ops->mode != MTD_OPS_RAW)) {
@@ -2376,11 +2389,23 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		int bytes = mtd->writesize;
 		int cached = writelen > bytes && page != blockmask;
 		uint8_t *wbuf = buf;
+		int use_bufpoi;
+		int part_pagewr = (column || writelen < (mtd->writesize - 1));
+
+		if (part_pagewr)
+			use_bufpoi = 1;
+		else if (chip->options & NAND_USE_BOUNCE_BUFFER)
+			use_bufpoi = !virt_addr_valid(buf);
+		else
+			use_bufpoi = 0;
 
-		/* Partial page write? */
-		if (unlikely(column || writelen < (mtd->writesize - 1))) {
+		/* Partial page write?, or need to use bounce buffer */
+		if (use_bufpoi) {
+			pr_debug("%s: using write bounce buffer for buf@%p\n",
+					 __func__, buf);
 			cached = 0;
-			bytes = min_t(int, bytes - column, (int) writelen);
+			if (part_pagewr)
+				bytes = min_t(int, bytes - column, writelen);
 			chip->pagebuf = -1;
 			memset(chip->buffers->databuf, 0xff, mtd->writesize);
 			memcpy(&chip->buffers->databuf[column], buf, bytes);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 450d61e..bdedc79 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -176,6 +176,11 @@ typedef enum {
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	0x00040000
 /*
+ * This option could be defined by controller drivers to protect against
+ * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
+ */
+#define NAND_USE_BOUNCE_BUFFER	0x00080000
+/*
  * Autodetect nand buswidth with readid/onfi.
  * This suppose the driver will configure the hardware in 8 bits mode
  * when calling nand_scan_ident, and update its configuration
-- 
1.9.2
