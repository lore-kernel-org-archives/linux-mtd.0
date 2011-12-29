Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCF5-0004Rf-9r
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:25:46 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 04/27] mtd: introduce mtd_point interface
Date: Thu, 29 Dec 2011 11:27:08 +0200
Message-Id: <1325150851-2805-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
References: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdpart.c   |    4 ++--
 fs/jffs2/erase.c        |    4 ++--
 fs/jffs2/readinode.c    |    4 ++--
 fs/jffs2/scan.c         |    4 ++--
 include/linux/mtd/mtd.h |   14 ++++++++++----
 5 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d318fee..5b66472 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -89,8 +89,8 @@ static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
 		len = 0;
 	else if (from + len > mtd->size)
 		len = mtd->size - from;
-	return part->master->point (part->master, from + part->offset,
-				    len, retlen, virt, phys);
+	return mtd_point(part->master, from + part->offset, len, retlen,
+			 virt, phys);
 }
 
 static void part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 540e8ec..53f8794 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -340,8 +340,8 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
 	if (c->mtd->point) {
 		unsigned long *wordebuf;
 
-		ret = c->mtd->point(c->mtd, jeb->offset, c->sector_size,
-				    &retlen, &ebuf, NULL);
+		ret = mtd_point(c->mtd, jeb->offset, c->sector_size, &retlen,
+				&ebuf, NULL);
 		if (ret) {
 			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
 			goto do_flash_read;
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index ee57bac..dde61ef 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -63,8 +63,8 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
 	 * adding and jffs2_flash_read_end() interface. */
 	if (c->mtd->point) {
-		err = c->mtd->point(c->mtd, ofs, len, &retlen,
-				    (void **)&buffer, NULL);
+		err = mtd_point(c->mtd, ofs, len, &retlen, (void **)&buffer,
+				NULL);
 		if (!err && retlen < len) {
 			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
 			c->mtd->unpoint(c->mtd, ofs, retlen);
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 28107ca..53e05c8 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -97,8 +97,8 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	size_t pointlen, try_size;
 
 	if (c->mtd->point) {
-		ret = c->mtd->point(c->mtd, 0, c->mtd->size, &pointlen,
-				    (void **)&flashbuf, NULL);
+		ret = mtd_point(c->mtd, 0, c->mtd->size, &pointlen,
+				(void **)&flashbuf, NULL);
 		if (!ret && pointlen < c->mtd->size) {
 			/* Don't muck about if it won't let us point to the whole flash */
 			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", pointlen));
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 201bad5..ca7bfda 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -175,11 +175,8 @@ struct mtd_info {
 	 * wrappers instead.
 	 */
 	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
-
-	/* This stuff for eXecute-In-Place */
-	/* phys is optional and may be set to NULL */
 	int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, void **virt, resource_size_t *phys);
+		      size_t *retlen, void **virt, resource_size_t *phys);
 
 	/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
 	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
@@ -283,6 +280,15 @@ static inline int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return mtd->erase(mtd, instr);
 }
 
+/*
+ * This stuff for eXecute-In-Place. phys is optional and may be set to NULL.
+ */
+static inline int mtd_point(struct mtd_info *mtd, loff_t from, size_t len,
+			    size_t *retlen, void **virt, resource_size_t *phys)
+{
+	return mtd->point(mtd, from, len, retlen, virt, phys);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
