Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGvXJ-0003ce-GD
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 06:09:41 -0500
Date: Tue, 13 Feb 2007 11:09:21 +0000
From: Ben Dooks <ben@fluff.org.uk>
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: PATCH: calculate s3c2410 NAND timing values more accurately
Message-ID: <20070213110921.GB2211@fluff.org.uk>
References: <f383264b0702121139w7b5dc50ds8bdd96b708c1336d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f383264b0702121139w7b5dc50ds8bdd96b708c1336d@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 12, 2007 at 11:39:55AM -0800, Matt Reimer wrote:
> Calculate NAND timing values more accurately on S3C2410, 2412, and
> 2440, whose registers differ slightly:
> 
> Enforce the TACLS max value as 3 on 2440 but 7 on 2410/2412.
> 
> Also, make it possible to specify a value of 0 on 2412/2440.
> 
> Signed-off-by: Matt Reimer <mreimer@vpop.net>

Please in-line your patches next time, this makes it much easier
to make comments, like this:

--- a/drivers/mtd/nand/s3c2410.c	Tue Jan 30 12:54:43 2007
+++ b/drivers/mtd/nand/s3c2410.c	Tue Jan 30 12:54:43 2007
@@ -168,9 +169,6 @@ static int s3c_nand_calc_rate(int wanted
 		return -1;
 	}
 
-	if (result < 1)
-		result = 1;
-

 	return result;
 }
 
@@ -183,7 +181,7 @@ static int s3c2410_nand_inithw(struct s3
 {
 	struct s3c2410_platform_nand *plat = to_nand_plat(pdev);
 	unsigned long clkrate = clk_get_rate(info->clk);
-	int tacls_max = (info->cpu_type == TYPE_S3C2412) ? 8 : 4;
+	int tacls_max = (info->cpu_type == TYPE_S3C2440) ? 4 : 8;
 	int tacls, twrph0, twrph1;
 	unsigned long cfg = 0;
 
@@ -207,26 +205,34 @@ static int s3c2410_nand_inithw(struct s3
 		return -EINVAL;
 	}
 
-	dev_info(info->device, "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
-	       tacls, to_ns(tacls, clkrate), twrph0, to_ns(twrph0, clkrate), twrph1, to_ns(twrph1, clkrate));
-
  	switch (info->cpu_type) {
  	case TYPE_S3C2410:
 		cfg = S3C2410_NFCONF_EN;
 		cfg |= S3C2410_NFCONF_TACLS(tacls - 1);
 		cfg |= S3C2410_NFCONF_TWRPH0(twrph0 - 1);
 		cfg |= S3C2410_NFCONF_TWRPH1(twrph1 - 1);
+
+		dev_info(info->device, "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
+			 tacls - 1, to_ns(tacls, clkrate),
+			 twrph0 - 1, to_ns(twrph0, clkrate),
+			 twrph1 - 1, to_ns(twrph1, clkrate));
+
 		break;
 
  	case TYPE_S3C2440:
  	case TYPE_S3C2412:
-		cfg = S3C2440_NFCONF_TACLS(tacls - 1);
+		cfg = S3C2440_NFCONF_TACLS(tacls);
 		cfg |= S3C2440_NFCONF_TWRPH0(twrph0 - 1);
 		cfg |= S3C2440_NFCONF_TWRPH1(twrph1 - 1);

According to the S3C2440A datasheet, the duration is defined
as `HCLK * (TACLS+1)` unlike the S3C2412 which defines it as
`HCLK * TALCS`.
 
 		/* enable the controller and de-assert nFCE */
 
 		writel(S3C2440_NFCONT_ENABLE, info->regs + S3C2440_NFCONT);
+
+		dev_info(info->device, "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
+			 tacls, to_ns(tacls, clkrate),
+			 twrph0 - 1, to_ns(twrph0, clkrate),
+			 twrph1 - 1, to_ns(twrph1, clkrate));
 	}
 
 	dev_dbg(info->device, "NF_CONF is 0x%lx\n", cfg);

I'll post the patch I've done

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
