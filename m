Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv2nR-0006nv-En
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 11:36:10 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/6] UBI: Fastmap: Fix memory leaks while closing the WL
 sub-system
Date: Sun, 30 Nov 2014 12:35:35 +0100
Message-Id: <1417347340-6872-2-git-send-email-richard@nod.at>
In-Reply-To: <1417347340-6872-1-git-send-email-richard@nod.at>
References: <1417347340-6872-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a ubi_fastmap_close() to free all resources used by fastmap
at WL shutdown.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index c2822f7..47b215f 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -2064,6 +2064,23 @@ static void protection_queue_destroy(struct ubi_device *ubi)
 	}
 }
 
+static void ubi_fastmap_close(struct ubi_device *ubi)
+{
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	int i;
+
+	flush_work(&ubi->fm_work);
+	return_unused_pool_pebs(ubi, &ubi->fm_pool);
+	return_unused_pool_pebs(ubi, &ubi->fm_wl_pool);
+
+	if (ubi->fm) {
+		for (i = 0; i < ubi->fm->used_blocks; i++)
+			kfree(ubi->fm->e[i]);
+	}
+	kfree(ubi->fm);
+#endif
+}
+
 /**
  * ubi_wl_close - close the wear-leveling sub-system.
  * @ubi: UBI device description object
@@ -2071,9 +2088,7 @@ static void protection_queue_destroy(struct ubi_device *ubi)
 void ubi_wl_close(struct ubi_device *ubi)
 {
 	dbg_wl("close the WL sub-system");
-#ifdef CONFIG_MTD_UBI_FASTMAP
-	flush_work(&ubi->fm_work);
-#endif
+	ubi_fastmap_close(ubi);
 	shutdown_work(ubi);
 	protection_queue_destroy(ubi);
 	tree_destroy(&ubi->used);
-- 
1.8.4.5
