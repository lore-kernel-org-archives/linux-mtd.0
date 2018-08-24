Received: from out1.zte.com.cn ([202.103.147.172] helo=mxct.zte.com.cn)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ft0kF-0000Ob-Gl
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2018 01:18:37 +0000
From: Liu Song <liu.song11@zte.com.cn>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: [PATCH v2] ubifs: remove unnecessary check in ubifs_log_start_commit
Date: Fri, 24 Aug 2018 09:15:45 +0800
Message-Id: <1535073345-88009-1-git-send-email-liu.song11@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In ubifs_log_start_commit, the value of c->lhead_offs is zero or set
to zero by code bellow.

	/* Switch to the next log LEB */
	if (c->lhead_offs) {
		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
		ubifs_assert(c->lhead_lnum != c->ltail_lnum);
		c->lhead_offs = 0;
	}

The value of 'len' can not exceed 'max_len' which assigned value by
code bellow.

	max_len = UBIFS_CS_NODE_SZ + c->jhead_cnt * UBIFS_REF_NODE_SZ;

The value of c->lhead_offs changed by code bellow and cannot exceed
'max_len'.

	c->lhead_offs += len;
	if (c->lhead_offs == c->leb_size) {
		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
		c->lhead_offs = 0;
	}

Usually, the size of PEB is between 64KB and 256KB. So the value of
c->lhead_offs is far less than c->leb_size. The check 
'if (c->lhead_offs == c->leb_size)' could never to be true.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
Reviewed-by: Jiang Biao <jiang.biao2@zte.com.cn>
---
v2: Improve description and code as suggestted by Richard.

 fs/ubifs/log.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 7cffa12..78afb78 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -427,10 +427,7 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 	*ltail_lnum = c->lhead_lnum;
 
 	c->lhead_offs += len;
-	if (c->lhead_offs == c->leb_size) {
-		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
-		c->lhead_offs = 0;
-	}
+	ubifs_assert(c->lhead_offs < c->leb_size);
 
 	remove_buds(c);
 
-- 
2.1.0.GIT
