Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3oak-0008Fc-Cg
	for linux-mtd@lists.infradead.org; Sat, 13 Aug 2005 01:30:10 -0400
Received: from ep_mmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IL500I53B9SPH@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 13 Aug 2005 14:29:52 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0IL500594B9SBN@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 13 Aug 2005 14:29:52 +0900 (KST)
Date: Sat, 13 Aug 2005 14:29:53 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0IL500595B9SBN@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: 'Thomas Gleixner' <tglx@linutronix.de>
Subject: [PATCH] OneNAND: Sync. Burst Read support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch supports OneNAND Sync. Burst Read. 
Now only OMAP architecture is supported and tested.

Any comments are welcome.

Best regards.
Kyungmin Park

ps. OMAP specific code will be replaced their board specific header file
after OMAP tree merged. :)

--

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -29,4 +29,10 @@ config MTD_ONENAND_OMAP
 	help
 	  Support for OneNAND flash on TI OMAP board.
 
+config MTD_ONENAND_SYNC_READ
+	bool "OneNAND Sync. Burst Read Support"
+	depends on ARCH_OMAP
+	help
+	  This enables support for Sync. Burst Read.
+
 endmenu
diff --git a/drivers/mtd/onenand/omap-onenand.c
b/drivers/mtd/onenand/omap-onenand.c
--- a/drivers/mtd/onenand/omap-onenand.c
+++ b/drivers/mtd/onenand/omap-onenand.c
@@ -25,9 +25,10 @@
 #include <asm/arch/hardware.h>
 #include <asm/arch/tc.h>
 #include <asm/sizes.h>
+#include <asm/mach-types.h>
 
 #define OMAP_ONENAND_FLASH_START1	OMAP_CS2A_PHYS
-#define OMAP_ONENAND_FLASH_START2	OMAP_CS0_PHYS
+#define OMAP_ONENAND_FLASH_START2	omap_cs3_phys()
 /*
  * MTD structure for OMAP board
  */
@@ -68,10 +69,66 @@ static struct mtd_partition static_parti
 	},
 };
 
-const char *part_probes[] = { "cmdlinepart", NULL,  };
+static const char *part_probes[] = { "cmdlinepart", NULL,  };
 
 #endif
 
+#ifdef CONFIG_MTD_ONENAND_SYNC_READ
+static unsigned int omap_emifs_cs;
+
+static void omap_find_emifs_cs(unsigned int addr)
+{
+	/* Check CS3 */
+	if (OMAP_EMIFS_CONFIG_REG & OMAP_EMIFS_CONFIG_BM && addr == 0x0) {
+		omap_emifs_cs = 3;
+	} else {
+		omap_emifs_cs = (addr >> 26);
+	}
+}
+
+/**
+ * omap_onenand_mmcontrol - Control OMAP EMIFS
+ */
+static void omap_onenand_mmcontrol(struct mtd_info *mtd, int sync_read)
+{
+	struct onenand_chip *this = mtd->priv;
+	static unsigned long omap_emifs_ccs, omap_emifs_acs;
+	static unsigned long onenand_sys_cfg1;
+	int config, emifs_ccs, emifs_acs;
+
+	if (sync_read) {
+		/*
+		 * Note: BRL and RDWST is equal
+		 */
+		omap_emifs_ccs = EMIFS_CCS(omap_emifs_cs);
+		omap_emifs_acs = EMIFS_ACS(omap_emifs_cs);
+		
+		emifs_ccs = 0x41141;
+		emifs_acs = 0x1;
+
+		/* OneNAND System Configuration 1 */
+		onenand_sys_cfg1 = this->read_word(this->base +
ONENAND_REG_SYS_CFG1);
+		config = (onenand_sys_cfg1
+			& ~(0x3f << ONENAND_SYS_CFG1_BL_SHIFT))
+			| ONENAND_SYS_CFG1_SYNC_READ
+			| ONENAND_SYS_CFG1_BRL_4
+			| ONENAND_SYS_CFG1_BL_8;
+	} else {
+		emifs_ccs = omap_emifs_ccs;
+		emifs_acs = omap_emifs_acs;
+		config = onenand_sys_cfg1;
+	}
+
+	this->write_word(config, this->base + ONENAND_REG_SYS_CFG1);
+	EMIFS_CCS(omap_emifs_cs) = emifs_ccs;
+	EMIFS_ACS(omap_emifs_cs) = emifs_acs;
+}
+#else
+#define omap_find_emifs_cs(x)		do { } while (0)
+#define omap_onenand_mmcontrol		NULL
+#endif
+
+
 /* Scan to find existance of the device at base.
    This also allocates oob and data internal buffers */
 static char onenand_name[] = "onenand";
@@ -102,14 +159,19 @@ static int __init omap_onenand_init (voi
 
 	/* Link the private data with the MTD structure */
 	omap_onenand_mtd->priv = this;
+	this->mmcontrol = omap_onenand_mmcontrol;
 
         /* try the first address */
 	this->base = ioremap(OMAP_ONENAND_FLASH_START1, SZ_128K);
+	omap_find_emifs_cs(OMAP_ONENAND_FLASH_START1);
+
 	omap_onenand_mtd->name = onenand_name;
 	if (onenand_scan(omap_onenand_mtd, 1)){
 		/* try the second address */
 		iounmap(this->base);
 		this->base = ioremap(OMAP_ONENAND_FLASH_START2, SZ_128K);
+		omap_find_emifs_cs(OMAP_ONENAND_FLASH_START2);
+
 		if (onenand_scan(omap_onenand_mtd, 1)) {
 			iounmap(this->base);
                         err = -ENXIO;
diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -379,6 +379,35 @@ static int onenand_read_bufferram(struct
 }
 
 /**
+ * onenand_sync_read_bufferram - [OneNAND Interface] Read the bufferram
area with Sync. Burst mode
+ * @param mtd		MTD data structure
+ * @param area		BufferRAM area
+ * @param buffer	the databuffer to put/get data
+ * @param offset	offset to read from or write to
+ * @param count		number of bytes to read/write
+ *
+ * Read the BufferRAM area with Sync. Burst Mode
+ */
+static int onenand_sync_read_bufferram(struct mtd_info *mtd, int area,
+		unsigned char *buffer, int offset, size_t count)
+{
+	struct onenand_chip *this = mtd->priv;
+	void __iomem *bufferram;
+
+	bufferram = this->base + area;
+
+	bufferram += onenand_bufferram_offset(mtd, area);
+
+	this->mmcontrol(mtd, ONENAND_SYS_CFG1_SYNC_READ);
+
+	memcpy(buffer, bufferram + offset, count);
+
+	this->mmcontrol(mtd, 0);
+
+	return 0;
+}
+
+/**
  * onenand_write_bufferram - [OneNAND Interface] Write the bufferram area
  * @param mtd		MTD data structure
  * @param area		BufferRAM area
@@ -1273,8 +1302,8 @@ static int onenand_check_maf(int manuf)
                         break;
         }
 
-        printk(KERN_DEBUG "OneNAND Manufacturer: %s\n",
-                onenand_manuf_ids[i].name);
+        printk(KERN_DEBUG "OneNAND Manufacturer: %s (0x%0x)\n",
+                onenand_manuf_ids[i].name, manuf);
 
         return (i != ONENAND_MFR_UNKNOWN);
 }
@@ -1385,6 +1414,12 @@ int onenand_scan(struct mtd_info *mtd, i
 	if (onenand_probe(mtd))
 		return -ENXIO;
 
+	/* Set Sync. Burst Read after probing */
+	if (this->mmcontrol) {
+		printk(KERN_INFO "OneNAND Sync. Burst Read support\n");
+		this->read_bufferram = onenand_sync_read_bufferram;
+	}
+
 	this->state = FL_READY;
 	init_waitqueue_head(&this->wq);
 	spin_lock_init(&this->chip_lock);
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -95,6 +95,7 @@ struct onenand_chip {
 			const unsigned char *buffer, int offset, size_t
count);
 	unsigned short (*read_word)(void __iomem *addr);
 	void (*write_word)(unsigned short value, void __iomem *addr);
+	void (*mmcontrol)(struct mtd_info *mtd, int sync_read);
 
 	spinlock_t		chip_lock;
 	wait_queue_head_t	wq;
diff --git a/include/linux/mtd/onenand_regs.h
b/include/linux/mtd/onenand_regs.h
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -121,8 +121,21 @@
  * System Configuration 1 Register F221h (R, R/W)
  */
 #define ONENAND_SYS_CFG1_SYNC_READ	(1 << 15)
-#define ONENAND_SYS_CFG1_BRL		(1 << 12)
-#define ONENAND_SYS_CFG1_BL		(1 << 9)
+#define ONENAND_SYS_CFG1_BRL_7		(7 << 12)
+#define ONENAND_SYS_CFG1_BRL_6		(6 << 12)
+#define ONENAND_SYS_CFG1_BRL_5		(5 << 12)
+#define ONENAND_SYS_CFG1_BRL_4		(4 << 12)
+#define ONENAND_SYS_CFG1_BRL_3		(3 << 12)
+#define ONENAND_SYS_CFG1_BRL_10		(2 << 12)
+#define ONENAND_SYS_CFG1_BRL_9		(1 << 12)
+#define ONENAND_SYS_CFG1_BRL_8		(0 << 12)
+#define ONENAND_SYS_CFG1_BRL_SHIFT	(12)
+#define ONENAND_SYS_CFG1_BL_32		(4 << 9)
+#define ONENAND_SYS_CFG1_BL_16		(3 << 9)
+#define ONENAND_SYS_CFG1_BL_8		(2 << 9)
+#define ONENAND_SYS_CFG1_BL_4		(1 << 9)
+#define ONENAND_SYS_CFG1_BL_CONT	(0 << 9)
+#define ONENAND_SYS_CFG1_BL_SHIFT	(9)
 #define ONENAND_SYS_CFG1_NO_ECC		(1 << 8)
 #define ONENAND_SYS_CFG1_RDY		(1 << 7)
 #define ONENAND_SYS_CFG1_INT		(1 << 6)
