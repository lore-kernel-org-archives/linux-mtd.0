Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N51Oe-0000Lq-M8
	for linux-mtd@lists.infradead.org; Mon, 02 Nov 2009 18:12:57 +0000
Subject: s3c2410: propogate nand options from the platform data
Message-Id: <20091102181251.730102058@fluff.org.uk>
From: Ben Dooks <ben@simtec.co.uk>
To: linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
Content-Disposition: inline; filename=s3c24xx-andn-probe-new3.patch
Date: Mon, 02 Nov 2009 18:12:51 +0000
Cc: Simtec Linux Team <linux@simtec.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update the nand information passed to the core from the platform data to
setup the initial option value, so that flags such as NAND_SCAN_SILENT_NODEV
can pass through.

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

---
 arch/arm/plat-s3c/include/plat/nand.h |    2 ++
 drivers/mtd/nand/s3c2410.c            |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

Index: b/arch/arm/plat-s3c/include/plat/nand.h
===================================================================
--- a/arch/arm/plat-s3c/include/plat/nand.h	2009-11-02 17:37:01.000000000 +0000
+++ b/arch/arm/plat-s3c/include/plat/nand.h	2009-11-02 17:38:32.000000000 +0000
@@ -17,6 +17,7 @@
  *			Setting this flag will allow the kernel to
  *			look for it at boot time and also skip the NAND
  *			scan.
+ * @options:		Default value to set into 'struct nand_chip' options.
  * @nr_chips:		Number of chips in this set
  * @nr_partitions:	Number of partitions pointed to by @partitions
  * @name:		Name of set (optional)
@@ -31,6 +32,7 @@ struct s3c2410_nand_set {
 	unsigned int		disable_ecc:1;
 	unsigned int		flash_bbt:1;
 
+	unsigned int		options;
 	int			nr_chips;
 	int			nr_partitions;
 	char			*name;
Index: b/drivers/mtd/nand/s3c2410.c
===================================================================
--- a/drivers/mtd/nand/s3c2410.c	2009-11-02 17:35:55.000000000 +0000
+++ b/drivers/mtd/nand/s3c2410.c	2009-11-02 17:36:47.000000000 +0000
@@ -774,7 +774,7 @@ static void s3c2410_nand_init_chip(struc
 	chip->select_chip  = s3c2410_nand_select_chip;
 	chip->chip_delay   = 50;
 	chip->priv	   = nmtd;
-	chip->options	   = 0;
+	chip->options	   = set->options;
 	chip->controller   = &info->controller;
 
 	switch (info->cpu_type) {

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
