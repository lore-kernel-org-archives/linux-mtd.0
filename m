Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IuG2H-0006Bp-RG
	for linux-mtd@lists.infradead.org; Mon, 19 Nov 2007 18:28:20 -0500
Date: Mon, 19 Nov 2007 23:28:07 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] NAND: S3C2410 correctly set nFCE over resume
Message-ID: <20071119232807.GA8229@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ensure the nFCE line is de-asserted over suspend and
then re-initialised when the system resumes. This is
to ensure that the NAND is kept in lowest power mode
over suspend (power settings are only specified for
nFCE inactive) as well as fixing the Simtec Osiris
which relies on nFCE being inactive.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

diff -urpN -X linux-2.6.24-rc3/Documentation/dontdiff linux-2.6.24-rc3/drivers/mtd/nand/s3c2410.c linux-2.6.24-rc3-mtd1/drivers/mtd/nand/s3c2410.c
--- linux-2.6.24-rc3/drivers/mtd/nand/s3c2410.c	2007-11-19 16:12:05.000000000 +0000
+++ linux-2.6.24-rc3-mtd1/drivers/mtd/nand/s3c2410.c	2007-11-19 23:25:01.000000000 +0000
@@ -119,6 +119,8 @@ struct s3c2410_nand_info {
 	void __iomem			*sel_reg;
 	int				sel_bit;
 	int				mtd_count;
+	
+	unsigned long			save_nfconf;
 
 	enum s3c_cpu_type		cpu_type;
 };
@@ -810,6 +812,16 @@ static int s3c24xx_nand_suspend(struct p
 	struct s3c2410_nand_info *info = platform_get_drvdata(dev);
 
 	if (info) {
+		info->save_nfconf = readl(info->regs + S3C2410_NFCONF);
+
+		/* For the moment, we must ensure nFCE is high during
+		 * the time we are suspended. This really should be
+		 * handled by suspending the MTDs we are using, but
+		 * that is currently not the case. */
+
+		writel(info->save_nfconf | info->sel_bit,
+		       info->regs + S3C2410_NFCONF);
+
 		if (!allow_clk_stop(info))
 			clk_disable(info->clk);
 	}
@@ -820,10 +832,18 @@ static int s3c24xx_nand_suspend(struct p
 static int s3c24xx_nand_resume(struct platform_device *dev)
 {
 	struct s3c2410_nand_info *info = platform_get_drvdata(dev);
+	unsigned long nfconf;
 
 	if (info) {
 		clk_enable(info->clk);
 		s3c2410_nand_inithw(info, dev);
+		
+		/* Restore the state of the nFCE line. */
+
+		nfconf = readl(info->regs + S3C2410_NFCONF);
+		nfconf &= ~info->sel_bit;
+		nfconf |= info->save_nfconf & info->sel_bit;
+		writel(nfconf, info->regs + S3C2410_NFCONF);
 
 		if (allow_clk_stop(info))
 			clk_disable(info->clk);
