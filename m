Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY5Fw-0006sx-MS
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 08:25:15 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v2 7/7] mtd: rawnand: sunxi: Fix kernel doc headers
Date: Sat, 15 Dec 2018 09:24:37 +0100
Message-Id: <20181215082437.9175-8-boris.brezillon@bootlin.com>
In-Reply-To: <20181215082437.9175-1-boris.brezillon@bootlin.com>
References: <20181215082437.9175-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix the struct description and use standard kernel-doc header format
(even if the file is not parsed by the doc generator).

We also replace tabs by a single space.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 60 +++++++++++++++----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d6b07067ed26..93e18f48f1e1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -154,37 +154,36 @@
 
 #define NFC_MAX_CS		7
 
-/*
- * Chip Select structure: stores information related to NAND Chip Select
+/**
+ * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
- * @cs:		the NAND CS id used to communicate with a NAND Chip
- * @rb:		the Ready/Busy pin ID. -1 means no R/B pin connected to the
- *		NFC
+ * @cs: the NAND CS id used to communicate with a NAND Chip
+ * @rb: the Ready/Busy pin ID. -1 means no R/B pin connected to the NFC
  */
 struct sunxi_nand_chip_sel {
 	u8 cs;
 	s8 rb;
 };
 
-/*
- * sunxi HW ECC infos: stores information related to HW ECC support
+/**
+ * struct sunxi_nand_hw_ecc - stores information related to HW ECC support
  *
- * @mode:	the sunxi ECC mode field deduced from ECC requirements
+ * @mode: the sunxi ECC mode field deduced from ECC requirements
  */
 struct sunxi_nand_hw_ecc {
 	int mode;
 };
 
-/*
- * NAND chip structure: stores NAND chip device related information
+/**
+ * struct sunxi_nand_chip - stores NAND chip device related information
  *
- * @node:		used to store NAND chips into a list
- * @nand:		base NAND chip structure
- * @mtd:		base MTD structure
- * @clk_rate:		clk_rate required for this NAND chip
- * @timing_cfg		TIMING_CFG register value for this NAND chip
- * @nsels:		number of CS lines required by the NAND chip
- * @sels:		array of CS lines descriptions
+ * @node: used to store NAND chips into a list
+ * @nand: base NAND chip structure
+ * @clk_rate: clk_rate required for this NAND chip
+ * @timing_cfg: TIMING_CFG register value for this NAND chip
+ * @timing_ctl: TIMING_CTL register value for this NAND chip
+ * @nsels: number of CS lines required by the NAND chip
+ * @sels: array of CS lines descriptions
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -201,20 +200,21 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
 	return container_of(nand, struct sunxi_nand_chip, nand);
 }
 
-/*
- * NAND Controller structure: stores sunxi NAND controller information
+/**
+ * struct sunxi_nfc - stores sunxi NAND controller information
  *
- * @controller:		base controller structure
- * @dev:		parent device (used to print error messages)
- * @regs:		NAND controller registers
- * @ahb_clk:		NAND Controller AHB clock
- * @mod_clk:		NAND Controller mod clock
- * @assigned_cs:	bitmask describing already assigned CS lines
- * @clk_rate:		NAND controller current clock rate
- * @chips:		a list containing all the NAND chips attached to
- *			this NAND controller
- * @complete:		a completion object used to wait for NAND
- *			controller events
+ * @controller: base controller structure
+ * @dev: parent device (used to print error messages)
+ * @regs: NAND controller registers
+ * @ahb_clk: NAND controller AHB clock
+ * @mod_clk: NAND controller mod clock
+ * @reset: NAND controller reset line
+ * @assigned_cs: bitmask describing already assigned CS lines
+ * @clk_rate: NAND controller current clock rate
+ * @chips: a list containing all the NAND chips attached to this NAND
+ *	   controller
+ * @complete: a completion object used to wait for NAND controller events
+ * @dmac: the DMA channel attached to the NAND controller
  */
 struct sunxi_nfc {
 	struct nand_controller controller;
-- 
2.17.1
