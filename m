Received: from [45.249.212.32] (helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecAip-0003Zo-Mr
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 13:59:23 +0000
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] mtd: ubi: wl: Fix error return code in ubi_wl_init()
Date: Thu, 18 Jan 2018 14:05:05 +0000
Message-ID: <1516284305-82544-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix to return error code -ENOMEM from the kmem_cache_alloc() error
handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mtd/ubi/wl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 77ab49f..2052a64 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1617,8 +1617,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		cond_resched();
 
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
-		if (!e)
+		if (!e) {
+			err = -ENOMEM;
 			goto out_free;
+		}
 
 		e->pnum = aeb->pnum;
 		e->ec = aeb->ec;
@@ -1637,8 +1639,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			cond_resched();
 
 			e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
-			if (!e)
+			if (!e) {
+				err = -ENOMEM;
 				goto out_free;
+			}
 
 			e->pnum = aeb->pnum;
 			e->ec = aeb->ec;
