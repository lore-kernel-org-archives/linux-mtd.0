Received: from dns1.vpop.net ([216.193.240.2] helo=mail.vpop.net)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjHSU-0006LV-0y
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 17:45:58 +0100
From: Matt Reimer <mattjreimer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: make s3c2410's correct_data indicate an error for
	multi-bit read errors
Date: Sat, 20 Oct 2007 09:44:47 -0700
Message-Id: <1192898687-12818-1-git-send-email-mattjreimer@gmail.com>
Cc: Matt Reimer <mreimer@vpop.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matt Reimer <mreimer@vpop.net>

If there were multiple bit errors in the data s3c2410_nand_correct_data()
was returning 0 (no error) instead of -1, so the upper layers (like JFFS2)
would not know the data is corrupt.

Signed-off-by: Matt Reimer <mreimer@vpop.net>
---
 drivers/mtd/nand/s3c2410.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 077fdcc..1aa3a18 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -397,7 +397,7 @@ static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 	if ((diff0 & ~(1<<fls(diff0))) == 0)
 		return 1;
 
-	return 0;
+	return -EBADMSG;
 }
 
 /* ECC functions
-- 
1.5.3.2
