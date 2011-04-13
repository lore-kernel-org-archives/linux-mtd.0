Received: from ns.vscht.cz ([2001:718:3:15::5])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9ws0-0000pc-TB
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 10:00:21 +0000
From: Jiri Pinkava <jiri.pinkava@vscht.cz>
To: <dedekind1@gmail.com>
Subject: [PATCH 2/2] nand: Remove unnecessary variable
Date: Wed, 13 Apr 2011 11:59:31 +0200
Message-ID: <1302688771-17252-2-git-send-email-jiri.pinkava@vscht.cz>
In-Reply-To: <1302688771-17252-1-git-send-email-jiri.pinkava@vscht.cz>
References: <1302665784.14691.5.camel@koala>
	<1302688771-17252-1-git-send-email-jiri.pinkava@vscht.cz>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Jiri Pinkava <jiri.pinkava@vscht.cz>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
---
 drivers/mtd/nand/s3c2410.c |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index cea775a..8041038 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -54,12 +54,6 @@ static int hardware_ecc = 1;
 static int hardware_ecc = 0;
 #endif
 
-#ifdef CONFIG_MTD_NAND_S3C2410_CLKSTOP
-static const int clock_stop = 1;
-#else
-static const int clock_stop = 0;
-#endif
-
 
 /* new oob placement block for use with hardware ecc generation
  */
@@ -169,7 +163,11 @@ static struct s3c2410_platform_nand *to_nand_plat(struct platform_device *dev)
 
 static inline int allow_clk_suspend(struct s3c2410_nand_info *info)
 {
-	return clock_stop;
+#ifdef CONFIG_MTD_NAND_S3C2410_CLKSTOP
+	return 1;
+#else
+	return 0;
+#endif
 }
 
 /**
-- 
1.7.4.4
