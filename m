Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JliXF-0006Tp-Ov
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 10:37:10 +0000
Message-Id: <20080415103707.763265750@fluff.org.uk>
References: <20080415103617.924928338@fluff.org.uk>
Date: Tue, 15 Apr 2008 11:36:18 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: S3C2410 Fix previous nFCE suspend save patch
Content-Disposition: inline;
	filename=simtec/simtec-drivers-mtd-nand-s3c24xx-fixsuspend.patch
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 03680b1e00d146df718c8a4eac34438566b70c85 incorrectly
was assuming S3C2410_NFCONF was being used to select the
NAND chip. Fix this error by ising the sel_reg.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Index: linux-2.6.25-rc9-quilt2/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.25-rc9-quilt2.orig/drivers/mtd/nand/s3c2410.c	2008-04-15 10:56:07.000000000 +0100
+++ linux-2.6.25-rc9-quilt2/drivers/mtd/nand/s3c2410.c	2008-04-15 11:02:11.000000000 +0100
@@ -118,9 +118,8 @@ struct s3c2410_nand_info {
 	void __iomem			*regs;
 	void __iomem			*sel_reg;
 	int				sel_bit;
-	int				mtd_count;
-
-	unsigned long			save_nfconf;
+	int				mtd_count;       
+	unsigned long			save_sel;
 
 	enum s3c_cpu_type		cpu_type;
 };
@@ -810,15 +809,14 @@ static int s3c24xx_nand_suspend(struct p
 	struct s3c2410_nand_info *info = platform_get_drvdata(dev);
 
 	if (info) {
-		info->save_nfconf = readl(info->regs + S3C2410_NFCONF);
+		info->save_sel = readl(info->sel_reg);
 
 		/* For the moment, we must ensure nFCE is high during
 		 * the time we are suspended. This really should be
 		 * handled by suspending the MTDs we are using, but
 		 * that is currently not the case. */
 
-		writel(info->save_nfconf | info->sel_bit,
-		       info->regs + S3C2410_NFCONF);
+		writel(info->save_sel | info->sel_bit, info->sel_reg);
 
 		if (!allow_clk_stop(info))
 			clk_disable(info->clk);
@@ -830,18 +828,18 @@ static int s3c24xx_nand_suspend(struct p
 static int s3c24xx_nand_resume(struct platform_device *dev)
 {
 	struct s3c2410_nand_info *info = platform_get_drvdata(dev);
-	unsigned long nfconf;
+	unsigned long sel;
 
 	if (info) {
 		clk_enable(info->clk);
 		s3c2410_nand_inithw(info, dev);
-
+		
 		/* Restore the state of the nFCE line. */
 
-		nfconf = readl(info->regs + S3C2410_NFCONF);
-		nfconf &= ~info->sel_bit;
-		nfconf |= info->save_nfconf & info->sel_bit;
-		writel(nfconf, info->regs + S3C2410_NFCONF);
+		sel = readl(info->sel_reg);
+		sel &= ~info->sel_bit;
+		sel |= info->save_sel & info->sel_bit;
+		writel(sel, info->sel_reg);
 
 		if (allow_clk_stop(info))
 			clk_disable(info->clk);

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
