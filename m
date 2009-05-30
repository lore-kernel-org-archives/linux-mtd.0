Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATFW-00015k-Q6
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:26:00 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Fix CFG debug order
Date: Sat, 30 May 2009 18:41:33 +0100
Message-Id: <1243705298-21814-7-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-6-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-6-git-send-email-ben-linux@fluff.org>
Cc: Andy Green <andy@warmcat.com>, Nelson Castillo <arhuaco@freaks-unidos.net>,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andy Green <andy@warmcat.com>

Fix NAND CFG debug order.

Signed-off-by: Andy Green <andy@warmcat.com>
Signed-off-by: Nelson Castillo <arhuaco@freaks-unidos.net>
[ben-linux@fluff.org: Change andy@openmoko.com to andy@warmcat.com, subject cleanup]
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/mtd/nand/s3c2410.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 7be3663..87c40de 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -267,8 +267,6 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 		BUG();
 	}
 
-	dev_dbg(info->device, "NF_CONF is 0x%lx\n", cfg);
-
 	local_irq_save(flags);
 
 	cfg = readl(info->regs + S3C2410_NFCONF);
@@ -278,6 +276,8 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 
 	local_irq_restore(flags);
 
+	dev_dbg(info->device, "NF_CONF is 0x%lx\n", cfg);
+
 	return 0;
 }
 
-- 
1.5.6.5
