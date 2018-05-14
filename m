Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI8hD-0005gs-7h
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:19:04 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 6/6] ubifs: lpt: Fix wrong pnode number range in comment
Date: Mon, 14 May 2018 10:18:19 +0200
Message-Id: <20180514081819.20921-7-s.hauer@pengutronix.de>
In-Reply-To: <20180514081819.20921-1-s.hauer@pengutronix.de>
References: <20180514081819.20921-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The comment above pnode_lookup claims the range for the pnode number is
from 0 to main_lebs - 1. This is wrong because every pnode has
informations about UBIFS_LPT_FANOUT LEBs, thus the corrent range is
0 to to (main_lebs - 1) / UBIFS_LPT_FANOUT.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/lpt_commit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 235654c2fe89..78da65b2fb85 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -619,7 +619,7 @@ static struct ubifs_pnode *next_pnode_to_dirty(struct ubifs_info *c,
 /**
  * pnode_lookup - lookup a pnode in the LPT.
  * @c: UBIFS file-system description object
- * @i: pnode number (0 to main_lebs - 1)
+ * @i: pnode number (0 to (main_lebs - 1) / UBIFS_LPT_FANOUT))
  *
  * This function returns a pointer to the pnode on success or a negative
  * error code on failure.
-- 
2.17.0
