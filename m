Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMiAx-0005JG-4j
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 19:47:04 +0000
Received: by wijp15 with SMTP id p15so19939186wij.0
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2015 12:46:40 -0700 (PDT)
Sender: Salah TRIKI <salah.triki@gmail.com>
From: Salah Triki <salah.triki@acm.org>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 salah.triki@acm.org
Subject: [PATCH] jffs2: Remove NULL checks from jffs2_destroy_slab_caches
Date: Tue,  4 Aug 2015 20:46:30 +0100
Message-Id: <1438717590-4263-1-git-send-email-salah.triki@acm.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kmem_cache_destroy can be called with NULL values. Thus, the checks that
precede the calls are useless.

Signed-off-by: Salah Triki <salah.triki@acm.org>
---
 fs/jffs2/malloc.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index b8fd651..ce11897 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -97,25 +97,16 @@ int __init jffs2_create_slab_caches(void)
 
 void jffs2_destroy_slab_caches(void)
 {
-	if(full_dnode_slab)
-		kmem_cache_destroy(full_dnode_slab);
-	if(raw_dirent_slab)
-		kmem_cache_destroy(raw_dirent_slab);
-	if(raw_inode_slab)
-		kmem_cache_destroy(raw_inode_slab);
-	if(tmp_dnode_info_slab)
-		kmem_cache_destroy(tmp_dnode_info_slab);
-	if(raw_node_ref_slab)
-		kmem_cache_destroy(raw_node_ref_slab);
-	if(node_frag_slab)
-		kmem_cache_destroy(node_frag_slab);
-	if(inode_cache_slab)
-		kmem_cache_destroy(inode_cache_slab);
+	kmem_cache_destroy(full_dnode_slab);
+	kmem_cache_destroy(raw_dirent_slab);
+	kmem_cache_destroy(raw_inode_slab);
+	kmem_cache_destroy(tmp_dnode_info_slab);
+	kmem_cache_destroy(raw_node_ref_slab);
+	kmem_cache_destroy(node_frag_slab);
+	kmem_cache_destroy(inode_cache_slab);
 #ifdef CONFIG_JFFS2_FS_XATTR
-	if (xattr_datum_cache)
-		kmem_cache_destroy(xattr_datum_cache);
-	if (xattr_ref_cache)
-		kmem_cache_destroy(xattr_ref_cache);
+	kmem_cache_destroy(xattr_datum_cache);
+	kmem_cache_destroy(xattr_ref_cache);
 #endif
 }
 
-- 
1.9.1
