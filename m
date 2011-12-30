Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgeRM-0006Mj-JD
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2011 15:32:17 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] jffs: remove custom mtd_fake_writev function
Date: Fri, 30 Dec 2011 17:34:12 +0200
Message-Id: <1325259254-21208-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325259254-21208-1-git-send-email-dedekind1@gmail.com>
References: <1325259254-21208-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Instead, use 'default_mtd_writev()' function which MTD provides.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/jffs2/writev.c |   27 +--------------------------
 1 files changed, 1 insertions(+), 26 deletions(-)

diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index d0ef068..8d70407 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -13,31 +13,6 @@
 #include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
-/* This ought to be in core MTD code. All registered MTD devices
-   without writev should have this put in place. Bug the MTD
-   maintainer */
-static inline int mtd_fake_writev(struct mtd_info *mtd, const struct kvec *vecs,
-				  unsigned long count, loff_t to, size_t *retlen)
-{
-	unsigned long i;
-	size_t totlen = 0, thislen;
-	int ret = 0;
-
-	for (i=0; i<count; i++) {
-		if (!vecs[i].iov_len)
-			continue;
-		ret = mtd_write(mtd, to, vecs[i].iov_len, &thislen,
-				vecs[i].iov_base);
-		totlen += thislen;
-		if (ret || thislen != vecs[i].iov_len)
-			break;
-		to += vecs[i].iov_len;
-	}
-	if (retlen)
-		*retlen = totlen;
-	return ret;
-}
-
 int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 			      unsigned long count, loff_t to, size_t *retlen)
 {
@@ -54,7 +29,7 @@ int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 	if (c->mtd->writev)
 		return mtd_writev(c->mtd, vecs, count, to, retlen);
 	else {
-		return mtd_fake_writev(c->mtd, vecs, count, to, retlen);
+		return default_mtd_writev(c->mtd, vecs, count, to, retlen);
 	}
 }
 
-- 
1.7.7.3
