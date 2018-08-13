Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fp3Ud-0007LV-Hd
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2018 03:26:08 +0000
Received: by mail-pl0-x242.google.com with SMTP id w3-v6so6338645plq.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Aug 2018 20:25:56 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] fs: jffs2: fix a sleep-in-atomic-context bug in
 jffs2_alloc_refblock()
Date: Mon, 13 Aug 2018 11:25:47 +0800
Message-Id: <20180813032547.3156-1-baijiaju1990@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kernel may sleep with holding a spin lock.

The function call paths (from bottom to top) in Linux-4.16 are:

[FUNC] kmem_cache_alloc(GFP_KERNEL)
fs/jffs2/malloc.c, 188: 
	kmem_cache_alloc in jffs2_alloc_refblock
fs/jffs2/malloc.c, 221: 
	jffs2_alloc_refblock in jffs2_prealloc_raw_node_refs
fs/jffs2/wbuf.c, 164: 
	jffs2_prealloc_raw_node_refs in jffs2_block_refile
fs/jffs2/wbuf.c, 927: 
	jffs2_block_refile in jffs2_flash_writev
fs/jffs2/wbuf.c, 924: 
	spin_lock in jffs2_flash_writev

To fix it, GFP_KERNEL in kmem_cache_alloc() is replaced with GFP_ATOMIC.
	
This is found by my static analysis tool (DSAC).

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 fs/jffs2/malloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index ce1189793288..66496ef09716 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -185,7 +185,7 @@ static struct jffs2_raw_node_ref *jffs2_alloc_refblock(void)
 {
 	struct jffs2_raw_node_ref *ret;
 
-	ret = kmem_cache_alloc(raw_node_ref_slab, GFP_KERNEL);
+	ret = kmem_cache_alloc(raw_node_ref_slab, GFP_ATOMIC);
 	if (ret) {
 		int i = 0;
 		for (i=0; i < REFS_PER_BLOCK; i++) {
-- 
2.17.0
