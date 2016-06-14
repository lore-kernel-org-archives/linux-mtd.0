Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCjSt-0007BM-0E
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 08:12:53 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/7] ubi: Fix scan_fast() comment
Date: Tue, 14 Jun 2016 10:12:12 +0200
Message-Id: <1465891938-4063-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index c1aaf03..cc04ca8 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1326,7 +1326,7 @@ static struct ubi_attach_info *alloc_ai(void)
 #ifdef CONFIG_MTD_UBI_FASTMAP
 
 /**
- * scan_fastmap - try to find a fastmap and attach from it.
+ * scan_fast - try to find a fastmap and attach from it.
  * @ubi: UBI device description object
  * @ai: attach info object
  *
-- 
2.7.3
