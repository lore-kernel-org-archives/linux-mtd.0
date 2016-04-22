Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atXzQ-0002ZD-Pt
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 10:07:10 +0000
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd,
 ubi: set free_count to zero before walking through erase list
Date: Fri, 22 Apr 2016 12:06:38 +0200
Message-Id: <1461319598-17157-1-git-send-email-hs@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Set free_count to zero before walking through ai->erase list
in wl_init().

Found in U-Boot as U-Boot has no workqueue/threads, it immediately
calls erase_worker(), which increase for each erased block
free_count. Without this patch, free_count gets after
this initialized to zero in wl_init(), so the free_count
variable always has the maybe wrong value 0 in U-Boot.

Signed-off-by: Heiko Schocher <hs@denx.de>
Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Detected this behaviour on the dxr2 board, where the
UBI fastmap gets not written when attaching/dettaching
on an empty NAND. It drops instead the error message:

could not find any anchor PEB

With this patch, fastmap gets written on dettach.

corresponding U-Boot Thread:
http://lists.denx.de/pipermail/u-boot/2016-April/252338.html

 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 17ec948..959c7b12 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1534,6 +1534,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		INIT_LIST_HEAD(&ubi->pq[i]);
 	ubi->pq_head = 0;
 
+	ubi->free_count = 0;
 	list_for_each_entry_safe(aeb, tmp, &ai->erase, u.list) {
 		cond_resched();
 
@@ -1552,7 +1553,6 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		found_pebs++;
 	}
 
-	ubi->free_count = 0;
 	list_for_each_entry(aeb, &ai->free, u.list) {
 		cond_resched();
 
-- 
2.5.0
