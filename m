Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IXDlP-0007Mc-4o
	for linux-mtd@lists.infradead.org; Mon, 17 Sep 2007 06:23:44 -0400
Received: by ug-out-1314.google.com with SMTP id 23so692565ugr
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Sep 2007 03:23:33 -0700 (PDT)
To: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH] Magic Panel MTD mapping update
Date: Mon, 17 Sep 2007 12:09:15 +0200
References: <200708200837.08856.super.firetwister@gmail.com>
	<1187595327.3137.3.camel@shinybook.infradead.org>
In-Reply-To: <1187595327.3137.3.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200709171209.16148.super.firetwister@gmail.com>
From: Markus Brunner <super.firetwister@googlemail.com>
Cc: Mark Jonas <toertel@gmail.com>, linux-mtd@lists.infradead.org,
	linux-sh <linuxsh-dev@lists.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Paul,

this update moves the flash mapping for the Magic Panel into the board setup. 
It also removes references to the old MTD mapping option in the defconfig.

Signed-off by: Markus Brunner <super.firetwister@gmail.com>
Signed-off by: Mark Jonas <toertel@gmail.com>
---

 boards/magicpanelr2/setup.c    |   83 ++++++++++++++++++++++++++++++++++++++++-
 configs/magicpanelr2_defconfig |    8 ++-
 2 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/arch/sh/boards/magicpanelr2/setup.c b/arch/sh/boards/magicpanelr2/setup.c
index c593065..854bcc6 100644
--- a/arch/sh/boards/magicpanelr2/setup.c
+++ b/arch/sh/boards/magicpanelr2/setup.c
@@ -12,14 +12,19 @@
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/platform_device.h>
-#include <linux/ide.h>
-#include <linux/irq.h>
 #include <linux/delay.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/physmap.h>
+#include <linux/mtd/map.h>
 #include <asm/magicpanelr2.h>
 #include <asm/heartbeat.h>
 
 #define LAN9115_READY	(ctrl_inl(0xA8000084UL) & 0x00000001UL)
 
+/* Prefer cmdline over RedBoot */
+static const char *probes[] = { "cmdlinepart", "RedBoot", NULL };
+
 /* Wait until reset finished. Timeout is 100ms. */
 static int __init ethernet_reset_finished(void)
 {
@@ -270,13 +275,87 @@ static struct platform_device heartbeat_device = {
 	.resource	= heartbeat_resources,
 };
 
+static struct mtd_partition *parsed_partitions;
+
+static struct mtd_partition mpr2_partitions[] = {
+	/* Reserved for bootloader, read-only */
+	{
+		.name = "Bootloader",
+		.offset = 0x00000000UL,
+		.size = MPR2_MTD_BOOTLOADER_SIZE,
+		.mask_flags = MTD_WRITEABLE,
+	},
+	/* Reserved for kernel image */
+	{
+		.name = "Kernel",
+		.offset = MTDPART_OFS_NXTBLK,
+		.size = MPR2_MTD_KERNEL_SIZE,
+	},
+	/* Rest is used for Flash FS */
+	{
+		.name = "Flash_FS",
+		.offset = MTDPART_OFS_NXTBLK,
+		.size = MTDPART_SIZ_FULL,
+	}
+};
+
+static struct physmap_flash_data flash_data = {
+	.width		= 2,
+};
+
+static struct resource flash_resource = {
+	.start		= 0x00000000,
+	.end		= 0x2000000UL,
+	.flags		= IORESOURCE_MEM,
+};
+
+static struct platform_device flash_device = {
+	.name		= "physmap-flash",
+	.id		= -1,
+	.resource	= &flash_resource,
+	.num_resources	= 1,
+	.dev		= {
+		.platform_data = &flash_data,
+	},
+};
+
+static struct mtd_info *flash_mtd;
+
+struct map_info mpr2_flash_map = {
+	.name = "Magic Panel R2 Flash",
+	.size = 0x2000000UL,
+	.bankwidth = 2,
+};
+
+static void __init set_mtd_partitions(){
+	int nr_parts = 0;
+	simple_map_init(&mpr2_flash_map);
+	flash_mtd = do_map_probe("cfi_probe", &mpr2_flash_map);
+	nr_parts = parse_mtd_partitions(flash_mtd, probes, &parsed_partitions, 0);
+	/* If there is no partition table, used the hard coded table */
+	if (nr_parts <= 0) {
+		flash_data.parts = mpr2_partitions;
+		flash_data.nr_parts = ARRAY_SIZE(mpr2_partitions);
+	} else {
+		flash_data.nr_parts = nr_parts;
+		flash_data.parts = parsed_partitions;
+	}
+}
+
+/*
+ * Add all resources to the platform_device
+ */
+
 static struct platform_device *mpr2_devices[] __initdata = {
 	&heartbeat_device,
 	&smc911x_device,
+	&flash_device,
 };
 
+
 static int __init mpr2_devices_setup(void)
 {
+	set_mtd_partitions();
 	return platform_add_devices(mpr2_devices, ARRAY_SIZE(mpr2_devices));
 }
 device_initcall(mpr2_devices_setup);
diff --git a/arch/sh/configs/magicpanelr2_defconfig b/arch/sh/configs/magicpanelr2_defconfig
index ce4e764..f8398a5 100644
--- a/arch/sh/configs/magicpanelr2_defconfig
+++ b/arch/sh/configs/magicpanelr2_defconfig
@@ -185,7 +185,7 @@ CONFIG_SH_MAGIC_PANEL_R2=y
 #
 # Magic Panel R2 options
 #
-CONFIG_SH_MAGIC_PANEL_R2_VERSION=2
+CONFIG_SH_MAGIC_PANEL_R2_VERSION=3
 
 #
 # Timer and clock configuration
@@ -404,9 +404,11 @@ CONFIG_MTD_CFI_UTIL=y
 # Mapping drivers for chip access
 #
 # CONFIG_MTD_COMPLEX_MAPPINGS is not set
-# CONFIG_MTD_PHYSMAP is not set
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_START=0x0000000
+CONFIG_MTD_PHYSMAP_LEN=0
+CONFIG_MTD_PHYSMAP_BANKWIDTH=0
 # CONFIG_MTD_SOLUTIONENGINE is not set
-CONFIG_MTD_MAGICPANELR2=y
 # CONFIG_MTD_PLATRAM is not set
 
 #
