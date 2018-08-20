Received: from out1.zte.com.cn ([202.103.147.172] helo=mxct.zte.com.cn)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frbIk-00081L-SC
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 03:56:24 +0000
From: Liu Song <liu.song11@zte.com.cn>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: [PATCH] UBIFS: Fix typo of output in get_cs_sqnum
Date: Mon, 20 Aug 2018 11:54:30 +0800
Message-Id: <1534737270-143176-1-git-send-email-liu.song11@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Not a CS node" makes more sense than "Node a CS node".

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
Reviewed-by: Jiang Biao <jiang.biao2@zte.com.cn>
---
 fs/ubifs/recovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 3af4472061cc..400163dc7022 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -829,7 +829,7 @@ static int get_cs_sqnum(struct ubifs_info *c, int lnum, int offs,
 		goto out_err;
 	}
 	if (cs_node->ch.node_type != UBIFS_CS_NODE) {
-		ubifs_err(c, "Node a CS node, type is %d", cs_node->ch.node_type);
+		ubifs_err(c, "Not a CS node, type is %d", cs_node->ch.node_type);
 		goto out_err;
 	}
 	if (le64_to_cpu(cs_node->cmt_no) != c->cmt_no) {
-- 
2.17.1
