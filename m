Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrs7X-0005zi-Fl
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 14:22:12 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] jffs2: remove direct mtd->point reference
Date: Mon, 30 Jan 2012 16:24:05 +0200
Message-Id: <1327933447-17356-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Commit 10934478e44d9a5a7b16dadd89094fb608cf101e did not remove now useless
"if (mtd->point)" check mistakingly - let's kill it now.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/jffs2/scan.c |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index f994648..c027373 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -96,18 +96,16 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 #ifndef __ECOS
 	size_t pointlen, try_size;
 
-	if (c->mtd->point) {
-		ret = mtd_point(c->mtd, 0, c->mtd->size, &pointlen,
-				(void **)&flashbuf, NULL);
-		if (!ret && pointlen < c->mtd->size) {
-			/* Don't muck about if it won't let us point to the whole flash */
-			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", pointlen));
-			mtd_unpoint(c->mtd, 0, pointlen);
-			flashbuf = NULL;
-		}
-		if (ret && ret != -EOPNOTSUPP)
-			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
+	ret = mtd_point(c->mtd, 0, c->mtd->size, &pointlen,
+			(void **)&flashbuf, NULL);
+	if (!ret && pointlen < c->mtd->size) {
+		/* Don't muck about if it won't let us point to the whole flash */
+		D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", pointlen));
+		mtd_unpoint(c->mtd, 0, pointlen);
+		flashbuf = NULL;
 	}
+	if (ret && ret != -EOPNOTSUPP)
+		D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
 #endif
 	if (!flashbuf) {
 		/* For NAND it's quicker to read a whole eraseblock at a time,
-- 
1.7.7.6
