Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bn10O-00024Z-Bc
 for linux-mtd@lists.infradead.org; Thu, 22 Sep 2016 10:14:13 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [RFC PATCH 4/7] mtd: nand: rawnand: prefix conflicting names with
 nandc instead of nand
Date: Thu, 22 Sep 2016 12:12:57 +0200
Message-Id: <1474539180-5863-5-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some raw NAND function names conflict with names defined in nand.h.
Prefix all those functions with nandc (for nand chip) instead of nand so
we can include nand.h from rawnand.h

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/DocBook/mtdnand.tmpl                 |  10 +-
 arch/arm/mach-ep93xx/snappercl15.c                 |   4 +-
 arch/arm/mach-ep93xx/ts72xx.c                      |   4 +-
 arch/arm/mach-imx/mach-qong.c                      |   2 +-
 arch/arm/mach-ixp4xx/ixdp425-setup.c               |   2 +-
 arch/arm/mach-omap1/board-nand.c                   |   2 +-
 arch/arm/mach-orion5x/ts78xx-setup.c               |   6 +-
 arch/arm/mach-pxa/balloon3.c                       |   2 +-
 arch/arm/mach-pxa/em-x270.c                        |   2 +-
 arch/arm/mach-pxa/palmtx.c                         |   2 +-
 arch/blackfin/mach-bf537/boards/stamp.c            |   2 +-
 arch/blackfin/mach-bf561/boards/acvilon.c          |   2 +-
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c     |   4 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c     |   4 +-
 arch/mips/alchemy/devboards/db1200.c               |   2 +-
 arch/mips/alchemy/devboards/db1300.c               |   2 +-
 arch/mips/alchemy/devboards/db1550.c               |   2 +-
 arch/mips/jz4740/board-qi_lb60.c                   |   2 +-
 arch/mips/pnx833x/common/platform.c                |   2 +-
 arch/mips/rb532/devices.c                          |   2 +-
 arch/sh/boards/mach-migor/setup.c                  |   2 +-
 drivers/mtd/nand/rawnand/ams-delta.c               |   8 +-
 drivers/mtd/nand/rawnand/atmel_nand.c              |  60 +++++------
 drivers/mtd/nand/rawnand/au1550nd.c                |  26 ++---
 drivers/mtd/nand/rawnand/bcm47xxnflash/main.c      |   4 +-
 .../mtd/nand/rawnand/bcm47xxnflash/ops_bcm4706.c   |  18 ++--
 drivers/mtd/nand/rawnand/bf5xx_nand.c              |  32 +++---
 drivers/mtd/nand/rawnand/brcmnand/brcmnand.c       |  32 +++---
 drivers/mtd/nand/rawnand/cafe_nand.c               |  24 ++---
 drivers/mtd/nand/rawnand/cmx270_nand.c             |  12 +--
 drivers/mtd/nand/rawnand/cs553x_nand.c             |  20 ++--
 drivers/mtd/nand/rawnand/davinci_nand.c            |  14 +--
 drivers/mtd/nand/rawnand/denali.c                  |  12 +--
 drivers/mtd/nand/rawnand/diskonchip.c              |  68 ++++++------
 drivers/mtd/nand/rawnand/docg4.c                   |  36 +++----
 drivers/mtd/nand/rawnand/fsl_elbc_nand.c           |  26 ++---
 drivers/mtd/nand/rawnand/fsl_ifc_nand.c            |  28 ++---
 drivers/mtd/nand/rawnand/fsl_upm.c                 |  12 +--
 drivers/mtd/nand/rawnand/fsmc_nand.c               |  24 ++---
 drivers/mtd/nand/rawnand/gpio.c                    |   6 +-
 drivers/mtd/nand/rawnand/gpmi-nand/gpmi-lib.c      |   2 +-
 drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.c     |  38 +++----
 drivers/mtd/nand/rawnand/hisi504_nand.c            |  24 ++---
 drivers/mtd/nand/rawnand/jz4740_nand.c             |  12 +--
 drivers/mtd/nand/rawnand/jz4780_nand.c             |   8 +-
 drivers/mtd/nand/rawnand/lpc32xx_mlc.c             |  16 +--
 drivers/mtd/nand/rawnand/lpc32xx_slc.c             |  20 ++--
 drivers/mtd/nand/rawnand/mpc5121_nfc.c             |  26 ++---
 drivers/mtd/nand/rawnand/mtk_nand.c                |  38 +++----
 drivers/mtd/nand/rawnand/mxc_nand.c                |  52 ++++-----
 drivers/mtd/nand/rawnand/nand_base.c               | 120 ++++++++++-----------
 drivers/mtd/nand/rawnand/nand_bbt.c                |  34 +++---
 drivers/mtd/nand/rawnand/nand_bch.c                |   6 +-
 drivers/mtd/nand/rawnand/nand_ecc.c                |   4 +-
 drivers/mtd/nand/rawnand/nandsim.c                 |  22 ++--
 drivers/mtd/nand/rawnand/ndfc.c                    |  18 ++--
 drivers/mtd/nand/rawnand/nuc900_nand.c             |   8 +-
 drivers/mtd/nand/rawnand/omap2.c                   |  20 ++--
 drivers/mtd/nand/rawnand/orion_nand.c              |   6 +-
 drivers/mtd/nand/rawnand/pasemi_nand.c             |  10 +-
 drivers/mtd/nand/rawnand/plat_nand.c               |   4 +-
 drivers/mtd/nand/rawnand/pxa3xx_nand.c             |  36 +++----
 drivers/mtd/nand/rawnand/qcom_nandc.c              |  28 ++---
 drivers/mtd/nand/rawnand/r852.c                    |   8 +-
 drivers/mtd/nand/rawnand/s3c2410.c                 |  16 +--
 drivers/mtd/nand/rawnand/sh_flctl.c                |  10 +-
 drivers/mtd/nand/rawnand/sharpsl.c                 |   8 +-
 drivers/mtd/nand/rawnand/sm_common.c               |   2 +-
 drivers/mtd/nand/rawnand/socrates_nand.c           |  12 +--
 drivers/mtd/nand/rawnand/sunxi_nand.c              |  58 +++++-----
 drivers/mtd/nand/rawnand/tmio_nand.c               |   8 +-
 drivers/mtd/nand/rawnand/txx9ndfmc.c               |  14 +--
 drivers/mtd/nand/rawnand/vf610_nfc.c               |   4 +-
 drivers/mtd/nand/rawnand/xway_nand.c               |  10 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |   6 +-
 include/linux/mtd/rawnand.h                        |   4 +-
 include/linux/mtd/sh_flctl.h                       |   2 +-
 77 files changed, 619 insertions(+), 619 deletions(-)

diff --git a/Documentation/DocBook/mtdnand.tmpl b/Documentation/DocBook/mtdnand.tmpl
index 35ec7155faa3..ae8ef3c53641 100644
--- a/Documentation/DocBook/mtdnand.tmpl
+++ b/Documentation/DocBook/mtdnand.tmpl
@@ -169,7 +169,7 @@
 			The NAND chip structure embeds an mtd structure
 			which will be registered to the MTD subsystem.
 			You can extract a pointer to the mtd structure
-			from a nand_chip pointer using the nand_to_mtd()
+			from a nand_chip pointer using the nandc_to_mtd()
 			helper.
 		</para>
 		<para>
@@ -237,7 +237,7 @@ static void board_hwcontrol(struct mtd_info *mtd, int cmd)
 		<programlisting>
 static void board_hwcontrol(struct mtd_info *mtd, int cmd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	switch(cmd){
 		case NAND_CTL_SETCLE: this->IO_ADDR_W |= CLE_ADRR_BIT;  break;
 		case NAND_CTL_CLRCLE: this->IO_ADDR_W &amp;= ~CLE_ADRR_BIT; break;
@@ -283,7 +283,7 @@ static int __init board_init (void)
 		goto out;
 	}
 
-	board_mtd = nand_to_mtd(this);
+	board_mtd = nandc_to_mtd(this);
 
 	/* map physical address */
 	baseaddr = ioremap(CHIP_PHYSICAL_ADDRESS, 1024);
@@ -342,7 +342,7 @@ static void __exit board_cleanup (void)
 	iounmap(baseaddr);
 	
 	/* Free the MTD device structure */
-	kfree (mtd_to_nand(board_mtd));
+	kfree (mtd_to_nandc(board_mtd));
 }
 module_exit(board_cleanup);
 #endif
@@ -398,7 +398,7 @@ static void board_select_chip (struct mtd_info *mtd, int chip)
 		<programlisting>
 static void board_select_chip (struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	
 	/* Deselect all chips */
 	this->IO_ADDR_R &amp;= ~BOARD_NAND_ADDR_MASK;
diff --git a/arch/arm/mach-ep93xx/snappercl15.c b/arch/arm/mach-ep93xx/snappercl15.c
index 8b29398f4dc7..7996609ae516 100644
--- a/arch/arm/mach-ep93xx/snappercl15.c
+++ b/arch/arm/mach-ep93xx/snappercl15.c
@@ -49,7 +49,7 @@
 static void snappercl15_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				      unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	static u16 nand_state = SNAPPERCL15_NAND_WPN;
 	u16 set;
 
@@ -76,7 +76,7 @@ static void snappercl15_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 
 static int snappercl15_nand_dev_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	return !!(__raw_readw(NAND_CTRL_ADDR(chip)) & SNAPPERCL15_NAND_RDY);
 }
diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index 9def3b98945e..7627e874e568 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -74,7 +74,7 @@ static void __init ts72xx_map_io(void)
 static void ts72xx_nand_hwcontrol(struct mtd_info *mtd,
 				  int cmd, unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
 		void __iomem *addr = chip->IO_ADDR_R;
@@ -96,7 +96,7 @@ static void ts72xx_nand_hwcontrol(struct mtd_info *mtd,
 
 static int ts72xx_nand_device_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	void __iomem *addr = chip->IO_ADDR_R;
 
 	addr += (1 << TS72XX_NAND_BUSY_ADDR_LINE);
diff --git a/arch/arm/mach-imx/mach-qong.c b/arch/arm/mach-imx/mach-qong.c
index 9658e49577af..0ab363864241 100644
--- a/arch/arm/mach-imx/mach-qong.c
+++ b/arch/arm/mach-imx/mach-qong.c
@@ -131,7 +131,7 @@ static void qong_init_nor_mtd(void)
  */
 static void qong_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 
 	if (cmd == NAND_CMD_NONE)
 		return;
diff --git a/arch/arm/mach-ixp4xx/ixdp425-setup.c b/arch/arm/mach-ixp4xx/ixdp425-setup.c
index 93b89291c06b..e951d78b133a 100644
--- a/arch/arm/mach-ixp4xx/ixdp425-setup.c
+++ b/arch/arm/mach-ixp4xx/ixdp425-setup.c
@@ -76,7 +76,7 @@ static struct mtd_partition ixdp425_partitions[] = {
 static void
 ixdp425_flash_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int offset = (int)nand_get_controller_data(this);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
diff --git a/arch/arm/mach-omap1/board-nand.c b/arch/arm/mach-omap1/board-nand.c
index 1bffbb4e050f..662f2e402a23 100644
--- a/arch/arm/mach-omap1/board-nand.c
+++ b/arch/arm/mach-omap1/board-nand.c
@@ -22,7 +22,7 @@
 
 void omap1_nand_cmd_ctl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	unsigned long mask;
 
 	if (cmd == NAND_CMD_NONE)
diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index 4632e674e9c5..824f3feccb47 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -176,7 +176,7 @@ static void ts78xx_ts_rtc_unload(void)
 static void ts78xx_ts_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 			unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
 		unsigned char bits;
@@ -200,7 +200,7 @@ static int ts78xx_ts_nand_dev_ready(struct mtd_info *mtd)
 static void ts78xx_ts_nand_write_buf(struct mtd_info *mtd,
 			const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	void __iomem *io_base = chip->IO_ADDR_W;
 	unsigned long off = ((unsigned long)buf & 3);
 	int sz;
@@ -227,7 +227,7 @@ static void ts78xx_ts_nand_write_buf(struct mtd_info *mtd,
 static void ts78xx_ts_nand_read_buf(struct mtd_info *mtd,
 			uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	void __iomem *io_base = chip->IO_ADDR_R;
 	unsigned long off = ((unsigned long)buf & 3);
 	int sz;
diff --git a/arch/arm/mach-pxa/balloon3.c b/arch/arm/mach-pxa/balloon3.c
index 38afb6fa1dcf..ce4e1f747c8d 100644
--- a/arch/arm/mach-pxa/balloon3.c
+++ b/arch/arm/mach-pxa/balloon3.c
@@ -572,7 +572,7 @@ static inline void balloon3_i2c_init(void) {}
 #if defined(CONFIG_MTD_NAND_PLATFORM)||defined(CONFIG_MTD_NAND_PLATFORM_MODULE)
 static void balloon3_nand_cmd_ctl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	uint8_t balloon3_ctl_set = 0, balloon3_ctl_clr = 0;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
diff --git a/arch/arm/mach-pxa/em-x270.c b/arch/arm/mach-pxa/em-x270.c
index a6c5f5b96e47..ac4c9714e2f6 100644
--- a/arch/arm/mach-pxa/em-x270.c
+++ b/arch/arm/mach-pxa/em-x270.c
@@ -289,7 +289,7 @@ static void nand_cs_off(void)
 static void em_x270_nand_cmd_ctl(struct mtd_info *mtd, int dat,
 				 unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	unsigned long nandaddr = (unsigned long)this->IO_ADDR_W;
 
 	dsb();
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index 47e3e38e9bec..d7782217cf76 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -250,7 +250,7 @@ static inline void palmtx_keys_init(void) {}
 static void palmtx_nand_cmd_ctl(struct mtd_info *mtd, int cmd,
 				 unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	char __iomem *nandaddr = this->IO_ADDR_W;
 
 	if (cmd == NAND_CMD_NONE)
diff --git a/arch/blackfin/mach-bf537/boards/stamp.c b/arch/blackfin/mach-bf537/boards/stamp.c
index ab3034fd1c5b..3aa49a78ca81 100644
--- a/arch/blackfin/mach-bf537/boards/stamp.c
+++ b/arch/blackfin/mach-bf537/boards/stamp.c
@@ -404,7 +404,7 @@ static struct mtd_partition bfin_plat_nand_partitions[] = {
 #define BFIN_NAND_PLAT_ALE 1
 static void bfin_plat_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	if (cmd == NAND_CMD_NONE)
 		return;
diff --git a/arch/blackfin/mach-bf561/boards/acvilon.c b/arch/blackfin/mach-bf561/boards/acvilon.c
index 696cc9d7820a..da00a178676e 100644
--- a/arch/blackfin/mach-bf561/boards/acvilon.c
+++ b/arch/blackfin/mach-bf561/boards/acvilon.c
@@ -267,7 +267,7 @@ static struct mtd_partition bfin_plat_nand_partitions[] = {
 static void bfin_plat_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				    unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	if (cmd == NAND_CMD_NONE)
 		return;
diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index 925a98eb6d68..95655cc22090 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -51,7 +51,7 @@ static void crisv32_hwcontrol(struct mtd_info *mtd, int cmd,
 {
 	unsigned long flags;
 	reg_pio_rw_dout dout;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	local_irq_save(flags);
 
@@ -147,7 +147,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 
 	/* Get pointer to private data */
 	this = &wrapper->chip;
-	crisv32_mtd = nand_to_mtd(this);
+	crisv32_mtd = nandc_to_mtd(this);
 
 	/* Set address of NAND IO lines */
 	this->IO_ADDR_R = read_cs;
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index 53b56a429dde..3acc5008a8c2 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -50,7 +50,7 @@ static void crisv32_hwcontrol(struct mtd_info *mtd, int cmd,
 {
 	unsigned long flags;
 	reg_gio_rw_pa_dout dout;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	local_irq_save(flags);
 
@@ -128,7 +128,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 
 	/* Get pointer to private data */
 	this = &wrapper->chip;
-	crisv32_mtd = nand_to_mtd(this);
+	crisv32_mtd = nandc_to_mtd(this);
 
 	pa_oe.oe |= 1 << CE_BIT;
 	pa_oe.oe |= 1 << ALE_BIT;
diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index 83831002c832..c0135c94123f 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -200,7 +200,7 @@ static struct i2c_board_info db1200_i2c_devs[] __initdata = {
 static void au1200_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				 unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
 
 	ioaddr &= 0xffffff00;
diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index 06c18a80a129..a92141d1a96f 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -150,7 +150,7 @@ static void __init db1300_gpio_config(void)
 static void au1300_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				 unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
 
 	ioaddr &= 0xffffff00;
diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index 421bd5793f7e..3c5a803e38fe 100644
--- a/arch/mips/alchemy/devboards/db1550.c
+++ b/arch/mips/alchemy/devboards/db1550.c
@@ -128,7 +128,7 @@ static struct i2c_board_info db1550_i2c_devs[] __initdata = {
 static void au1550_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				 unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
 
 	ioaddr &= 0xffffff00;
diff --git a/arch/mips/jz4740/board-qi_lb60.c b/arch/mips/jz4740/board-qi_lb60.c
index 258fd03c9ef5..28f3984da44f 100644
--- a/arch/mips/jz4740/board-qi_lb60.c
+++ b/arch/mips/jz4740/board-qi_lb60.c
@@ -138,7 +138,7 @@ static void qi_lb60_nand_ident(struct platform_device *pdev,
 		struct mtd_info *mtd, struct mtd_partition **partitions,
 		int *num_partitions)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (chip->page_shift == 12) {
 		*partitions = qi_lb60_partitions_2gb;
diff --git a/arch/mips/pnx833x/common/platform.c b/arch/mips/pnx833x/common/platform.c
index 9b0f2a9a50f7..a0d74b872f1f 100644
--- a/arch/mips/pnx833x/common/platform.c
+++ b/arch/mips/pnx833x/common/platform.c
@@ -180,7 +180,7 @@ static struct platform_device pnx833x_sata_device = {
 static void
 pnx833x_flash_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	unsigned long nandaddr = (unsigned long)this->IO_ADDR_W;
 
 	if (cmd == NAND_CMD_NONE)
diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 32ea3e6731d6..914b01e2dfcf 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -148,7 +148,7 @@ static int rb532_dev_ready(struct mtd_info *mtd)
 
 static void rb532_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	unsigned char orbits, nandbits;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
diff --git a/arch/sh/boards/mach-migor/setup.c b/arch/sh/boards/mach-migor/setup.c
index 0bcbe58b11e9..08bb54d5cade 100644
--- a/arch/sh/boards/mach-migor/setup.c
+++ b/arch/sh/boards/mach-migor/setup.c
@@ -166,7 +166,7 @@ static struct mtd_partition migor_nand_flash_partitions[] = {
 static void migor_nand_flash_cmd_ctl(struct mtd_info *mtd, int cmd,
 				     unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (cmd == NAND_CMD_NONE)
 		return;
diff --git a/drivers/mtd/nand/rawnand/ams-delta.c b/drivers/mtd/nand/rawnand/ams-delta.c
index 0972493b6cd2..c8b8d8b93f74 100644
--- a/drivers/mtd/nand/rawnand/ams-delta.c
+++ b/drivers/mtd/nand/rawnand/ams-delta.c
@@ -64,7 +64,7 @@ static struct mtd_partition partition_info[] = {
 
 static void ams_delta_write_byte(struct mtd_info *mtd, u_char byte)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	void __iomem *io_base = (void __iomem *)nand_get_controller_data(this);
 
 	writew(0, io_base + OMAP_MPUIO_IO_CNTL);
@@ -77,7 +77,7 @@ static void ams_delta_write_byte(struct mtd_info *mtd, u_char byte)
 static u_char ams_delta_read_byte(struct mtd_info *mtd)
 {
 	u_char res;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	void __iomem *io_base = (void __iomem *)nand_get_controller_data(this);
 
 	gpio_set_value(AMS_DELTA_GPIO_PIN_NAND_NRE, 0);
@@ -190,7 +190,7 @@ static int ams_delta_init(struct platform_device *pdev)
 		goto out;
 	}
 
-	ams_delta_mtd = nand_to_mtd(this);
+	ams_delta_mtd = nandc_to_mtd(this);
 	ams_delta_mtd->owner = THIS_MODULE;
 
 	/*
@@ -271,7 +271,7 @@ static int ams_delta_cleanup(struct platform_device *pdev)
 	iounmap(io_base);
 
 	/* Free the MTD device structure */
-	kfree(mtd_to_nand(ams_delta_mtd));
+	kfree(mtd_to_nandc(ams_delta_mtd));
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/rawnand/atmel_nand.c b/drivers/mtd/nand/rawnand/atmel_nand.c
index fbb7e5da2541..f72bb35b53c1 100644
--- a/drivers/mtd/nand/rawnand/atmel_nand.c
+++ b/drivers/mtd/nand/rawnand/atmel_nand.c
@@ -194,7 +194,7 @@ static void atmel_nand_disable(struct atmel_nand_host *host)
  */
 static void atmel_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
@@ -217,7 +217,7 @@ static void atmel_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl
  */
 static int atmel_nand_device_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 
 	return gpio_get_value(host->board.rdy_pin) ^
@@ -227,7 +227,7 @@ static int atmel_nand_device_ready(struct mtd_info *mtd)
 /* Set up for hardware ready pin and enable pin. */
 static int atmel_nand_set_enable_ready_pins(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(chip);
 	int res = 0;
 
@@ -279,7 +279,7 @@ static int atmel_nand_set_enable_ready_pins(struct mtd_info *mtd)
  */
 static void atmel_read_buf8(struct mtd_info *mtd, u8 *buf, int len)
 {
-	struct nand_chip	*nand_chip = mtd_to_nand(mtd);
+	struct nand_chip	*nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (host->nfc && host->nfc->use_nfc_sram && host->nfc->data_in_sram) {
@@ -292,7 +292,7 @@ static void atmel_read_buf8(struct mtd_info *mtd, u8 *buf, int len)
 
 static void atmel_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
 {
-	struct nand_chip	*nand_chip = mtd_to_nand(mtd);
+	struct nand_chip	*nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (host->nfc && host->nfc->use_nfc_sram && host->nfc->data_in_sram) {
@@ -305,14 +305,14 @@ static void atmel_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
 
 static void atmel_write_buf8(struct mtd_info *mtd, const u8 *buf, int len)
 {
-	struct nand_chip	*nand_chip = mtd_to_nand(mtd);
+	struct nand_chip	*nand_chip = mtd_to_nandc(mtd);
 
 	__raw_writesb(nand_chip->IO_ADDR_W, buf, len);
 }
 
 static void atmel_write_buf16(struct mtd_info *mtd, const u8 *buf, int len)
 {
-	struct nand_chip	*nand_chip = mtd_to_nand(mtd);
+	struct nand_chip	*nand_chip = mtd_to_nandc(mtd);
 
 	__raw_writesw(nand_chip->IO_ADDR_W, buf, len / 2);
 }
@@ -329,7 +329,7 @@ static int nfc_set_sram_bank(struct atmel_nand_host *host, unsigned int bank)
 		return -EINVAL;
 
 	if (bank) {
-		struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
+		struct mtd_info *mtd = nandc_to_mtd(&host->nand_chip);
 
 		/* Only for a 2k-page or lower flash, NFC can handle 2 banks */
 		if (mtd->writesize > 2048)
@@ -366,7 +366,7 @@ static int atmel_nand_dma_op(struct mtd_info *mtd, void *buf, int len,
 	dma_addr_t dma_src_addr, dma_dst_addr, phys_addr;
 	struct dma_async_tx_descriptor *tx = NULL;
 	dma_cookie_t cookie;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(chip);
 	void *p = buf;
 	int err = -EIO;
@@ -439,7 +439,7 @@ err_buf:
 
 static void atmel_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (use_dma && len > mtd->oobsize)
 		/* only use DMA for bigger than oob size: better performances */
@@ -454,7 +454,7 @@ static void atmel_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 
 static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (use_dma && len > mtd->oobsize)
 		/* only use DMA for bigger than oob size: better performances */
@@ -530,7 +530,7 @@ static int pmecc_data_alloc(struct atmel_nand_host *host)
 
 static void pmecc_gen_syndrome(struct mtd_info *mtd, int sector)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 	int i;
 	uint32_t value;
@@ -547,7 +547,7 @@ static void pmecc_gen_syndrome(struct mtd_info *mtd, int sector)
 
 static void pmecc_substitute(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 	int16_t __iomem *alpha_to = host->pmecc_alpha_to;
 	int16_t __iomem *index_of = host->pmecc_index_of;
@@ -589,7 +589,7 @@ static void pmecc_substitute(struct mtd_info *mtd)
 
 static void pmecc_get_sigma(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 
 	int16_t *lmu = host->pmecc_lmu;
@@ -747,7 +747,7 @@ static void pmecc_get_sigma(struct mtd_info *mtd)
 
 static int pmecc_err_location(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 	unsigned long end_time;
 	const int cap = host->pmecc_corr_cap;
@@ -799,7 +799,7 @@ static int pmecc_err_location(struct mtd_info *mtd)
 static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
 		int sector_num, int extra_bytes, int err_nbr)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 	int i = 0;
 	int byte_pos, bit_pos, sector_size, pos;
@@ -848,7 +848,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
 static int pmecc_correction(struct mtd_info *mtd, u32 pmecc_stat, uint8_t *buf,
 	u8 *ecc)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 	int i, err_nbr;
 	uint8_t *buf_pos;
@@ -1001,7 +1001,7 @@ static int atmel_nand_pmecc_write_page(struct mtd_info *mtd,
 
 static void atmel_pmecc_core_init(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 	int eccbytes = mtd_ooblayout_count_eccbytes(mtd);
 	uint32_t val = 0;
@@ -1178,7 +1178,7 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 					 struct atmel_nand_host *host)
 {
 	struct nand_chip *nand_chip = &host->nand_chip;
-	struct mtd_info *mtd = nand_to_mtd(nand_chip);
+	struct mtd_info *mtd = nandc_to_mtd(nand_chip);
 	struct resource *regs, *regs_pmerr, *regs_rom;
 	uint16_t *galois_table;
 	int cap, sector_size, err_no;
@@ -1327,7 +1327,7 @@ err:
 static int atmel_nand_calculate(struct mtd_info *mtd,
 		const u_char *dat, unsigned char *ecc_code)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 	unsigned int ecc_value;
 
@@ -1432,7 +1432,7 @@ static int atmel_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 static int atmel_nand_correct(struct mtd_info *mtd, u_char *dat,
 		u_char *read_ecc, u_char *isnull)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 	unsigned int ecc_status;
 	unsigned int ecc_word, ecc_bit;
@@ -1498,7 +1498,7 @@ static int atmel_nand_correct(struct mtd_info *mtd, u_char *dat,
  */
 static void atmel_nand_hwctl(struct mtd_info *mtd, int mode)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (host->board.need_reset_workaround)
@@ -1619,7 +1619,7 @@ static int atmel_hw_nand_init_params(struct platform_device *pdev,
 					 struct atmel_nand_host *host)
 {
 	struct nand_chip *nand_chip = &host->nand_chip;
-	struct mtd_info *mtd = nand_to_mtd(nand_chip);
+	struct mtd_info *mtd = nandc_to_mtd(nand_chip);
 	struct resource		*regs;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
@@ -1805,7 +1805,7 @@ static int nfc_send_command(struct atmel_nand_host *host,
 static int nfc_device_ready(struct mtd_info *mtd)
 {
 	u32 status, mask;
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 
 	status = nfc_read_status(host);
@@ -1821,7 +1821,7 @@ static int nfc_device_ready(struct mtd_info *mtd)
 
 static void nfc_select_chip(struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (chip == -1)
@@ -1833,7 +1833,7 @@ static void nfc_select_chip(struct mtd_info *mtd, int chip)
 static int nfc_make_addr(struct mtd_info *mtd, int command, int column,
 		int page_addr, unsigned int *addr1234, unsigned int *cycle0)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	int acycle = 0;
 	unsigned char addr_bytes[8];
@@ -1873,7 +1873,7 @@ static int nfc_make_addr(struct mtd_info *mtd, int command, int column,
 static void nfc_nand_command(struct mtd_info *mtd, unsigned int command,
 				int column, int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(chip);
 	unsigned long timeout;
 	unsigned int nfc_addr_cmd = 0;
@@ -2060,7 +2060,7 @@ static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 static int nfc_sram_init(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct atmel_nand_host *host = nand_get_controller_data(chip);
 	int res = 0;
 
@@ -2147,7 +2147,7 @@ static int atmel_nand_probe(struct platform_device *pdev)
 	host->io_phys = (dma_addr_t)mem->start;
 
 	nand_chip = &host->nand_chip;
-	mtd = nand_to_mtd(nand_chip);
+	mtd = nandc_to_mtd(nand_chip);
 	host->dev = &pdev->dev;
 	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
 		nand_set_flash_node(nand_chip, pdev->dev.of_node);
@@ -2334,7 +2334,7 @@ err_nand_ioremap:
 static int atmel_nand_remove(struct platform_device *pdev)
 {
 	struct atmel_nand_host *host = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->nand_chip);
 
 	nand_release(mtd);
 
diff --git a/drivers/mtd/nand/rawnand/au1550nd.c b/drivers/mtd/nand/rawnand/au1550nd.c
index 9d4a28fa6b73..c4dd144f25e0 100644
--- a/drivers/mtd/nand/rawnand/au1550nd.c
+++ b/drivers/mtd/nand/rawnand/au1550nd.c
@@ -38,7 +38,7 @@ struct au1550nd_ctx {
  */
 static u_char au_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	u_char ret = readb(this->IO_ADDR_R);
 	wmb(); /* drain writebuffer */
 	return ret;
@@ -53,7 +53,7 @@ static u_char au_read_byte(struct mtd_info *mtd)
  */
 static void au_write_byte(struct mtd_info *mtd, u_char byte)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	writeb(byte, this->IO_ADDR_W);
 	wmb(); /* drain writebuffer */
 }
@@ -66,7 +66,7 @@ static void au_write_byte(struct mtd_info *mtd, u_char byte)
  */
 static u_char au_read_byte16(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	u_char ret = (u_char) cpu_to_le16(readw(this->IO_ADDR_R));
 	wmb(); /* drain writebuffer */
 	return ret;
@@ -81,7 +81,7 @@ static u_char au_read_byte16(struct mtd_info *mtd)
  */
 static void au_write_byte16(struct mtd_info *mtd, u_char byte)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	writew(le16_to_cpu((u16) byte), this->IO_ADDR_W);
 	wmb(); /* drain writebuffer */
 }
@@ -94,7 +94,7 @@ static void au_write_byte16(struct mtd_info *mtd, u_char byte)
  */
 static u16 au_read_word(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	u16 ret = readw(this->IO_ADDR_R);
 	wmb(); /* drain writebuffer */
 	return ret;
@@ -111,7 +111,7 @@ static u16 au_read_word(struct mtd_info *mtd)
 static void au_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	int i;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	for (i = 0; i < len; i++) {
 		writeb(buf[i], this->IO_ADDR_W);
@@ -130,7 +130,7 @@ static void au_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 static void au_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	int i;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	for (i = 0; i < len; i++) {
 		buf[i] = readb(this->IO_ADDR_R);
@@ -149,7 +149,7 @@ static void au_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 static void au_write_buf16(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	int i;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	u16 *p = (u16 *) buf;
 	len >>= 1;
 
@@ -171,7 +171,7 @@ static void au_write_buf16(struct mtd_info *mtd, const u_char *buf, int len)
 static void au_read_buf16(struct mtd_info *mtd, u_char *buf, int len)
 {
 	int i;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	u16 *p = (u16 *) buf;
 	len >>= 1;
 
@@ -196,7 +196,7 @@ static void au_read_buf16(struct mtd_info *mtd, u_char *buf, int len)
 
 static void au1550_hwcontrol(struct mtd_info *mtd, int cmd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct au1550nd_ctx *ctx = container_of(this, struct au1550nd_ctx,
 						chip);
 
@@ -267,7 +267,7 @@ static void au1550_select_chip(struct mtd_info *mtd, int chip)
  */
 static void au1550_command(struct mtd_info *mtd, unsigned command, int column, int page_addr)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct au1550nd_ctx *ctx = container_of(this, struct au1550nd_ctx,
 						chip);
 	int ce_override = 0, i;
@@ -440,7 +440,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 	}
 
 	this = &ctx->chip;
-	mtd = nand_to_mtd(this);
+	mtd = nandc_to_mtd(this);
 	mtd->dev.parent = &pdev->dev;
 
 	/* figure out which CS# r->start belongs to */
@@ -496,7 +496,7 @@ static int au1550nd_remove(struct platform_device *pdev)
 	struct au1550nd_ctx *ctx = platform_get_drvdata(pdev);
 	struct resource *r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	nand_release(nand_to_mtd(&ctx->chip));
+	nand_release(nandc_to_mtd(&ctx->chip));
 	iounmap(ctx->base);
 	release_mem_region(r->start, 0x1000);
 	kfree(ctx);
diff --git a/drivers/mtd/nand/rawnand/bcm47xxnflash/main.c b/drivers/mtd/nand/rawnand/bcm47xxnflash/main.c
index fb31429b70a9..3c10466f3bf3 100644
--- a/drivers/mtd/nand/rawnand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/rawnand/bcm47xxnflash/main.c
@@ -35,7 +35,7 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
-	mtd = nand_to_mtd(&b47n->nand_chip);
+	mtd = nandc_to_mtd(&b47n->nand_chip);
 	mtd->dev.parent = &pdev->dev;
 	b47n->cc = container_of(nflash, struct bcma_drv_cc, nflash);
 
@@ -65,7 +65,7 @@ static int bcm47xxnflash_remove(struct platform_device *pdev)
 {
 	struct bcm47xxnflash *nflash = platform_get_drvdata(pdev);
 
-	nand_release(nand_to_mtd(&nflash->nand_chip));
+	nand_release(nandc_to_mtd(&nflash->nand_chip));
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/rawnand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/rawnand/bcm47xxnflash/ops_bcm4706.c
index f1da4ea88f2c..93e1f61b7b77 100644
--- a/drivers/mtd/nand/rawnand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/rawnand/bcm47xxnflash/ops_bcm4706.c
@@ -89,7 +89,7 @@ static int bcm47xxnflash_ops_bcm4706_poll(struct bcma_drv_cc *cc)
 static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
 					   int len)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 
 	u32 ctlcode;
@@ -139,7 +139,7 @@ static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
 static void bcm47xxnflash_ops_bcm4706_write(struct mtd_info *mtd,
 					    const uint8_t *buf, int len)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 	struct bcma_drv_cc *cc = b47n->cc;
 
@@ -173,7 +173,7 @@ static void bcm47xxnflash_ops_bcm4706_write(struct mtd_info *mtd,
 static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct mtd_info *mtd, int cmd,
 					       unsigned int ctrl)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 	u32 code = 0;
 
@@ -199,7 +199,7 @@ static void bcm47xxnflash_ops_bcm4706_select_chip(struct mtd_info *mtd,
 
 static int bcm47xxnflash_ops_bcm4706_dev_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 
 	return !!(bcma_cc_read32(b47n->cc, BCMA_CC_NFLASH_CTL) & NCTL_READY);
@@ -216,7 +216,7 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 					      unsigned command, int column,
 					      int page_addr)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 	struct bcma_drv_cc *cc = b47n->cc;
 	u32 ctlcode;
@@ -312,7 +312,7 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 
 static u8 bcm47xxnflash_ops_bcm4706_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 	struct bcma_drv_cc *cc = b47n->cc;
 	u32 tmp = 0;
@@ -341,7 +341,7 @@ static u8 bcm47xxnflash_ops_bcm4706_read_byte(struct mtd_info *mtd)
 static void bcm47xxnflash_ops_bcm4706_read_buf(struct mtd_info *mtd,
 					       uint8_t *buf, int len)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 
 	switch (b47n->curr_command) {
@@ -357,7 +357,7 @@ static void bcm47xxnflash_ops_bcm4706_read_buf(struct mtd_info *mtd,
 static void bcm47xxnflash_ops_bcm4706_write_buf(struct mtd_info *mtd,
 						const uint8_t *buf, int len)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 
 	switch (b47n->curr_command) {
@@ -421,7 +421,7 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 			(w4 << 24 | w3 << 18 | w2 << 12 | w1 << 6 | w0));
 
 	/* Scan NAND */
-	err = nand_scan(nand_to_mtd(&b47n->nand_chip), 1);
+	err = nand_scan(nandc_to_mtd(&b47n->nand_chip), 1);
 	if (err) {
 		pr_err("Could not scan NAND flash: %d\n", err);
 		goto exit;
diff --git a/drivers/mtd/nand/rawnand/bf5xx_nand.c b/drivers/mtd/nand/rawnand/bf5xx_nand.c
index 5655dca6ce43..84d673f7cf36 100644
--- a/drivers/mtd/nand/rawnand/bf5xx_nand.c
+++ b/drivers/mtd/nand/rawnand/bf5xx_nand.c
@@ -162,9 +162,9 @@ struct bf5xx_nand_info {
 /*
  * Conversion functions
  */
-static struct bf5xx_nand_info *mtd_to_nand_info(struct mtd_info *mtd)
+static struct bf5xx_nand_info *mtd_to_nandc_info(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct bf5xx_nand_info,
+	return container_of(mtd_to_nandc(mtd), struct bf5xx_nand_info,
 			    chip);
 }
 
@@ -230,7 +230,7 @@ static int bf5xx_nand_devready(struct mtd_info *mtd)
 static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
 					u_char *read_ecc, u_char *calc_ecc)
 {
-	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
+	struct bf5xx_nand_info *info = mtd_to_nandc_info(mtd);
 	u32 syndrome[5];
 	u32 calced, stored;
 	int i;
@@ -309,7 +309,7 @@ static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
 static int bf5xx_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 					u_char *read_ecc, u_char *calc_ecc)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ret, bitflips = 0;
 
 	ret = bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
@@ -341,8 +341,8 @@ static void bf5xx_nand_enable_hwecc(struct mtd_info *mtd, int mode)
 static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 		const u_char *dat, u_char *ecc_code)
 {
-	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct bf5xx_nand_info *info = mtd_to_nandc_info(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	u16 ecc0, ecc1;
 	u32 code[2];
 	u8 *p;
@@ -478,8 +478,8 @@ static irqreturn_t bf5xx_nand_dma_irq(int irq, void *dev_id)
 static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 				uint8_t *buf, int is_read)
 {
-	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct bf5xx_nand_info *info = mtd_to_nandc_info(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	unsigned short val;
 
 	dev_dbg(info->device, " mtd->%p, buf->%p, is_read %d\n",
@@ -544,8 +544,8 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 static void bf5xx_nand_dma_read_buf(struct mtd_info *mtd,
 					uint8_t *buf, int len)
 {
-	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct bf5xx_nand_info *info = mtd_to_nandc_info(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	dev_dbg(info->device, "mtd->%p, buf->%p, int %d\n", mtd, buf, len);
 
@@ -558,8 +558,8 @@ static void bf5xx_nand_dma_read_buf(struct mtd_info *mtd,
 static void bf5xx_nand_dma_write_buf(struct mtd_info *mtd,
 				const uint8_t *buf, int len)
 {
-	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct bf5xx_nand_info *info = mtd_to_nandc_info(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	dev_dbg(info->device, "mtd->%p, buf->%p, len %d\n", mtd, buf, len);
 
@@ -673,7 +673,7 @@ static int bf5xx_nand_hw_init(struct bf5xx_nand_info *info)
  */
 static int bf5xx_nand_add_partition(struct bf5xx_nand_info *info)
 {
-	struct mtd_info *mtd = nand_to_mtd(&info->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&info->chip);
 	struct mtd_partition *parts = info->platform->partitions;
 	int nr = info->platform->nr_partitions;
 
@@ -688,7 +688,7 @@ static int bf5xx_nand_remove(struct platform_device *pdev)
 	 * and their partitions, then go through freeing the
 	 * resources used
 	 */
-	nand_release(nand_to_mtd(&info->chip));
+	nand_release(nandc_to_mtd(&info->chip));
 
 	peripheral_free_list(bfin_nfc_pin_req);
 	bf5xx_nand_dma_remove(info);
@@ -698,7 +698,7 @@ static int bf5xx_nand_remove(struct platform_device *pdev)
 
 static int bf5xx_nand_scan(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ret;
 
 	ret = nand_scan_ident(mtd, 1, NULL);
@@ -768,7 +768,7 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 
 	/* initialise chip data struct */
 	chip = &info->chip;
-	mtd = nand_to_mtd(&info->chip);
+	mtd = nandc_to_mtd(&info->chip);
 
 	if (plat->data_width)
 		chip->options |= NAND_BUSWIDTH_16;
diff --git a/drivers/mtd/nand/rawnand/brcmnand/brcmnand.c b/drivers/mtd/nand/rawnand/brcmnand/brcmnand.c
index 98453816a0a2..62545f25c87e 100644
--- a/drivers/mtd/nand/rawnand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/rawnand/brcmnand/brcmnand.c
@@ -844,7 +844,7 @@ static inline bool is_hamming_ecc(struct brcmnand_controller *ctrl,
 static int brcmnand_hamming_ooblayout_ecc(struct mtd_info *mtd, int section,
 					  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_cfg *cfg = &host->hwcfg;
 	int sas = cfg->spare_area_size << cfg->sector_size_1k;
@@ -862,7 +862,7 @@ static int brcmnand_hamming_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
 					   struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_cfg *cfg = &host->hwcfg;
 	int sas = cfg->spare_area_size << cfg->sector_size_1k;
@@ -902,7 +902,7 @@ static const struct mtd_ooblayout_ops brcmnand_hamming_ooblayout_ops = {
 static int brcmnand_bch_ooblayout_ecc(struct mtd_info *mtd, int section,
 				      struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_cfg *cfg = &host->hwcfg;
 	int sas = cfg->spare_area_size << cfg->sector_size_1k;
@@ -920,7 +920,7 @@ static int brcmnand_bch_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int brcmnand_bch_ooblayout_free_lp(struct mtd_info *mtd, int section,
 					  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_cfg *cfg = &host->hwcfg;
 	int sas = cfg->spare_area_size << cfg->sector_size_1k;
@@ -946,7 +946,7 @@ static int brcmnand_bch_ooblayout_free_lp(struct mtd_info *mtd, int section,
 static int brcmnand_bch_ooblayout_free_sp(struct mtd_info *mtd, int section,
 					  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_cfg *cfg = &host->hwcfg;
 	int sas = cfg->spare_area_size << cfg->sector_size_1k;
@@ -979,7 +979,7 @@ static const struct mtd_ooblayout_ops brcmnand_bch_sp_ooblayout_ops = {
 static int brcmstb_choose_ecc_layout(struct brcmnand_host *host)
 {
 	struct brcmnand_cfg *p = &host->hwcfg;
-	struct mtd_info *mtd = nand_to_mtd(&host->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->chip);
 	struct nand_ecc_ctrl *ecc = &host->chip.ecc;
 	unsigned int ecc_level = p->ecc_level;
 	int sas = p->spare_area_size << p->sector_size_1k;
@@ -1018,7 +1018,7 @@ static int brcmstb_choose_ecc_layout(struct brcmnand_host *host)
 
 static void brcmnand_wp(struct mtd_info *mtd, int wp)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 
@@ -1184,7 +1184,7 @@ static void brcmnand_cmd_ctrl(struct mtd_info *mtd, int dat,
 
 static int brcmnand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	unsigned long timeo = msecs_to_jiffies(100);
@@ -1219,7 +1219,7 @@ static int brcmnand_low_level_op(struct brcmnand_host *host,
 				 enum brcmnand_llop_type type, u32 data,
 				 bool last_op)
 {
-	struct mtd_info *mtd = nand_to_mtd(&host->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->chip);
 	struct nand_chip *chip = &host->chip;
 	struct brcmnand_controller *ctrl = host->ctrl;
 	u32 tmp;
@@ -1258,7 +1258,7 @@ static int brcmnand_low_level_op(struct brcmnand_host *host,
 static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 			     int column, int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	u64 addr = (u64)page_addr << chip->page_shift;
@@ -1364,7 +1364,7 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 
 static uint8_t brcmnand_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	uint8_t ret = 0;
@@ -1431,7 +1431,7 @@ static void brcmnand_write_buf(struct mtd_info *mtd, const uint8_t *buf,
 				   int len)
 {
 	int i;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 
 	switch (host->last_cmd) {
@@ -2028,7 +2028,7 @@ static inline int get_blk_adr_bytes(u64 size, u32 writesize)
 
 static int brcmnand_setup_dev(struct brcmnand_host *host)
 {
-	struct mtd_info *mtd = nand_to_mtd(&host->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->chip);
 	struct nand_chip *chip = &host->chip;
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct brcmnand_cfg *cfg = &host->hwcfg;
@@ -2168,7 +2168,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 		return -ENXIO;
 	}
 
-	mtd = nand_to_mtd(&host->chip);
+	mtd = nandc_to_mtd(&host->chip);
 	chip = &host->chip;
 
 	nand_set_flash_node(chip, dn);
@@ -2312,7 +2312,7 @@ static int brcmnand_resume(struct device *dev)
 
 	list_for_each_entry(host, &ctrl->host_list, node) {
 		struct nand_chip *chip = &host->chip;
-		struct mtd_info *mtd = nand_to_mtd(chip);
+		struct mtd_info *mtd = nandc_to_mtd(chip);
 
 		brcmnand_save_restore_cs_config(host, 1);
 
@@ -2544,7 +2544,7 @@ int brcmnand_remove(struct platform_device *pdev)
 	struct brcmnand_host *host;
 
 	list_for_each_entry(host, &ctrl->host_list, node)
-		nand_release(nand_to_mtd(&host->chip));
+		nand_release(nandc_to_mtd(&host->chip));
 
 	clk_disable_unprepare(ctrl->clk);
 
diff --git a/drivers/mtd/nand/rawnand/cafe_nand.c b/drivers/mtd/nand/rawnand/cafe_nand.c
index 93880171740a..30538a9bba4e 100644
--- a/drivers/mtd/nand/rawnand/cafe_nand.c
+++ b/drivers/mtd/nand/rawnand/cafe_nand.c
@@ -101,7 +101,7 @@ static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
 static int cafe_device_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int result = !!(cafe_readl(cafe, NAND_STATUS) & 0x40000000);
 	uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
@@ -118,7 +118,7 @@ static int cafe_device_ready(struct mtd_info *mtd)
 
 static void cafe_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
 	if (usedma)
@@ -134,7 +134,7 @@ static void cafe_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 
 static void cafe_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
 	if (usedma)
@@ -149,7 +149,7 @@ static void cafe_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 
 static uint8_t cafe_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	uint8_t d;
 
@@ -162,7 +162,7 @@ static uint8_t cafe_read_byte(struct mtd_info *mtd)
 static void cafe_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 			      int column, int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int adrbytes = 0;
 	uint32_t ctl1;
@@ -318,7 +318,7 @@ static void cafe_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 
 static void cafe_select_chip(struct mtd_info *mtd, int chipnr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
 	cafe_dev_dbg(&cafe->pdev->dev, "select_chip %d\n", chipnr);
@@ -334,7 +334,7 @@ static void cafe_select_chip(struct mtd_info *mtd, int chipnr)
 static irqreturn_t cafe_nand_interrupt(int irq, void *id)
 {
 	struct mtd_info *mtd = id;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
 	cafe_writel(cafe, irqs & ~0x90000000, NAND_IRQ);
@@ -462,7 +462,7 @@ static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 static int cafe_ooblayout_ecc(struct mtd_info *mtd, int section,
 			      struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section)
 		return -ERANGE;
@@ -476,7 +476,7 @@ static int cafe_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int cafe_ooblayout_free(struct mtd_info *mtd, int section,
 			       struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section)
 		return -ERANGE;
@@ -630,7 +630,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe)
 		return  -ENOMEM;
 
-	mtd = nand_to_mtd(&cafe->nand);
+	mtd = nandc_to_mtd(&cafe->nand);
 	mtd->dev.parent = &pdev->dev;
 	nand_set_controller_data(&cafe->nand, cafe);
 
@@ -819,7 +819,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 static void cafe_nand_remove(struct pci_dev *pdev)
 {
 	struct mtd_info *mtd = pci_get_drvdata(pdev);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
 	/* Disable NAND IRQ in global IRQ mask register */
@@ -847,7 +847,7 @@ static int cafe_nand_resume(struct pci_dev *pdev)
 {
 	uint32_t ctrl;
 	struct mtd_info *mtd = pci_get_drvdata(pdev);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
        /* Start off by resetting the NAND controller completely */
diff --git a/drivers/mtd/nand/rawnand/cmx270_nand.c b/drivers/mtd/nand/rawnand/cmx270_nand.c
index 2efe6a56557f..d7bd5f48acab 100644
--- a/drivers/mtd/nand/rawnand/cmx270_nand.c
+++ b/drivers/mtd/nand/rawnand/cmx270_nand.c
@@ -53,7 +53,7 @@ static struct mtd_partition partition_info[] = {
 
 static u_char cmx270_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	return (readl(this->IO_ADDR_R) >> 16);
 }
@@ -61,7 +61,7 @@ static u_char cmx270_read_byte(struct mtd_info *mtd)
 static void cmx270_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	int i;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	for (i=0; i<len; i++)
 		writel((*buf++ << 16), this->IO_ADDR_W);
@@ -70,7 +70,7 @@ static void cmx270_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 static void cmx270_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	int i;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	for (i=0; i<len; i++)
 		*buf++ = readl(this->IO_ADDR_R) >> 16;
@@ -94,7 +94,7 @@ static void nand_cs_off(void)
 static void cmx270_hwcontrol(struct mtd_info *mtd, int dat,
 			     unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;
 
 	dsb();
@@ -173,7 +173,7 @@ static int __init cmx270_init(void)
 		goto err_ioremap;
 	}
 
-	cmx270_nand_mtd = nand_to_mtd(this);
+	cmx270_nand_mtd = nandc_to_mtd(this);
 
 	/* Link the private data with the MTD structure */
 	cmx270_nand_mtd->owner = THIS_MODULE;
@@ -237,7 +237,7 @@ static void __exit cmx270_cleanup(void)
 
 	iounmap(cmx270_nand_io);
 
-	kfree(mtd_to_nand(cmx270_nand_mtd));
+	kfree(mtd_to_nandc(cmx270_nand_mtd));
 }
 module_exit(cmx270_cleanup);
 
diff --git a/drivers/mtd/nand/rawnand/cs553x_nand.c b/drivers/mtd/nand/rawnand/cs553x_nand.c
index 8fafb4b4488d..2ba279878903 100644
--- a/drivers/mtd/nand/rawnand/cs553x_nand.c
+++ b/drivers/mtd/nand/rawnand/cs553x_nand.c
@@ -97,7 +97,7 @@
 
 static void cs553x_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	while (unlikely(len > 0x800)) {
 		memcpy_fromio(buf, this->IO_ADDR_R, 0x800);
@@ -109,7 +109,7 @@ static void cs553x_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 
 static void cs553x_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	while (unlikely(len > 0x800)) {
 		memcpy_toio(this->IO_ADDR_R, buf, 0x800);
@@ -121,13 +121,13 @@ static void cs553x_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 
 static unsigned char cs553x_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	return readb(this->IO_ADDR_R);
 }
 
 static void cs553x_write_byte(struct mtd_info *mtd, u_char byte)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int i = 100000;
 
 	while (i && readb(this->IO_ADDR_R + MM_NAND_STS) & CS_NAND_CTLR_BUSY) {
@@ -140,7 +140,7 @@ static void cs553x_write_byte(struct mtd_info *mtd, u_char byte)
 static void cs553x_hwcontrol(struct mtd_info *mtd, int cmd,
 			     unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	void __iomem *mmio_base = this->IO_ADDR_R;
 	if (ctrl & NAND_CTRL_CHANGE) {
 		unsigned char ctl = (ctrl & ~NAND_CTRL_CHANGE ) ^ 0x01;
@@ -152,7 +152,7 @@ static void cs553x_hwcontrol(struct mtd_info *mtd, int cmd,
 
 static int cs553x_device_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	void __iomem *mmio_base = this->IO_ADDR_R;
 	unsigned char foo = readb(mmio_base + MM_NAND_STS);
 
@@ -161,7 +161,7 @@ static int cs553x_device_ready(struct mtd_info *mtd)
 
 static void cs_enable_hwecc(struct mtd_info *mtd, int mode)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	void __iomem *mmio_base = this->IO_ADDR_R;
 
 	writeb(0x07, mmio_base + MM_NAND_ECC_CTL);
@@ -170,7 +170,7 @@ static void cs_enable_hwecc(struct mtd_info *mtd, int mode)
 static int cs_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
 {
 	uint32_t ecc;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	void __iomem *mmio_base = this->IO_ADDR_R;
 
 	ecc = readl(mmio_base + MM_NAND_STS);
@@ -203,7 +203,7 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 		goto out;
 	}
 
-	new_mtd = nand_to_mtd(this);
+	new_mtd = nandc_to_mtd(this);
 
 	/* Link the private data with the MTD structure */
 	new_mtd->owner = THIS_MODULE;
@@ -335,7 +335,7 @@ static void __exit cs553x_cleanup(void)
 		if (!mtd)
 			continue;
 
-		this = mtd_to_nand(mtd);
+		this = mtd_to_nandc(mtd);
 		mmio_base = this->IO_ADDR_R;
 
 		/* Release resources, unregister device */
diff --git a/drivers/mtd/nand/rawnand/davinci_nand.c b/drivers/mtd/nand/rawnand/davinci_nand.c
index fcc533261c06..b161271f6ad9 100644
--- a/drivers/mtd/nand/rawnand/davinci_nand.c
+++ b/drivers/mtd/nand/rawnand/davinci_nand.c
@@ -79,7 +79,7 @@ static bool ecc4_busy;
 
 static inline struct davinci_nand_info *to_davinci_nand(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct davinci_nand_info, chip);
+	return container_of(mtd_to_nandc(mtd), struct davinci_nand_info, chip);
 }
 
 static inline unsigned int davinci_nand_readl(struct davinci_nand_info *info,
@@ -105,7 +105,7 @@ static void nand_davinci_hwcontrol(struct mtd_info *mtd, int cmd,
 {
 	struct davinci_nand_info	*info = to_davinci_nand(mtd);
 	uint32_t			addr = info->current_cs;
-	struct nand_chip		*nand = mtd_to_nand(mtd);
+	struct nand_chip		*nand = mtd_to_nandc(mtd);
 
 	/* Did the control lines change? */
 	if (ctrl & NAND_CTRL_CHANGE) {
@@ -191,7 +191,7 @@ static int nand_davinci_calculate_1bit(struct mtd_info *mtd,
 static int nand_davinci_correct_1bit(struct mtd_info *mtd, u_char *dat,
 				     u_char *read_ecc, u_char *calc_ecc)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	uint32_t eccNand = read_ecc[0] | (read_ecc[1] << 8) |
 					  (read_ecc[2] << 16);
 	uint32_t eccCalc = calc_ecc[0] | (calc_ecc[1] << 8) |
@@ -438,7 +438,7 @@ correct:
  */
 static void nand_davinci_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
 		ioread32_rep(chip->IO_ADDR_R, buf, len >> 2);
@@ -451,7 +451,7 @@ static void nand_davinci_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 static void nand_davinci_write_buf(struct mtd_info *mtd,
 		const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
 		iowrite32_rep(chip->IO_ADDR_R, buf, len >> 2);
@@ -651,7 +651,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	info->base		= base;
 	info->vaddr		= vaddr;
 
-	mtd			= nand_to_mtd(&info->chip);
+	mtd			= nandc_to_mtd(&info->chip);
 	mtd->dev.parent		= &pdev->dev;
 	nand_set_flash_node(&info->chip, pdev->dev.of_node);
 
@@ -837,7 +837,7 @@ static int nand_davinci_remove(struct platform_device *pdev)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	nand_release(nand_to_mtd(&info->chip));
+	nand_release(nandc_to_mtd(&info->chip));
 
 	clk_disable_unprepare(info->clk);
 
diff --git a/drivers/mtd/nand/rawnand/denali.c b/drivers/mtd/nand/rawnand/denali.c
index 0476ae8776d9..3cbbcc682726 100644
--- a/drivers/mtd/nand/rawnand/denali.c
+++ b/drivers/mtd/nand/rawnand/denali.c
@@ -77,7 +77,7 @@ MODULE_PARM_DESC(onfi_timing_mode,
  */
 static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct denali_nand_info, nand);
+	return container_of(mtd_to_nandc(mtd), struct denali_nand_info, nand);
 }
 
 /*
@@ -990,7 +990,7 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 				 */
 				if (err_byte < ECC_SECTOR_SIZE) {
 					struct mtd_info *mtd =
-						nand_to_mtd(&denali->nand);
+						nandc_to_mtd(&denali->nand);
 					int offset;
 
 					offset = (err_sector *
@@ -1380,7 +1380,7 @@ static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section)
 		return -ERANGE;
@@ -1395,7 +1395,7 @@ static int denali_ooblayout_free(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section)
 		return -ERANGE;
@@ -1461,7 +1461,7 @@ static void denali_drv_init(struct denali_nand_info *denali)
 
 int denali_init(struct denali_nand_info *denali)
 {
-	struct mtd_info *mtd = nand_to_mtd(&denali->nand);
+	struct mtd_info *mtd = nandc_to_mtd(&denali->nand);
 	int ret;
 
 	if (denali->platform == INTEL_CE4100) {
@@ -1647,7 +1647,7 @@ EXPORT_SYMBOL(denali_init);
 /* driver exit point */
 void denali_remove(struct denali_nand_info *denali)
 {
-	struct mtd_info *mtd = nand_to_mtd(&denali->nand);
+	struct mtd_info *mtd = nandc_to_mtd(&denali->nand);
 	/*
 	 * Pre-compute DMA buffer size to avoid any problems in case
 	 * nand_release() ever changes in a way that mtd->writesize and
diff --git a/drivers/mtd/nand/rawnand/diskonchip.c b/drivers/mtd/nand/rawnand/diskonchip.c
index c3aa53caab5c..1257365abec0 100644
--- a/drivers/mtd/nand/rawnand/diskonchip.c
+++ b/drivers/mtd/nand/rawnand/diskonchip.c
@@ -295,7 +295,7 @@ static inline int DoC_WaitReady(struct doc_priv *doc)
 
 static void doc2000_write_byte(struct mtd_info *mtd, u_char datum)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 
@@ -307,7 +307,7 @@ static void doc2000_write_byte(struct mtd_info *mtd, u_char datum)
 
 static u_char doc2000_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	u_char ret;
@@ -322,7 +322,7 @@ static u_char doc2000_read_byte(struct mtd_info *mtd)
 
 static void doc2000_writebuf(struct mtd_info *mtd, const u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int i;
@@ -339,7 +339,7 @@ static void doc2000_writebuf(struct mtd_info *mtd, const u_char *buf, int len)
 
 static void doc2000_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int i;
@@ -354,7 +354,7 @@ static void doc2000_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 
 static void doc2000_readbuf_dword(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int i;
@@ -375,7 +375,7 @@ static void doc2000_readbuf_dword(struct mtd_info *mtd, u_char *buf, int len)
 
 static uint16_t __init doc200x_ident_chip(struct mtd_info *mtd, int nr)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	uint16_t ret;
 
@@ -421,7 +421,7 @@ static uint16_t __init doc200x_ident_chip(struct mtd_info *mtd, int nr)
 
 static void __init doc2000_count_chips(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	uint16_t mfrid;
 	int i;
@@ -457,7 +457,7 @@ static int doc200x_wait(struct mtd_info *mtd, struct nand_chip *this)
 
 static void doc2001_write_byte(struct mtd_info *mtd, u_char datum)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 
@@ -468,7 +468,7 @@ static void doc2001_write_byte(struct mtd_info *mtd, u_char datum)
 
 static u_char doc2001_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 
@@ -482,7 +482,7 @@ static u_char doc2001_read_byte(struct mtd_info *mtd)
 
 static void doc2001_writebuf(struct mtd_info *mtd, const u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int i;
@@ -495,7 +495,7 @@ static void doc2001_writebuf(struct mtd_info *mtd, const u_char *buf, int len)
 
 static void doc2001_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int i;
@@ -512,7 +512,7 @@ static void doc2001_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 
 static u_char doc2001plus_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	u_char ret;
@@ -527,7 +527,7 @@ static u_char doc2001plus_read_byte(struct mtd_info *mtd)
 
 static void doc2001plus_writebuf(struct mtd_info *mtd, const u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int i;
@@ -545,7 +545,7 @@ static void doc2001plus_writebuf(struct mtd_info *mtd, const u_char *buf, int le
 
 static void doc2001plus_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int i;
@@ -576,7 +576,7 @@ static void doc2001plus_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 
 static void doc2001plus_select_chip(struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int floor = 0;
@@ -603,7 +603,7 @@ static void doc2001plus_select_chip(struct mtd_info *mtd, int chip)
 
 static void doc200x_select_chip(struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int floor = 0;
@@ -634,7 +634,7 @@ static void doc200x_select_chip(struct mtd_info *mtd, int chip)
 static void doc200x_hwcontrol(struct mtd_info *mtd, int cmd,
 			      unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 
@@ -657,7 +657,7 @@ static void doc200x_hwcontrol(struct mtd_info *mtd, int cmd,
 
 static void doc2001plus_command(struct mtd_info *mtd, unsigned command, int column, int page_addr)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 
@@ -763,7 +763,7 @@ static void doc2001plus_command(struct mtd_info *mtd, unsigned command, int colu
 
 static int doc200x_dev_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 
@@ -803,7 +803,7 @@ static int doc200x_block_bad(struct mtd_info *mtd, loff_t ofs)
 
 static void doc200x_enable_hwecc(struct mtd_info *mtd, int mode)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 
@@ -822,7 +822,7 @@ static void doc200x_enable_hwecc(struct mtd_info *mtd, int mode)
 
 static void doc2001plus_enable_hwecc(struct mtd_info *mtd, int mode)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 
@@ -842,7 +842,7 @@ static void doc2001plus_enable_hwecc(struct mtd_info *mtd, int mode)
 /* This code is only called on write */
 static int doc200x_calculate_ecc(struct mtd_info *mtd, const u_char *dat, unsigned char *ecc_code)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	int i;
@@ -903,7 +903,7 @@ static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat,
 				u_char *read_ecc, u_char *isnull)
 {
 	int i, ret = 0;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
 	uint8_t calc_ecc[6];
@@ -1004,7 +1004,7 @@ static const struct mtd_ooblayout_ops doc200x_ooblayout_ops = {
    mh1_page in the DOC private structure. */
 static int __init find_media_headers(struct mtd_info *mtd, u_char *buf, const char *id, int findmirror)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	unsigned offs;
 	int ret;
@@ -1047,7 +1047,7 @@ static int __init find_media_headers(struct mtd_info *mtd, u_char *buf, const ch
 
 static inline int __init nftl_partscan(struct mtd_info *mtd, struct mtd_partition *parts)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	int ret = 0;
 	u_char *buf;
@@ -1149,7 +1149,7 @@ static inline int __init nftl_partscan(struct mtd_info *mtd, struct mtd_partitio
 /* This is a stripped-down copy of the code in inftlmount.c */
 static inline int __init inftl_partscan(struct mtd_info *mtd, struct mtd_partition *parts)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	int ret = 0;
 	u_char *buf;
@@ -1269,7 +1269,7 @@ static inline int __init inftl_partscan(struct mtd_info *mtd, struct mtd_partiti
 static int __init nftl_scan_bbt(struct mtd_info *mtd)
 {
 	int ret, numparts;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	struct mtd_partition parts[2];
 
@@ -1304,7 +1304,7 @@ static int __init nftl_scan_bbt(struct mtd_info *mtd)
 static int __init inftl_scan_bbt(struct mtd_info *mtd)
 {
 	int ret, numparts;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	struct mtd_partition parts[5];
 
@@ -1357,7 +1357,7 @@ static int __init inftl_scan_bbt(struct mtd_info *mtd)
 
 static inline int __init doc2000_init(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 
 	this->read_byte = doc2000_read_byte;
@@ -1373,7 +1373,7 @@ static inline int __init doc2000_init(struct mtd_info *mtd)
 
 static inline int __init doc2001_init(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 
 	this->read_byte = doc2001_read_byte;
@@ -1403,7 +1403,7 @@ static inline int __init doc2001_init(struct mtd_info *mtd)
 
 static inline int __init doc2001plus_init(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 
 	this->read_byte = doc2001plus_read_byte;
@@ -1520,7 +1520,7 @@ static int __init doc_probe(unsigned long physadr)
 	for (mtd = doclist; mtd; mtd = doc->nextdoc) {
 		unsigned char oldval;
 		unsigned char newval;
-		nand = mtd_to_nand(mtd);
+		nand = mtd_to_nandc(mtd);
 		doc = nand_get_controller_data(nand);
 		/* Use the alias resolution register to determine if this is
 		   in fact the same DOC aliased to a new address.  If writes
@@ -1561,7 +1561,7 @@ static int __init doc_probe(unsigned long physadr)
 		goto fail;
 	}
 
-	mtd			= nand_to_mtd(nand);
+	mtd			= nandc_to_mtd(nand);
 	doc			= (struct doc_priv *) (nand + 1);
 	nand->bbt_td		= (struct nand_bbt_descr *) (doc + 1);
 	nand->bbt_md		= nand->bbt_td + 1;
@@ -1640,7 +1640,7 @@ static void release_nanddoc(void)
 	struct doc_priv *doc;
 
 	for (mtd = doclist; mtd; mtd = nextmtd) {
-		nand = mtd_to_nand(mtd);
+		nand = mtd_to_nandc(mtd);
 		doc = nand_get_controller_data(nand);
 
 		nextmtd = doc->nextdoc;
diff --git a/drivers/mtd/nand/rawnand/docg4.c b/drivers/mtd/nand/rawnand/docg4.c
index e038130b7206..dd8e55633d75 100644
--- a/drivers/mtd/nand/rawnand/docg4.c
+++ b/drivers/mtd/nand/rawnand/docg4.c
@@ -264,7 +264,7 @@ static inline void write_nop(void __iomem *docptr)
 static void docg4_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	int i;
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	uint16_t *p = (uint16_t *) buf;
 	len >>= 1;
 
@@ -275,7 +275,7 @@ static void docg4_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 static void docg4_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
 	int i;
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	uint16_t *p = (uint16_t *) buf;
 	len >>= 1;
 
@@ -340,7 +340,7 @@ static void docg4_select_chip(struct mtd_info *mtd, int chip)
 	 * Select among multiple cascaded chips ("floors").  Multiple floors are
 	 * not yet supported, so the only valid non-negative value is 0.
 	 */
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 
@@ -359,7 +359,7 @@ static void reset(struct mtd_info *mtd)
 {
 	/* full device reset */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 
@@ -397,7 +397,7 @@ static int correct_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	 * Up to four bitflips can be corrected.
 	 */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 	int i, numerrs, errpos[4];
@@ -486,7 +486,7 @@ static int correct_data(struct mtd_info *mtd, uint8_t *buf, int page)
 
 static uint8_t docg4_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 
 	dev_dbg(doc->dev, "%s\n", __func__);
@@ -567,7 +567,7 @@ static int pageprog(struct mtd_info *mtd)
 	 * internal buffer out to the flash array, or some such.
 	 */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 	int retval = 0;
@@ -604,7 +604,7 @@ static void sequence_reset(struct mtd_info *mtd)
 {
 	/* common starting sequence for all operations */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 
@@ -621,7 +621,7 @@ static void read_page_prologue(struct mtd_info *mtd, uint32_t docg4_addr)
 {
 	/* first step in reading a page */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 
@@ -648,7 +648,7 @@ static void write_page_prologue(struct mtd_info *mtd, uint32_t docg4_addr)
 {
 	/* first step in writing a page */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 
@@ -713,7 +713,7 @@ static void docg4_command(struct mtd_info *mtd, unsigned command, int column,
 {
 	/* handle standard nand commands */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	uint32_t g4_addr = mtd_to_docg4_address(page_addr, column);
 
@@ -896,7 +896,7 @@ static int docg4_read_oob(struct mtd_info *mtd, struct nand_chip *nand,
 
 static int docg4_erase_block(struct mtd_info *mtd, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 	uint16_t g4_page;
@@ -1038,7 +1038,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 	 * update the memory-based bbt accordingly.
 	 */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	uint32_t g4_addr = mtd_to_docg4_address(DOCG4_FACTORY_BBT_PAGE, 0);
 	uint8_t *buf;
@@ -1111,7 +1111,7 @@ static int docg4_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 	int ret, i;
 	uint8_t *buf;
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	struct nand_bbt_descr *bbtd = nand->badblock_pattern;
 	int page = (int)(ofs >> nand->page_shift);
@@ -1224,7 +1224,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	 * things as well, such as call nand_set_defaults().
 	 */
 
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 
 	mtd->size = DOCG4_CHIP_SIZE;
@@ -1282,7 +1282,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 
 static int __init read_id_reg(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
 	void __iomem *docptr = doc->virtadr;
 	uint16_t id1, id2;
@@ -1333,7 +1333,7 @@ static int __init probe_docg4(struct platform_device *pdev)
 		goto fail_unmap;
 	}
 
-	mtd = nand_to_mtd(nand);
+	mtd = nandc_to_mtd(nand);
 	doc = (struct docg4_priv *) (nand + 1);
 	nand_set_controller_data(nand, doc);
 	mtd->dev.parent = &pdev->dev;
@@ -1389,7 +1389,7 @@ static int __exit cleanup_docg4(struct platform_device *pdev)
 	struct docg4_priv *doc = platform_get_drvdata(pdev);
 	nand_release(doc->mtd);
 	free_bch(doc->bch);
-	kfree(mtd_to_nand(doc->mtd));
+	kfree(mtd_to_nandc(doc->mtd));
 	iounmap(doc->virtadr);
 	return 0;
 }
diff --git a/drivers/mtd/nand/rawnand/fsl_elbc_nand.c b/drivers/mtd/nand/rawnand/fsl_elbc_nand.c
index 7d8453eb4d0f..6e215ac48b32 100644
--- a/drivers/mtd/nand/rawnand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/rawnand/fsl_elbc_nand.c
@@ -82,7 +82,7 @@ struct fsl_elbc_fcm_ctrl {
 static int fsl_elbc_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 
 	if (section >= chip->ecc.steps)
@@ -100,7 +100,7 @@ static int fsl_elbc_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int fsl_elbc_ooblayout_free(struct mtd_info *mtd, int section,
 				   struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 
 	if (section > chip->ecc.steps)
@@ -164,7 +164,7 @@ static struct nand_bbt_descr bbt_mirror_descr = {
  */
 static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
@@ -215,7 +215,7 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
  */
 static int fsl_elbc_run_command(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
@@ -320,7 +320,7 @@ static void fsl_elbc_do_read(struct nand_chip *chip, int oob)
 static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
                              int column, int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
@@ -545,7 +545,7 @@ static void fsl_elbc_select_chip(struct mtd_info *mtd, int chip)
  */
 static void fsl_elbc_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
 	unsigned int bufsize = mtd->writesize + mtd->oobsize;
@@ -583,7 +583,7 @@ static void fsl_elbc_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
  */
 static u8 fsl_elbc_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
 
@@ -600,7 +600,7 @@ static u8 fsl_elbc_read_byte(struct mtd_info *mtd)
  */
 static void fsl_elbc_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
 	int avail;
@@ -639,7 +639,7 @@ static int fsl_elbc_wait(struct mtd_info *mtd, struct nand_chip *chip)
 
 static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
@@ -754,7 +754,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
 	struct nand_chip *chip = &priv->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 
 	dev_dbg(priv->dev, "eLBC Set Information for bank %d\n", priv->bank);
 
@@ -809,7 +809,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
 {
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&priv->chip);
 
 	nand_release(mtd);
 
@@ -899,9 +899,9 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	mtd = nand_to_mtd(&priv->chip);
+	mtd = nandc_to_mtd(&priv->chip);
 	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
-	if (!nand_to_mtd(&priv->chip)->name) {
+	if (!nandc_to_mtd(&priv->chip)->name) {
 		ret = -ENOMEM;
 		goto err;
 	}
diff --git a/drivers/mtd/nand/rawnand/fsl_ifc_nand.c b/drivers/mtd/nand/rawnand/fsl_ifc_nand.c
index bcf7f0b8abf9..0aa970045bbe 100644
--- a/drivers/mtd/nand/rawnand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/rawnand/fsl_ifc_nand.c
@@ -96,7 +96,7 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 static int fsl_ifc_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section)
 		return -ERANGE;
@@ -110,7 +110,7 @@ static int fsl_ifc_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int fsl_ifc_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section > 1)
 		return -ERANGE;
@@ -150,7 +150,7 @@ static const struct mtd_ooblayout_ops fsl_ifc_ooblayout_ops = {
  */
 static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
 	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
@@ -173,7 +173,7 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
 
 static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 	u8 __iomem *addr = priv->vbase + bufnum * (mtd->writesize * 2);
 	u32 __iomem *mainarea = (u32 __iomem *)addr;
@@ -216,7 +216,7 @@ static int check_read_ecc(struct mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
  */
 static void fsl_ifc_run_command(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
 	struct fsl_ifc_nand_ctrl *nctrl = ifc_nand_ctrl;
@@ -333,7 +333,7 @@ static void fsl_ifc_do_read(struct nand_chip *chip,
 /* cmdfunc send commands to the IFC NAND Machine */
 static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 			     int column, int page_addr) {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
 	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
@@ -548,7 +548,7 @@ static void fsl_ifc_select_chip(struct mtd_info *mtd, int chip)
  */
 static void fsl_ifc_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 	unsigned int bufsize = mtd->writesize + mtd->oobsize;
 
@@ -574,7 +574,7 @@ static void fsl_ifc_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
  */
 static uint8_t fsl_ifc_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 	unsigned int offset;
 
@@ -597,7 +597,7 @@ static uint8_t fsl_ifc_read_byte(struct mtd_info *mtd)
  */
 static uint8_t fsl_ifc_read_byte16(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 	uint16_t data;
 
@@ -620,7 +620,7 @@ static uint8_t fsl_ifc_read_byte16(struct mtd_info *mtd)
  */
 static void fsl_ifc_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 	int avail;
 
@@ -706,7 +706,7 @@ static int fsl_ifc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 static int fsl_ifc_chip_init_tail(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 
 	dev_dbg(priv->dev, "%s: nand->numchips = %d\n", __func__,
@@ -805,7 +805,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	struct fsl_ifc_global __iomem *ifc_global = ctrl->gregs;
 	struct fsl_ifc_runtime __iomem *ifc_runtime = ctrl->rregs;
 	struct nand_chip *chip = &priv->chip;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&priv->chip);
 	u32 csor;
 
 	/* Fill in fsl_ifc_mtd structure */
@@ -906,7 +906,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 
 static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 {
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&priv->chip);
 
 	nand_release(mtd);
 
@@ -1018,7 +1018,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		  IFC_NAND_EVTER_INTR_WPERIR_EN,
 		  &ifc->ifc_nand.nand_evter_intr_en);
 
-	mtd = nand_to_mtd(&priv->chip);
+	mtd = nandc_to_mtd(&priv->chip);
 	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
 	if (!mtd->name) {
 		ret = -ENOMEM;
diff --git a/drivers/mtd/nand/rawnand/fsl_upm.c b/drivers/mtd/nand/rawnand/fsl_upm.c
index a88e2cf66e0f..23c513348f46 100644
--- a/drivers/mtd/nand/rawnand/fsl_upm.c
+++ b/drivers/mtd/nand/rawnand/fsl_upm.c
@@ -48,7 +48,7 @@ struct fsl_upm_nand {
 
 static inline struct fsl_upm_nand *to_fsl_upm_nand(struct mtd_info *mtdinfo)
 {
-	return container_of(mtd_to_nand(mtdinfo), struct fsl_upm_nand,
+	return container_of(mtd_to_nandc(mtdinfo), struct fsl_upm_nand,
 			    chip);
 }
 
@@ -66,7 +66,7 @@ static int fun_chip_ready(struct mtd_info *mtd)
 static void fun_wait_rnb(struct fsl_upm_nand *fun)
 {
 	if (fun->rnb_gpio[fun->mchip_number] >= 0) {
-		struct mtd_info *mtd = nand_to_mtd(&fun->chip);
+		struct mtd_info *mtd = nandc_to_mtd(&fun->chip);
 		int cnt = 1000000;
 
 		while (--cnt && !fun_chip_ready(mtd))
@@ -80,7 +80,7 @@ static void fun_wait_rnb(struct fsl_upm_nand *fun)
 
 static void fun_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_upm_nand *fun = to_fsl_upm_nand(mtd);
 	u32 mar;
 
@@ -110,7 +110,7 @@ static void fun_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 
 static void fun_select_chip(struct mtd_info *mtd, int mchip_nr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsl_upm_nand *fun = to_fsl_upm_nand(mtd);
 
 	if (mchip_nr == -1) {
@@ -158,7 +158,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 			 const struct device_node *upm_np,
 			 const struct resource *io_res)
 {
-	struct mtd_info *mtd = nand_to_mtd(&fun->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&fun->chip);
 	int ret;
 	struct device_node *flash_np;
 
@@ -323,7 +323,7 @@ err1:
 static int fun_remove(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun = dev_get_drvdata(&ofdev->dev);
-	struct mtd_info *mtd = nand_to_mtd(&fun->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&fun->chip);
 	int i;
 
 	nand_release(mtd);
diff --git a/drivers/mtd/nand/rawnand/fsmc_nand.c b/drivers/mtd/nand/rawnand/fsmc_nand.c
index 5c08694aa153..e63d54468205 100644
--- a/drivers/mtd/nand/rawnand/fsmc_nand.c
+++ b/drivers/mtd/nand/rawnand/fsmc_nand.c
@@ -42,7 +42,7 @@
 static int fsmc_ecc1_ooblayout_ecc(struct mtd_info *mtd, int section,
 				   struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section >= chip->ecc.steps)
 		return -ERANGE;
@@ -56,7 +56,7 @@ static int fsmc_ecc1_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int fsmc_ecc1_ooblayout_free(struct mtd_info *mtd, int section,
 				    struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section >= chip->ecc.steps)
 		return -ERANGE;
@@ -85,7 +85,7 @@ static const struct mtd_ooblayout_ops fsmc_ecc1_ooblayout_ops = {
 static int fsmc_ecc4_ooblayout_ecc(struct mtd_info *mtd, int section,
 				   struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section >= chip->ecc.steps)
 		return -ERANGE;
@@ -103,7 +103,7 @@ static int fsmc_ecc4_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int fsmc_ecc4_ooblayout_free(struct mtd_info *mtd, int section,
 				    struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section >= chip->ecc.steps)
 		return -ERANGE;
@@ -174,13 +174,13 @@ struct fsmc_nand_data {
 
 static inline struct fsmc_nand_data *mtd_to_fsmc(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct fsmc_nand_data, nand);
+	return container_of(mtd_to_nandc(mtd), struct fsmc_nand_data, nand);
 }
 
 /* Assert CS signal based on chipnr */
 static void fsmc_select_chip(struct mtd_info *mtd, int chipnr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsmc_nand_data *host;
 
 	host = mtd_to_fsmc(mtd);
@@ -209,7 +209,7 @@ static void fsmc_select_chip(struct mtd_info *mtd, int chipnr)
  */
 static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
 	void __iomem *regs = host->regs_va;
 	unsigned int bank = host->bank;
@@ -476,7 +476,7 @@ unmap_dma:
 static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
 	int i;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
 			IS_ALIGNED(len, sizeof(uint32_t))) {
@@ -499,7 +499,7 @@ static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 static void fsmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	int i;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
 			IS_ALIGNED(len, sizeof(uint32_t))) {
@@ -630,7 +630,7 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 			     uint8_t *read_ecc, uint8_t *calc_ecc)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
 	void __iomem *regs = host->regs_va;
 	unsigned int bank = host->bank;
@@ -858,7 +858,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		init_completion(&host->dma_access_complete);
 
 	/* Link all private pointers */
-	mtd = nand_to_mtd(&host->nand);
+	mtd = nandc_to_mtd(&host->nand);
 	nand = &host->nand;
 	nand_set_controller_data(nand, host);
 	nand_set_flash_node(nand, np);
@@ -1038,7 +1038,7 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 	struct fsmc_nand_data *host = platform_get_drvdata(pdev);
 
 	if (host) {
-		nand_release(nand_to_mtd(&host->nand));
+		nand_release(nandc_to_mtd(&host->nand));
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
diff --git a/drivers/mtd/nand/rawnand/gpio.c b/drivers/mtd/nand/rawnand/gpio.c
index 21b19efe1ac7..0016a27b2fdb 100644
--- a/drivers/mtd/nand/rawnand/gpio.c
+++ b/drivers/mtd/nand/rawnand/gpio.c
@@ -41,7 +41,7 @@ struct gpiomtd {
 
 static inline struct gpiomtd *gpio_nand_getpriv(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct gpiomtd, nand_chip);
+	return container_of(mtd_to_nandc(mtd), struct gpiomtd, nand_chip);
 }
 
 
@@ -197,7 +197,7 @@ static int gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
 
-	nand_release(nand_to_mtd(&gpiomtd->nand_chip));
+	nand_release(nandc_to_mtd(&gpiomtd->nand_chip));
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
@@ -278,7 +278,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	chip->chip_delay	= gpiomtd->plat.chip_delay;
 	chip->cmd_ctrl		= gpio_nand_cmd_ctrl;
 
-	mtd			= nand_to_mtd(chip);
+	mtd			= nandc_to_mtd(chip);
 	mtd->dev.parent		= &pdev->dev;
 
 	platform_set_drvdata(pdev, gpiomtd);
diff --git a/drivers/mtd/nand/rawnand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/rawnand/gpmi-nand/gpmi-lib.c
index 0f68a99fc4ad..bf37661e7368 100644
--- a/drivers/mtd/nand/rawnand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/rawnand/gpmi-nand/gpmi-lib.c
@@ -919,7 +919,7 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
 {
 	struct resources  *r = &this->resources;
 	struct nand_chip *nand = &this->nand;
-	struct mtd_info	 *mtd = nand_to_mtd(nand);
+	struct mtd_info	 *mtd = nandc_to_mtd(nand);
 	uint8_t *feature;
 	unsigned long rate;
 	int ret;
diff --git a/drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.c
index 6c062b8251d2..c1ec57327ff5 100644
--- a/drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.c
@@ -49,7 +49,7 @@ static struct nand_bbt_descr gpmi_bbt_descr = {
 static int gpmi_ooblayout_ecc(struct mtd_info *mtd, int section,
 			      struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *geo = &this->bch_geometry;
 
@@ -65,7 +65,7 @@ static int gpmi_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int gpmi_ooblayout_free(struct mtd_info *mtd, int section,
 			       struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *geo = &this->bch_geometry;
 
@@ -140,7 +140,7 @@ static irqreturn_t bch_irq(int irq, void *cookie)
 static inline int get_ecc_strength(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
-	struct mtd_info	*mtd = nand_to_mtd(&this->nand);
+	struct mtd_info	*mtd = nandc_to_mtd(&this->nand);
 	int ecc_strength;
 
 	ecc_strength = ((mtd->oobsize - geo->metadata_size) * 8)
@@ -173,7 +173,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
 	struct nand_chip *chip = &this->nand;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	unsigned int block_mark_bit_offset;
 
 	if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
@@ -283,7 +283,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 static int legacy_set_geometry(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
-	struct mtd_info *mtd = nand_to_mtd(&this->nand);
+	struct mtd_info *mtd = nandc_to_mtd(&this->nand);
 	unsigned int metadata_size;
 	unsigned int status_size;
 	unsigned int block_mark_bit_offset;
@@ -834,7 +834,7 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
 	struct device *dev = this->dev;
-	struct mtd_info *mtd = nand_to_mtd(&this->nand);
+	struct mtd_info *mtd = nandc_to_mtd(&this->nand);
 
 	/* [1] Allocate a command buffer. PAGE_SIZE is enough. */
 	this->cmd_buffer = kzalloc(PAGE_SIZE, GFP_DMA | GFP_KERNEL);
@@ -886,7 +886,7 @@ error_alloc:
 
 static void gpmi_cmd_ctrl(struct mtd_info *mtd, int data, unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	int ret;
 
@@ -920,7 +920,7 @@ static void gpmi_cmd_ctrl(struct mtd_info *mtd, int data, unsigned int ctrl)
 
 static int gpmi_dev_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
 	return gpmi_is_ready(this, this->current_chip);
@@ -928,7 +928,7 @@ static int gpmi_dev_ready(struct mtd_info *mtd)
 
 static void gpmi_select_chip(struct mtd_info *mtd, int chipnr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
 	if ((this->current_chip < 0) && (chipnr >= 0))
@@ -941,7 +941,7 @@ static void gpmi_select_chip(struct mtd_info *mtd, int chipnr)
 
 static void gpmi_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
 	dev_dbg(this->dev, "len is %d\n", len);
@@ -953,7 +953,7 @@ static void gpmi_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 
 static void gpmi_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
 	dev_dbg(this->dev, "len is %d\n", len);
@@ -965,7 +965,7 @@ static void gpmi_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 
 static uint8_t gpmi_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	uint8_t *buf = this->data_buffer_dma;
 
@@ -1637,7 +1637,7 @@ static int gpmi_ecc_write_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 static int gpmi_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	int ret = 0;
 	uint8_t *block_mark;
@@ -1700,7 +1700,7 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 	struct boot_rom_geometry *rom_geo = &this->rom_geometry;
 	struct device *dev = this->dev;
 	struct nand_chip *chip = &this->nand;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	unsigned int search_area_size_in_strides;
 	unsigned int stride;
 	unsigned int page;
@@ -1755,7 +1755,7 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 	struct device *dev = this->dev;
 	struct boot_rom_geometry *rom_geo = &this->rom_geometry;
 	struct nand_chip *chip = &this->nand;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	unsigned int block_size_in_pages;
 	unsigned int search_area_size_in_strides;
 	unsigned int search_area_size_in_pages;
@@ -1834,7 +1834,7 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
 {
 	struct device *dev = this->dev;
 	struct nand_chip *chip = &this->nand;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	unsigned int block_count;
 	unsigned int block;
 	int     chipnr;
@@ -1930,14 +1930,14 @@ static int gpmi_set_geometry(struct gpmi_nand_data *this)
 
 static void gpmi_nand_exit(struct gpmi_nand_data *this)
 {
-	nand_release(nand_to_mtd(&this->nand));
+	nand_release(nandc_to_mtd(&this->nand));
 	gpmi_free_dma_buffer(this);
 }
 
 static int gpmi_init_last(struct gpmi_nand_data *this)
 {
 	struct nand_chip *chip = &this->nand;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct bch_geometry *bch_geo = &this->bch_geometry;
 	int ret;
@@ -1986,7 +1986,7 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 static int gpmi_nand_init(struct gpmi_nand_data *this)
 {
 	struct nand_chip *chip = &this->nand;
-	struct mtd_info  *mtd = nand_to_mtd(chip);
+	struct mtd_info  *mtd = nandc_to_mtd(chip);
 	int ret;
 
 	/* init current chip */
diff --git a/drivers/mtd/nand/rawnand/hisi504_nand.c b/drivers/mtd/nand/rawnand/hisi504_nand.c
index a287d73bb17e..81a941c8a20b 100644
--- a/drivers/mtd/nand/rawnand/hisi504_nand.c
+++ b/drivers/mtd/nand/rawnand/hisi504_nand.c
@@ -188,7 +188,7 @@ static void wait_controller_finished(struct hinfc_host *host)
 static void hisi_nfc_dma_transfer(struct hinfc_host *host, int todev)
 {
 	struct nand_chip *chip = &host->chip;
-	struct mtd_info	*mtd = nand_to_mtd(chip);
+	struct mtd_info	*mtd = nandc_to_mtd(chip);
 	unsigned long val;
 	int ret;
 
@@ -260,7 +260,7 @@ static int hisi_nfc_send_cmd_pageprog(struct hinfc_host *host)
 
 static int hisi_nfc_send_cmd_readstart(struct hinfc_host *host)
 {
-	struct mtd_info	*mtd = nand_to_mtd(&host->chip);
+	struct mtd_info	*mtd = nandc_to_mtd(&host->chip);
 
 	if ((host->addr_value[0] == host->cache_addr_value[0]) &&
 	    (host->addr_value[1] == host->cache_addr_value[1]))
@@ -355,7 +355,7 @@ static int hisi_nfc_send_cmd_reset(struct hinfc_host *host, int chipselect)
 
 static void hisi_nfc_select_chip(struct mtd_info *mtd, int chipselect)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct hinfc_host *host = nand_get_controller_data(chip);
 
 	if (chipselect < 0)
@@ -366,7 +366,7 @@ static void hisi_nfc_select_chip(struct mtd_info *mtd, int chipselect)
 
 static uint8_t hisi_nfc_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct hinfc_host *host = nand_get_controller_data(chip);
 
 	if (host->command == NAND_CMD_STATUS)
@@ -382,7 +382,7 @@ static uint8_t hisi_nfc_read_byte(struct mtd_info *mtd)
 
 static u16 hisi_nfc_read_word(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct hinfc_host *host = nand_get_controller_data(chip);
 
 	host->offset += 2;
@@ -392,7 +392,7 @@ static u16 hisi_nfc_read_word(struct mtd_info *mtd)
 static void
 hisi_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct hinfc_host *host = nand_get_controller_data(chip);
 
 	memcpy(host->buffer + host->offset, buf, len);
@@ -401,7 +401,7 @@ hisi_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 
 static void hisi_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct hinfc_host *host = nand_get_controller_data(chip);
 
 	memcpy(buf, host->buffer + host->offset, len);
@@ -410,7 +410,7 @@ static void hisi_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 
 static void set_addr(struct mtd_info *mtd, int column, int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct hinfc_host *host = nand_get_controller_data(chip);
 	unsigned int command = host->command;
 
@@ -446,7 +446,7 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr)
 static void hisi_nfc_cmdfunc(struct mtd_info *mtd, unsigned command, int column,
 		int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct hinfc_host *host = nand_get_controller_data(chip);
 	int is_cache_invalid = 1;
 	unsigned int flag = 0;
@@ -660,7 +660,7 @@ static int hisi_nfc_ecc_probe(struct hinfc_host *host)
 	int size, strength, ecc_bits;
 	struct device *dev = host->dev;
 	struct nand_chip *chip = &host->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 
 	size = chip->ecc.size;
 	strength = chip->ecc.strength;
@@ -728,7 +728,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, host);
 	chip = &host->chip;
-	mtd  = nand_to_mtd(chip);
+	mtd  = nandc_to_mtd(chip);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
@@ -831,7 +831,7 @@ err_res:
 static int hisi_nfc_remove(struct platform_device *pdev)
 {
 	struct hinfc_host *host = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = nand_to_mtd(&host->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->chip);
 
 	nand_release(mtd);
 
diff --git a/drivers/mtd/nand/rawnand/jz4740_nand.c b/drivers/mtd/nand/rawnand/jz4740_nand.c
index e813ec11ee84..99fb8f47b508 100644
--- a/drivers/mtd/nand/rawnand/jz4740_nand.c
+++ b/drivers/mtd/nand/rawnand/jz4740_nand.c
@@ -75,13 +75,13 @@ struct jz_nand {
 
 static inline struct jz_nand *mtd_to_jz_nand(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct jz_nand, chip);
+	return container_of(mtd_to_nandc(mtd), struct jz_nand, chip);
 }
 
 static void jz_nand_select_chip(struct mtd_info *mtd, int chipnr)
 {
 	struct jz_nand *nand = mtd_to_jz_nand(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	uint32_t ctrl;
 	int banknr;
 
@@ -103,7 +103,7 @@ static void jz_nand_select_chip(struct mtd_info *mtd, int chipnr)
 static void jz_nand_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 {
 	struct jz_nand *nand = mtd_to_jz_nand(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	uint32_t reg;
 	void __iomem *bank_base = nand->bank_base[nand->selected_bank];
 
@@ -315,7 +315,7 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 	char res_name[6];
 	uint32_t ctrl;
 	struct nand_chip *chip = &nand->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 
 	/* Request GPIO port. */
 	gpio = JZ_GPIO_MEM_CS0 + bank - 1;
@@ -413,7 +413,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 	}
 
 	chip		= &nand->chip;
-	mtd		= nand_to_mtd(chip);
+	mtd		= nandc_to_mtd(chip);
 	mtd->dev.parent = &pdev->dev;
 	mtd->name	= "jz4740-nand";
 
@@ -520,7 +520,7 @@ static int jz_nand_remove(struct platform_device *pdev)
 	struct jz_nand *nand = platform_get_drvdata(pdev);
 	size_t i;
 
-	nand_release(nand_to_mtd(&nand->chip));
+	nand_release(nandc_to_mtd(&nand->chip));
 
 	/* Deassert and disable all chips */
 	writel(0, nand->base + JZ_REG_NAND_CTRL);
diff --git a/drivers/mtd/nand/rawnand/jz4780_nand.c b/drivers/mtd/nand/rawnand/jz4780_nand.c
index 2f725bd83de8..7db5da056939 100644
--- a/drivers/mtd/nand/rawnand/jz4780_nand.c
+++ b/drivers/mtd/nand/rawnand/jz4780_nand.c
@@ -62,7 +62,7 @@ struct jz4780_nand_chip {
 
 static inline struct jz4780_nand_chip *to_jz4780_nand_chip(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct jz4780_nand_chip, chip);
+	return container_of(mtd_to_nandc(mtd), struct jz4780_nand_chip, chip);
 }
 
 static inline struct jz4780_nand_controller *to_jz4780_nand_controller(struct nand_hw_control *ctrl)
@@ -160,7 +160,7 @@ static int jz4780_nand_ecc_correct(struct mtd_info *mtd, u8 *dat,
 static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *dev)
 {
 	struct nand_chip *chip = &nand->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(chip->controller);
 	int eccbytes;
 
@@ -262,7 +262,7 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
 	}
 
 	chip = &nand->chip;
-	mtd = nand_to_mtd(chip);
+	mtd = nandc_to_mtd(chip);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
 				   cs->bank);
 	if (!mtd->name)
@@ -308,7 +308,7 @@ static void jz4780_nand_cleanup_chips(struct jz4780_nand_controller *nfc)
 
 	while (!list_empty(&nfc->chips)) {
 		chip = list_first_entry(&nfc->chips, struct jz4780_nand_chip, chip_list);
-		nand_release(nand_to_mtd(&chip->chip));
+		nand_release(nandc_to_mtd(&chip->chip));
 		list_del(&chip->chip_list);
 	}
 }
diff --git a/drivers/mtd/nand/rawnand/lpc32xx_mlc.c b/drivers/mtd/nand/rawnand/lpc32xx_mlc.c
index b212bb0fd902..c7d66b565495 100644
--- a/drivers/mtd/nand/rawnand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/rawnand/lpc32xx_mlc.c
@@ -141,7 +141,7 @@ struct lpc32xx_nand_cfg_mlc {
 static int lpc32xx_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 
 	if (section >= nand_chip->ecc.steps)
 		return -ERANGE;
@@ -155,7 +155,7 @@ static int lpc32xx_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int lpc32xx_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 
 	if (section >= nand_chip->ecc.steps)
 		return -ERANGE;
@@ -288,7 +288,7 @@ static void lpc32xx_nand_setup(struct lpc32xx_nand_host *host)
 static void lpc32xx_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 				  unsigned int ctrl)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (cmd != NAND_CMD_NONE) {
@@ -304,7 +304,7 @@ static void lpc32xx_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
  */
 static int lpc32xx_nand_device_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if ((readb(MLC_ISR(host->io_base)) &
@@ -402,7 +402,7 @@ static void lpc32xx_dma_complete_func(void *completion)
 static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 			    enum dma_transfer_direction dir)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 	struct dma_async_tx_descriptor *desc;
 	int flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
@@ -579,7 +579,7 @@ static void lpc32xx_ecc_enable(struct mtd_info *mtd, int mode)
 
 static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
 {
-	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->nand_chip);
 	dma_cap_mask_t mask;
 
 	if (!host->pdata || !host->pdata->dma_filter) {
@@ -674,7 +674,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	host->io_base_phy = rc->start;
 
 	nand_chip = &host->nand_chip;
-	mtd = nand_to_mtd(nand_chip);
+	mtd = nandc_to_mtd(nand_chip);
 	if (pdev->dev.of_node)
 		host->ncfg = lpc32xx_parse_dt(&pdev->dev);
 	if (!host->ncfg) {
@@ -828,7 +828,7 @@ err_exit1:
 static int lpc32xx_nand_remove(struct platform_device *pdev)
 {
 	struct lpc32xx_nand_host *host = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->nand_chip);
 
 	nand_release(mtd);
 	free_irq(host->irq, host);
diff --git a/drivers/mtd/nand/rawnand/lpc32xx_slc.c b/drivers/mtd/nand/rawnand/lpc32xx_slc.c
index 018d783d37cd..20520df33460 100644
--- a/drivers/mtd/nand/rawnand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/rawnand/lpc32xx_slc.c
@@ -282,7 +282,7 @@ static void lpc32xx_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 	unsigned int ctrl)
 {
 	uint32_t tmp;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 
 	/* Does CE state need to be changed? */
@@ -306,7 +306,7 @@ static void lpc32xx_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
  */
 static int lpc32xx_nand_device_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 	int rdy = 0;
 
@@ -361,7 +361,7 @@ static int lpc32xx_nand_ecc_calculate(struct mtd_info *mtd,
  */
 static uint8_t lpc32xx_nand_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 
 	return (uint8_t)readl(SLC_DATA(host->io_base));
@@ -372,7 +372,7 @@ static uint8_t lpc32xx_nand_read_byte(struct mtd_info *mtd)
  */
 static void lpc32xx_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 
 	/* Direct device read with no ECC */
@@ -385,7 +385,7 @@ static void lpc32xx_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
  */
 static void lpc32xx_nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 
 	/* Direct device write with no ECC */
@@ -450,7 +450,7 @@ static void lpc32xx_dma_complete_func(void *completion)
 static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
 			    void *mem, int len, enum dma_transfer_direction dir)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 	struct dma_async_tx_descriptor *desc;
 	int flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
@@ -510,7 +510,7 @@ out1:
 static int lpc32xx_xfer(struct mtd_info *mtd, uint8_t *buf, int eccsubpages,
 			int read)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 	int i, status = 0;
 	unsigned long timeout;
@@ -736,7 +736,7 @@ static int lpc32xx_nand_write_page_raw_syndrome(struct mtd_info *mtd,
 
 static int lpc32xx_nand_dma_setup(struct lpc32xx_nand_host *host)
 {
-	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->nand_chip);
 	dma_cap_mask_t mask;
 
 	if (!host->pdata || !host->pdata->dma_filter) {
@@ -832,7 +832,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	host->pdata = dev_get_platdata(&pdev->dev);
 
 	chip = &host->nand_chip;
-	mtd = nand_to_mtd(chip);
+	mtd = nandc_to_mtd(chip);
 	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, pdev->dev.of_node);
 	mtd->owner = THIS_MODULE;
@@ -959,7 +959,7 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 {
 	uint32_t tmp;
 	struct lpc32xx_nand_host *host = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->nand_chip);
 
 	nand_release(mtd);
 	dma_release_channel(host->dma_chan);
diff --git a/drivers/mtd/nand/rawnand/mpc5121_nfc.c b/drivers/mtd/nand/rawnand/mpc5121_nfc.c
index 2a1fa86fd123..40f5969ac098 100644
--- a/drivers/mtd/nand/rawnand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/rawnand/mpc5121_nfc.c
@@ -134,7 +134,7 @@ static void mpc5121_nfc_done(struct mtd_info *mtd);
 /* Read NFC register */
 static inline u16 nfc_read(struct mtd_info *mtd, uint reg)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 
 	return in_be16(prv->regs + reg);
@@ -143,7 +143,7 @@ static inline u16 nfc_read(struct mtd_info *mtd, uint reg)
 /* Write NFC register */
 static inline void nfc_write(struct mtd_info *mtd, uint reg, u16 val)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 
 	out_be16(prv->regs + reg, val);
@@ -213,7 +213,7 @@ static inline void mpc5121_nfc_send_read_status(struct mtd_info *mtd)
 static irqreturn_t mpc5121_nfc_irq(int irq, void *data)
 {
 	struct mtd_info *mtd = data;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 
 	nfc_set(mtd, NFC_CONFIG1, NFC_INT_MASK);
@@ -225,7 +225,7 @@ static irqreturn_t mpc5121_nfc_irq(int irq, void *data)
 /* Wait for operation complete */
 static void mpc5121_nfc_done(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 	int rv;
 
@@ -245,7 +245,7 @@ static void mpc5121_nfc_done(struct mtd_info *mtd)
 /* Do address cycle(s) */
 static void mpc5121_nfc_addr_cycle(struct mtd_info *mtd, int column, int page)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	u32 pagemask = chip->pagemask;
 
 	if (column != -1) {
@@ -280,7 +280,7 @@ static void mpc5121_nfc_select_chip(struct mtd_info *mtd, int chip)
 /* Init external chip select logic on ADS5121 board */
 static int ads5121_chipselect_init(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 	struct device_node *dn;
 
@@ -302,7 +302,7 @@ static int ads5121_chipselect_init(struct mtd_info *mtd)
 /* Control chips select signal on ADS5121 board */
 static void ads5121_select_chip(struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(nand);
 	u8 v;
 
@@ -332,7 +332,7 @@ static int mpc5121_nfc_dev_ready(struct mtd_info *mtd)
 static void mpc5121_nfc_command(struct mtd_info *mtd, unsigned command,
 							int column, int page)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 
 	prv->column = (column >= 0) ? column : 0;
@@ -405,7 +405,7 @@ static void mpc5121_nfc_command(struct mtd_info *mtd, unsigned command,
 static void mpc5121_nfc_copy_spare(struct mtd_info *mtd, uint offset,
 						u8 *buffer, uint size, int wr)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(nand);
 	uint o, s, sbsize, blksize;
 
@@ -457,7 +457,7 @@ static void mpc5121_nfc_copy_spare(struct mtd_info *mtd, uint offset,
 static void mpc5121_nfc_buf_copy(struct mtd_info *mtd, u_char *buf, int len,
 									int wr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 	uint c = prv->column;
 	uint l;
@@ -535,7 +535,7 @@ static u16 mpc5121_nfc_read_word(struct mtd_info *mtd)
  */
 static int mpc5121_nfc_read_hw_config(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 	struct mpc512x_reset_module *rm;
 	struct device_node *rmnode;
@@ -614,7 +614,7 @@ out:
 /* Free driver resources */
 static void mpc5121_nfc_free(struct device *dev, struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mpc5121_nfc_prv *prv = nand_get_controller_data(chip);
 
 	if (prv->clk)
@@ -654,7 +654,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENOMEM;
 
 	chip = &prv->chip;
-	mtd = nand_to_mtd(chip);
+	mtd = nandc_to_mtd(chip);
 
 	mtd->dev.parent = dev;
 	nand_set_controller_data(chip, prv);
diff --git a/drivers/mtd/nand/rawnand/mtk_nand.c b/drivers/mtd/nand/rawnand/mtk_nand.c
index 65156b8fe839..2f5a4084387e 100644
--- a/drivers/mtd/nand/rawnand/mtk_nand.c
+++ b/drivers/mtd/nand/rawnand/mtk_nand.c
@@ -302,7 +302,7 @@ static int mtk_nfc_send_address(struct mtk_nfc *nfc, int addr)
 
 static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	u32 fmt, spare;
@@ -415,7 +415,7 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
 
 static void mtk_nfc_select_chip(struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct mtk_nfc *nfc = nand_get_controller_data(nand);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(nand);
 
@@ -429,7 +429,7 @@ static void mtk_nfc_select_chip(struct mtd_info *mtd, int chip)
 
 static int mtk_nfc_dev_ready(struct mtd_info *mtd)
 {
-	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
+	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nandc(mtd));
 
 	if (nfi_readl(nfc, NFI_STA) & STA_BUSY)
 		return 0;
@@ -439,7 +439,7 @@ static int mtk_nfc_dev_ready(struct mtd_info *mtd)
 
 static void mtk_nfc_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 {
-	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
+	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nandc(mtd));
 
 	if (ctrl & NAND_ALE) {
 		mtk_nfc_send_address(nfc, dat);
@@ -464,7 +464,7 @@ static inline void mtk_nfc_wait_ioready(struct mtk_nfc *nfc)
 
 static inline u8 mtk_nfc_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	u32 reg;
 
@@ -501,7 +501,7 @@ static void mtk_nfc_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 
 static void mtk_nfc_write_byte(struct mtd_info *mtd, u8 byte)
 {
-	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
+	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nandc(mtd));
 	u32 reg;
 
 	reg = nfi_readl(nfc, NFI_STA) & NFI_FSM_MASK;
@@ -547,7 +547,7 @@ static void mtk_nfc_no_bad_mark_swap(struct mtd_info *a, u8 *b, int c)
 
 static void mtk_nfc_bad_mark_swap(struct mtd_info *mtd, u8 *buf, int raw)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtk_nfc_nand_chip *nand = to_mtk_nand(chip);
 	u32 bad_pos = nand->bad_mark.pos;
 
@@ -562,7 +562,7 @@ static void mtk_nfc_bad_mark_swap(struct mtd_info *mtd, u8 *buf, int raw)
 static int mtk_nfc_format_subpage(struct mtd_info *mtd, u32 offset,
 				  u32 len, const u8 *buf)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	struct mtk_nfc_fdm *fdm = &mtk_nand->fdm;
@@ -596,7 +596,7 @@ static int mtk_nfc_format_subpage(struct mtd_info *mtd, u32 offset,
 
 static void mtk_nfc_format_page(struct mtd_info *mtd, const u8 *buf)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	struct mtk_nfc_fdm *fdm = &mtk_nand->fdm;
@@ -809,7 +809,7 @@ static int mtk_nfc_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
 
 static int mtk_nfc_update_ecc_stats(struct mtd_info *mtd, u8 *buf, u32 sectors)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	struct mtk_ecc_stats stats;
@@ -1060,7 +1060,7 @@ static void mtk_nfc_disable_clk(struct mtk_nfc_clk *clk)
 static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oob_region)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	struct mtk_nfc_fdm *fdm = &mtk_nand->fdm;
 	u32 eccsteps;
@@ -1079,7 +1079,7 @@ static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
 static int mtk_nfc_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oob_region)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	u32 eccsteps;
 
@@ -1100,7 +1100,7 @@ static const struct mtd_ooblayout_ops mtk_nfc_ooblayout_ops = {
 
 static void mtk_nfc_set_fdm(struct mtk_nfc_fdm *fdm, struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct mtk_nfc_nand_chip *chip = to_mtk_nand(nand);
 	u32 ecc_bytes;
 
@@ -1117,7 +1117,7 @@ static void mtk_nfc_set_fdm(struct mtk_nfc_fdm *fdm, struct mtd_info *mtd)
 static void mtk_nfc_set_bad_mark_ctl(struct mtk_nfc_bad_mark_ctl *bm_ctl,
 				     struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 
 	if (mtd->writesize == 512) {
 		bm_ctl->bm_swap = mtk_nfc_no_bad_mark_swap;
@@ -1130,7 +1130,7 @@ static void mtk_nfc_set_bad_mark_ctl(struct mtk_nfc_bad_mark_ctl *bm_ctl,
 
 static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	u32 spare[] = {16, 26, 27, 28, 32, 36, 40, 44,
 			48, 49, 50, 51, 52, 62, 63, 64};
 	u32 eccsteps, i;
@@ -1160,7 +1160,7 @@ static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
 
 static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	u32 spare;
 	int free;
 
@@ -1284,7 +1284,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand->ecc.read_oob_raw = mtk_nfc_read_oob_std;
 	nand->ecc.read_oob = mtk_nfc_read_oob_std;
 
-	mtd = nand_to_mtd(nand);
+	mtd = nandc_to_mtd(nand);
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
 	mtd->name = MTK_NAME;
@@ -1448,7 +1448,7 @@ static int mtk_nfc_remove(struct platform_device *pdev)
 	while (!list_empty(&nfc->chips)) {
 		chip = list_first_entry(&nfc->chips, struct mtk_nfc_nand_chip,
 					node);
-		nand_release(nand_to_mtd(&chip->nand));
+		nand_release(nandc_to_mtd(&chip->nand));
 		list_del(&chip->node);
 	}
 
@@ -1488,7 +1488,7 @@ static int mtk_nfc_resume(struct device *dev)
 	/* reset NAND chip if VCC was powered off */
 	list_for_each_entry(chip, &nfc->chips, node) {
 		nand = &chip->nand;
-		mtd = nand_to_mtd(nand);
+		mtd = nandc_to_mtd(nand);
 		for (i = 0; i < chip->nsels; i++) {
 			nand->select_chip(mtd, i);
 			nand->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
diff --git a/drivers/mtd/nand/rawnand/mxc_nand.c b/drivers/mtd/nand/rawnand/mxc_nand.c
index 379e11be6e0b..2dcb1f584883 100644
--- a/drivers/mtd/nand/rawnand/mxc_nand.c
+++ b/drivers/mtd/nand/rawnand/mxc_nand.c
@@ -466,7 +466,7 @@ static void send_addr_v1_v2(struct mxc_nand_host *host, uint16_t addr, int islas
 
 static void send_page_v3(struct mtd_info *mtd, unsigned int ops)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	uint32_t tmp;
 
@@ -482,7 +482,7 @@ static void send_page_v3(struct mtd_info *mtd, unsigned int ops)
 
 static void send_page_v2(struct mtd_info *mtd, unsigned int ops)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 
 	/* NANDFC buffer 0 is used for page read/write */
@@ -496,7 +496,7 @@ static void send_page_v2(struct mtd_info *mtd, unsigned int ops)
 
 static void send_page_v1(struct mtd_info *mtd, unsigned int ops)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	int bufs, i;
 
@@ -597,7 +597,7 @@ static void mxc_nand_enable_hwecc(struct mtd_info *mtd, int mode)
 static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
 				 u_char *read_ecc, u_char *calc_ecc)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 
 	/*
@@ -618,7 +618,7 @@ static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
 static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
 				 u_char *read_ecc, u_char *calc_ecc)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	u32 ecc_stat, err;
 	int no_subpages = 1;
@@ -656,7 +656,7 @@ static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
 
 static u_char mxc_nand_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	uint8_t ret;
 
@@ -680,7 +680,7 @@ static u_char mxc_nand_read_byte(struct mtd_info *mtd)
 
 static uint16_t mxc_nand_read_word(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	uint16_t ret;
 
@@ -696,7 +696,7 @@ static uint16_t mxc_nand_read_word(struct mtd_info *mtd)
 static void mxc_nand_write_buf(struct mtd_info *mtd,
 				const u_char *buf, int len)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	u16 col = host->buf_start;
 	int n = mtd->oobsize + mtd->writesize - col;
@@ -714,7 +714,7 @@ static void mxc_nand_write_buf(struct mtd_info *mtd,
  */
 static void mxc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	u16 col = host->buf_start;
 	int n = mtd->oobsize + mtd->writesize - col;
@@ -730,7 +730,7 @@ static void mxc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
  * deselect of the NAND chip */
 static void mxc_nand_select_chip_v1_v3(struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (chip == -1) {
@@ -751,7 +751,7 @@ static void mxc_nand_select_chip_v1_v3(struct mtd_info *mtd, int chip)
 
 static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (chip == -1) {
@@ -784,7 +784,7 @@ static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
  */
 static void copy_spare(struct mtd_info *mtd, bool bfrom)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(this);
 	u16 i, oob_chunk_size;
 	u16 num_chunks = mtd->writesize / 512;
@@ -827,7 +827,7 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
  */
 static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 
 	/* Write out column address, if necessary */
@@ -880,7 +880,7 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
 static int mxc_v1_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 
 	if (section >= nand_chip->ecc.steps)
 		return -ERANGE;
@@ -894,7 +894,7 @@ static int mxc_v1_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int mxc_v1_ooblayout_free(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 
 	if (section > nand_chip->ecc.steps)
 		return -ERANGE;
@@ -928,7 +928,7 @@ static const struct mtd_ooblayout_ops mxc_v1_ooblayout_ops = {
 static int mxc_v2_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	int stepsize = nand_chip->ecc.bytes == 9 ? 16 : 26;
 
 	if (section >= nand_chip->ecc.steps)
@@ -943,7 +943,7 @@ static int mxc_v2_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int mxc_v2_ooblayout_free(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	int stepsize = nand_chip->ecc.bytes == 9 ? 16 : 26;
 
 	if (section > nand_chip->ecc.steps)
@@ -989,7 +989,7 @@ static int get_eccsize(struct mtd_info *mtd)
 
 static void preset_v1(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	uint16_t config1 = 0;
 
@@ -1019,7 +1019,7 @@ static int mxc_nand_v2_setup_data_interface(struct mtd_info *mtd,
 					const struct nand_data_interface *conf,
 					bool check_only)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	int tRC_min_ns, tRC_ps, ret;
 	unsigned long rate, rate_round;
@@ -1093,7 +1093,7 @@ static int mxc_nand_v2_setup_data_interface(struct mtd_info *mtd,
 
 static void preset_v2(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	uint16_t config1 = 0;
 
@@ -1139,7 +1139,7 @@ static void preset_v2(struct mtd_info *mtd)
 
 static void preset_v3(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(chip);
 	uint32_t config2, config3;
 	int i, addr_phases;
@@ -1210,7 +1210,7 @@ static void preset_v3(struct mtd_info *mtd)
 static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 				int column, int page_addr)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 
 	pr_debug("mxc_nand_command (cmd = 0x%x, col = 0x%x, page = 0x%x)\n",
@@ -1322,7 +1322,7 @@ static int mxc_nand_onfi_set_features(struct mtd_info *mtd,
 				      struct nand_chip *chip, int addr,
 				      u8 *subfeature_param)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	int i;
 
@@ -1348,7 +1348,7 @@ static int mxc_nand_onfi_get_features(struct mtd_info *mtd,
 				      struct nand_chip *chip, int addr,
 				      u8 *subfeature_param)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	int i;
 
@@ -1629,7 +1629,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	host->dev = &pdev->dev;
 	/* structures must be linked */
 	this = &host->nand;
-	mtd = nand_to_mtd(this);
+	mtd = nandc_to_mtd(this);
 	mtd->dev.parent = &pdev->dev;
 	mtd->name = DRIVER_NAME;
 
@@ -1834,7 +1834,7 @@ static int mxcnd_remove(struct platform_device *pdev)
 {
 	struct mxc_nand_host *host = platform_get_drvdata(pdev);
 
-	nand_release(nand_to_mtd(&host->nand));
+	nand_release(nandc_to_mtd(&host->nand));
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
 
diff --git a/drivers/mtd/nand/rawnand/nand_base.c b/drivers/mtd/nand/rawnand/nand_base.c
index 56b08a897115..c4a4054255cf 100644
--- a/drivers/mtd/nand/rawnand/nand_base.c
+++ b/drivers/mtd/nand/rawnand/nand_base.c
@@ -56,7 +56,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	if (section > 1)
@@ -105,7 +105,7 @@ EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
 static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	if (section)
@@ -120,7 +120,7 @@ static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 static int nand_ooblayout_free_lp(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	if (section)
@@ -141,7 +141,7 @@ EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
 static int check_offs_len(struct mtd_info *mtd,
 					loff_t ofs, uint64_t len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ret = 0;
 
 	/* Start address must align on block boundary */
@@ -167,7 +167,7 @@ static int check_offs_len(struct mtd_info *mtd,
  */
 static void nand_release_device(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	/* Release the controller and the chip */
 	spin_lock(&chip->controller->lock);
@@ -185,7 +185,7 @@ static void nand_release_device(struct mtd_info *mtd)
  */
 static uint8_t nand_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	return readb(chip->IO_ADDR_R);
 }
 
@@ -198,7 +198,7 @@ static uint8_t nand_read_byte(struct mtd_info *mtd)
  */
 static uint8_t nand_read_byte16(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	return (uint8_t) cpu_to_le16(readw(chip->IO_ADDR_R));
 }
 
@@ -210,7 +210,7 @@ static uint8_t nand_read_byte16(struct mtd_info *mtd)
  */
 static u16 nand_read_word(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	return readw(chip->IO_ADDR_R);
 }
 
@@ -223,7 +223,7 @@ static u16 nand_read_word(struct mtd_info *mtd)
  */
 static void nand_select_chip(struct mtd_info *mtd, int chipnr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	switch (chipnr) {
 	case -1:
@@ -246,7 +246,7 @@ static void nand_select_chip(struct mtd_info *mtd, int chipnr)
  */
 static void nand_write_byte(struct mtd_info *mtd, uint8_t byte)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	chip->write_buf(mtd, &byte, 1);
 }
@@ -260,7 +260,7 @@ static void nand_write_byte(struct mtd_info *mtd, uint8_t byte)
  */
 static void nand_write_byte16(struct mtd_info *mtd, uint8_t byte)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	uint16_t word = byte;
 
 	/*
@@ -292,7 +292,7 @@ static void nand_write_byte16(struct mtd_info *mtd, uint8_t byte)
  */
 static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	iowrite8_rep(chip->IO_ADDR_W, buf, len);
 }
@@ -307,7 +307,7 @@ static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static void nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	ioread8_rep(chip->IO_ADDR_R, buf, len);
 }
@@ -322,7 +322,7 @@ static void nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
  */
 static void nand_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	u16 *p = (u16 *) buf;
 
 	iowrite16_rep(chip->IO_ADDR_W, p, len >> 1);
@@ -338,7 +338,7 @@ static void nand_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	u16 *p = (u16 *) buf;
 
 	ioread16_rep(chip->IO_ADDR_R, p, len >> 1);
@@ -354,7 +354,7 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
 static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
 	int page, res = 0, i = 0;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	u16 bad;
 
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
@@ -400,7 +400,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
  */
 static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtd_oob_ops ops;
 	uint8_t buf[2] = { 0, 0 };
 	int ret = 0, res, i = 0;
@@ -450,7 +450,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 */
 static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int res, ret = 0;
 
 	if (!(chip->bbt_options & NAND_BBT_NO_OOB_BBM)) {
@@ -491,7 +491,7 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
  */
 static int nand_check_wp(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	/* Broken xD cards report WP despite being writable */
 	if (chip->options & NAND_BROKEN_XD)
@@ -511,7 +511,7 @@ static int nand_check_wp(struct mtd_info *mtd)
  */
 static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (!chip->bbt)
 		return 0;
@@ -530,7 +530,7 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
  */
 static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int allowbbt)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (!chip->bbt)
 		return chip->block_bad(mtd, ofs);
@@ -549,7 +549,7 @@ static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int allowbbt)
  */
 static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int i;
 
 	/* Wait for the device to get ready */
@@ -569,7 +569,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
  */
 void nand_wait_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	unsigned long timeo = 400;
 
 	if (in_interrupt() || oops_in_progress)
@@ -597,7 +597,7 @@ EXPORT_SYMBOL_GPL(nand_wait_ready);
  */
 static void nand_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
 {
-	register struct nand_chip *chip = mtd_to_nand(mtd);
+	register struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	timeo = jiffies + msecs_to_jiffies(timeo);
 	do {
@@ -620,7 +620,7 @@ static void nand_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
 static void nand_command(struct mtd_info *mtd, unsigned int command,
 			 int column, int page_addr)
 {
-	register struct nand_chip *chip = mtd_to_nand(mtd);
+	register struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ctrl = NAND_CTRL_CLE | NAND_CTRL_CHANGE;
 
 	/* Write out the command to the device */
@@ -723,7 +723,7 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 			    int column, int page_addr)
 {
-	register struct nand_chip *chip = mtd_to_nand(mtd);
+	register struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	/* Emulate NAND_CMD_READOOB */
 	if (command == NAND_CMD_READOOB) {
@@ -850,7 +850,7 @@ static void panic_nand_get_device(struct nand_chip *chip,
 static int
 nand_get_device(struct mtd_info *mtd, int new_state)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	spinlock_t *lock = &chip->controller->lock;
 	wait_queue_head_t *wq = &chip->controller->wq;
 	DECLARE_WAITQUEUE(wait, current);
@@ -960,7 +960,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
  */
 static int nand_reset_data_interface(struct nand_chip *chip)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	const struct nand_data_interface *conf;
 	int ret;
 
@@ -1003,7 +1003,7 @@ static int nand_reset_data_interface(struct nand_chip *chip)
  */
 static int nand_setup_data_interface(struct nand_chip *chip)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	int ret;
 
 	if (!chip->setup_data_interface || !chip->data_interface)
@@ -1046,7 +1046,7 @@ err:
  */
 static int nand_init_data_interface(struct nand_chip *chip)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	int modes, mode, ret;
 
 	if (!chip->setup_data_interface)
@@ -1100,7 +1100,7 @@ static void nand_release_data_interface(struct nand_chip *chip)
  */
 int nand_reset(struct nand_chip *chip)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	int ret;
 
 	ret = nand_reset_data_interface(chip);
@@ -1133,7 +1133,7 @@ static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
 {
 	int ret = 0;
 	int status, page;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	/* Submit address of first page to unlock */
 	page = ofs >> chip->page_shift;
@@ -1168,7 +1168,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	int ret = 0;
 	int chipnr;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
 			__func__, (unsigned long long)ofs, len);
@@ -1231,7 +1231,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	int ret = 0;
 	int chipnr, status, page;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
 			__func__, (unsigned long long)ofs, len);
@@ -1833,7 +1833,7 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 static uint8_t *nand_transfer_oob(struct mtd_info *mtd, uint8_t *oob,
 				  struct mtd_oob_ops *ops, size_t len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ret;
 
 	switch (ops->mode) {
@@ -1866,7 +1866,7 @@ static uint8_t *nand_transfer_oob(struct mtd_info *mtd, uint8_t *oob,
  */
 static int nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	pr_debug("setting READ RETRY mode %d\n", retry_mode);
 
@@ -1891,7 +1891,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
 	int chipnr, page, realpage, col, bytes, aligned, oob_required;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ret = 0;
 	uint32_t readlen = ops->len;
 	uint32_t oobreadlen = ops->ooblen;
@@ -2072,8 +2072,8 @@ read_retry:
  *
  * Get hold of the chip and call nand_do_read.
  */
-static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
-		     size_t *retlen, uint8_t *buf)
+static int nandc_read(struct mtd_info *mtd, loff_t from, size_t len,
+		      size_t *retlen, uint8_t *buf)
 {
 	struct mtd_oob_ops ops;
 	int ret;
@@ -2236,7 +2236,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
 	int page, realpage, chipnr;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtd_ecc_stats stats;
 	int readlen = ops->ooblen;
 	int len;
@@ -2678,7 +2678,7 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
 			      struct mtd_oob_ops *ops)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ret;
 
 	/*
@@ -2720,7 +2720,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
 	int chipnr, realpage, page, blockmask, column;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	uint32_t writelen = ops->len;
 
 	uint32_t oobwritelen = ops->ooblen;
@@ -2849,7 +2849,7 @@ err_out:
 static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const uint8_t *buf)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct mtd_oob_ops ops;
 	int ret;
 
@@ -2880,8 +2880,8 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
  *
  * NAND write with ECC.
  */
-static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
-			  size_t *retlen, const uint8_t *buf)
+static int nandc_write(struct mtd_info *mtd, loff_t to, size_t len,
+		       size_t *retlen, const uint8_t *buf)
 {
 	struct mtd_oob_ops ops;
 	int ret;
@@ -2909,7 +2909,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
 	int chipnr, page, status, len;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	pr_debug("%s: to = 0x%08x, len = %i\n",
 			 __func__, (unsigned int)to, (int)ops->ooblen);
@@ -3031,7 +3031,7 @@ out:
  */
 static int single_erase(struct mtd_info *mtd, int page)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	/* Send commands to erase a block */
 	chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
 	chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
@@ -3046,7 +3046,7 @@ static int single_erase(struct mtd_info *mtd, int page)
  *
  * Erase one ore more blocks.
  */
-static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
+static int nandc_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	return nand_erase_nand(mtd, instr, 0);
 }
@@ -3063,7 +3063,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    int allowbbt)
 {
 	int page, status, pages_per_block, ret, chipnr;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
@@ -3189,7 +3189,7 @@ static void nand_sync(struct mtd_info *mtd)
  */
 static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int chipnr = (int)(offs >> chip->chip_shift);
 	int ret;
 
@@ -3291,7 +3291,7 @@ static int nand_suspend(struct mtd_info *mtd)
  */
 static void nand_resume(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (chip->state == FL_PM_SUSPENDED)
 		nand_release_device(mtd);
@@ -3462,7 +3462,7 @@ ext_out:
 
 static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
 
 	return chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_READ_RETRY,
@@ -4295,7 +4295,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		    struct nand_flash_dev *table)
 {
 	int i, nand_maf_id, nand_dev_id;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_flash_dev *type;
 	int ret;
 
@@ -4363,7 +4363,7 @@ EXPORT_SYMBOL(nand_scan_ident);
 
 static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	if (WARN_ON(ecc->mode != NAND_ECC_SOFT))
@@ -4473,7 +4473,7 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
  */
 static bool nand_ecc_strength_good(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int corr, ds_corr;
 
@@ -4501,7 +4501,7 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
  */
 int nand_scan_tail(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct nand_buffers *nbuf;
 	int ret;
@@ -4726,11 +4726,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
 	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
 						MTD_CAP_NANDFLASH;
-	mtd->_erase = nand_erase;
+	mtd->_erase = nandc_erase;
 	mtd->_point = NULL;
 	mtd->_unpoint = NULL;
-	mtd->_read = nand_read;
-	mtd->_write = nand_write;
+	mtd->_read = nandc_read;
+	mtd->_write = nandc_write;
 	mtd->_panic_write = panic_nand_write;
 	mtd->_read_oob = nand_read_oob;
 	mtd->_write_oob = nand_write_oob;
@@ -4830,7 +4830,7 @@ EXPORT_SYMBOL_GPL(nand_cleanup);
 void nand_release(struct mtd_info *mtd)
 {
 	mtd_device_unregister(mtd);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_cleanup(mtd_to_nandc(mtd));
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
diff --git a/drivers/mtd/nand/rawnand/nand_bbt.c b/drivers/mtd/nand/rawnand/nand_bbt.c
index 2915b6739bf8..3f2e785f4bfb 100644
--- a/drivers/mtd/nand/rawnand/nand_bbt.c
+++ b/drivers/mtd/nand/rawnand/nand_bbt.c
@@ -172,7 +172,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		struct nand_bbt_descr *td, int offs)
 {
 	int res, ret = 0, i, j, act = 0;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	size_t retlen, len, totlen;
 	loff_t from;
 	int bits = td->options & NAND_BBT_NRBITS_MSK;
@@ -263,7 +263,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
  */
 static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int res = 0, i;
 
 	if (td->options & NAND_BBT_PERCHIP) {
@@ -388,7 +388,7 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
 static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 			  struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
@@ -454,7 +454,7 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	struct nand_bbt_descr *bd, int chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int i, numblocks, numpages;
 	int startblock;
 	loff_t from;
@@ -523,7 +523,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
  */
 static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int i, chips;
 	int startblock, block, dir;
 	int scanlen = mtd->writesize + mtd->oobsize;
@@ -683,7 +683,7 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 			       struct nand_bbt_descr *td,
 			       int chip, int block)
 {
-	struct mtd_info *mtd = nand_to_mtd(this);
+	struct mtd_info *mtd = nandc_to_mtd(this);
 	loff_t to;
 	int res;
 
@@ -712,7 +712,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		     struct nand_bbt_descr *td, struct nand_bbt_descr *md,
 		     int chipsel)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct erase_info einfo;
 	int i, res, chip = 0;
 	int bits, page, offs, numblocks, sft, sftmsk;
@@ -896,7 +896,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
  */
 static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 
 	return create_bbt(mtd, this->buffers->databuf, bd, -1);
 }
@@ -915,7 +915,7 @@ static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *b
 static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
 {
 	int i, chips, writeops, create, chipsel, res, res2;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct nand_bbt_descr *td = this->bbt_td;
 	struct nand_bbt_descr *md = this->bbt_md;
 	struct nand_bbt_descr *rd, *rd2;
@@ -1039,7 +1039,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
  */
 static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int i, j, chips, block, nrblocks, update;
 	uint8_t oldval;
 
@@ -1099,7 +1099,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
  */
 static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	u32 pattern_len;
 	u32 bits;
 	u32 table_size;
@@ -1151,7 +1151,7 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  */
 static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int len, res;
 	uint8_t *buf;
 	struct nand_bbt_descr *td = this->bbt_td;
@@ -1224,7 +1224,7 @@ err:
  */
 static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int len, res = 0;
 	int chip, chipsel;
 	uint8_t *buf;
@@ -1358,7 +1358,7 @@ static int nand_create_badblock_pattern(struct nand_chip *this)
  */
 int nand_default_bbt(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int ret;
 
 	/* Is a flash based bad block table requested? */
@@ -1394,7 +1394,7 @@ int nand_default_bbt(struct mtd_info *mtd)
  */
 int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int block;
 
 	block = (int)(offs >> this->bbt_erase_shift);
@@ -1409,7 +1409,7 @@ int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
  */
 int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int block, res;
 
 	block = (int)(offs >> this->bbt_erase_shift);
@@ -1436,7 +1436,7 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
  */
 int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	int block, ret = 0;
 
 	block = (int)(offs >> this->bbt_erase_shift);
diff --git a/drivers/mtd/nand/rawnand/nand_bch.c b/drivers/mtd/nand/rawnand/nand_bch.c
index 505441c9373b..ee3a82ea1a93 100644
--- a/drivers/mtd/nand/rawnand/nand_bch.c
+++ b/drivers/mtd/nand/rawnand/nand_bch.c
@@ -50,7 +50,7 @@ struct nand_bch_control {
 int nand_bch_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 			   unsigned char *code)
 {
-	const struct nand_chip *chip = mtd_to_nand(mtd);
+	const struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_bch_control *nbc = chip->ecc.priv;
 	unsigned int i;
 
@@ -77,7 +77,7 @@ EXPORT_SYMBOL(nand_bch_calculate_ecc);
 int nand_bch_correct_data(struct mtd_info *mtd, unsigned char *buf,
 			  unsigned char *read_ecc, unsigned char *calc_ecc)
 {
-	const struct nand_chip *chip = mtd_to_nand(mtd);
+	const struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_bch_control *nbc = chip->ecc.priv;
 	unsigned int *errloc = nbc->errloc;
 	int i, count;
@@ -120,7 +120,7 @@ EXPORT_SYMBOL(nand_bch_correct_data);
  */
 struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	unsigned int m, t, eccsteps, i;
 	struct nand_bch_control *nbc = NULL;
 	unsigned char *erased_page;
diff --git a/drivers/mtd/nand/rawnand/nand_ecc.c b/drivers/mtd/nand/rawnand/nand_ecc.c
index 7613a0388044..7c582b301e8b 100644
--- a/drivers/mtd/nand/rawnand/nand_ecc.c
+++ b/drivers/mtd/nand/rawnand/nand_ecc.c
@@ -424,7 +424,7 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 		       unsigned char *code)
 {
 	__nand_calculate_ecc(buf,
-			mtd_to_nand(mtd)->ecc.size, code);
+			mtd_to_nandc(mtd)->ecc.size, code);
 
 	return 0;
 }
@@ -524,7 +524,7 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		      unsigned char *read_ecc, unsigned char *calc_ecc)
 {
 	return __nand_correct_data(buf, read_ecc, calc_ecc,
-				   mtd_to_nand(mtd)->ecc.size);
+				   mtd_to_nandc(mtd)->ecc.size);
 }
 EXPORT_SYMBOL(nand_correct_data);
 
diff --git a/drivers/mtd/nand/rawnand/nandsim.c b/drivers/mtd/nand/rawnand/nandsim.c
index 9c16635b5338..020bd7e9cea0 100644
--- a/drivers/mtd/nand/rawnand/nandsim.c
+++ b/drivers/mtd/nand/rawnand/nandsim.c
@@ -666,7 +666,7 @@ static char __init *get_partition_name(int i)
  */
 static int __init init_nandsim(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nandsim   *ns   = nand_get_controller_data(chip);
 	int i, ret = 0;
 	uint64_t remains;
@@ -1908,7 +1908,7 @@ static void switch_state(struct nandsim *ns)
 
 static u_char ns_nand_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 	u_char outb = 0x00;
 
@@ -1970,7 +1970,7 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 
 static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 
 	/* Sanity and correctness checks */
@@ -2125,7 +2125,7 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 static void ns_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int bitmask)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 
 	ns->lines.cle = bitmask & NAND_CLE ? 1 : 0;
@@ -2144,7 +2144,7 @@ static int ns_device_ready(struct mtd_info *mtd)
 
 static uint16_t ns_nand_read_word(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	NS_DBG("read_word\n");
 
@@ -2153,7 +2153,7 @@ static uint16_t ns_nand_read_word(struct mtd_info *mtd)
 
 static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 
 	/* Check that chip is expecting data input */
@@ -2181,7 +2181,7 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 
 static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 
 	/* Sanity and correctness checks */
@@ -2203,7 +2203,7 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 		int i;
 
 		for (i = 0; i < len; i++)
-			buf[i] = mtd_to_nand(mtd)->read_byte(mtd);
+			buf[i] = mtd_to_nandc(mtd)->read_byte(mtd);
 
 		return;
 	}
@@ -2247,7 +2247,7 @@ static int __init ns_init_module(void)
 		NS_ERR("unable to allocate core structures.\n");
 		return -ENOMEM;
 	}
-	nsmtd       = nand_to_mtd(chip);
+	nsmtd       = nandc_to_mtd(chip);
 	nand        = (struct nandsim *)(chip + 1);
 	nand_set_controller_data(chip, (void *)nand);
 
@@ -2411,7 +2411,7 @@ module_init(ns_init_module);
  */
 static void __exit ns_cleanup_module(void)
 {
-	struct nand_chip *chip = mtd_to_nand(nsmtd);
+	struct nand_chip *chip = mtd_to_nandc(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 	int i;
 
@@ -2420,7 +2420,7 @@ static void __exit ns_cleanup_module(void)
 	nand_release(nsmtd); /* Unregister driver */
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
 		kfree(ns->partitions[i].name);
-	kfree(mtd_to_nand(nsmtd));        /* Free other structures */
+	kfree(mtd_to_nandc(nsmtd));        /* Free other structures */
 	free_lists();
 }
 
diff --git a/drivers/mtd/nand/rawnand/ndfc.c b/drivers/mtd/nand/rawnand/ndfc.c
index d8a806894937..79a5cca84b0b 100644
--- a/drivers/mtd/nand/rawnand/ndfc.c
+++ b/drivers/mtd/nand/rawnand/ndfc.c
@@ -47,7 +47,7 @@ static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
 static void ndfc_select_chip(struct mtd_info *mtd, int chip)
 {
 	uint32_t ccr;
-	struct nand_chip *nchip = mtd_to_nand(mtd);
+	struct nand_chip *nchip = mtd_to_nandc(mtd);
 	struct ndfc_controller *ndfc = nand_get_controller_data(nchip);
 
 	ccr = in_be32(ndfc->ndfcbase + NDFC_CCR);
@@ -61,7 +61,7 @@ static void ndfc_select_chip(struct mtd_info *mtd, int chip)
 
 static void ndfc_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct ndfc_controller *ndfc = nand_get_controller_data(chip);
 
 	if (cmd == NAND_CMD_NONE)
@@ -75,7 +75,7 @@ static void ndfc_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 
 static int ndfc_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct ndfc_controller *ndfc = nand_get_controller_data(chip);
 
 	return in_be32(ndfc->ndfcbase + NDFC_STAT) & NDFC_STAT_IS_READY;
@@ -84,7 +84,7 @@ static int ndfc_ready(struct mtd_info *mtd)
 static void ndfc_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	uint32_t ccr;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct ndfc_controller *ndfc = nand_get_controller_data(chip);
 
 	ccr = in_be32(ndfc->ndfcbase + NDFC_CCR);
@@ -96,7 +96,7 @@ static void ndfc_enable_hwecc(struct mtd_info *mtd, int mode)
 static int ndfc_calculate_ecc(struct mtd_info *mtd,
 			      const u_char *dat, u_char *ecc_code)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct ndfc_controller *ndfc = nand_get_controller_data(chip);
 	uint32_t ecc;
 	uint8_t *p = (uint8_t *)&ecc;
@@ -120,7 +120,7 @@ static int ndfc_calculate_ecc(struct mtd_info *mtd,
  */
 static void ndfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct ndfc_controller *ndfc = nand_get_controller_data(chip);
 	uint32_t *p = (uint32_t *) buf;
 
@@ -130,7 +130,7 @@ static void ndfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 
 static void ndfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct ndfc_controller *ndfc = nand_get_controller_data(chip);
 	uint32_t *p = (uint32_t *) buf;
 
@@ -146,7 +146,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 {
 	struct device_node *flash_np;
 	struct nand_chip *chip = &ndfc->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	int ret;
 
 	chip->IO_ADDR_R = ndfc->ndfcbase + NDFC_DATA;
@@ -256,7 +256,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 static int ndfc_remove(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc = dev_get_drvdata(&ofdev->dev);
-	struct mtd_info *mtd = nand_to_mtd(&ndfc->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&ndfc->chip);
 
 	nand_release(mtd);
 	kfree(mtd->name);
diff --git a/drivers/mtd/nand/rawnand/nuc900_nand.c b/drivers/mtd/nand/rawnand/nuc900_nand.c
index 7bb4d2ea9342..ee19784a3f71 100644
--- a/drivers/mtd/nand/rawnand/nuc900_nand.c
+++ b/drivers/mtd/nand/rawnand/nuc900_nand.c
@@ -63,7 +63,7 @@ struct nuc900_nand {
 
 static inline struct nuc900_nand *mtd_to_nuc900(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct nuc900_nand, chip);
+	return container_of(mtd_to_nandc(mtd), struct nuc900_nand, chip);
 }
 
 static const struct mtd_partition partitions[] = {
@@ -132,7 +132,7 @@ static int nuc900_nand_devready(struct mtd_info *mtd)
 static void nuc900_nand_command_lp(struct mtd_info *mtd, unsigned int command,
 				   int column, int page_addr)
 {
-	register struct nand_chip *chip = mtd_to_nand(mtd);
+	register struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nuc900_nand *nand = mtd_to_nuc900(mtd);
 
 	if (command == NAND_CMD_READOOB) {
@@ -243,7 +243,7 @@ static int nuc900_nand_probe(struct platform_device *pdev)
 	if (!nuc900_nand)
 		return -ENOMEM;
 	chip = &(nuc900_nand->chip);
-	mtd = nand_to_mtd(chip);
+	mtd = nandc_to_mtd(chip);
 
 	mtd->dev.parent		= &pdev->dev;
 	spin_lock_init(&nuc900_nand->lock);
@@ -284,7 +284,7 @@ static int nuc900_nand_remove(struct platform_device *pdev)
 {
 	struct nuc900_nand *nuc900_nand = platform_get_drvdata(pdev);
 
-	nand_release(nand_to_mtd(&nuc900_nand->chip));
+	nand_release(nandc_to_mtd(&nuc900_nand->chip));
 	clk_disable(nuc900_nand->clk);
 
 	return 0;
diff --git a/drivers/mtd/nand/rawnand/omap2.c b/drivers/mtd/nand/rawnand/omap2.c
index ebfa1751051d..1e6babd63780 100644
--- a/drivers/mtd/nand/rawnand/omap2.c
+++ b/drivers/mtd/nand/rawnand/omap2.c
@@ -184,7 +184,7 @@ struct omap_nand_info {
 
 static inline struct omap_nand_info *mtd_to_omap(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct omap_nand_info, nand);
+	return container_of(mtd_to_nandc(mtd), struct omap_nand_info, nand);
 }
 
 /**
@@ -279,7 +279,7 @@ static void omap_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
  */
 static void omap_read_buf8(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 
 	ioread8_rep(nand->IO_ADDR_R, buf, len);
 }
@@ -313,7 +313,7 @@ static void omap_write_buf8(struct mtd_info *mtd, const u_char *buf, int len)
  */
 static void omap_read_buf16(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 
 	ioread16_rep(nand->IO_ADDR_R, buf, len / 2);
 }
@@ -944,7 +944,7 @@ static int omap_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
 static void omap_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	struct omap_nand_info *info = mtd_to_omap(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	unsigned int dev_width = (chip->options & NAND_BUSWIDTH_16) ? 1 : 0;
 	u32 val;
 
@@ -990,7 +990,7 @@ static void omap_enable_hwecc(struct mtd_info *mtd, int mode)
  */
 static int omap_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	unsigned long timeo = jiffies;
 	int status, state = this->state;
@@ -1042,7 +1042,7 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 	unsigned int dev_width, nsectors;
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	enum omap_ecc ecc_opt = info->ecc_opt;
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	u32 val, wr_mode;
 	unsigned int ecc_size1, ecc_size0;
 
@@ -1757,7 +1757,7 @@ static const struct mtd_ooblayout_ops omap_ooblayout_ops = {
 static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int off = BADBLOCK_MARKER_LENGTH;
 
 	if (section >= chip->ecc.steps)
@@ -1776,7 +1776,7 @@ static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int off = BADBLOCK_MARKER_LENGTH;
 
 	if (section)
@@ -1851,7 +1851,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	}
 
 	nand_chip		= &info->nand;
-	mtd			= nand_to_mtd(nand_chip);
+	mtd			= nandc_to_mtd(nand_chip);
 	mtd->dev.parent		= &pdev->dev;
 	nand_chip->ecc.priv	= NULL;
 	nand_set_flash_node(nand_chip, dev->of_node);
@@ -2181,7 +2181,7 @@ return_error:
 static int omap_nand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	if (nand_chip->ecc.priv) {
 		nand_bch_free(nand_chip->ecc.priv);
diff --git a/drivers/mtd/nand/rawnand/orion_nand.c b/drivers/mtd/nand/rawnand/orion_nand.c
index e68c4231e8b7..e002f66b9693 100644
--- a/drivers/mtd/nand/rawnand/orion_nand.c
+++ b/drivers/mtd/nand/rawnand/orion_nand.c
@@ -25,7 +25,7 @@
 
 static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *nc = mtd_to_nand(mtd);
+	struct nand_chip *nc = mtd_to_nandc(mtd);
 	struct orion_nand_data *board = nand_get_controller_data(nc);
 	u32 offs;
 
@@ -47,7 +47,7 @@ static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl
 
 static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	void __iomem *io_base = chip->IO_ADDR_R;
 	uint64_t *buf64;
 	int i = 0;
@@ -89,7 +89,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 			GFP_KERNEL);
 	if (!nc)
 		return -ENOMEM;
-	mtd = nand_to_mtd(nc);
+	mtd = nandc_to_mtd(nc);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	io_base = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/mtd/nand/rawnand/pasemi_nand.c b/drivers/mtd/nand/rawnand/pasemi_nand.c
index 372b9736ac02..80e5328ddfd5 100644
--- a/drivers/mtd/nand/rawnand/pasemi_nand.c
+++ b/drivers/mtd/nand/rawnand/pasemi_nand.c
@@ -45,7 +45,7 @@ static const char driver_name[] = "pasemi-nand";
 
 static void pasemi_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	while (len > 0x800) {
 		memcpy_fromio(buf, chip->IO_ADDR_R, 0x800);
@@ -57,7 +57,7 @@ static void pasemi_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 
 static void pasemi_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	while (len > 0x800) {
 		memcpy_toio(chip->IO_ADDR_R, buf, 0x800);
@@ -70,7 +70,7 @@ static void pasemi_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 static void pasemi_hwcontrol(struct mtd_info *mtd, int cmd,
 			     unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (cmd == NAND_CMD_NONE)
 		return;
@@ -117,7 +117,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 		goto out;
 	}
 
-	pasemi_nand_mtd = nand_to_mtd(chip);
+	pasemi_nand_mtd = nandc_to_mtd(chip);
 
 	/* Link the private data with the MTD structure */
 	pasemi_nand_mtd->dev.parent = dev;
@@ -189,7 +189,7 @@ static int pasemi_nand_remove(struct platform_device *ofdev)
 	if (!pasemi_nand_mtd)
 		return 0;
 
-	chip = mtd_to_nand(pasemi_nand_mtd);
+	chip = mtd_to_nandc(pasemi_nand_mtd);
 
 	/* Release resources, unregister device */
 	nand_release(pasemi_nand_mtd);
diff --git a/drivers/mtd/nand/rawnand/plat_nand.c b/drivers/mtd/nand/rawnand/plat_nand.c
index d5c3c894c60d..af483bb0ae0d 100644
--- a/drivers/mtd/nand/rawnand/plat_nand.c
+++ b/drivers/mtd/nand/rawnand/plat_nand.c
@@ -57,7 +57,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 		return PTR_ERR(data->io_base);
 
 	nand_set_flash_node(&data->chip, pdev->dev.of_node);
-	mtd = nand_to_mtd(&data->chip);
+	mtd = nandc_to_mtd(&data->chip);
 	mtd->dev.parent = &pdev->dev;
 
 	data->chip.IO_ADDR_R = data->io_base;
@@ -115,7 +115,7 @@ static int plat_nand_remove(struct platform_device *pdev)
 	struct plat_nand_data *data = platform_get_drvdata(pdev);
 	struct platform_nand_data *pdata = dev_get_platdata(&pdev->dev);
 
-	nand_release(nand_to_mtd(&data->chip));
+	nand_release(nandc_to_mtd(&data->chip));
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
 
diff --git a/drivers/mtd/nand/rawnand/pxa3xx_nand.c b/drivers/mtd/nand/rawnand/pxa3xx_nand.c
index 4feec4ea3082..503e69c8d45e 100644
--- a/drivers/mtd/nand/rawnand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/rawnand/pxa3xx_nand.c
@@ -326,7 +326,7 @@ static struct pxa3xx_nand_flash builtin_flash_types[] = {
 static int pxa3xx_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	int nchunks = mtd->writesize / info->chunk_size;
@@ -344,7 +344,7 @@ static int pxa3xx_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int pxa3xx_ooblayout_free(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	int nchunks = mtd->writesize / info->chunk_size;
@@ -509,7 +509,7 @@ static int pxa3xx_nand_init_timings_compat(struct pxa3xx_nand_host *host,
 	struct nand_chip *chip = &host->chip;
 	struct pxa3xx_nand_info *info = host->info_data;
 	const struct pxa3xx_nand_flash *f = NULL;
-	struct mtd_info *mtd = nand_to_mtd(&host->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->chip);
 	int i, id, ntypes;
 
 	ntypes = ARRAY_SIZE(builtin_flash_types);
@@ -931,7 +931,7 @@ static void set_command_address(struct pxa3xx_nand_info *info,
 static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 {
 	struct pxa3xx_nand_host *host = info->host[info->cs];
-	struct mtd_info *mtd = nand_to_mtd(&host->chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->chip);
 
 	/* reset data and oob column point to handle data */
 	info->buf_start		= 0;
@@ -984,7 +984,7 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 	struct mtd_info *mtd;
 
 	host = info->host[info->cs];
-	mtd = nand_to_mtd(&host->chip);
+	mtd = nandc_to_mtd(&host->chip);
 	addr_cycle = 0;
 	exec_cmd = 1;
 
@@ -1168,7 +1168,7 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 static void nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 			 int column, int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	int exec_cmd;
@@ -1217,7 +1217,7 @@ static void nand_cmdfunc_extended(struct mtd_info *mtd,
 				  const unsigned command,
 				  int column, int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	int exec_cmd, ext_cmd_type;
@@ -1373,7 +1373,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 
 static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	char retval = 0xFF;
@@ -1387,7 +1387,7 @@ static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
 
 static u16 pxa3xx_nand_read_word(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	u16 retval = 0xFFFF;
@@ -1401,7 +1401,7 @@ static u16 pxa3xx_nand_read_word(struct mtd_info *mtd)
 
 static void pxa3xx_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	int real_len = min_t(size_t, len, info->buf_count - info->buf_start);
@@ -1413,7 +1413,7 @@ static void pxa3xx_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 static void pxa3xx_nand_write_buf(struct mtd_info *mtd,
 		const uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	int real_len = min_t(size_t, len, info->buf_count - info->buf_start);
@@ -1429,7 +1429,7 @@ static void pxa3xx_nand_select_chip(struct mtd_info *mtd, int chip)
 
 static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 
@@ -1480,7 +1480,7 @@ static void pxa3xx_nand_config_tail(struct pxa3xx_nand_info *info)
 {
 	struct pxa3xx_nand_host *host = info->host[info->cs];
 	struct nand_chip *chip = &host->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 
 	info->reg_ndcr |= (host->col_addr_cycles == 2) ? NDCR_RA_START : 0;
 	info->reg_ndcr |= (chip->page_shift == 6) ? NDCR_PG_PER_BLK : 0;
@@ -1569,7 +1569,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 			struct mtd_info *mtd,
 			int strength, int ecc_stepsize, int page_size)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	if (strength == 1 && ecc_stepsize == 512 && page_size == 2048) {
@@ -1651,7 +1651,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 
 static int pxa3xx_nand_scan(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct pxa3xx_nand_host *host = nand_get_controller_data(chip);
 	struct pxa3xx_nand_info *info = host->info_data;
 	struct platform_device *pdev = info->pdev;
@@ -1788,7 +1788,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		host = (void *)&info[1] + sizeof(*host) * cs;
 		chip = &host->chip;
 		nand_set_controller_data(chip, host);
-		mtd = nand_to_mtd(chip);
+		mtd = nandc_to_mtd(chip);
 		info->host[cs] = host;
 		host->cs = cs;
 		host->info_data = info;
@@ -1906,7 +1906,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	clk_disable_unprepare(info->clk);
 
 	for (cs = 0; cs < pdata->num_cs; cs++)
-		nand_release(nand_to_mtd(&info->host[cs]->chip));
+		nand_release(nandc_to_mtd(&info->host[cs]->chip));
 	return 0;
 }
 
@@ -1968,7 +1968,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	info = platform_get_drvdata(pdev);
 	probe_success = 0;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
-		struct mtd_info *mtd = nand_to_mtd(&info->host[cs]->chip);
+		struct mtd_info *mtd = nandc_to_mtd(&info->host[cs]->chip);
 
 		/*
 		 * The mtd name matches the one used in 'mtdparts' kernel
diff --git a/drivers/mtd/nand/rawnand/qcom_nandc.c b/drivers/mtd/nand/rawnand/qcom_nandc.c
index a77c66f4d8bc..20a79f966f2c 100644
--- a/drivers/mtd/nand/rawnand/qcom_nandc.c
+++ b/drivers/mtd/nand/rawnand/qcom_nandc.c
@@ -873,7 +873,7 @@ static void post_command(struct qcom_nand_host *host, int command)
 static void qcom_nandc_command(struct mtd_info *mtd, unsigned int command,
 			       int column, int page_addr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
@@ -1008,7 +1008,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	unsigned int max_bitflips = 0;
 	struct read_stats *buf;
@@ -1481,7 +1481,7 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 
 static int qcom_nandc_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
@@ -1521,7 +1521,7 @@ err:
 
 static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
@@ -1571,7 +1571,7 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
  */
 static uint8_t qcom_nandc_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	u8 *buf = nandc->data_buffer;
@@ -1593,7 +1593,7 @@ static uint8_t qcom_nandc_read_byte(struct mtd_info *mtd)
 
 static void qcom_nandc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int real_len = min_t(size_t, len, nandc->buf_count - nandc->buf_start);
 
@@ -1604,7 +1604,7 @@ static void qcom_nandc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 static void qcom_nandc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
 				 int len)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int real_len = min_t(size_t, len, nandc->buf_count - nandc->buf_start);
 
@@ -1616,7 +1616,7 @@ static void qcom_nandc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
 /* we support only one external chip for now */
 static void qcom_nandc_select_chip(struct mtd_info *mtd, int chipnr)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 
 	if (chipnr <= 0)
@@ -1713,7 +1713,7 @@ static void qcom_nandc_select_chip(struct mtd_info *mtd, int chipnr)
 static int qcom_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 				   struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
@@ -1735,7 +1735,7 @@ static int qcom_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int qcom_nand_ooblayout_free(struct mtd_info *mtd, int section,
 				     struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
@@ -1756,7 +1756,7 @@ static const struct mtd_ooblayout_ops qcom_nand_ooblayout_ops = {
 static int qcom_nand_host_setup(struct qcom_nand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int cwperpage, bad_block_byte;
@@ -1988,7 +1988,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			       struct device_node *dn)
 {
 	struct nand_chip *chip = &host->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nandc_to_mtd(chip);
 	struct device *dev = nandc->dev;
 	int ret;
 
@@ -2152,7 +2152,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 
 err_cs_init:
 	list_for_each_entry(host, &nandc->host_list, node)
-		nand_release(nand_to_mtd(&host->chip));
+		nand_release(nandc_to_mtd(&host->chip));
 err_setup:
 	clk_disable_unprepare(nandc->aon_clk);
 err_aon_clk:
@@ -2169,7 +2169,7 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	struct qcom_nand_host *host;
 
 	list_for_each_entry(host, &nandc->host_list, node)
-		nand_release(nand_to_mtd(&host->chip));
+		nand_release(nandc_to_mtd(&host->chip));
 
 	qcom_nandc_unalloc(nandc);
 
diff --git a/drivers/mtd/nand/rawnand/r852.c b/drivers/mtd/nand/rawnand/r852.c
index fc9287af4614..f63f9a5143c7 100644
--- a/drivers/mtd/nand/rawnand/r852.c
+++ b/drivers/mtd/nand/rawnand/r852.c
@@ -64,7 +64,7 @@ static inline void r852_write_reg_dword(struct r852_device *dev,
 /* returns pointer to our private structure */
 static inline struct r852_device *r852_get_dev(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	return nand_get_controller_data(chip);
 }
 
@@ -634,7 +634,7 @@ static void r852_update_media_status(struct r852_device *dev)
  */
 static int r852_register_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct mtd_info *mtd = nandc_to_mtd(dev->chip);
 
 	WARN_ON(dev->card_registred);
 
@@ -669,7 +669,7 @@ error1:
 
 static void r852_unregister_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct mtd_info *mtd = nandc_to_mtd(dev->chip);
 
 	if (!dev->card_registred)
 		return;
@@ -1025,7 +1025,7 @@ static int r852_suspend(struct device *device)
 static int r852_resume(struct device *device)
 {
 	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct mtd_info *mtd = nandc_to_mtd(dev->chip);
 
 	r852_disable_irqs(dev);
 	r852_card_update_present(dev);
diff --git a/drivers/mtd/nand/rawnand/s3c2410.c b/drivers/mtd/nand/rawnand/s3c2410.c
index 6ce9f867a123..b6648ee2280a 100644
--- a/drivers/mtd/nand/rawnand/s3c2410.c
+++ b/drivers/mtd/nand/rawnand/s3c2410.c
@@ -189,7 +189,7 @@ struct s3c2410_nand_info {
 
 static struct s3c2410_nand_mtd *s3c2410_nand_mtd_toours(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct s3c2410_nand_mtd,
+	return container_of(mtd_to_nandc(mtd), struct s3c2410_nand_mtd,
 			    chip);
 }
 
@@ -404,7 +404,7 @@ static void s3c2410_nand_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct s3c2410_nand_info *info;
 	struct s3c2410_nand_mtd *nmtd;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	unsigned long cur;
 
 	nmtd = nand_get_controller_data(this);
@@ -657,7 +657,7 @@ static int s3c2440_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
 
 static void s3c2410_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	readsb(this->IO_ADDR_R, buf, len);
 }
 
@@ -679,7 +679,7 @@ static void s3c2440_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 static void s3c2410_nand_write_buf(struct mtd_info *mtd, const u_char *buf,
 				   int len)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	writesb(this->IO_ADDR_W, buf, len);
 }
 
@@ -768,7 +768,7 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 
 		for (mtdno = 0; mtdno < info->mtd_count; mtdno++, ptr++) {
 			pr_debug("releasing mtd %d (%p)\n", mtdno, ptr);
-			nand_release(nand_to_mtd(&ptr->chip));
+			nand_release(nandc_to_mtd(&ptr->chip));
 		}
 	}
 
@@ -785,7 +785,7 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_set *set)
 {
 	if (set) {
-		struct mtd_info *mtdinfo = nand_to_mtd(&mtd->chip);
+		struct mtd_info *mtdinfo = nandc_to_mtd(&mtd->chip);
 
 		mtdinfo->name = set->name;
 
@@ -943,7 +943,7 @@ static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
 	} else {
 		chip->ecc.size	    = 512;
 		chip->ecc.bytes	    = 3;
-		mtd_set_ooblayout(nand_to_mtd(chip), &s3c2410_ooblayout_ops);
+		mtd_set_ooblayout(nandc_to_mtd(chip), &s3c2410_ooblayout_ops);
 	}
 }
 
@@ -1033,7 +1033,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 	nmtd = info->mtds;
 
 	for (setno = 0; setno < nr_sets; setno++, nmtd++) {
-		struct mtd_info *mtd = nand_to_mtd(&nmtd->chip);
+		struct mtd_info *mtd = nandc_to_mtd(&nmtd->chip);
 
 		pr_debug("initialising set %d (%p, info %p)\n",
 			 setno, nmtd, info);
diff --git a/drivers/mtd/nand/rawnand/sh_flctl.c b/drivers/mtd/nand/rawnand/sh_flctl.c
index 492705fb23f2..c9baab2023c2 100644
--- a/drivers/mtd/nand/rawnand/sh_flctl.c
+++ b/drivers/mtd/nand/rawnand/sh_flctl.c
@@ -45,7 +45,7 @@
 static int flctl_4secc_ooblayout_sp_ecc(struct mtd_info *mtd, int section,
 					struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section)
 		return -ERANGE;
@@ -76,7 +76,7 @@ static const struct mtd_ooblayout_ops flctl_4secc_oob_smallpage_ops = {
 static int flctl_4secc_ooblayout_lp_ecc(struct mtd_info *mtd, int section,
 					struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section >= chip->ecc.steps)
 		return -ERANGE;
@@ -90,7 +90,7 @@ static int flctl_4secc_ooblayout_lp_ecc(struct mtd_info *mtd, int section,
 static int flctl_4secc_ooblayout_lp_free(struct mtd_info *mtd, int section,
 					 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (section >= chip->ecc.steps)
 		return -ERANGE;
@@ -1164,7 +1164,7 @@ static int flctl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, flctl);
 	nand = &flctl->chip;
-	flctl_mtd = nand_to_mtd(nand);
+	flctl_mtd = nandc_to_mtd(nand);
 	nand_set_flash_node(nand, pdev->dev.of_node);
 	flctl_mtd->dev.parent = &pdev->dev;
 	flctl->pdev = pdev;
@@ -1229,7 +1229,7 @@ static int flctl_remove(struct platform_device *pdev)
 	struct sh_flctl *flctl = platform_get_drvdata(pdev);
 
 	flctl_release_dma(flctl);
-	nand_release(nand_to_mtd(&flctl->chip));
+	nand_release(nandc_to_mtd(&flctl->chip));
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
diff --git a/drivers/mtd/nand/rawnand/sharpsl.c b/drivers/mtd/nand/rawnand/sharpsl.c
index 737efe83cd36..00ef260dfe99 100644
--- a/drivers/mtd/nand/rawnand/sharpsl.c
+++ b/drivers/mtd/nand/rawnand/sharpsl.c
@@ -36,7 +36,7 @@ struct sharpsl_nand {
 
 static inline struct sharpsl_nand *mtd_to_sharpsl(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct sharpsl_nand, chip);
+	return container_of(mtd_to_nandc(mtd), struct sharpsl_nand, chip);
 }
 
 /* register offset */
@@ -68,7 +68,7 @@ static void sharpsl_nand_hwcontrol(struct mtd_info *mtd, int cmd,
 				   unsigned int ctrl)
 {
 	struct sharpsl_nand *sharpsl = mtd_to_sharpsl(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
 		unsigned char bits = ctrl & 0x07;
@@ -146,7 +146,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	this = (struct nand_chip *)(&sharpsl->chip);
 
 	/* Link the private data with the MTD structure */
-	mtd = nand_to_mtd(this);
+	mtd = nandc_to_mtd(this);
 	mtd->dev.parent = &pdev->dev;
 	mtd_set_ooblayout(mtd, data->ecc_layout);
 
@@ -210,7 +210,7 @@ static int sharpsl_nand_remove(struct platform_device *pdev)
 	struct sharpsl_nand *sharpsl = platform_get_drvdata(pdev);
 
 	/* Release resources, unregister device */
-	nand_release(nand_to_mtd(&sharpsl->chip));
+	nand_release(nandc_to_mtd(&sharpsl->chip));
 
 	iounmap(sharpsl->io);
 
diff --git a/drivers/mtd/nand/rawnand/sm_common.c b/drivers/mtd/nand/rawnand/sm_common.c
index c378705c6e2b..a0ad3283a8d9 100644
--- a/drivers/mtd/nand/rawnand/sm_common.c
+++ b/drivers/mtd/nand/rawnand/sm_common.c
@@ -163,7 +163,7 @@ static struct nand_flash_dev nand_xd_flash_ids[] = {
 
 int sm_register_device(struct mtd_info *mtd, int smartmedia)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ret;
 
 	chip->options |= NAND_SKIP_BBTSCAN;
diff --git a/drivers/mtd/nand/rawnand/socrates_nand.c b/drivers/mtd/nand/rawnand/socrates_nand.c
index f5a3e7252b82..bd918869c878 100644
--- a/drivers/mtd/nand/rawnand/socrates_nand.c
+++ b/drivers/mtd/nand/rawnand/socrates_nand.c
@@ -44,7 +44,7 @@ static void socrates_nand_write_buf(struct mtd_info *mtd,
 		const uint8_t *buf, int len)
 {
 	int i;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct socrates_nand_host *host = nand_get_controller_data(this);
 
 	for (i = 0; i < len; i++) {
@@ -63,7 +63,7 @@ static void socrates_nand_write_buf(struct mtd_info *mtd,
 static void socrates_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	int i;
-	struct nand_chip *this = mtd_to_nand(mtd);
+	struct nand_chip *this = mtd_to_nandc(mtd);
 	struct socrates_nand_host *host = nand_get_controller_data(this);
 	uint32_t val;
 
@@ -104,7 +104,7 @@ static uint16_t socrates_nand_read_word(struct mtd_info *mtd)
 static void socrates_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
 		unsigned int ctrl)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct socrates_nand_host *host = nand_get_controller_data(nand_chip);
 	uint32_t val;
 
@@ -129,7 +129,7 @@ static void socrates_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
  */
 static int socrates_nand_device_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct nand_chip *nand_chip = mtd_to_nandc(mtd);
 	struct socrates_nand_host *host = nand_get_controller_data(nand_chip);
 
 	if (in_be32(host->io_base) & FPGA_NAND_BUSY)
@@ -159,7 +159,7 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	}
 
 	nand_chip = &host->nand_chip;
-	mtd = nand_to_mtd(nand_chip);
+	mtd = nandc_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
 	/* link the private data structures */
@@ -216,7 +216,7 @@ out:
 static int socrates_nand_remove(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host = dev_get_drvdata(&ofdev->dev);
-	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
+	struct mtd_info *mtd = nandc_to_mtd(&host->nand_chip);
 
 	nand_release(mtd);
 
diff --git a/drivers/mtd/nand/rawnand/sunxi_nand.c b/drivers/mtd/nand/rawnand/sunxi_nand.c
index ccccc7ab9023..f17f2609927c 100644
--- a/drivers/mtd/nand/rawnand/sunxi_nand.c
+++ b/drivers/mtd/nand/rawnand/sunxi_nand.c
@@ -374,7 +374,7 @@ static int sunxi_nfc_dma_op_prepare(struct mtd_info *mtd, const void *buf,
 				    enum dma_data_direction ddir,
 				    struct scatterlist *sg)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct dma_async_tx_descriptor *dmad;
 	enum dma_transfer_direction tdir;
@@ -422,7 +422,7 @@ static void sunxi_nfc_dma_op_cleanup(struct mtd_info *mtd,
 				     enum dma_data_direction ddir,
 				     struct scatterlist *sg)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	dma_unmap_sg(nfc->dev, sg, 1, ddir);
@@ -432,7 +432,7 @@ static void sunxi_nfc_dma_op_cleanup(struct mtd_info *mtd,
 
 static int sunxi_nfc_dev_ready(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_rb *rb;
@@ -463,7 +463,7 @@ static int sunxi_nfc_dev_ready(struct mtd_info *mtd)
 
 static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
@@ -508,7 +508,7 @@ static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
 
 static void sunxi_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	int ret;
@@ -541,7 +541,7 @@ static void sunxi_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 static void sunxi_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
 				int len)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	int ret;
@@ -582,7 +582,7 @@ static uint8_t sunxi_nfc_read_byte(struct mtd_info *mtd)
 static void sunxi_nfc_cmd_ctrl(struct mtd_info *mtd, int dat,
 			       unsigned int ctrl)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	int ret;
@@ -739,7 +739,7 @@ static u16 sunxi_nfc_randomizer_state(struct mtd_info *mtd, int page, bool ecc)
 static void sunxi_nfc_randomizer_config(struct mtd_info *mtd,
 					int page, bool ecc)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
 	u16 state;
@@ -755,7 +755,7 @@ static void sunxi_nfc_randomizer_config(struct mtd_info *mtd,
 
 static void sunxi_nfc_randomizer_enable(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
@@ -767,7 +767,7 @@ static void sunxi_nfc_randomizer_enable(struct mtd_info *mtd)
 
 static void sunxi_nfc_randomizer_disable(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
@@ -806,7 +806,7 @@ static void sunxi_nfc_randomizer_read_buf(struct mtd_info *mtd, uint8_t *buf,
 
 static void sunxi_nfc_hw_ecc_enable(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_hw_ecc *data = nand->ecc.priv;
 	u32 ecc_ctl;
@@ -822,7 +822,7 @@ static void sunxi_nfc_hw_ecc_enable(struct mtd_info *mtd)
 
 static void sunxi_nfc_hw_ecc_disable(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	writel(readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_ECC_EN,
@@ -845,7 +845,7 @@ static inline u32 sunxi_nfc_buf_to_user_data(const u8 *buf)
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct mtd_info *mtd, u8 *oob,
 						int step, bool bbm, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	sunxi_nfc_user_data_to_buf(readl(nfc->regs + NFC_REG_USER_DATA(step)),
@@ -860,7 +860,7 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct mtd_info *mtd,
 						const u8 *oob, int step,
 						bool bbm, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u8 user_data[4];
 
@@ -889,7 +889,7 @@ static void sunxi_nfc_hw_ecc_update_stats(struct mtd_info *mtd,
 static int sunxi_nfc_hw_ecc_correct(struct mtd_info *mtd, u8 *data, u8 *oob,
 				    int step, u32 status, bool *erased)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
@@ -930,7 +930,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct mtd_info *mtd,
 				       unsigned int *max_bitflips,
 				       bool bbm, bool oob_required, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int raw_mode = 0;
@@ -1009,7 +1009,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct mtd_info *mtd,
 					    u8 *oob, int *cur_off,
 					    bool randomize, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = ((ecc->bytes + 4) * ecc->steps);
 	int len = mtd->oobsize - offset;
@@ -1035,7 +1035,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
 					    int oob_required, int page,
 					    int nchunks)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -1161,7 +1161,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct mtd_info *mtd,
 					int *cur_off, bool bbm,
 					int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret;
@@ -1199,7 +1199,7 @@ static void sunxi_nfc_hw_ecc_write_extra_oob(struct mtd_info *mtd,
 					     u8 *oob, int *cur_off,
 					     int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = ((ecc->bytes + 4) * ecc->steps);
 	int len = mtd->oobsize - offset;
@@ -1390,7 +1390,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct mtd_info *mtd,
 					   int oob_required,
 					   int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
@@ -1576,7 +1576,7 @@ static int sunxi_nfc_setup_data_interface(struct mtd_info *mtd,
 					const struct nand_data_interface *conf,
 					bool check_only)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nand_chip *chip = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(chip->nand.controller);
 	const struct nand_sdr_timings *timings;
@@ -1726,7 +1726,7 @@ static int sunxi_nfc_setup_data_interface(struct mtd_info *mtd,
 static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 				    struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 
 	if (section >= ecc->steps)
@@ -1741,7 +1741,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 				     struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 
 	if (section > ecc->steps)
@@ -1779,7 +1779,7 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
 					      struct device_node *np)
 {
 	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_hw_ecc *data;
@@ -1878,7 +1878,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 				       struct nand_ecc_ctrl *ecc,
 				       struct device_node *np)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	int ret;
@@ -1942,7 +1942,7 @@ static void sunxi_nand_ecc_cleanup(struct nand_ecc_ctrl *ecc)
 static int sunxi_nand_ecc_init(struct mtd_info *mtd, struct nand_ecc_ctrl *ecc,
 			       struct device_node *np)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct nand_chip *nand = mtd_to_nandc(mtd);
 	int ret;
 
 	if (!ecc->size) {
@@ -2068,7 +2068,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	nand->read_byte = sunxi_nfc_read_byte;
 	nand->setup_data_interface = sunxi_nfc_setup_data_interface;
 
-	mtd = nand_to_mtd(nand);
+	mtd = nandc_to_mtd(nand);
 	mtd->dev.parent = dev;
 
 	ret = nand_scan_ident(mtd, nsels, NULL);
@@ -2137,7 +2137,7 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 	while (!list_empty(&nfc->chips)) {
 		chip = list_first_entry(&nfc->chips, struct sunxi_nand_chip,
 					node);
-		nand_release(nand_to_mtd(&chip->nand));
+		nand_release(nandc_to_mtd(&chip->nand));
 		sunxi_nand_ecc_cleanup(&chip->nand.ecc);
 		list_del(&chip->node);
 	}
diff --git a/drivers/mtd/nand/rawnand/tmio_nand.c b/drivers/mtd/nand/rawnand/tmio_nand.c
index e599ada12cd0..af8e6a9743fd 100644
--- a/drivers/mtd/nand/rawnand/tmio_nand.c
+++ b/drivers/mtd/nand/rawnand/tmio_nand.c
@@ -120,7 +120,7 @@ struct tmio_nand {
 
 static inline struct tmio_nand *mtd_to_tmio(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct tmio_nand, chip);
+	return container_of(mtd_to_nandc(mtd), struct tmio_nand, chip);
 }
 
 
@@ -130,7 +130,7 @@ static void tmio_nand_hwcontrol(struct mtd_info *mtd, int cmd,
 				   unsigned int ctrl)
 {
 	struct tmio_nand *tmio = mtd_to_tmio(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
 		u8 mode;
@@ -381,7 +381,7 @@ static int tmio_probe(struct platform_device *dev)
 
 	platform_set_drvdata(dev, tmio);
 	nand_chip = &tmio->chip;
-	mtd = nand_to_mtd(nand_chip);
+	mtd = nandc_to_mtd(nand_chip);
 	mtd->name = "tmio-nand";
 	mtd->dev.parent = &dev->dev;
 
@@ -457,7 +457,7 @@ static int tmio_remove(struct platform_device *dev)
 {
 	struct tmio_nand *tmio = platform_get_drvdata(dev);
 
-	nand_release(nand_to_mtd(&tmio->chip));
+	nand_release(nandc_to_mtd(&tmio->chip));
 	tmio_hw_stop(dev, tmio);
 	return 0;
 }
diff --git a/drivers/mtd/nand/rawnand/txx9ndfmc.c b/drivers/mtd/nand/rawnand/txx9ndfmc.c
index b567d212fe7d..8f626bec6b47 100644
--- a/drivers/mtd/nand/rawnand/txx9ndfmc.c
+++ b/drivers/mtd/nand/rawnand/txx9ndfmc.c
@@ -78,7 +78,7 @@ struct txx9ndfmc_drvdata {
 
 static struct platform_device *mtd_to_platdev(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct txx9ndfmc_priv *txx9_priv = nand_get_controller_data(chip);
 	return txx9_priv->dev;
 }
@@ -134,7 +134,7 @@ static void txx9ndfmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 static void txx9ndfmc_cmd_ctrl(struct mtd_info *mtd, int cmd,
 			       unsigned int ctrl)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct txx9ndfmc_priv *txx9_priv = nand_get_controller_data(chip);
 	struct platform_device *dev = txx9_priv->dev;
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
@@ -174,7 +174,7 @@ static int txx9ndfmc_calculate_ecc(struct mtd_info *mtd, const uint8_t *dat,
 				   uint8_t *ecc_code)
 {
 	struct platform_device *dev = mtd_to_platdev(mtd);
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int eccbytes;
 	u32 mcr = txx9ndfmc_read(dev, TXX9_NDFMCR);
 
@@ -194,7 +194,7 @@ static int txx9ndfmc_calculate_ecc(struct mtd_info *mtd, const uint8_t *dat,
 static int txx9ndfmc_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		unsigned char *read_ecc, unsigned char *calc_ecc)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int eccsize;
 	int corrected = 0;
 	int stat;
@@ -256,7 +256,7 @@ static void txx9ndfmc_initialize(struct platform_device *dev)
 
 static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	int ret;
 
 	ret = nand_scan_ident(mtd, 1, NULL);
@@ -320,7 +320,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		if (!txx9_priv)
 			continue;
 		chip = &txx9_priv->chip;
-		mtd = nand_to_mtd(chip);
+		mtd = nandc_to_mtd(chip);
 		mtd->dev.parent = &dev->dev;
 
 		chip->read_byte = txx9ndfmc_read_byte;
@@ -387,7 +387,7 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 
 		if (!mtd)
 			continue;
-		chip = mtd_to_nand(mtd);
+		chip = mtd_to_nandc(mtd);
 		txx9_priv = nand_get_controller_data(chip);
 
 		nand_release(mtd);
diff --git a/drivers/mtd/nand/rawnand/vf610_nfc.c b/drivers/mtd/nand/rawnand/vf610_nfc.c
index c497b157d56a..42e35040f5d9 100644
--- a/drivers/mtd/nand/rawnand/vf610_nfc.c
+++ b/drivers/mtd/nand/rawnand/vf610_nfc.c
@@ -171,7 +171,7 @@ struct vf610_nfc {
 
 static inline struct vf610_nfc *mtd_to_nfc(struct mtd_info *mtd)
 {
-	return container_of(mtd_to_nand(mtd), struct vf610_nfc, chip);
+	return container_of(mtd_to_nandc(mtd), struct vf610_nfc, chip);
 }
 
 static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
@@ -648,7 +648,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
-	mtd = nand_to_mtd(chip);
+	mtd = nandc_to_mtd(chip);
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = nfc->dev;
diff --git a/drivers/mtd/nand/rawnand/xway_nand.c b/drivers/mtd/nand/rawnand/xway_nand.c
index 3e7353e76264..fd9d90e43c9c 100644
--- a/drivers/mtd/nand/rawnand/xway_nand.c
+++ b/drivers/mtd/nand/rawnand/xway_nand.c
@@ -71,7 +71,7 @@ struct xway_nand_data {
 
 static u8 xway_readb(struct mtd_info *mtd, int op)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct xway_nand_data *data = nand_get_controller_data(chip);
 
 	return readb(data->nandaddr + op);
@@ -79,7 +79,7 @@ static u8 xway_readb(struct mtd_info *mtd, int op)
 
 static void xway_writeb(struct mtd_info *mtd, int op, u8 value)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct xway_nand_data *data = nand_get_controller_data(chip);
 
 	writeb(value, data->nandaddr + op);
@@ -87,7 +87,7 @@ static void xway_writeb(struct mtd_info *mtd, int op, u8 value)
 
 static void xway_select_chip(struct mtd_info *mtd, int select)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct xway_nand_data *data = nand_get_controller_data(chip);
 
 	switch (select) {
@@ -170,7 +170,7 @@ static int xway_nand_probe(struct platform_device *pdev)
 		return PTR_ERR(data->nandaddr);
 
 	nand_set_flash_node(&data->chip, pdev->dev.of_node);
-	mtd = nand_to_mtd(&data->chip);
+	mtd = nandc_to_mtd(&data->chip);
 	mtd->dev.parent = &pdev->dev;
 
 	data->chip.cmd_ctrl = xway_cmd_ctrl;
@@ -223,7 +223,7 @@ static int xway_nand_remove(struct platform_device *pdev)
 {
 	struct xway_nand_data *data = platform_get_drvdata(pdev);
 
-	nand_release(nand_to_mtd(&data->chip));
+	nand_release(nandc_to_mtd(&data->chip));
 
 	return 0;
 }
diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index f7f6edf2dda1..a7f104861f82 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -31,7 +31,7 @@
 
 static inline struct spinand_state *mtd_to_state(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct spinand_info *info = nand_get_controller_data(chip);
 	struct spinand_state *state = info->priv;
 
@@ -756,7 +756,7 @@ static void spinand_reset(struct spi_device *spi_nand)
 static void spinand_cmdfunc(struct mtd_info *mtd, unsigned int command,
 			    int column, int page)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandc(mtd);
 	struct spinand_info *info = nand_get_controller_data(chip);
 	struct spinand_state *state = info->priv;
 
@@ -916,7 +916,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 	chip->options	|= NAND_CACHEPRG;
 	chip->select_chip = spinand_select_chip;
 
-	mtd = nand_to_mtd(chip);
+	mtd = nandc_to_mtd(chip);
 
 	dev_set_drvdata(&spi_nand->dev, mtd);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index fecfd05a585a..941218dec463 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -888,12 +888,12 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
 	return mtd_get_of_node(&chip->mtd);
 }
 
-static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
+static inline struct nand_chip *mtd_to_nandc(struct mtd_info *mtd)
 {
 	return container_of(mtd, struct nand_chip, mtd);
 }
 
-static inline struct mtd_info *nand_to_mtd(struct nand_chip *chip)
+static inline struct mtd_info *nandc_to_mtd(struct nand_chip *chip)
 {
 	return &chip->mtd;
 }
diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index c759d403cbc0..db51c0b983dd 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -186,7 +186,7 @@ struct sh_flctl_platform_data {
 
 static inline struct sh_flctl *mtd_to_flctl(struct mtd_info *mtdinfo)
 {
-	return container_of(mtd_to_nand(mtdinfo), struct sh_flctl, chip);
+	return container_of(mtd_to_nandc(mtdinfo), struct sh_flctl, chip);
 }
 
 #endif	/* __SH_FLCTL_H__ */
-- 
2.7.4
