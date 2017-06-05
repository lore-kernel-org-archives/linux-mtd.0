Received: from m12-18.163.com ([220.181.12.18])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dHioq-0004yc-Ie
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 03:36:42 +0000
From: Jia-Ju Bai <baijiaju1990@163.com>
To: richard@nod.at,
	dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jia-Ju Bai <baijiaju1990@163.com>
Subject: [PATCH] ubifs: Fix a sleep-in-atomic bug in ubifs_read_nnode
Date: Mon,  5 Jun 2017 11:38:36 +0800
Message-Id: <1496633916-32362-1-git-send-email-baijiaju1990@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver may sleep under a spin lock, and the function call path is:
ubifs_change_lp (acquire the lock by spin_lock)
  change_category
    ubifs_remove_from_cat
      remove_from_lpt_heap
        dbg_check_heap
          ubifs_lpt_lookup
            ubifs_read_nnode
              kzalloc(GFP_NOFS) --> may sleep

To fix it, "GFP_NOFS" is replaced with "GFP_ATOMIC".

Signed-off-by: Jia-Ju Bai <baijiaju1990@163.com>
---
 fs/ubifs/lpt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 9a51710..4247934c 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1205,7 +1205,7 @@ int ubifs_read_nnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 		lnum = c->lpt_lnum;
 		offs = c->lpt_offs;
 	}
-	nnode = kzalloc(sizeof(struct ubifs_nnode), GFP_NOFS);
+	nnode = kzalloc(sizeof(struct ubifs_nnode), GFP_ATOMIC);
 	if (!nnode) {
 		err = -ENOMEM;
 		goto out;
-- 
1.7.9.5
