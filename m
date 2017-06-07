Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIiab-0003dJ-Jk
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 21:34:07 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Fail commit if TNC is obviously inconsistent
Date: Wed,  7 Jun 2017 23:33:35 +0200
Message-Id: <20170607213335.23059-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A reference to LEB 0 or with length 0 in the TNC
is never correct and could be caused by a memory corruption.
Don't write such a bad index node to the MTD.
Instead fail the commit which will turn UBIFS into read-only mode.

This is less painful than having the bad reference on the MTD
from where UBFIS has no chance to recover.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/tnc_commit.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 51157da3f76e..aa31f60220ef 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -57,6 +57,8 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
 			ubifs_dump_znode(c, znode);
 			if (zbr->znode)
 				ubifs_dump_znode(c, zbr->znode);
+
+			return -EINVAL;
 		}
 	}
 	ubifs_prepare_node(c, idx, len, 0);
@@ -859,6 +861,8 @@ static int write_index(struct ubifs_info *c)
 				ubifs_dump_znode(c, znode);
 				if (zbr->znode)
 					ubifs_dump_znode(c, zbr->znode);
+
+				return -EINVAL;
 			}
 		}
 		len = ubifs_idx_node_sz(c, znode->child_cnt);
-- 
2.12.3
