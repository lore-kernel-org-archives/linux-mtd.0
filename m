Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBovq-00060v-D0
	for linux-mtd@lists.infradead.org; Wed, 03 Jun 2009 11:47:05 +0000
Received: by fg-out-1718.google.com with SMTP id l27so1242773fgb.3
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Jun 2009 04:46:56 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: linux-mtd@lists.infradead.org,
	dwmw2@infradead.org,
	ben-linux@fluff.org
Subject: [PATCH] nand/s3c2410: s3c2410_nand_setrate(): use correct macros for
	2412/2440
Date: Wed,  3 Jun 2009 13:46:54 +0200
Message-Id: <1244029614-24511-1-git-send-email-jacmet@sunsite.dk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the correct S3C2440_NFCONF_* macros for the mask for the 2412/2440
variants instead of the 2410 ones which use wrong bit positions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 drivers/mtd/nand/s3c2410.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 8e375d5..776756e 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -215,9 +215,9 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 
 	case TYPE_S3C2440:
 	case TYPE_S3C2412:
-		mask = (S3C2410_NFCONF_TACLS(tacls_max - 1) |
-			S3C2410_NFCONF_TWRPH0(7) |
-			S3C2410_NFCONF_TWRPH1(7));
+		mask = (S3C2440_NFCONF_TACLS(tacls_max - 1) |
+			S3C2440_NFCONF_TWRPH0(7) |
+			S3C2440_NFCONF_TWRPH1(7));
 
 		set = S3C2440_NFCONF_TACLS(tacls - 1);
 		set |= S3C2440_NFCONF_TWRPH0(twrph0 - 1);
-- 
1.6.2
