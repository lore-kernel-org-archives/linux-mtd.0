Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3Qnk-0007Iz-EP
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 12:09:49 +0000
Received: by wibhn17 with SMTP id hn17so2760962wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 05:09:45 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2 7/7] UBI: drop CONFIG_MTD_UBI_BEB_LIMIT
Date: Mon, 20 Aug 2012 14:09:21 +0200
Message-Id: <1345464561-24464-8-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
References: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This option can be set by a kernel parameter and an ioctl, so we may not
need the kernel config option any more.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 arch/arm/configs/sam9_l9260_defconfig |    1 -
 drivers/mtd/ubi/Kconfig               |   29 -----------------------------
 drivers/mtd/ubi/build.c               |    4 ++--
 drivers/mtd/ubi/ubi.h                 |    3 +++
 4 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/arch/arm/configs/sam9_l9260_defconfig b/arch/arm/configs/sam9_l9260_defconfig
index b4384af..47dd71a 100644
--- a/arch/arm/configs/sam9_l9260_defconfig
+++ b/arch/arm/configs/sam9_l9260_defconfig
@@ -39,7 +39,6 @@ CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_ATMEL=y
 CONFIG_MTD_NAND_PLATFORM=y
 CONFIG_MTD_UBI=y
-CONFIG_MTD_UBI_BEB_LIMIT=25
 CONFIG_MTD_UBI_GLUEBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 9406d26..7a57cc0 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -27,35 +27,6 @@ config MTD_UBI_WL_THRESHOLD
 	  life-cycle less than 10000, the threshold should be lessened (e.g.,
 	  to 128 or 256, although it does not have to be power of 2).
 
-config MTD_UBI_BEB_LIMIT
-	int "Maximum expected bad eraseblock count per 1024 eraseblocks"
-	default 20
-	range 0 768
-	help
-	  This option specifies the maximum bad physical eraseblocks UBI
-	  expects on the MTD device (per 1024 eraseblocks). If the underlying
-	  flash does not admit of bad eraseblocks (e.g. NOR flash), this value
-	  is ignored.
-
-	  NAND datasheets often specify the minimum and maximum NVM (Number of
-	  Valid Blocks) for the flashes' endurance lifetime. The maximum
-	  expected bad eraseblocks per 1024 eraseblocks then can be calculated
-	  as "1024 * (1 - MinNVB / MaxNVB)", which gives 20 for most NANDs
-	  (MaxNVB is basically the total count of eraseblocks on the chip).
-
-	  To put it differently, if this value is 20, UBI will try to reserve
-	  about 1.9% of physical eraseblocks for bad blocks handling. And that
-	  will be 1.9% of eraseblocks on the entire NAND chip, not just the MTD
-	  partition UBI attaches. This means that if you have, say, a NAND
-	  flash chip admits maximum 40 bad eraseblocks, and it is split on two
-	  MTD partitions of the same size, UBI will reserve 40 eraseblocks when
-	  attaching a partition.
-
-	  This option can be overridden by the kernel parameter ubi.mtd and the
-	  ioctl UBI_IOCATT.
-
-	  Leave the default value if unsure.
-
 config MTD_UBI_GLUEBI
 	tristate "MTD devices emulation driver (gluebi)"
 	help
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ec1bd5e..b0c76c8 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -869,7 +869,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * ioctl and the module parameter.
 	 */
 	if (!max_beb_per1024)
-		max_beb_per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
+		max_beb_per1024 = MTD_UBI_DEFAULT_BEB_LIMIT;
 
 	/*
 	 * Check if we already have the same MTD device attached.
@@ -1420,7 +1420,7 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|pa
 		      "MTD devices may be specified by their number, name, or path to the MTD character device node.\n"
 		      "Optional \"vid_hdr_offs\" parameter specifies UBI VID header position to be used by UBI. (default value if 0 or not set)\n"
 		      "Optional \"max_beb_per1024\" parameter specifies the maximum expected bad eraseblock per 1024 eraseblocks. (default value ("
-		      __stringify(CONFIG_MTD_UBI_BEB_LIMIT) ") if 0 or not set)\n"
+		      __stringify(MTD_UBI_DEFAULT_BEB_LIMIT) ") if 0 or not set)\n"
 		      "\n"
 		      "Example 1: mtd=/dev/mtd0 - attach MTD device /dev/mtd0.\n"
 		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device with name \"content\" using VID header offset 1984, and MTD device number 4 with default VID header offset.\n"
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 2a2475b..2148f35 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -50,6 +50,9 @@
 /* UBI name used for character devices, sysfs, etc */
 #define UBI_NAME_STR "ubi"
 
+/* Default number of maximum expected bad blocks per 1024 eraseblocks */
+#define MTD_UBI_DEFAULT_BEB_LIMIT 20
+
 /* Normal UBI messages */
 #define ubi_msg(fmt, ...) printk(KERN_NOTICE "UBI: " fmt "\n", ##__VA_ARGS__)
 /* UBI warning messages */
-- 
1.7.2.5
