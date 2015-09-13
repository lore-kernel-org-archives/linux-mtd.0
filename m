Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zb6ao-0003n8-71
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2015 12:41:14 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 01/39] mtd: nandsim: drop null test before destroy functions
Date: Sun, 13 Sep 2015 14:14:54 +0200
Message-Id: <1442146532-9100-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/nand/nandsim.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 95d0cc4..b16d70a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -649,8 +649,7 @@ static void free_device(struct nandsim *ns)
 				kmem_cache_free(ns->nand_pages_slab,
 						ns->pages[i].byte);
 		}
-		if (ns->nand_pages_slab)
-			kmem_cache_destroy(ns->nand_pages_slab);
+		kmem_cache_destroy(ns->nand_pages_slab);
 		vfree(ns->pages);
 	}
 }
