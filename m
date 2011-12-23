Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9Zd-0005G2-NA
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:31 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/28] mtd: introduce mtd_unpoint interface
Date: Fri, 23 Dec 2011 20:10:57 +0200
Message-Id: <1324663880-22477-6-git-send-email-dedekind1@gmail.com>
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

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdpart.c   |    2 +-
 fs/jffs2/erase.c        |    4 ++--
 fs/jffs2/readinode.c    |    6 +++---
 fs/jffs2/scan.c         |    4 ++--
 include/linux/mtd/mtd.h |    8 ++++++--
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 5b66472..b09624a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -97,7 +97,7 @@ static void part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 	struct mtd_part *part = PART(mtd);
 
-	part->master->unpoint(part->master, from + part->offset, len);
+	mtd_unpoint(part->master, from + part->offset, len);
 }
 
 static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 53f8794..ffdf4fc 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -349,7 +349,7 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
 		if (retlen < c->sector_size) {
 			/* Don't muck about if it won't let us point to the whole erase sector */
 			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", retlen));
-			c->mtd->unpoint(c->mtd, jeb->offset, retlen);
+			mtd_unpoint(c->mtd, jeb->offset, retlen);
 			goto do_flash_read;
 		}
 		wordebuf = ebuf-sizeof(*wordebuf);
@@ -358,7 +358,7 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
 		   if (*++wordebuf != ~0)
 			   break;
 		} while(--retlen);
-		c->mtd->unpoint(c->mtd, jeb->offset, c->sector_size);
+		mtd_unpoint(c->mtd, jeb->offset, c->sector_size);
 		if (retlen) {
 			printk(KERN_WARNING "Newly-erased block contained word 0x%lx at offset 0x%08tx\n",
 			       *wordebuf, jeb->offset + c->sector_size-retlen*sizeof(*wordebuf));
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index dde61ef..fca2f84 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -67,7 +67,7 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 				NULL);
 		if (!err && retlen < len) {
 			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
-			c->mtd->unpoint(c->mtd, ofs, retlen);
+			mtd_unpoint(c->mtd, ofs, retlen);
 		} else if (err)
 			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
 		else
@@ -101,7 +101,7 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 		kfree(buffer);
 #ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, ofs, len);
+		mtd_unpoint(c->mtd, ofs, len);
 #endif
 
 	if (crc != tn->data_crc) {
@@ -137,7 +137,7 @@ free_out:
 		kfree(buffer);
 #ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, ofs, len);
+		mtd_unpoint(c->mtd, ofs, len);
 #endif
 	return err;
 }
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 53e05c8..72f3960 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -102,7 +102,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 		if (!ret && pointlen < c->mtd->size) {
 			/* Don't muck about if it won't let us point to the whole flash */
 			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", pointlen));
-			c->mtd->unpoint(c->mtd, 0, pointlen);
+			mtd_unpoint(c->mtd, 0, pointlen);
 			flashbuf = NULL;
 		}
 		if (ret)
@@ -273,7 +273,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 		kfree(flashbuf);
 #ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, 0, c->mtd->size);
+		mtd_unpoint(c->mtd, 0, c->mtd->size);
 #endif
 	kfree(s);
 	return ret;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index ca7bfda..a7d22b7 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -177,8 +177,6 @@ struct mtd_info {
 	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
 	int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
 		      size_t *retlen, void **virt, resource_size_t *phys);
-
-	/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
 	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
 
 	/* Allow NOMMU mmap() to directly map the device (if not NULL)
@@ -289,6 +287,12 @@ static inline int mtd_point(struct mtd_info *mtd, loff_t from, size_t len,
 	return mtd->point(mtd, from, len, retlen, virt, phys);
 }
 
+/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
+static inline void mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	return mtd->unpoint(mtd, from, len);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
