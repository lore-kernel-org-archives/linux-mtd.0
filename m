Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGva0-0003p6-6F
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 06:12:27 -0500
Date: Tue, 13 Feb 2007 11:12:04 +0000
From: Ben Dooks <ben@fluff.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] S3C2412 TACLS rate calculation fix
Message-ID: <20070213111204.GC2211@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: mreimer@vpop.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The TALCs value on the S3C2412 value does not have
an +1 adjustment unlike the S3C2410 and S3C2440.

The TALCs value on the S3C2440 is only 2 bits instead
of three, so change it to a maximum of 4.

Re-work of an patch by Matt Reimer <mreimer@vpop.net>

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

diff -urpN -X ../dontdiff linux-2.6.20-rmk-12feb2007/drivers/mtd/nand/s3c2410.c linux-2.6.20-rmk-12feb2007-bjd1/drivers/mtd/nand/s3c2410.c
--- linux-2.6.20-rmk-12feb2007/drivers/mtd/nand/s3c2410.c	2007-02-04 18:44:54.000000000 +0000
+++ linux-2.6.20-rmk-12feb2007-bjd1/drivers/mtd/nand/s3c2410.c	2007-02-13 10:53:54.000000000 +0000
@@ -183,15 +183,17 @@ static int s3c2410_nand_inithw(struct s3
 {
 	struct s3c2410_platform_nand *plat = to_nand_plat(pdev);
 	unsigned long clkrate = clk_get_rate(info->clk);
-	int tacls_max = (info->cpu_type == TYPE_S3C2412) ? 8 : 4;
+	int tacls_max = (info->cpu_type == TYPE_S3C2440) ? 3 : 7;
+	int tacls_adj = (info->cpu_type == TYPE_S3C2412) ? 0 : -1;
 	int tacls, twrph0, twrph1;
 	unsigned long cfg = 0;
 
 	/* calculate the timing information for the controller */
 
 	clkrate /= 1000;	/* turn clock into kHz for ease of use */
+	tacls_max -= tacls_adj;
 
-	if (plat != NULL) {
+	if (plat != NULL) {	
 		tacls = s3c_nand_calc_rate(plat->tacls, clkrate, tacls_max);
 		twrph0 = s3c_nand_calc_rate(plat->twrph0, clkrate, 8);
 		twrph1 = s3c_nand_calc_rate(plat->twrph1, clkrate, 8);
@@ -207,20 +209,23 @@ static int s3c2410_nand_inithw(struct s3
 		return -EINVAL;
 	}
 
-	dev_info(info->device, "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
-	       tacls, to_ns(tacls, clkrate), twrph0, to_ns(twrph0, clkrate), twrph1, to_ns(twrph1, clkrate));
+	dev_info(info->device,
+		 "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
+		 tacls, to_ns(tacls, clkrate),
+		 twrph0, to_ns(twrph0, clkrate),
+		 twrph1, to_ns(twrph1, clkrate));
 
  	switch (info->cpu_type) {
  	case TYPE_S3C2410:
 		cfg = S3C2410_NFCONF_EN;
-		cfg |= S3C2410_NFCONF_TACLS(tacls - 1);
+		cfg |= S3C2410_NFCONF_TACLS(tacls + tacls_adj);
 		cfg |= S3C2410_NFCONF_TWRPH0(twrph0 - 1);
 		cfg |= S3C2410_NFCONF_TWRPH1(twrph1 - 1);
 		break;
 
  	case TYPE_S3C2440:
  	case TYPE_S3C2412:
-		cfg = S3C2440_NFCONF_TACLS(tacls - 1);
+		cfg = S3C2440_NFCONF_TACLS(tacls + tacls_adj);
 		cfg |= S3C2440_NFCONF_TWRPH0(twrph0 - 1);
 		cfg |= S3C2440_NFCONF_TWRPH1(twrph1 - 1);
 
