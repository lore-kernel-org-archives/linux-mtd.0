Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROz-0002U4-Qs
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:20 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:26:17 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 62/62] mtd: kill CONFIG_MTD_PARTITIONS
Date: Mon, 23 May 2011 10:23:43 +0100
Message-Id: <1306142623-24952-63-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that none of the drivers use CONFIG_MTD_PARTITIONS we can remove
it from Kconfig and the last remaining uses.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 Documentation/DocBook/mtdnand.tmpl |    3 +--
 drivers/mtd/Kconfig                |   10 +---------
 drivers/mtd/Makefile               |    3 +--
 drivers/mtd/maps/Kconfig           |   15 +++++----------
 drivers/mtd/mtdchar.c              |    5 -----
 drivers/mtd/nand/Kconfig           |    3 +--
 include/linux/mtd/mtd.h            |    8 --------
 7 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/Documentation/DocBook/mtdnand.tmpl b/Documentation/DocBook/mtdnand.tmpl
index 6f242d5..17910e2 100644
--- a/Documentation/DocBook/mtdnand.tmpl
+++ b/Documentation/DocBook/mtdnand.tmpl
@@ -189,8 +189,7 @@ static void __iomem *baseaddr;
 		<title>Partition defines</title>
 		<para>
 			If you want to divide your device into partitions, then
-			enable the configuration switch CONFIG_MTD_PARTITIONS and define
-			a partitioning scheme suitable to your board.
+			define a partitioning scheme suitable to your board.
 		</para>
 		<programlisting>
 #define NUM_PARTITIONS 2
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 8b61b0c..62b4fdb 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -1,7 +1,6 @@
 menuconfig MTD
 	tristate "Memory Technology Device (MTD) support"
 	depends on HAS_IOMEM
-	select MTD_PARTITIONS
 	help
 	  Memory Technology Devices are flash, RAM and similar chips, often
 	  used for solid state file systems on embedded devices. This option
@@ -34,11 +33,6 @@ config MTD_TESTS
 	  should normally be compiled as kernel modules. The modules perform
 	  various checks and verifications when loaded.
 
-config MTD_PARTITIONS
-	bool
-
-if MTD_PARTITIONS
-
 config MTD_REDBOOT_PARTS
 	tristate "RedBoot partition table parsing"
 	---help---
@@ -91,7 +85,7 @@ endif # MTD_REDBOOT_PARTS
 
 config MTD_CMDLINE_PARTS
 	bool "Command line partition table parsing"
-	depends on MTD_PARTITIONS = "y" && MTD = "y"
+	depends on MTD = "y"
 	---help---
 	  Allow generic configuration of the MTD partition tables via the kernel
 	  command line. Multiple flash resources are supported for hardware where
@@ -156,8 +150,6 @@ config MTD_AR7_PARTS
 	---help---
 	  TI AR7 partitioning support
 
-endif # MTD_PARTITIONS
-
 comment "User Modules And Translation Layers"
 
 config MTD_CHAR
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index d578095..39664c4 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -4,8 +4,7 @@
 
 # Core functionality.
 obj-$(CONFIG_MTD)		+= mtd.o
-mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o
-mtd-$(CONFIG_MTD_PARTITIONS)	+= mtdpart.o
+mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o
 mtd-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index cf458a5..5b49440 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -82,7 +82,6 @@ config MTD_PHYSMAP_OF
 config MTD_PMC_MSP_EVM
 	tristate "CFI Flash device mapped on PMC-Sierra MSP"
 	depends on PMC_MSP && MTD_CFI
-	select MTD_PARTITIONS
 	help
 	  This provides a 'mapping' driver which supports the way
 	  in which user-programmable flash chips are connected on the
@@ -122,7 +121,7 @@ config MTD_SC520CDP
 
 config MTD_NETSC520
 	tristate "CFI Flash device mapped on AMD NetSc520"
-	depends on X86 && MTD_CFI && MTD_PARTITIONS
+	depends on X86 && MTD_CFI
 	help
 	  This enables access routines for the flash chips on the AMD NetSc520
 	  demonstration board. If you have one of these boards and would like
@@ -131,7 +130,6 @@ config MTD_NETSC520
 config MTD_TS5500
 	tristate "JEDEC Flash device mapped on Technologic Systems TS-5500"
 	depends on X86
-	select MTD_PARTITIONS
 	select MTD_JEDECPROBE
 	select MTD_CFI_AMDSTD
 	help
@@ -149,7 +147,7 @@ config MTD_TS5500
 
 config MTD_SBC_GXX
 	tristate "CFI Flash device mapped on Arcom SBC-GXx boards"
-	depends on X86 && MTD_CFI_INTELEXT && MTD_PARTITIONS && MTD_COMPLEX_MAPPINGS
+	depends on X86 && MTD_CFI_INTELEXT && MTD_COMPLEX_MAPPINGS
 	help
 	  This provides a driver for the on-board flash of Arcom Control
 	  Systems' SBC-GXn family of boards, formerly known as SBC-MediaGX.
@@ -246,7 +244,7 @@ config MTD_TSUNAMI
 
 config MTD_NETtel
 	tristate "CFI flash device on SnapGear/SecureEdge"
-	depends on X86 && MTD_PARTITIONS && MTD_JEDECPROBE
+	depends on X86 && MTD_JEDECPROBE
 	help
 	  Support for flash chips on NETtel/SecureEdge/SnapGear boards.
 
@@ -262,13 +260,12 @@ config MTD_BCM963XX
 config MTD_LANTIQ
 	tristate "Lantiq SoC NOR support"
 	depends on LANTIQ
-	select MTD_PARTITIONS
 	help
 	  Support for NOR flash attached to the Lantiq SoC's External Bus Unit.
 
 config MTD_DILNETPC
 	tristate "CFI Flash device mapped on DIL/Net PC"
-	depends on X86 && MTD_PARTITIONS && MTD_CFI_INTELEXT && BROKEN
+	depends on X86 && MTD_CFI_INTELEXT && BROKEN
 	help
 	  MTD map driver for SSV DIL/Net PC Boards "DNP" and "ADNP".
 	  For details, see <http://www.ssv-embedded.de/ssv/pc104/p169.htm>
@@ -388,7 +385,7 @@ config MTD_IXP2000
 
 config MTD_FORTUNET
 	tristate "CFI Flash device mapped on the FortuNet board"
-	depends on MTD_CFI && MTD_PARTITIONS && SA1100_FORTUNET
+	depends on MTD_CFI && SA1100_FORTUNET
 	help
 	  This enables access to the Flash on the FortuNet board.  If you
 	  have such a board, say 'Y'.
@@ -486,7 +483,6 @@ config MTD_UCLINUX
 config MTD_WRSBC8260
 	tristate "Map driver for WindRiver PowerQUICC II MPC82xx board"
 	depends on (SBC82xx || SBC8560)
-	select MTD_PARTITIONS
 	select MTD_MAP_BANK_WIDTH_4
 	select MTD_MAP_BANK_WIDTH_1
 	select MTD_CFI_I1
@@ -499,7 +495,6 @@ config MTD_WRSBC8260
 config MTD_DMV182
         tristate "Map driver for Dy-4 SVME/DMV-182 board."
         depends on DMV182
-        select MTD_PARTITIONS
 	select MTD_MAP_BANK_WIDTH_32
 	select MTD_CFI_I8
 	select MTD_CFI_AMDSTD
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 4c36ef6..75d9abb 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -512,7 +512,6 @@ static int shrink_ecclayout(const struct nand_ecclayout *from,
 	return 0;
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 static int mtd_blkpg_ioctl(struct mtd_info *mtd,
 			   struct blkpg_ioctl_arg __user *arg)
 {
@@ -548,8 +547,6 @@ static int mtd_blkpg_ioctl(struct mtd_info *mtd,
 		return -EINVAL;
 	}
 }
-#endif
-
 
 static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 {
@@ -941,7 +938,6 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 	case BLKPG:
 	{
 		ret = mtd_blkpg_ioctl(mtd,
@@ -955,7 +951,6 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		ret = 0;
 		break;
 	}
-#endif
 
 	default:
 		ret = -ENOTTY;
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 333d231..4c342523 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -419,7 +419,6 @@ config MTD_NAND_TMIO
 
 config MTD_NAND_NANDSIM
 	tristate "Support for NAND Flash Simulator"
-	depends on MTD_PARTITIONS
 	help
 	  The simulator may simulate various NAND flash chips for the
 	  MTD nand layer.
@@ -513,7 +512,7 @@ config MTD_NAND_SOCRATES
 
 config MTD_NAND_NUC900
 	tristate "Support for NAND on Nuvoton NUC9xx/w90p910 evaluation boards."
-	depends on ARCH_W90X900 && MTD_PARTITIONS
+	depends on ARCH_W90X900
 	help
 	  This enables the driver for the NAND Flash on evaluation board based
 	  on w90p910 / NUC9xx.
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 96ad56a..b5fabfd 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -373,15 +373,7 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int default_mtd_readv(struct mtd_info *mtd, struct kvec *vecs,
 		      unsigned long count, loff_t from, size_t *retlen);
 
-#ifdef CONFIG_MTD_PARTITIONS
 void mtd_erase_callback(struct erase_info *instr);
-#else
-static inline void mtd_erase_callback(struct erase_info *instr)
-{
-	if (instr->callback)
-		instr->callback(instr);
-}
-#endif
 
 /*
  * Debugging macro and defines
-- 
1.7.4.4
