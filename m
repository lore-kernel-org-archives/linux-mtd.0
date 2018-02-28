Received: from mxhk.zte.com.cn ([63.217.80.70])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqrJ8-0005lr-3s
 for linux-mtd@lists.infradead.org; Wed, 28 Feb 2018 02:17:28 +0000
From: Jiang Biao <jiang.biao2@zte.com.cn>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: [PATCH] fs/ubifs: constify struct ubifs_lprops in scan_for_leb_for_idx
Date: Wed, 28 Feb 2018 10:13:57 +0800
Message-Id: <1519784037-105472-1-git-send-email-jiang.biao2@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Constify struct ubifs_lprops in scan_for_leb_for_idx to be
consistent with other references.

Signed-off-by: Jiang Biao <jiang.biao2@zte.com.cn>
---
 fs/ubifs/find.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 2dcf3d4..9571616 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -632,7 +632,7 @@ static int scan_for_idx_cb(struct ubifs_info *c,
  */
 static const struct ubifs_lprops *scan_for_leb_for_idx(struct ubifs_info *c)
 {
-	struct ubifs_lprops *lprops;
+	const struct ubifs_lprops *lprops;
 	struct scan_data data;
 	int err;
 
-- 
2.7.4
