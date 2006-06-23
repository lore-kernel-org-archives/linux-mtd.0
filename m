Received: from host-84-9-201-23.bulldogdsl.com ([84.9.201.23]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fts5M-0002I6-Ia
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 16:17:13 -0400
Date: Fri, 23 Jun 2006 21:16:51 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: s3c2412 support in s3c2410.c
Message-ID: <20060623201651.GB12107@home.fluff.org>
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

Add support for both the S3C2412 and S3C2412 Samsung SoCs to
the increasingly mis-named s3c2410.c driver.

This currently only supports SLC ECCs, and a chip on nFCE0.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

--- linux-2.6.17-git5/drivers/mtd/nand/s3c2410.c	2006-06-23 10:57:33.000000000 +0100
+++ linux-2.6.17-git5-s3c2412-rel1/drivers/mtd/nand/s3c2410.c	2006-06-23 20:45:41.000000000 +0100
@@ -99,6 +99,12 @@ struct s3c2410_nand_mtd {
 	int				scan_res;
 };
 
+enum s3c_cpu_type {
+	TYPE_S3C2410,
+	TYPE_S3C2412,
+	TYPE_S3C2440,
+};
+
 /* overview of the s3c2410 nand state */
 
 struct s3c2410_nand_info {
@@ -112,9 +118,11 @@ struct s3c2410_nand_info {
 	struct resource			*area;
 	struct clk			*clk;
 	void __iomem			*regs;
+	void __iomem			*sel_reg;
+	int				sel_bit;
 	int				mtd_count;
 
-	unsigned char			is_s3c2440;
+	enum s3c_cpu_type		cpu_type;
 };
 
 /* conversion functions */
@@ -148,7 +156,7 @@ static inline int allow_clk_stop(struct 
 
 #define NS_IN_KHZ 1000000
 
-static int s3c2410_nand_calc_rate(int wanted, unsigned long clk, int max)
+static int s3c_nand_calc_rate(int wanted, unsigned long clk, int max)
 {
 	int result;
 
@@ -172,24 +180,26 @@ static int s3c2410_nand_calc_rate(int wa
 
 /* controller setup */
 
-static int s3c2410_nand_inithw(struct s3c2410_nand_info *info, struct platform_device *pdev)
+static int s3c2410_nand_inithw(struct s3c2410_nand_info *info,
+			       struct platform_device *pdev)
 {
 	struct s3c2410_platform_nand *plat = to_nand_plat(pdev);
 	unsigned long clkrate = clk_get_rate(info->clk);
+	int tacls_max = (info->cpu_type == TYPE_S3C2412) ? 8 : 4;
 	int tacls, twrph0, twrph1;
-	unsigned long cfg;
+	unsigned long cfg = 0;
 
 	/* calculate the timing information for the controller */
 
 	clkrate /= 1000;	/* turn clock into kHz for ease of use */
 
 	if (plat != NULL) {
-		tacls = s3c2410_nand_calc_rate(plat->tacls, clkrate, 4);
-		twrph0 = s3c2410_nand_calc_rate(plat->twrph0, clkrate, 8);
-		twrph1 = s3c2410_nand_calc_rate(plat->twrph1, clkrate, 8);
+		tacls = s3c_nand_calc_rate(plat->tacls, clkrate, tacls_max);
+		twrph0 = s3c_nand_calc_rate(plat->twrph0, clkrate, 8);
+		twrph1 = s3c_nand_calc_rate(plat->twrph1, clkrate, 8);
 	} else {
 		/* default timings */
-		tacls = 4;
+		tacls = tacls_max;
 		twrph0 = 8;
 		twrph1 = 8;
 	}
@@ -202,20 +212,23 @@ static int s3c2410_nand_inithw(struct s3
 	printk(KERN_INFO PFX "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
 	       tacls, to_ns(tacls, clkrate), twrph0, to_ns(twrph0, clkrate), twrph1, to_ns(twrph1, clkrate));
 
-	if (!info->is_s3c2440) {
+ 	switch (info->cpu_type) {
+ 	case TYPE_S3C2410:
 		cfg = S3C2410_NFCONF_EN;
 		cfg |= S3C2410_NFCONF_TACLS(tacls - 1);
 		cfg |= S3C2410_NFCONF_TWRPH0(twrph0 - 1);
 		cfg |= S3C2410_NFCONF_TWRPH1(twrph1 - 1);
-	} else {
+		break;
+
+ 	case TYPE_S3C2440:
+ 	case TYPE_S3C2412:
 		cfg = S3C2440_NFCONF_TACLS(tacls - 1);
 		cfg |= S3C2440_NFCONF_TWRPH0(twrph0 - 1);
 		cfg |= S3C2440_NFCONF_TWRPH1(twrph1 - 1);
 
 		/* enable the controller and de-assert nFCE */
 
-		writel(S3C2440_NFCONT_ENABLE | S3C2440_NFCONT_ENABLE,
-		       info->regs + S3C2440_NFCONT);
+		writel(S3C2440_NFCONT_ENABLE, info->regs + S3C2440_NFCONT);
 	}
 
 	pr_debug(PFX "NF_CONF is 0x%lx\n", cfg);
@@ -231,23 +244,18 @@ static void s3c2410_nand_select_chip(str
 	struct s3c2410_nand_info *info;
 	struct s3c2410_nand_mtd *nmtd;
 	struct nand_chip *this = mtd->priv;
-	void __iomem *reg;
 	unsigned long cur;
-	unsigned long bit;
 
 	nmtd = this->priv;
 	info = nmtd->info;
 
-	bit = (info->is_s3c2440) ? S3C2440_NFCONT_nFCE : S3C2410_NFCONF_nFCE;
-	reg = info->regs + ((info->is_s3c2440) ? S3C2440_NFCONT : S3C2410_NFCONF);
-
 	if (chip != -1 && allow_clk_stop(info))
 		clk_enable(info->clk);
 
-	cur = readl(reg);
+	cur = readl(info->sel_reg);
 
 	if (chip == -1) {
-		cur |= bit;
+		cur |= info->sel_bit;
 	} else {
 		if (nmtd->set != NULL && chip > nmtd->set->nr_chips) {
 			printk(KERN_ERR PFX "chip %d out of range\n", chip);
@@ -259,10 +267,10 @@ static void s3c2410_nand_select_chip(str
 				(info->platform->select_chip) (nmtd->set, chip);
 		}
 
-		cur &= ~bit;
+		cur &= ~info->sel_bit;
 	}
 
-	writel(cur, reg);
+	writel(cur, info->sel_reg);
 
 	if (chip == -1 && allow_clk_stop(info))
 		clk_disable(info->clk);
@@ -311,15 +319,25 @@ static void s3c2440_nand_hwcontrol(struc
 static int s3c2410_nand_devready(struct mtd_info *mtd)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
-
-	if (info->is_s3c2440)
-		return readb(info->regs + S3C2440_NFSTAT) & S3C2440_NFSTAT_READY;
 	return readb(info->regs + S3C2410_NFSTAT) & S3C2410_NFSTAT_BUSY;
 }
 
+static int s3c2440_nand_devready(struct mtd_info *mtd)
+{
+	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
+	return readb(info->regs + S3C2440_NFSTAT) & S3C2440_NFSTAT_READY;
+}
+
+static int s3c2412_nand_devready(struct mtd_info *mtd)
+{
+	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
+	return readb(info->regs + S3C2412_NFSTAT) & S3C2412_NFSTAT_READY;
+}
+
 /* ECC handling functions */
 
-static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat, u_char *read_ecc, u_char *calc_ecc)
+static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
+				     u_char *read_ecc, u_char *calc_ecc)
 {
 	pr_debug("s3c2410_nand_correct_data(%p,%p,%p,%p)\n", mtd, dat, read_ecc, calc_ecc);
 
@@ -487,11 +505,8 @@ static void s3c2410_nand_init_chip(struc
 				   struct s3c2410_nand_set *set)
 {
 	struct nand_chip *chip = &nmtd->chip;
+	void __iomem *regs = info->regs;
 
-	chip->IO_ADDR_R	   = info->regs + S3C2410_NFDATA;
-	chip->IO_ADDR_W    = info->regs + S3C2410_NFDATA;
-	chip->cmd_ctrl     = s3c2410_nand_hwcontrol;
-	chip->dev_ready    = s3c2410_nand_devready;
 	chip->write_buf    = s3c2410_nand_write_buf;
 	chip->read_buf     = s3c2410_nand_read_buf;
 	chip->select_chip  = s3c2410_nand_select_chip;
@@ -500,11 +515,37 @@ static void s3c2410_nand_init_chip(struc
 	chip->options	   = 0;
 	chip->controller   = &info->controller;
 
-	if (info->is_s3c2440) {
-		chip->IO_ADDR_R	 = info->regs + S3C2440_NFDATA;
-		chip->IO_ADDR_W  = info->regs + S3C2440_NFDATA;
-		chip->cmd_ctrl   = s3c2440_nand_hwcontrol;
-	}
+	switch (info->cpu_type) {
+	case TYPE_S3C2410:
+		chip->IO_ADDR_W = regs + S3C2410_NFDATA;
+		info->sel_reg   = regs + S3C2410_NFCONF;
+		info->sel_bit	= S3C2410_NFCONF_nFCE;
+		chip->cmd_ctrl  = s3c2410_nand_hwcontrol;
+		chip->dev_ready = s3c2410_nand_devready;
+		break;
+
+	case TYPE_S3C2440:
+		chip->IO_ADDR_W = regs + S3C2440_NFDATA;
+		info->sel_reg   = regs + S3C2440_NFCONT;
+		info->sel_bit	= S3C2440_NFCONT_nFCE;
+		chip->cmd_ctrl  = s3c2440_nand_hwcontrol;
+		chip->dev_ready = s3c2440_nand_devready;
+		break;
+
+	case TYPE_S3C2412:
+		chip->IO_ADDR_W = regs + S3C2440_NFDATA;
+		info->sel_reg   = regs + S3C2440_NFCONT;
+		info->sel_bit	= S3C2412_NFCONT_nFCE0;
+		chip->cmd_ctrl  = s3c2440_nand_hwcontrol;
+		chip->dev_ready = s3c2412_nand_devready;
+
+		if (readl(regs + S3C2410_NFCONF) & S3C2412_NFCONF_NANDBOOT)
+			dev_info(info->device, "System booted from NAND\n");
+
+		break;
+  	}
+
+	chip->IO_ADDR_R = chip->IO_ADDR_W;
 
 	nmtd->info	   = info;
 	nmtd->mtd.priv	   = chip;
@@ -512,17 +553,25 @@ static void s3c2410_nand_init_chip(struc
 	nmtd->set	   = set;
 
 	if (hardware_ecc) {
-		chip->ecc.correct   = s3c2410_nand_correct_data;
-		chip->ecc.hwctl	    = s3c2410_nand_enable_hwecc;
 		chip->ecc.calculate = s3c2410_nand_calculate_ecc;
+		chip->ecc.correct   = s3c2410_nand_correct_data;
 		chip->ecc.mode	    = NAND_ECC_HW;
 		chip->ecc.size	    = 512;
 		chip->ecc.bytes	    = 3;
 		chip->ecc.layout    = &nand_hw_eccoob;
 
-		if (info->is_s3c2440) {
-			chip->ecc.hwctl     = s3c2440_nand_enable_hwecc;
-			chip->ecc.calculate = s3c2440_nand_calculate_ecc;
+		switch (info->cpu_type) {
+		case TYPE_S3C2410:
+			chip->ecc.hwctl	    = s3c2410_nand_enable_hwecc;
+			chip->ecc.calculate = s3c2410_nand_calculate_ecc;
+			break;
+
+		case TYPE_S3C2412:
+		case TYPE_S3C2440:
+  			chip->ecc.hwctl     = s3c2440_nand_enable_hwecc;
+  			chip->ecc.calculate = s3c2440_nand_calculate_ecc;
+			break;
+
 		}
 	} else {
 		chip->ecc.mode	    = NAND_ECC_SOFT;
@@ -537,7 +586,8 @@ static void s3c2410_nand_init_chip(struc
  * nand layer to look for devices
 */
 
-static int s3c24xx_nand_probe(struct platform_device *pdev, int is_s3c2440)
+static int s3c24xx_nand_probe(struct platform_device *pdev,
+			      enum s3c_cpu_type cpu_type)
 {
 	struct s3c2410_platform_nand *plat = to_nand_plat(pdev);
 	struct s3c2410_nand_info *info;
@@ -592,7 +642,7 @@ static int s3c24xx_nand_probe(struct pla
 	info->device     = &pdev->dev;
 	info->platform   = plat;
 	info->regs       = ioremap(res->start, size);
-	info->is_s3c2440 = is_s3c2440;
+	info->cpu_type   = cpu_type;
 
 	if (info->regs == NULL) {
 		dev_err(&pdev->dev, "cannot reserve register region\n");
@@ -699,12 +749,17 @@ static int s3c24xx_nand_resume(struct pl
 
 static int s3c2410_nand_probe(struct platform_device *dev)
 {
-	return s3c24xx_nand_probe(dev, 0);
+	return s3c24xx_nand_probe(dev, TYPE_S3C2410);
 }
 
 static int s3c2440_nand_probe(struct platform_device *dev)
 {
-	return s3c24xx_nand_probe(dev, 1);
+	return s3c24xx_nand_probe(dev, TYPE_S3C2440);
+}
+
+static int s3c2412_nand_probe(struct platform_device *dev)
+{
+	return s3c24xx_nand_probe(dev, TYPE_S3C2412);
 }
 
 static struct platform_driver s3c2410_nand_driver = {
@@ -729,16 +784,29 @@ static struct platform_driver s3c2440_na
 	},
 };
 
+static struct platform_driver s3c2412_nand_driver = {
+	.probe		= s3c2412_nand_probe,
+	.remove		= s3c2410_nand_remove,
+	.suspend	= s3c24xx_nand_suspend,
+	.resume		= s3c24xx_nand_resume,
+	.driver		= {
+		.name	= "s3c2412-nand",
+		.owner	= THIS_MODULE,
+	},
+};
+
 static int __init s3c2410_nand_init(void)
 {
 	printk("S3C24XX NAND Driver, (c) 2004 Simtec Electronics\n");
 
+	platform_driver_register(&s3c2412_nand_driver);
 	platform_driver_register(&s3c2440_nand_driver);
 	return platform_driver_register(&s3c2410_nand_driver);
 }
 
 static void __exit s3c2410_nand_exit(void)
 {
+	platform_driver_unregister(&s3c2412_nand_driver);
 	platform_driver_unregister(&s3c2440_nand_driver);
 	platform_driver_unregister(&s3c2410_nand_driver);
 }
--- linux-2.6.17-git5/include/asm-arm/arch-s3c2410/regs-nand.h	2006-06-18 02:49:35.000000000 +0100
+++ linux-2.6.17-git5-s3c2412-rel1/include/asm-arm/arch-s3c2410/regs-nand.h	2006-06-23 20:17:08.000000000 +0100
@@ -39,10 +39,19 @@
 #define S3C2440_NFESTAT1 S3C2410_NFREG(0x28)
 #define S3C2440_NFMECC0  S3C2410_NFREG(0x2C)
 #define S3C2440_NFMECC1  S3C2410_NFREG(0x30)
-#define S3C2440_NFSECC   S3C2410_NFREG(0x34)
+#define S3C2440_NFSECC   S3C24E10_NFREG(0x34)
 #define S3C2440_NFSBLK   S3C2410_NFREG(0x38)
 #define S3C2440_NFEBLK   S3C2410_NFREG(0x3C)
 
+#define S3C2412_NFSBLK		S3C2410_NFREG(0x20)
+#define S3C2412_NFEBLK		S3C2410_NFREG(0x24)
+#define S3C2412_NFSTAT		S3C2410_NFREG(0x28)
+#define S3C2412_NFMECC_ERR0	S3C2410_NFREG(0x2C)
+#define S3C2412_NFMECC_ERR1	S3C2410_NFREG(0x30)
+#define S3C2412_NFMECC0		S3C2410_NFREG(0x34)
+#define S3C2412_NFMECC1		S3C2410_NFREG(0x38)
+#define S3C2412_NFSECC		S3C2410_NFREG(0x3C)
+
 #define S3C2410_NFCONF_EN          (1<<15)
 #define S3C2410_NFCONF_512BYTE     (1<<14)
 #define S3C2410_NFCONF_4STEP       (1<<13)
@@ -77,5 +86,42 @@
 #define S3C2440_NFSTAT_RnB_CHANGE	(1<<2)
 #define S3C2440_NFSTAT_ILLEGAL_ACCESS	(1<<3)
 
+#define S3C2412_NFCONF_NANDBOOT		(1<<31)
+#define S3C2412_NFCONF_ECCCLKCON	(1<<30)
+#define S3C2412_NFCONF_ECC_MLC		(1<<24)
+#define S3C2412_NFCONF_TACLS_MASK	(7<<12)	/* 1 extra bit of Tacls */
+
+#define S3C2412_NFCONT_ECC4_DIRWR	(1<<18)
+#define S3C2412_NFCONT_LOCKTIGHT	(1<<17)
+#define S3C2412_NFCONT_SOFTLOCK		(1<<16)
+#define S3C2412_NFCONT_ECC4_ENCINT	(1<<13)
+#define S3C2412_NFCONT_ECC4_DECINT	(1<<12)
+#define S3C2412_NFCONT_MAIN_ECC_LOCK	(1<<7)
+#define S3C2412_NFCONT_INIT_MAIN_ECC	(1<<5)
+#define S3C2412_NFCONT_nFCE1		(1<<2)
+#define S3C2412_NFCONT_nFCE0		(1<<1)
+
+#define S3C2412_NFSTAT_ECC_ENCDONE	(1<<7)
+#define S3C2412_NFSTAT_ECC_DECDONE	(1<<6)
+#define S3C2412_NFSTAT_ILLEGAL_ACCESS	(1<<5)
+#define S3C2412_NFSTAT_RnB_CHANGE	(1<<4)
+#define S3C2412_NFSTAT_nFCE1		(1<<3)
+#define S3C2412_NFSTAT_nFCE0		(1<<2)
+#define S3C2412_NFSTAT_Res1		(1<<1)
+#define S3C2412_NFSTAT_READY		(1<<0)
+
+#define S3C2412_NFECCERR_SERRDATA(x)	(((x) >> 21) & 0xf)
+#define S3C2412_NFECCERR_SERRBIT(x)	(((x) >> 18) & 0x7)
+#define S3C2412_NFECCERR_MERRDATA(x)	(((x) >> 7) & 0x3ff)
+#define S3C2412_NFECCERR_MERRBIT(x)	(((x) >> 4) & 0x7)
+#define S3C2412_NFECCERR_SPARE_ERR(x)	(((x) >> 2) & 0x3)
+#define S3C2412_NFECCERR_MAIN_ERR(x)	(((x) >> 2) & 0x3)
+#define S3C2412_NFECCERR_NONE		(0)
+#define S3C2412_NFECCERR_1BIT		(1)
+#define S3C2412_NFECCERR_MULTIBIT	(2)
+#define S3C2412_NFECCERR_ECCAREA	(3)
+
+
+
 #endif /* __ASM_ARM_REGS_NAND */
 
