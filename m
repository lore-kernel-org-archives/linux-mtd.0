Received: from out1.zte.com.cn ([202.103.147.172] helo=mxct.zte.com.cn)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frxCd-0008M4-9M
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 03:19:33 +0000
From: Liu Song <liu.song11@zte.com.cn>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: [PATCH] ubifs: remove unnecessary check in ubifs_log_start_commit
Date: Tue, 21 Aug 2018 11:17:22 +0800
Message-Id: <1534821442-178518-1-git-send-email-liu.song11@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The value of c->lhead_offs cannot exceed max_len which much
smaller than c->leb_size. So the check will never be true.
Just remove it.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
Reviewed-by: Jiang Biao <jiang.biao2@zte.com.cn>
---
 fs/ubifs/log.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 7cffa120a750..5a338737223b 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -427,10 +427,6 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 	*ltail_lnum = c->lhead_lnum;
 
 	c->lhead_offs += len;
-	if (c->lhead_offs == c->leb_size) {
-		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
-		c->lhead_offs = 0;
-	}
 
 	remove_buds(c);
 
-- 
2.17.1
