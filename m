Received: from [222.73.24.84] (helo=song.cn.fujitsu.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVH9J-0001Qd-6s
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 03:13:01 +0000
Message-ID: <498BAAB1.5030104@cn.fujitsu.com>
Date: Fri, 06 Feb 2009 11:12:49 +0800
From: Wei Yongjun <yjwei@cn.fujitsu.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: fs/jffs2/malloc.c: kmem_cache_alloc/memset -> kmem_cache_zalloc
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Used kmem_cache_zalloc instead of kmem_cache_alloc/memset.

Signed-off-by: Wei Yongjun <yjwei@cn.fujitsu.com>
---
 fs/jffs2/malloc.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index f921125..9eff2bd 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -284,10 +284,9 @@ void jffs2_free_inode_cache(struct jffs2_inode_cache *x)
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
@@ -303,10 +302,9 @@ void jffs2_free_xattr_datum(struct jffs2_xattr_datum *xd)
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
-- 
1.5.3.8
