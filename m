Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LhvJB-00031M-7z
	for linux-mtd@lists.infradead.org; Fri, 13 Mar 2009 00:31:36 +0000
Date: Fri, 13 Mar 2009 01:31:24 +0100
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] OneNand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090313003124.GA13328@mail.gnudd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
Cc: STEricsson_nomadik_linux@list.st.com, andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alessandro Rubini <rubini@unipv.it>

Add the platform_device and the configuration used to activate
the OneNand device found on the NHK8815 evaluation kit.

Signed-off-by: Alessandro Rubini <rubini@unipv.it>
Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
---

This patch depends on the ones I sent earlier: basic nomadik
suppport (sent to linux-arm-kenrel) and nand driver (sent to
linux-arm-kernel and linux-mtd). This is sent to linux-mtd only.

 arch/arm/configs/nhk15_defconfig      |    9 +++-
 arch/arm/mach-nomadik/board-8815nhk.c |   67 +++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/nhk15_defconfig b/arch/arm/configs/nhk15_defconfig
index 1697efe..ea99b34 100644
--- a/arch/arm/configs/nhk15_defconfig
+++ b/arch/arm/configs/nhk15_defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.29-rc7
-# Thu Mar 12 00:30:32 2009
+# Fri Mar 13 00:06:15 2009
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -477,7 +477,12 @@ CONFIG_MTD_NAND_IDS=y
 # CONFIG_MTD_NAND_NANDSIM is not set
 # CONFIG_MTD_NAND_PLATFORM is not set
 CONFIG_MTD_NAND_NOMADIK=y
-# CONFIG_MTD_ONENAND is not set
+CONFIG_MTD_ONENAND=y
+CONFIG_MTD_ONENAND_VERIFY_WRITE=y
+CONFIG_MTD_ONENAND_GENERIC=y
+# CONFIG_MTD_ONENAND_OTP is not set
+# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
+# CONFIG_MTD_ONENAND_SIM is not set
 
 #
 # LPDDR flash memory drivers
diff --git a/arch/arm/mach-nomadik/board-8815nhk.c b/arch/arm/mach-nomadik/board-8815nhk.c
index 1e5b332..6ed9760 100644
--- a/arch/arm/mach-nomadik/board-8815nhk.c
+++ b/arch/arm/mach-nomadik/board-8815nhk.c
@@ -27,6 +27,7 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/irq.h>
 
+#include <asm/mach/flash.h>
 #include <mach/hardware.h>
 #include <mach/setup.h>
 #include <mach/nand.h>
@@ -115,9 +116,74 @@ static struct platform_device nhk8815_nand_device = {
 	.num_resources	= ARRAY_SIZE(nhk8815_nand_resources),
 };
 
+/* These are the partitions for the OneNand device, different from above */
+static struct mtd_partition nhk8815_onenand_partitions[] = {
+	{
+		.name	= "X-Loader(OneNAND)",
+		.offset = 0,
+		.size	= SZ_256K,
+	}, {
+		.name	= "MemInit(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_256K,
+	}, {
+		.name	= "BootLoader(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_2M-SZ_256K,
+	}, {
+		.name	= "U-Boot Environment(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_256K,
+	}, {
+		.name	= "SysImage(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 4 * SZ_1M,
+	}, {
+		.name	= "Root Filesystem(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 22* SZ_1M,
+	}, {
+		.name	= "User Filesystem(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct flash_platform_data nhk8815_onenand_data = {
+	.parts		= nhk8815_onenand_partitions,
+	.nr_parts	= ARRAY_SIZE(nhk8815_onenand_partitions),
+};
+
+static struct resource nhk8815_onenand_resource[] = {
+	{
+		.start		= 0x30000000,
+		.end		= 0x30000000 + SZ_128K -1,
+		.flags		= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device nhk8815_onenand_device = {
+	.name		= "onenand",
+	.id		= -1,
+	.dev		= {
+		.platform_data	= &nhk8815_onenand_data,
+	},
+	.resource	= nhk8815_onenand_resource,
+	.num_resources	= ARRAY_SIZE(nhk8815_onenand_resource),
+};
+
+static void __init nhk8815_onenand_init(void)
+{
+#ifdef CONFIG_ONENAND
+       /* Set up SMCS0 for OneNand */
+       writel(0x000030db, FSMC_BCR0);
+       writel(0x02100551, FSMC_BTR0);
+#endif
+}
 
 static struct platform_device *nhk8815_platform_devices[] __initdata = {
 	&nhk8815_nand_device,
+	&nhk8815_onenand_device,
 	/* will add keypad, touchscreen etc */
 };
 
@@ -129,6 +195,7 @@ static void __init nhk8815_map_io(void)
 static void __init nhk8815_platform_init(void)
 {
 	cpu8815_platform_init();
+	nhk8815_onenand_init();
 	platform_add_devices(nhk8815_platform_devices,
 			     ARRAY_SIZE(nhk8815_platform_devices));
 }
-- 
1.6.0.2
