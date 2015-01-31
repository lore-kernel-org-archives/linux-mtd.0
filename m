Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHdT1-0004sp-AZ
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 19:12:27 +0000
Received: by mail-ie0-f179.google.com with SMTP id x19so10075033ier.10
 for <linux-mtd@lists.infradead.org>; Sat, 31 Jan 2015 11:12:03 -0800 (PST)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] jffs2:Remove no longer needed fix me comment for the function,
 jffs2_do_readpage_nolock
Date: Sat, 31 Jan 2015 14:11:58 -0500
Message-Id: <1422731518-17649-1-git-send-email-xerofoify@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fix me comment is no longer needed due to kmap not being able to fail and always
returning a address mapped in high memory as required for this function. There for
this fix me can now be removed as kmap always succeeds and there is no reason to
check if it fails.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 fs/jffs2/file.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 64989ca..84a2f7b 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -94,7 +94,6 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 	BUG_ON(!PageLocked(pg));
 
 	pg_buf = kmap(pg);
-	/* FIXME: Can kmap fail? */
 
 	ret = jffs2_read_inode_range(c, f, pg_buf, pg->index << PAGE_CACHE_SHIFT, PAGE_CACHE_SIZE);
 
-- 
2.1.0
