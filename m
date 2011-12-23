Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9Za-0005Er-00
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:27 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/28] mtd: introduce mtd_erase interface
Date: Fri, 23 Dec 2011 20:10:55 +0200
Message-Id: <1324663880-22477-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch is part of a patch-set which changes the MTD interface
from 'mtd->func()' form to 'mtd_func()' form. We need this because
we want to add common code to to all drivers in the mtd core level,
which is impossible with the current interface when MTD clients
call driver functions like 'read()' or 'write()' directly.

At this point we just introduce a new inline wrapper function, but
later some of them are expected to gain more code. E.g., the input
parameters check should be moved to the wrappers rather than be
duplicated at many drivers.

This particular patch introduced the 'mtd_erase()' interface. The
following patches add all the other interfaces one by one.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ftl.c                   |    2 +-
 drivers/mtd/inftlmount.c            |    4 ++--
 drivers/mtd/mtdblock.c              |    2 +-
 drivers/mtd/mtdchar.c               |    2 +-
 drivers/mtd/mtdconcat.c             |    2 +-
 drivers/mtd/mtdoops.c               |    2 +-
 drivers/mtd/mtdpart.c               |    2 +-
 drivers/mtd/mtdswap.c               |    2 +-
 drivers/mtd/nftlmount.c             |    2 +-
 drivers/mtd/rfd_ftl.c               |    2 +-
 drivers/mtd/sm_ftl.c                |    2 +-
 drivers/mtd/tests/mtd_oobtest.c     |    2 +-
 drivers/mtd/tests/mtd_pagetest.c    |    2 +-
 drivers/mtd/tests/mtd_speedtest.c   |    4 ++--
 drivers/mtd/tests/mtd_stresstest.c  |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c |    2 +-
 drivers/mtd/tests/mtd_torturetest.c |    2 +-
 drivers/mtd/ubi/io.c                |    2 +-
 drivers/staging/spectra/lld_mtd.c   |    2 +-
 fs/jffs2/erase.c                    |    2 +-
 fs/logfs/dev_mtd.c                  |    2 +-
 include/linux/mtd/mtd.h             |   19 ++++++++++++++-----
 22 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index c7382bb..a982889 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -355,7 +355,7 @@ static int erase_xfer(partition_t *part,
     erase->len = 1 << part->header.EraseUnitSize;
     erase->priv = (u_long)part;
 
-    ret = part->mbd.mtd->erase(part->mbd.mtd, erase);
+    ret = mtd_erase(part->mbd.mtd, erase);
 
     if (!ret)
 	    xfer->EraseCount++;
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 2ff601f..0d946f1 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -220,7 +220,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 				 */
 				instr->addr = ip->Reserved0 * inftl->EraseSize;
 				instr->len = inftl->EraseSize;
-				mtd->erase(mtd, instr);
+				mtd_erase(mtd, instr);
 			}
 			if ((ip->lastUnit - ip->firstUnit + 1) < ip->virtualUnits) {
 				printk(KERN_WARNING "INFTL: Media Header "
@@ -393,7 +393,7 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 	   mark only the failed block in the bbt. */
 	for (physblock = 0; physblock < inftl->EraseSize;
 	     physblock += instr->len, instr->addr += instr->len) {
-		mtd->erase(inftl->mbd.mtd, instr);
+		mtd_erase(inftl->mbd.mtd, instr);
 
 		if (instr->state == MTD_ERASE_FAILED) {
 			printk(KERN_WARNING "INFTL: error while formatting block %d\n",
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 7c1dc90..9b01cb0 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -85,7 +85,7 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
 	set_current_state(TASK_INTERRUPTIBLE);
 	add_wait_queue(&wait_q, &wait);
 
-	ret = mtd->erase(mtd, &erase);
+	ret = mtd_erase(mtd, &erase);
 	if (ret) {
 		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&wait_q, &wait);
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 00423cc..41d64ff 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -731,7 +731,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 			  wq_head is no longer there when the
 			  callback routine tries to wake us up.
 			*/
-			ret = mtd->erase(mtd, erase);
+			ret = mtd_erase(mtd, erase);
 			if (!ret) {
 				set_current_state(TASK_UNINTERRUPTIBLE);
 				add_wait_queue(&waitq, &wait);
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 6df4d4d..76123bd 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -379,7 +379,7 @@ static int concat_dev_erase(struct mtd_info *mtd, struct erase_info *erase)
 	 * FIXME: Allow INTERRUPTIBLE. Which means
 	 * not having the wait_queue head on the stack.
 	 */
-	err = mtd->erase(mtd, erase);
+	err = mtd_erase(mtd, erase);
 	if (!err) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		add_wait_queue(&waitq, &wait);
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index f3cdce9..9b2d863 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -112,7 +112,7 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 	set_current_state(TASK_INTERRUPTIBLE);
 	add_wait_queue(&wait_q, &wait);
 
-	ret = mtd->erase(mtd, &erase);
+	ret = mtd_erase(mtd, &erase);
 	if (ret) {
 		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&wait_q, &wait);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a0bd2de..d318fee 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -257,7 +257,7 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (instr->addr >= mtd->size)
 		return -EINVAL;
 	instr->addr += part->offset;
-	ret = part->master->erase(part->master, instr);
+	ret = mtd_erase(part->master, instr);
 	if (ret) {
 		if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
 			instr->fail_addr -= part->offset;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index bd9590c..4e12875 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -567,7 +567,7 @@ retry:
 	erase.len	= mtd->erasesize;
 	erase.priv	= (u_long)&wq;
 
-	ret = mtd->erase(mtd, &erase);
+	ret = mtd_erase(mtd, &erase);
 	if (ret) {
 		if (retries++ < MTDSWAP_ERASE_RETRIES) {
 			dev_warn(d->dev,
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index ac40925..9164a56 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -326,7 +326,7 @@ int NFTL_formatblock(struct NFTLrecord *nftl, int block)
 	instr->mtd = nftl->mbd.mtd;
 	instr->addr = block * nftl->EraseSize;
 	instr->len = nftl->EraseSize;
-	mtd->erase(mtd, instr);
+	mtd_erase(mtd, instr);
 
 	if (instr->state == MTD_ERASE_FAILED) {
 		printk("Error while formatting block %d\n", block);
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 73ae217..39de872 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -342,7 +342,7 @@ static int erase_block(struct partition *part, int block)
 	part->blocks[block].state = BLOCK_ERASING;
 	part->blocks[block].free_sectors = 0;
 
-	rc = part->mbd.mtd->erase(part->mbd.mtd, erase);
+	rc = mtd_erase(part->mbd.mtd, erase);
 
 	if (rc) {
 		printk(KERN_ERR PREFIX "erase of region %llx,%llx on '%s' "
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 1c9f307..2f1acb1 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -479,7 +479,7 @@ static int sm_erase_block(struct sm_ftl *ftl, int zone_num, uint16_t block,
 		return -EIO;
 	}
 
-	if (mtd->erase(mtd, &erase)) {
+	if (mtd_erase(mtd, &erase)) {
 		sm_printk("erase of block %d in zone %d failed",
 							block, zone_num);
 		goto error;
diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index 933f7e5..7d52854 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -78,7 +78,7 @@ static int erase_eraseblock(int ebnum)
 	ei.addr = addr;
 	ei.len  = mtd->erasesize;
 
-	err = mtd->erase(mtd, &ei);
+	err = mtd_erase(mtd, &ei);
 	if (err) {
 		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
 		return err;
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index afafb69..271819f 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -77,7 +77,7 @@ static int erase_eraseblock(int ebnum)
 	ei.addr = addr;
 	ei.len  = mtd->erasesize;
 
-	err = mtd->erase(mtd, &ei);
+	err = mtd_erase(mtd, &ei);
 	if (err) {
 		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
 		return err;
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 493b367..f67a65e 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -79,7 +79,7 @@ static int erase_eraseblock(int ebnum)
 	ei.addr = addr;
 	ei.len  = mtd->erasesize;
 
-	err = mtd->erase(mtd, &ei);
+	err = mtd_erase(mtd, &ei);
 	if (err) {
 		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
 		return err;
@@ -105,7 +105,7 @@ static int multiblock_erase(int ebnum, int blocks)
 	ei.addr = addr;
 	ei.len  = mtd->erasesize * blocks;
 
-	err = mtd->erase(mtd, &ei);
+	err = mtd_erase(mtd, &ei);
 	if (err) {
 		printk(PRINT_PREF "error %d while erasing EB %d, blocks %d\n",
 		       err, ebnum, blocks);
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 811642f..a204a9f 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -112,7 +112,7 @@ static int erase_eraseblock(int ebnum)
 	ei.addr = addr;
 	ei.len  = mtd->erasesize;
 
-	err = mtd->erase(mtd, &ei);
+	err = mtd_erase(mtd, &ei);
 	if (unlikely(err)) {
 		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
 		return err;
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 1a05bfa..16d0c05 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -80,7 +80,7 @@ static int erase_eraseblock(int ebnum)
 	ei.addr = addr;
 	ei.len  = mtd->erasesize;
 
-	err = mtd->erase(mtd, &ei);
+	err = mtd_erase(mtd, &ei);
 	if (err) {
 		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
 		return err;
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 03ab649..102c79b 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -105,7 +105,7 @@ static inline int erase_eraseblock(int ebnum)
 	ei.addr = addr;
 	ei.len  = mtd->erasesize;
 
-	err = mtd->erase(mtd, &ei);
+	err = mtd_erase(mtd, &ei);
 	if (err) {
 		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
 		return err;
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index f20b6f2..b6c8959 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -361,7 +361,7 @@ retry:
 	ei.callback = erase_callback;
 	ei.priv     = (unsigned long)&wq;
 
-	err = ubi->mtd->erase(ubi->mtd, &ei);
+	err = mtd_erase(ubi->mtd, &ei);
 	if (err) {
 		if (retries++ < UBI_IO_RETRIES) {
 			dbg_io("error %d while erasing PEB %d, retry",
diff --git a/drivers/staging/spectra/lld_mtd.c b/drivers/staging/spectra/lld_mtd.c
index a9c309a..d638faf 100644
--- a/drivers/staging/spectra/lld_mtd.c
+++ b/drivers/staging/spectra/lld_mtd.c
@@ -188,7 +188,7 @@ u16 mtd_Erase_Block(u32 block_add)
 	erase.len = spectra_mtd->erasesize;
 	erase.priv = (unsigned long)&comp;
 
-	ret = spectra_mtd->erase(spectra_mtd, &erase);
+	ret = mtd_erase(spectra_mtd, &erase);
 	if (!ret) {
 		wait_for_completion(&comp);
 		if (erase.state != MTD_ERASE_DONE)
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index e513f19..540e8ec 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -74,7 +74,7 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	((struct erase_priv_struct *)instr->priv)->jeb = jeb;
 	((struct erase_priv_struct *)instr->priv)->c = c;
 
-	ret = c->mtd->erase(c->mtd, instr);
+	ret = mtd_erase(c->mtd, instr);
 	if (!ret)
 		return;
 
diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index eb423eb..0463628 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -105,7 +105,7 @@ static int logfs_mtd_erase(struct super_block *sb, loff_t ofs, size_t len,
 	ei.len = len;
 	ei.callback = logfs_erase_callback;
 	ei.priv = (long)&complete;
-	ret = mtd->erase(mtd, &ei);
+	ret = mtd_erase(mtd, &ei);
 	if (ret)
 		return -EIO;
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9f5b312..201bad5 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -171,11 +171,8 @@ struct mtd_info {
 	struct mtd_erase_region_info *eraseregions;
 
 	/*
-	 * Erase is an asynchronous operation.  Device drivers are supposed
-	 * to call instr->callback() whenever the operation completes, even
-	 * if it completes with a failure.
-	 * Callers are supposed to pass a callback function and wait for it
-	 * to be called before writing to the block.
+	 * Do not call via these pointers, use corresponding mtd_*()
+	 * wrappers instead.
 	 */
 	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
 
@@ -274,6 +271,18 @@ struct mtd_info {
 	void (*put_device) (struct mtd_info *mtd);
 };
 
+/*
+ * Erase is an asynchronous operation.  Device drivers are supposed
+ * to call instr->callback() whenever the operation completes, even
+ * if it completes with a failure.
+ * Callers are supposed to pass a callback function and wait for it
+ * to be called before writing to the block.
+ */
+static inline int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+	return mtd->erase(mtd, instr);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
