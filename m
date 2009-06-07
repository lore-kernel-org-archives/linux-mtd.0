Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MDI31-0004Bx-10
	for linux-mtd@lists.infradead.org; Sun, 07 Jun 2009 13:04:33 +0000
Received: by fxm8 with SMTP id 8so2684782fxm.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 07 Jun 2009 06:04:24 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: ben-linux@fluff.org, David.Woodhouse@intel.com,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH] nand/s3c2410: s3c2410_nand_setrate(): use correct macros for
	2412/2440
Date: Sun,  7 Jun 2009 15:04:22 +0200
Message-Id: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
Cc: wookey@wookware.org
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
index 89b7905..01a105e 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -253,9 +253,9 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 
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
