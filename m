Message-Id: <200902112127.n1BLR6XF031345@imap1.linux-foundation.org>
Subject: [patch 9/9] fs/jffs2/malloc.c: kmem_cache_alloc/memset ->
	kmem_cache_zalloc
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 11 Feb 2009 13:27:06 -0800
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	yjwei@cn.fujitsu.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yjwei@cn.fujitsu.com>

Used kmem_cache_zalloc instead of kmem_cache_alloc/memset.

Signed-off-by: Wei Yongjun <yjwei@cn.fujitsu.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/jffs2/malloc.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff -puN fs/jffs2/malloc.c~fs-jffs2-mallocc-kmem_cache_alloc-memset-kmem_cache_zalloc fs/jffs2/malloc.c
--- a/fs/jffs2/malloc.c~fs-jffs2-mallocc-kmem_cache_alloc-memset-kmem_cache_zalloc
+++ a/fs/jffs2/malloc.c
@@ -284,10 +284,9 @@ void jffs2_free_inode_cache(struct jffs2
 struct jffs2_xattr_datum *jffs2_alloc_xattr_datum(void)
 {
 	struct jffs2_xattr_datum *xd;
-	xd = kmem_cache_alloc(xattr_datum_cache, GFP_KERNEL);
+	xd = kmem_cache_zalloc(xattr_datum_cache, GFP_KERNEL);
 	dbg_memalloc("%p\n", xd);
 
-	memset(xd, 0, sizeof(struct jffs2_xattr_datum));
 	xd->class = RAWNODE_CLASS_XATTR_DATUM;
 	xd->node = (void *)xd;
 	INIT_LIST_HEAD(&xd->xindex);
@@ -303,10 +302,9 @@ void jffs2_free_xattr_datum(struct jffs2
 struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void)
 {
 	struct jffs2_xattr_ref *ref;
-	ref = kmem_cache_alloc(xattr_ref_cache, GFP_KERNEL);
+	ref = kmem_cache_zalloc(xattr_ref_cache, GFP_KERNEL);
 	dbg_memalloc("%p\n", ref);
 
-	memset(ref, 0, sizeof(struct jffs2_xattr_ref));
 	ref->class = RAWNODE_CLASS_XATTR_REF;
 	ref->node = (void *)ref;
 	return ref;
_
