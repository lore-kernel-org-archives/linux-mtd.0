Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnQst-0000uB-Sc
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 10:37:49 +0000
Received: by mail-pb0-f41.google.com with SMTP id jt11so18738569pbb.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2013 02:37:26 -0800 (PST)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] JFFS2: NULL return of kmem_cache_zalloc should be handled.
Date: Mon,  2 Dec 2013 18:37:05 +0800
Message-Id: <1385980625-26545-1-git-send-email-yizhouzhou@ict.ac.cn>
Cc: Zhouyi Zhou <yizhouzhou@ict.ac.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NULL return of kmem_cache_zalloc should be handled in jffs2_alloc_xattr_datum
and jff2_alloc_xattr_ref.

Signed-off-by: Zhouyi Zhou <yizhouzhou@ict.ac.cn>
---
 fs/jffs2/malloc.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index 4f47aa2..b8fd651 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -288,6 +288,8 @@ struct jffs2_xattr_datum *jffs2_alloc_xattr_datum(void)
 	struct jffs2_xattr_datum *xd;
 	xd = kmem_cache_zalloc(xattr_datum_cache, GFP_KERNEL);
 	dbg_memalloc("%p\n", xd);
+	if (!xd)
+		return NULL;
 
 	xd->class = RAWNODE_CLASS_XATTR_DATUM;
 	xd->node = (void *)xd;
@@ -306,6 +308,8 @@ struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void)
 	struct jffs2_xattr_ref *ref;
 	ref = kmem_cache_zalloc(xattr_ref_cache, GFP_KERNEL);
 	dbg_memalloc("%p\n", ref);
+	if (!ref)
+		return NULL;
 
 	ref->class = RAWNODE_CLASS_XATTR_REF;
 	ref->node = (void *)ref;
-- 
1.7.10.4
