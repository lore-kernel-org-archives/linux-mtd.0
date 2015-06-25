Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7wqi-0000bH-0A
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 02:25:08 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [PATCH V3 1/2] mtd: nandsim: fix free of NULL pointer
Date: Thu, 25 Jun 2015 02:23:13 +0000
Message-ID: <1435198994-110948-2-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1435198994-110948-1-git-send-email-shengyong1@huawei.com>
References: <1435198994-110948-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: richard@nod.at, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If allocating ns->nand_pages_slab fails, do not try to destroy it when
cleaning up nandsim resources.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/nand/nandsim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 52c0c1a..6a74f62 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -649,7 +649,8 @@ static void free_device(struct nandsim *ns)
 				kmem_cache_free(ns->nand_pages_slab,
 						ns->pages[i].byte);
 		}
-		kmem_cache_destroy(ns->nand_pages_slab);
+		if (ns->nand_pages_slab)
+			kmem_cache_destroy(ns->nand_pages_slab);
 		vfree(ns->pages);
 	}
 }
-- 
1.8.3.4
