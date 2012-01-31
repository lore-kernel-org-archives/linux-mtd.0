Received: from [206.117.179.246] (helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsMPO-0002s8-UN
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 22:42:39 +0000
From: Joe Perches <joe@perches.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/4] jffs2: Remove unnecessary OOM messages
Date: Tue, 31 Jan 2012 14:42:08 -0800
Message-Id: <98592226b940c1fa59ced4a28418343508714161.1328049542.git.joe@perches.com>
In-Reply-To: <cover.1328049542.git.joe@perches.com>
References: <cover.1328049542.git.joe@perches.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Per call site OOM messages are unnecessary.
k.alloc and v.alloc failures use dump_stack().

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/jffs2/compr_lzo.c  |    1 -
 fs/jffs2/compr_zlib.c |    6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/compr_lzo.c b/fs/jffs2/compr_lzo.c
index af186ee..c553bd6 100644
--- a/fs/jffs2/compr_lzo.c
+++ b/fs/jffs2/compr_lzo.c
@@ -33,7 +33,6 @@ static int __init alloc_workspace(void)
 	lzo_compress_buf = vmalloc(lzo1x_worst_compress(PAGE_SIZE));
 
 	if (!lzo_mem || !lzo_compress_buf) {
-		printk(KERN_WARNING "Failed to allocate lzo deflate workspace\n");
 		free_workspace();
 		return -ENOMEM;
 	}
diff --git a/fs/jffs2/compr_zlib.c b/fs/jffs2/compr_zlib.c
index 5a00102..4e7a138 100644
--- a/fs/jffs2/compr_zlib.c
+++ b/fs/jffs2/compr_zlib.c
@@ -42,14 +42,12 @@ static int __init alloc_workspaces(void)
 {
 	def_strm.workspace = vmalloc(zlib_deflate_workspacesize(MAX_WBITS,
 							MAX_MEM_LEVEL));
-	if (!def_strm.workspace) {
-		printk(KERN_WARNING "Failed to allocate %d bytes for deflate workspace\n", zlib_deflate_workspacesize(MAX_WBITS, MAX_MEM_LEVEL));
+	if (!def_strm.workspace)
 		return -ENOMEM;
-	}
+
 	D1(printk(KERN_DEBUG "Allocated %d bytes for deflate workspace\n", zlib_deflate_workspacesize(MAX_WBITS, MAX_MEM_LEVEL)));
 	inf_strm.workspace = vmalloc(zlib_inflate_workspacesize());
 	if (!inf_strm.workspace) {
-		printk(KERN_WARNING "Failed to allocate %d bytes for inflate workspace\n", zlib_inflate_workspacesize());
 		vfree(def_strm.workspace);
 		return -ENOMEM;
 	}
-- 
1.7.8.111.gad25c.dirty
