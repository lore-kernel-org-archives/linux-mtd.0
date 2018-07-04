Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faeHF-0002HS-3G
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 09:41:38 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] ubifs: log: Don't leak kernel memory to the MTD
Date: Wed,  4 Jul 2018 11:40:25 +0200
Message-Id: <20180704094025.26789-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubifs_log_start_commit() allocates a buffer with kmalloc(),
this buffer is used to build UBIFS CS and REF nodes, all structure
attributes get set, except for the padding field in the ubifs_ref_node.
That way we leak 28 bytes of kernel memory to the MTD.
Fix it by using kzalloc().

Cc: stable@vger.kernel.org
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 7cffa120a750..60d49c6dd470 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -369,7 +369,7 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 
 	max_len = UBIFS_CS_NODE_SZ + c->jhead_cnt * UBIFS_REF_NODE_SZ;
 	max_len = ALIGN(max_len, c->min_io_size);
-	buf = cs = kmalloc(max_len, GFP_NOFS);
+	buf = cs = kzalloc(max_len, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
-- 
2.18.0
