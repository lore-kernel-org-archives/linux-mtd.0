Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATF7-0000AA-8T
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:25:25 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Uninitialised variable cleanup
Date: Sat, 30 May 2009 18:41:32 +0100
Message-Id: <1243705298-21814-6-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-5-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
Cc: Nelson Castillo <arhuaco@freaks-unidos.net>,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Nelson Castillo <arhuaco@freaks-unidos.net>

~ Avoid warning without generating code.
  (I don't even get the warning without the macro uninitialized_var).

Signed-off-by: Nelson Castillo <arhuaco@freaks-unidos.net>
[ben-linux@fluff.org: subject cleanup]
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/mtd/nand/s3c2410.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index daa4af9..7be3663 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -214,7 +214,7 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 	int tacls_max = (info->cpu_type == TYPE_S3C2412) ? 8 : 4;
 	int tacls, twrph0, twrph1;
 	unsigned long clkrate = clk_get_rate(info->clk);
-	unsigned long set, cfg, mask;
+	unsigned long uninitialized_var(set), cfg, uninitialized_var(mask);
 	unsigned long flags;
 
 	/* calculate the timing information for the controller */
@@ -264,9 +264,6 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 		break;
 
 	default:
-		/* keep compiler happy */
-		mask = 0;
-		set = 0;
 		BUG();
 	}
 
-- 
1.5.6.5
