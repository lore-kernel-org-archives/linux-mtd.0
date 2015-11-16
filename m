From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com,
 Josh Wu <josh.wu@atmel.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 01/27] mtd: nand: fix drivers abusing mtd->priv
Date: Mon, 16 Nov 2015 14:37:34 +0100
Message-Id: <1447681080-31232-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1447681080-31232-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1447681080-31232-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ->priv field of the mtd_info object attached to a nand_chip device
should point to the nand_chip device. The pxa and cafe drivers are
assigning this field their own private structure, which works fine as long
as the nand_chip field is the first one in the driver private struct but
seems a bit fragile.
Fix that by setting mtd->priv to point the nand_chip field and assigning
chip->priv to the private structure head.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/cafe_nand.c   | 34 ++++++++++++++++++++++------------
 drivers/mtd/nand/pxa3xx_nand.c | 30 +++++++++++++++++++-----------
 2 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 9de78d2..cce3ac4 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -101,7 +101,8 @@ static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
 static int cafe_device_ready(struct mtd_info *mtd)
 {
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 	int result = !!(cafe_readl(cafe, NAND_STATUS) & 0x40000000);
 	uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
 
@@ -117,7 +118,8 @@ static int cafe_device_ready(struct mtd_info *mtd)
 
 static void cafe_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 
 	if (usedma)
 		memcpy(cafe->dmabuf + cafe->datalen, buf, len);
@@ -132,7 +134,8 @@ static void cafe_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 
 static void cafe_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 
 	if (usedma)
 		memcpy(buf, cafe->dmabuf + cafe->datalen, len);
@@ -146,7 +149,8 @@ static void cafe_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 
 static uint8_t cafe_read_byte(struct mtd_info *mtd)
 {
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 	uint8_t d;
 
 	cafe_read_buf(mtd, &d, 1);
@@ -158,7 +162,8 @@ static uint8_t cafe_read_byte(struct mtd_info *mtd)
 static void cafe_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 			      int column, int page_addr)
 {
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 	int adrbytes = 0;
 	uint32_t ctl1;
 	uint32_t doneint = 0x80000000;
@@ -313,7 +318,8 @@ static void cafe_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 
 static void cafe_select_chip(struct mtd_info *mtd, int chipnr)
 {
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 
 	cafe_dev_dbg(&cafe->pdev->dev, "select_chip %d\n", chipnr);
 
@@ -328,7 +334,8 @@ static void cafe_select_chip(struct mtd_info *mtd, int chipnr)
 static irqreturn_t cafe_nand_interrupt(int irq, void *id)
 {
 	struct mtd_info *mtd = id;
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 	uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
 	cafe_writel(cafe, irqs & ~0x90000000, NAND_IRQ);
 	if (!irqs)
@@ -377,7 +384,7 @@ static int cafe_nand_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			       uint8_t *buf, int oob_required, int page)
 {
-	struct cafe_priv *cafe = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 	unsigned int max_bitflips = 0;
 
 	cafe_dev_dbg(&cafe->pdev->dev, "ECC result %08x SYN1,2 %08x\n",
@@ -519,7 +526,7 @@ static int cafe_nand_write_page_lowlevel(struct mtd_info *mtd,
 					  const uint8_t *buf, int oob_required,
 					  int page)
 {
-	struct cafe_priv *cafe = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 
 	chip->write_buf(mtd, buf, mtd->writesize);
 	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
@@ -604,7 +611,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe = (void *)(&mtd[1]);
 
 	mtd->dev.parent = &pdev->dev;
-	mtd->priv = cafe;
+	mtd->priv = &cafe->nand;
+	cafe->nand.priv = cafe;
 
 	cafe->pdev = pdev;
 	cafe->mmio = pci_iomap(pdev, 0, 0);
@@ -792,7 +800,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 static void cafe_nand_remove(struct pci_dev *pdev)
 {
 	struct mtd_info *mtd = pci_get_drvdata(pdev);
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
@@ -819,7 +828,8 @@ static int cafe_nand_resume(struct pci_dev *pdev)
 {
 	uint32_t ctrl;
 	struct mtd_info *mtd = pci_get_drvdata(pdev);
-	struct cafe_priv *cafe = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct cafe_priv *cafe = chip->priv;
 
        /* Start off by resetting the NAND controller completely */
 	cafe_writel(cafe, 1, NAND_RESET);
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 37df51d..ec421ad 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1118,7 +1118,8 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 static void nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 			 int column, int page_addr)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 	int exec_cmd;
 
@@ -1166,7 +1167,8 @@ static void nand_cmdfunc_extended(struct mtd_info *mtd,
 				  const unsigned command,
 				  int column, int page_addr)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 	int exec_cmd, ext_cmd_type;
 
@@ -1286,7 +1288,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 		struct nand_chip *chip, uint8_t *buf, int oob_required,
 		int page)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 
 	chip->read_buf(mtd, buf, mtd->writesize);
@@ -1312,7 +1314,8 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 
 static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 	char retval = 0xFF;
 
@@ -1325,7 +1328,8 @@ static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
 
 static u16 pxa3xx_nand_read_word(struct mtd_info *mtd)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 	u16 retval = 0xFFFF;
 
@@ -1338,7 +1342,8 @@ static u16 pxa3xx_nand_read_word(struct mtd_info *mtd)
 
 static void pxa3xx_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 	int real_len = min_t(size_t, len, info->buf_count - info->buf_start);
 
@@ -1349,7 +1354,8 @@ static void pxa3xx_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 static void pxa3xx_nand_write_buf(struct mtd_info *mtd,
 		const uint8_t *buf, int len)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 	int real_len = min_t(size_t, len, info->buf_count - info->buf_start);
 
@@ -1364,7 +1370,8 @@ static void pxa3xx_nand_select_chip(struct mtd_info *mtd, int chip)
 
 static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 
 	if (info->need_wait) {
@@ -1580,11 +1587,11 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 
 static int pxa3xx_nand_scan(struct mtd_info *mtd)
 {
-	struct pxa3xx_nand_host *host = mtd->priv;
+	struct nand_chip *chip = mtd->priv;
+	struct pxa3xx_nand_host *host = chip->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
 	struct platform_device *pdev = info->pdev;
 	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct nand_chip *chip = mtd->priv;
 	int ret;
 	uint16_t ecc_strength, ecc_step;
 
@@ -1724,11 +1731,12 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		host->mtd = mtd;
 		host->cs = cs;
 		host->info_data = info;
-		mtd->priv = host;
+		mtd->priv = chip;
 		mtd->dev.parent = &pdev->dev;
 		/* FIXME: all chips use the same device tree partitions */
 		nand_set_flash_node(chip, np);
 
+		chip->priv = host;
 		chip->ecc.read_page	= pxa3xx_nand_read_page_hwecc;
 		chip->ecc.write_page	= pxa3xx_nand_write_page_hwecc;
 		chip->controller        = &info->controller;
-- 
2.1.4
