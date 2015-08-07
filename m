Received: from mailout4.w1.samsung.com ([210.118.77.14])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNcaP-0005Wx-VM
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 08:01:06 +0000
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5 2014))
 with ESMTP id <0NSP00GFGCXA6H40@mailout4.w1.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 09:00:46 +0100 (BST)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 25/31] fs/ubifs: use kmemdup rather than duplicating its
 implementation
Date: Fri, 07 Aug 2015 09:59:31 +0200
Message-id: <1438934377-4922-26-git-send-email-a.hajda@samsung.com>
In-reply-to: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
References: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch was generated using fixed coccinelle semantic patch
scripts/coccinelle/api/memdup.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2014320

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 fs/ubifs/lpt.c | 6 ++----
 fs/ubifs/tnc.c | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index dc9f27e..9a51710 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1498,11 +1498,10 @@ static struct ubifs_nnode *dirty_cow_nnode(struct ubifs_info *c,
 	}
 
 	/* nnode is being committed, so copy it */
-	n = kmalloc(sizeof(struct ubifs_nnode), GFP_NOFS);
+	n = kmemdup(nnode, sizeof(struct ubifs_nnode), GFP_NOFS);
 	if (unlikely(!n))
 		return ERR_PTR(-ENOMEM);
 
-	memcpy(n, nnode, sizeof(struct ubifs_nnode));
 	n->cnext = NULL;
 	__set_bit(DIRTY_CNODE, &n->flags);
 	__clear_bit(COW_CNODE, &n->flags);
@@ -1549,11 +1548,10 @@ static struct ubifs_pnode *dirty_cow_pnode(struct ubifs_info *c,
 	}
 
 	/* pnode is being committed, so copy it */
-	p = kmalloc(sizeof(struct ubifs_pnode), GFP_NOFS);
+	p = kmemdup(pnode, sizeof(struct ubifs_pnode), GFP_NOFS);
 	if (unlikely(!p))
 		return ERR_PTR(-ENOMEM);
 
-	memcpy(p, pnode, sizeof(struct ubifs_pnode));
 	p->cnext = NULL;
 	__set_bit(DIRTY_CNODE, &p->flags);
 	__clear_bit(COW_CNODE, &p->flags);
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 957f575..fa9a20c 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -198,11 +198,10 @@ static struct ubifs_znode *copy_znode(struct ubifs_info *c,
 {
 	struct ubifs_znode *zn;
 
-	zn = kmalloc(c->max_znode_sz, GFP_NOFS);
+	zn = kmemdup(znode, c->max_znode_sz, GFP_NOFS);
 	if (unlikely(!zn))
 		return ERR_PTR(-ENOMEM);
 
-	memcpy(zn, znode, c->max_znode_sz);
 	zn->cnext = NULL;
 	__set_bit(DIRTY_ZNODE, &zn->flags);
 	__clear_bit(COW_ZNODE, &zn->flags);
-- 
1.9.1
