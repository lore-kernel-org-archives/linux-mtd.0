Received: from sa15.bezeqint.net ([192.115.104.30])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8F7f-0005Jy-N4
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 13:51:53 +0000
Message-ID: <48566FEF.5070206@compulab.co.il>
Date: Mon, 16 Jun 2008 16:51:43 +0300
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: ARM Linux <linux-arm-kernel@lists.arm.linux.org.uk>
Subject: [PATCH 3/5] CM-X270: update NAND flash driver to use gpio_lib
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update CM-X270 NAND flash driver to use gpio_lib.

Signed-off-by: Mike Rapoport <mike@compulab.co.il>

 drivers/mtd/nand/cmx270_nand.c |   79 ++++++++++++++++++++++++----------------
 1 files changed, 47 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index cb663ef..fc8529b 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -20,9 +20,11 @@

 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/gpio.h>

 #include <asm/io.h>
 #include <asm/irq.h>
+#include <asm/mach-types.h>

 #include <asm/arch/hardware.h>
 #include <asm/arch/pxa-regs.h>
@@ -30,20 +32,6 @@
 #define GPIO_NAND_CS	(11)
 #define GPIO_NAND_RB	(89)

-/* This macro needed to ensure in-order operation of GPIO and local
- * bus. Without both asm command and dummy uncached read there're
- * states when NAND access is broken. I've looked for such macro(s) in
- * include/asm-arm but found nothing approptiate.
- * dmac_clean_range is close, but is makes cache invalidation
- * unnecessary here and it cannot be used in module
- */
-#define DRAIN_WB() \
-	do { \
-		unsigned char dummy; \
-		asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
-		dummy=*((unsigned char*)UNCACHED_ADDR); \
-	} while(0)
-
 /* MTD structure for CM-X270 board */
 static struct mtd_info *cmx270_nand_mtd;

@@ -103,14 +91,14 @@ static int cmx270_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)

 static inline void nand_cs_on(void)
 {
-	GPCR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS);
+	gpio_set_value(GPIO_NAND_CS, 0);
 }

 static void nand_cs_off(void)
 {
-	DRAIN_WB();
+	dsb();

-	GPSR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS);
+	gpio_set_value(GPIO_NAND_CS, 1);
 }

 /*
@@ -122,7 +110,7 @@ static void cmx270_hwcontrol(struct mtd_info *mtd, int dat,
 	struct nand_chip* this = mtd->priv;
 	unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;

-	DRAIN_WB();
+	dsb();

 	if (ctrl & NAND_CTRL_CHANGE) {
 		if ( ctrl & NAND_ALE )
@@ -139,12 +127,12 @@ static void cmx270_hwcontrol(struct mtd_info *mtd, int dat,
 			nand_cs_off();
 	}

-	DRAIN_WB();
+	dsb();
 	this->IO_ADDR_W = (void __iomem*)nandaddr;
 	if (dat != NAND_CMD_NONE)
 		writel((dat << 16), this->IO_ADDR_W);

-	DRAIN_WB();
+	dsb();
 }

 /*
@@ -152,9 +140,9 @@ static void cmx270_hwcontrol(struct mtd_info *mtd, int dat,
  */
 static int cmx270_device_ready(struct mtd_info *mtd)
 {
-	DRAIN_WB();
+	dsb();

-	return (GPLR(GPIO_NAND_RB) & GPIO_bit(GPIO_NAND_RB));
+	return (gpio_get_value(GPIO_NAND_RB));
 }

 /*
@@ -168,20 +156,40 @@ static int cmx270_init(void)
 	int mtd_parts_nb = 0;
 	int ret;

+	if (!machine_is_armcore())
+		return -ENODEV;
+
+	ret = gpio_request(GPIO_NAND_CS, "NAND CS");
+	if (ret) {
+		pr_warning("CM-X270: failed to request NAND CS gpio\n");
+		return ret;
+	}
+
+	gpio_direction_output(GPIO_NAND_CS, 1);
+
+	ret = gpio_request(GPIO_NAND_RB, "NAND R/B");
+	if (ret) {
+		pr_warning("CM-X270: failed to request NAND R/B gpio\n");
+		goto err_gpio_request;
+	}
+
+	gpio_direction_input(GPIO_NAND_RB);
+
 	/* Allocate memory for MTD device structure and private data */
 	cmx270_nand_mtd = kzalloc(sizeof(struct mtd_info) +
 				  sizeof(struct nand_chip),
 				  GFP_KERNEL);
 	if (!cmx270_nand_mtd) {
-		printk("Unable to allocate CM-X270 NAND MTD device structure.\n");
-		return -ENOMEM;
+		pr_debug("Unable to allocate CM-X270 NAND MTD device structure.\n");
+		ret = -ENOMEM;
+		goto err_kzalloc;
 	}

 	cmx270_nand_io = ioremap(PXA_CS1_PHYS, 12);
 	if (!cmx270_nand_io) {
-		printk("Unable to ioremap NAND device\n");
+		pr_debug("Unable to ioremap NAND device\n");
 		ret = -EINVAL;
-		goto err1;
+		goto err_ioremap;
 	}

 	/* Get pointer to private data */
@@ -209,9 +217,9 @@ static int cmx270_init(void)

 	/* Scan to find existence of the device */
 	if (nand_scan (cmx270_nand_mtd, 1)) {
-		printk(KERN_NOTICE "No NAND device\n");
+		pr_notice("No NAND device\n");
 		ret = -ENXIO;
-		goto err2;
+		goto err_scan;
 	}

 #ifdef CONFIG_MTD_CMDLINE_PARTS
@@ -229,18 +237,22 @@ static int cmx270_init(void)
 	}

 	/* Register the partitions */
-	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+	pr_notice("Using %s partition definition\n", part_type);
 	ret = add_mtd_partitions(cmx270_nand_mtd, mtd_parts, mtd_parts_nb);
 	if (ret)
-		goto err2;
+		goto err_scan;

 	/* Return happy */
 	return 0;

-err2:
+err_scan:
 	iounmap(cmx270_nand_io);
-err1:
+err_ioremap:
 	kfree(cmx270_nand_mtd);
+err_kzalloc:
+	gpio_free(GPIO_NAND_RB);
+err_gpio_request:
+	gpio_free(GPIO_NAND_CS);

 	return ret;

@@ -255,6 +267,9 @@ static void cmx270_cleanup(void)
 	/* Release resources, unregister device */
 	nand_release(cmx270_nand_mtd);

+	gpio_free(GPIO_NAND_RB);
+	gpio_free(GPIO_NAND_CS);
+
 	iounmap(cmx270_nand_io);

 	/* Free the MTD device structure */


-- 
Sincerely yours,
Mike.
