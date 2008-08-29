Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KZ1fd-00049d-RF
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 10:57:38 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] pxa3xx_nand: moved nand definitions into shared platform
	header
Date: Fri, 29 Aug 2008 12:57:28 +0200
Message-Id: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch moves the exported datastructures from the pxa3xx_nand.c driver
into the <mach/pxa3xx_nand.h> header. This is a plain movement without
any modification of the attributes.

This is the first one of a set of patches which:

 * allows to specify used NAND flash in the platform code and allows to turn
   off the old way to specify NAND characteristics in the driver.  This way did
   not worked well as these characteristics depend on the platform and can not be
   derived from NAND id alone.

   E.g.  some NAND chips share the same ID (e.g.  K9K8G08U0A and K9NBG08U5A) but
   have different timings (which are written in the common driver currently and
   must be modified there).

 * adds 'const' annotations at various places

Further patches will be sent to the mtd-list.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 arch/arm/mach-pxa/include/mach/pxa3xx_nand.h |   44 ++++++++++++++++++++++++++
 drivers/mtd/nand/pxa3xx_nand.c               |   44 --------------------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
index eb4b190..0dc50d8 100644
--- a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
+++ b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
@@ -4,6 +4,50 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
+struct pxa3xx_nand_timing {
+	unsigned int	tCH;  /* Enable signal hold time */
+	unsigned int	tCS;  /* Enable signal setup time */
+	unsigned int	tWH;  /* ND_nWE high duration */
+	unsigned int	tWP;  /* ND_nWE pulse time */
+	unsigned int	tRH;  /* ND_nRE high duration */
+	unsigned int	tRP;  /* ND_nRE pulse width */
+	unsigned int	tR;   /* ND_nWE high to ND_nRE low for read */
+	unsigned int	tWHR; /* ND_nWE high to ND_nRE low for status read */
+	unsigned int	tAR;  /* ND_ALE low to ND_nRE low delay */
+};
+
+struct pxa3xx_nand_cmdset {
+	uint16_t	read1;
+	uint16_t	read2;
+	uint16_t	program;
+	uint16_t	read_status;
+	uint16_t	read_id;
+	uint16_t	erase;
+	uint16_t	reset;
+	uint16_t	lock;
+	uint16_t	unlock;
+	uint16_t	lock_status;
+};
+
+struct pxa3xx_nand_flash {
+	struct pxa3xx_nand_timing *timing; /* NAND Flash timing */
+	struct pxa3xx_nand_cmdset *cmdset;
+
+	uint32_t page_per_block;/* Pages per block (PG_PER_BLK) */
+	uint32_t page_size;	/* Page size in bytes (PAGE_SZ) */
+	uint32_t flash_width;	/* Width of Flash memory (DWIDTH_M) */
+	uint32_t dfc_width;	/* Width of flash controller(DWIDTH_C) */
+	uint32_t num_blocks;	/* Number of physical blocks in Flash */
+	uint32_t chip_id;
+
+	/* NOTE: these are automatically calculated, do not define */
+	size_t		oob_size;
+	size_t		read_id_bytes;
+
+	unsigned int	col_addr_cycles;
+	unsigned int	row_addr_cycles;
+};
+
 struct pxa3xx_nand_platform_data {
 
 	/* the data flash bus is shared between the Static Memory
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a64ad15..838db4b 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -115,50 +115,6 @@ enum {
 	STATE_PIO_WRITING,
 };
 
-struct pxa3xx_nand_timing {
-	unsigned int	tCH;  /* Enable signal hold time */
-	unsigned int	tCS;  /* Enable signal setup time */
-	unsigned int	tWH;  /* ND_nWE high duration */
-	unsigned int	tWP;  /* ND_nWE pulse time */
-	unsigned int	tRH;  /* ND_nRE high duration */
-	unsigned int	tRP;  /* ND_nRE pulse width */
-	unsigned int	tR;   /* ND_nWE high to ND_nRE low for read */
-	unsigned int	tWHR; /* ND_nWE high to ND_nRE low for status read */
-	unsigned int	tAR;  /* ND_ALE low to ND_nRE low delay */
-};
-
-struct pxa3xx_nand_cmdset {
-	uint16_t	read1;
-	uint16_t	read2;
-	uint16_t	program;
-	uint16_t	read_status;
-	uint16_t	read_id;
-	uint16_t	erase;
-	uint16_t	reset;
-	uint16_t	lock;
-	uint16_t	unlock;
-	uint16_t	lock_status;
-};
-
-struct pxa3xx_nand_flash {
-	struct pxa3xx_nand_timing *timing; /* NAND Flash timing */
-	struct pxa3xx_nand_cmdset *cmdset;
-
-	uint32_t page_per_block;/* Pages per block (PG_PER_BLK) */
-	uint32_t page_size;	/* Page size in bytes (PAGE_SZ) */
-	uint32_t flash_width;	/* Width of Flash memory (DWIDTH_M) */
-	uint32_t dfc_width;	/* Width of flash controller(DWIDTH_C) */
-	uint32_t num_blocks;	/* Number of physical blocks in Flash */
-	uint32_t chip_id;
-
-	/* NOTE: these are automatically calculated, do not define */
-	size_t		oob_size;
-	size_t		read_id_bytes;
-
-	unsigned int	col_addr_cycles;
-	unsigned int	row_addr_cycles;
-};
-
 struct pxa3xx_nand_info {
 	struct nand_chip	nand_chip;
 
-- 
1.5.5.1
