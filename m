Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wd5Tl-0006tH-Vd
 for linux-mtd@lists.infradead.org; Wed, 23 Apr 2014 22:17:22 +0000
Received: by mail-vc0-f177.google.com with SMTP id if17so1953428vcb.22
 for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2014 15:17:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1398286150-1590-1-git-send-email-kdasu.kdev@gmail.com>
References: <1398286150-1590-1-git-send-email-kdasu.kdev@gmail.com>
Date: Wed, 23 Apr 2014 18:16:59 -0400
Message-ID: <CAC=U0a0kPTn_Tuc33WYyEMeimrynmpHPaD47qcTyihnxCuh8zg@mail.gmail.com>
Subject: Fwd: [PATCH] mtd: nand: Add support to use nand_base poi databuf as
 bounce buffer
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
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
 drivers/mtd/nand/nand_base.c | 27 +++++++++++++++++++++------
 include/linux/mtd/nand.h     |  5 +++++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9d01c4d..37d7315 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1501,6 +1501,7 @@ static int nand_do_read_ops(struct mtd_info
*mtd, loff_t from,
                mtd->oobavail : mtd->oobsize;

        uint8_t *bufpoi, *oob, *buf;
+       int use_bufpoi;
        unsigned int max_bitflips = 0;
        int retry_mode = 0;
        bool ecc_fail = false;
@@ -1522,10 +1523,16 @@ static int nand_do_read_ops(struct mtd_info
*mtd, loff_t from,

                bytes = min(mtd->writesize - col, readlen);
                aligned = (bytes == mtd->writesize);
+               use_bufpoi = (chip->options & NAND_USE_BOUNCE_BUFFER) ?
+                               !virt_addr_valid(buf) : 0;

                /* Is the current page in the buffer? */
                if (realpage != chip->pagebuf || oob) {
-                       bufpoi = aligned ? buf : chip->buffers->databuf;
+                       bufpoi = (aligned && !use_bufpoi) ? buf :
+                               chip->buffers->databuf;
+
+                       if (use_bufpoi && aligned)
+                               pr_debug("%s: using bounce buffer\n", __func__);

 read_retry:
                        chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
@@ -1547,7 +1554,7 @@ read_retry:
                                ret = chip->ecc.read_page(mtd, chip, bufpoi,
                                                          oob_required, page);
                        if (ret < 0) {
-                               if (!aligned)
+                               if (!aligned || use_bufpoi)
                                        /* Invalidate page cache */
                                        chip->pagebuf = -1;
                                break;
@@ -1556,7 +1563,7 @@ read_retry:
                        max_bitflips = max_t(unsigned int, max_bitflips, ret);

                        /* Transfer not aligned data */
-                       if (!aligned) {
+                       if (!aligned || use_bufpoi) {
                                if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
                                    !(mtd->ecc_stats.failed - ecc_failures) &&
                                    (ops->mode != MTD_OPS_RAW)) {
@@ -2376,11 +2383,19 @@ static int nand_do_write_ops(struct mtd_info
*mtd, loff_t to,
                int bytes = mtd->writesize;
                int cached = writelen > bytes && page != blockmask;
                uint8_t *wbuf = buf;
-
-               /* Partial page write? */
-               if (unlikely(column || writelen < (mtd->writesize - 1))) {
+               int use_bufpoi = (chip->options & NAND_USE_BOUNCE_BUFFER ?
+                                 !virt_addr_valid(buf) : 0);
+               int part_pagewr = unlikely(column ||
+                                          writelen < (mtd->writesize - 1));
+
+               /* Partial page write?, or need to use bounce buffer */
+               if (part_pagewr || use_bufpoi) {
+                       pr_debug("%s: using write bounce buffer\n", __func__);
                        cached = 0;
                        bytes = min_t(int, bytes - column, (int) writelen);
+                       if (part_pagewr)
+                               bytes = min_t(int,
+                                             bytes - column, (int) writelen);
                        chip->pagebuf = -1;
                        memset(chip->buffers->databuf, 0xff, mtd->writesize);
                        memcpy(&chip->buffers->databuf[column], buf, bytes);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 450d61e..bb3e064 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -176,6 +176,11 @@ typedef enum {
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV 0x00040000
 /*
+ * This option is defined to protect against kmapped buffers
+ * being passed from highmem when using DMA
+ */
+#define NAND_USE_BOUNCE_BUFFER 0x00080000
+/*
  * Autodetect nand buswidth with readid/onfi.
  * This suppose the driver will configure the hardware in 8 bits mode
  * when calling nand_scan_ident, and update its configuration
--
1.9.2
