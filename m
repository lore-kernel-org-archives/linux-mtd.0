Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqi-0003Qp-OK
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:45 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/17] mtd: do use mtd->point directly
Date: Mon,  2 Jan 2012 14:20:32 +0200
Message-Id: <1325506847-23470-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Remove direct usage of the "mtd->point" function pointer. Instead,
test the mtd_point() return code for '-EOPNOTSUPP'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/jffs2/erase.c        |    9 ++++-----
 fs/jffs2/readinode.c    |   18 ++++++++----------
 fs/jffs2/scan.c         |    2 +-
 include/linux/mtd/mtd.h |    2 ++
 4 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index c59d642..a01cdad 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -336,12 +336,11 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
 	uint32_t ofs;
 	size_t retlen;
 	int ret = -EIO;
+	unsigned long *wordebuf;
 
-	if (c->mtd->point) {
-		unsigned long *wordebuf;
-
-		ret = mtd_point(c->mtd, jeb->offset, c->sector_size, &retlen,
-				&ebuf, NULL);
+	ret = mtd_point(c->mtd, jeb->offset, c->sector_size, &retlen,
+			&ebuf, NULL);
+	if (ret != -EOPNOTSUPP) {
 		if (ret) {
 			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
 			goto do_flash_read;
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index fca2f84..3093ac4 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -62,17 +62,15 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 #ifndef __ECOS
 	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
 	 * adding and jffs2_flash_read_end() interface. */
-	if (c->mtd->point) {
-		err = mtd_point(c->mtd, ofs, len, &retlen, (void **)&buffer,
-				NULL);
-		if (!err && retlen < len) {
-			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
-			mtd_unpoint(c->mtd, ofs, retlen);
-		} else if (err)
+	err = mtd_point(c->mtd, ofs, len, &retlen, (void **)&buffer, NULL);
+	if (!err && retlen < len) {
+		JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
+		mtd_unpoint(c->mtd, ofs, retlen);
+	} else if (err) {
+		if (err != -EOPNOTSUPP)
 			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
-		else
-			pointed = 1; /* succefully pointed to device */
-	}
+	} else
+		pointed = 1; /* succefully pointed to device */
 #endif
 
 	if (!pointed) {
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 83e1665..f994648 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -105,7 +105,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 			mtd_unpoint(c->mtd, 0, pointlen);
 			flashbuf = NULL;
 		}
-		if (ret)
+		if (ret && ret != -EOPNOTSUPP)
 			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
 	}
 #endif
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 4787015..b355a83 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -259,6 +259,8 @@ static inline int mtd_point(struct mtd_info *mtd, loff_t from, size_t len,
 			    size_t *retlen, void **virt, resource_size_t *phys)
 {
 	*retlen = 0;
+	if (!mtd->point)
+		return -EOPNOTSUPP;
 	return mtd->point(mtd, from, len, retlen, virt, phys);
 }
 
-- 
1.7.7.3
