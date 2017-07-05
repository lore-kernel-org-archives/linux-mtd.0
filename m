Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSnGE-0006Zn-Uv
 for linux-mtd@lists.infradead.org; Wed, 05 Jul 2017 16:34:44 +0000
Received: by mail-wm0-x242.google.com with SMTP id p204so33699427wmg.1
 for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2017 09:34:21 -0700 (PDT)
From: Romain Izard <romain.izard.pro@gmail.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org,
	Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH] mkfs.ubifs: Only require 17 LEBs
Date: Wed,  5 Jul 2017 18:34:11 +0200
Message-Id: <20170705163411.23546-1-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The minimum size for a UBIFS volume is 17 LEBs. As mkfs.ubifs counted
the reserved log and orphan blocks twice, the program did not allow
such a small volume.

Fix the calculations to be able to build an image with 17 LEBs. With
this, the following command works:

mkfs.ubifs -c 17 -l2 -m 2048 -e 124KiB -o small.ubifs

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 9e69a4f..ba0293c 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -331,6 +331,9 @@ static long long add_space_overhead(long long size)
         return size / divisor;
 }
 
+#define UBIFS_MIN_LEB_NOLOG   (UBIFS_MIN_LEB_CNT - UBIFS_MIN_LOG_LEBS)
+#define UBIFS_MIN_LEB_NOORPH  (UBIFS_MIN_LEB_CNT - UBIFS_MIN_ORPH_LEBS)
+
 static int validate_options(void)
 {
 	int tmp;
@@ -372,15 +375,15 @@ static int validate_options(void)
 	if (c->log_lebs < UBIFS_MIN_LOG_LEBS)
 		return err_msg("too few log LEBs, minimum is %d",
 			       UBIFS_MIN_LOG_LEBS);
-	if (c->log_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
+	if (c->log_lebs > c->max_leb_cnt - UBIFS_MIN_LEB_NOLOG)
 		return err_msg("too many log LEBs, maximum is %d",
-			       c->max_leb_cnt - UBIFS_MIN_LEB_CNT);
+			       c->max_leb_cnt - UBIFS_MIN_LEB_NOLOG);
 	if (c->orph_lebs < UBIFS_MIN_ORPH_LEBS)
 		return err_msg("too few orphan LEBs, minimum is %d",
 			       UBIFS_MIN_ORPH_LEBS);
-	if (c->orph_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
+	if (c->orph_lebs > c->max_leb_cnt - UBIFS_MIN_LEB_NOORPH)
 		return err_msg("too many orphan LEBs, maximum is %d",
-			       c->max_leb_cnt - UBIFS_MIN_LEB_CNT);
+			       c->max_leb_cnt - UBIFS_MIN_LEB_NOORPH);
 	tmp = UBIFS_SB_LEBS + UBIFS_MST_LEBS + c->log_lebs + c->lpt_lebs;
 	tmp += c->orph_lebs + 4;
 	if (tmp > c->max_leb_cnt)
-- 
2.11.0
