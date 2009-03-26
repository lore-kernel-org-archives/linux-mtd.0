Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmyGD-0003Ll-4d
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 22:41:25 +0000
Received: by bwz3 with SMTP id 3so836018bwz.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Mar 2009 15:41:14 -0700 (PDT)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdpart: Make ecc_stats more realistic.
Date: Fri, 27 Mar 2009 00:41:09 +0200
Message-Id: <1238107269-28883-1-git-send-email-jekhor@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Yauhen Kharuzhy <jekhor@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the existing implementation, ecc_stats fields are incremented only by
one, regardless of master mtd errors number. For example, if there are N
errors were corrected by ECC, partition ecc_stats.corrected will be
incremented by one.

This commit changes simple increment to sum of old value and parent mtd
error count.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/mtd/mtdpart.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 3728913..2704a61 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -48,8 +48,11 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
+	struct mtd_ecc_stats stats;
 	int res;
 
+	stats = part->master->ecc_stats;
+
 	if (from >= mtd->size)
 		len = 0;
 	else if (from + len > mtd->size)
@@ -58,9 +61,9 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 				   len, retlen, buf);
 	if (unlikely(res)) {
 		if (res == -EUCLEAN)
-			mtd->ecc_stats.corrected++;
+			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
 		if (res == -EBADMSG)
-			mtd->ecc_stats.failed++;
+			mtd->ecc_stats.failed += part->master->ecc_stats.failed - stats.failed;
 	}
 	return res;
 }
-- 
1.6.2
