Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y10wJ-00021a-QH
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 22:50:00 +0000
Received: by mail-ig0-f176.google.com with SMTP id l13so8318492iga.3
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 14:49:37 -0800 (PST)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] fs:jffs2: Remove no longer valid fix me comment in file.c
Date: Tue, 16 Dec 2014 17:49:32 -0500
Message-Id: <1418770172-18868-1-git-send-email-xerofoify@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removes no longer needed fix me comment in file.c due to the function kmap not being about to fail in the function, jffs2_do_readpage_nolock
and therefore there needs be no error checking after the call to kmap for mapping memory from high memory into the kernel's pages.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 fs/jffs2/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 64989ca..8798a61 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -94,7 +94,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 	BUG_ON(!PageLocked(pg));
 
 	pg_buf = kmap(pg);
-	/* FIXME: Can kmap fail? */
+
 
 	ret = jffs2_read_inode_range(c, f, pg_buf, pg->index << PAGE_CACHE_SHIFT, PAGE_CACHE_SIZE);
 
-- 
2.1.0
