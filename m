Received: from host-84-9-201-23.bulldogdsl.com ([84.9.201.23]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft3vG-0008DG-05
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 10:43:31 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1Ft3v7-00015x-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 15:43:05 +0100
Date: Wed, 21 Jun 2006 15:43:05 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [NAND] S3C2410 convert prinks to dev_*()s
Message-ID: <20060621144305.GA4207@home.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert the use of printk() to the correct dev_info/dev_err
functions

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

diff -urpN -X ../dontdiff linux-2.6.17-git2/drivers/mtd/nand/s3c2410.c linux-2.6.17-git2-mtd1/drivers/mtd/nand/s3c2410.c
--- linux-2.6.17-git2/drivers/mtd/nand/s3c2410.c	2006-06-21 10:00:38.000000000 +0100
+++ linux-2.6.17-git2-mtd1/drivers/mtd/nand/s3c2410.c	2006-06-21 15:32:44.000000000 +0100
@@ -63,8 +63,6 @@
 #include <asm/arch/regs-nand.h>
 #include <asm/arch/nand.h>
 
-#define PFX "s3c2410-nand: "
-
 #ifdef CONFIG_MTD_NAND_S3C2410_HWECC
 static int hardware_ecc = 1;
 #else
@@ -195,11 +193,11 @@ static int s3c2410_nand_inithw(struct s3
 	}
 
 	if (tacls < 0 || twrph0 < 0 || twrph1 < 0) {
-		printk(KERN_ERR PFX "cannot get timings suitable for board\n");
+		dev_err(info->device, "cannot get suitable timings\n");
 		return -EINVAL;
 	}
 
-	printk(KERN_INFO PFX "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
+	dev_info(info->device, "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
 	       tacls, to_ns(tacls, clkrate), twrph0, to_ns(twrph0, clkrate), twrph1, to_ns(twrph1, clkrate));
 
 	if (!info->is_s3c2440) {
@@ -218,7 +216,7 @@ static int s3c2410_nand_inithw(struct s3
 		       info->regs + S3C2440_NFCONT);
 	}
 
-	pr_debug(PFX "NF_CONF is 0x%lx\n", cfg);
+	dev_dbg(info->device, "NF_CONF is 0x%lx\n", cfg);
 
 	writel(cfg, info->regs + S3C2410_NFCONF);
 	return 0;
@@ -250,7 +248,7 @@ static void s3c2410_nand_select_chip(str
 		cur |= bit;
 	} else {
 		if (nmtd->set != NULL && chip > nmtd->set->nr_chips) {
-			printk(KERN_ERR PFX "chip %d out of range\n", chip);
+			dev_err(info->device, "invalid chip %d\n", chip);
 			return;
 		}
 
