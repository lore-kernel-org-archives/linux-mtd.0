Received: from m12-15.163.com ([220.181.12.15])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e8mu6-0006aS-0P
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 12:41:28 +0000
From: Pan Bian <bianpan2016@163.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pan Bian <bianpan2016@163.com>
Subject: ubi: fastmap: use kmem_cache_free to deallocate memory
Date: Sun, 29 Oct 2017 20:40:02 +0800
Message-Id: <1509280802-14620-1-git-send-email-bianpan2016@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Memory allocated by kmem_cache_alloc() should not be deallocated with
kfree(). Use kmem_cache_free() instead.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 5a832bc..717db749 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1063,7 +1063,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
 		if (!e) {
 			while (i--)
-				kfree(fm->e[i]);
+				kmem_cache_free(ubi_wl_entry_slab, fm->e[i]);
 
 			ret = -ENOMEM;
 			goto free_hdr;
-- 
1.9.1
