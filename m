Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuYUl-0002VQ-4N
 for linux-mtd@lists.infradead.org; Wed, 11 Jun 2014 02:42:38 +0000
Message-ID: <5397C1CD.4070200@huawei.com>
Date: Wed, 11 Jun 2014 10:41:17 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/4] UBIFS: Add missing break in dbg_chk_pnode()
References: <5397C0E7.9070602@huawei.com>
In-Reply-To: <5397C0E7.9070602@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a minor fix. These two branches in dbg_chk_pnode
are dealing with different conditions. Although there is
no fault in current state, I think adding "break"s in
each end of branch is better.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/lpt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index d46b19e..b4fb422 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -2198,6 +2198,7 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 					  lprops->dirty);
 				return -EINVAL;
 			}
+			break;
 		case LPROPS_FREEABLE:
 		case LPROPS_FRDI_IDX:
 			if (lprops->free + lprops->dirty != c->leb_size) {
@@ -2206,6 +2207,7 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 					  lprops->dirty);
 				return -EINVAL;
 			}
+			break;
 		}
 	}
 	return 0;
-- 
1.8.1.4
