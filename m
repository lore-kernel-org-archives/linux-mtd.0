Received: from mxhk.zte.com.cn ([63.217.80.70])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmVbw-0003iM-S7
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2018 02:51:10 +0000
From: Liu Song <liu.song11@zte.com.cn>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: [PATCH] Simplify redundant code
Date: Mon, 6 Aug 2018 10:49:06 +0800
Message-Id: <1533523746-13197-1-git-send-email-liu.song11@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cbuf's size can be simply assigned.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
Reviewed-by: Jiang Biao <jiang.biao2@zte.com.cn>
---
 fs/ubifs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index c5466c7..1a8e2032 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1245,8 +1245,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_free;
 
-	sz = ALIGN(c->max_idx_node_sz, c->min_io_size);
-	sz = ALIGN(sz + c->max_idx_node_sz, c->min_io_size);
+	sz = ALIGN(c->max_idx_node_sz, c->min_io_size) * 2;
 	c->cbuf = kmalloc(sz, GFP_NOFS);
 	if (!c->cbuf) {
 		err = -ENOMEM;
-- 
2.1.0.GIT
