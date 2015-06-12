Received: from mail-wi0-f175.google.com ([209.85.212.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3NIw-0000Wj-3J
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2015 11:39:24 +0000
Received: by wiga1 with SMTP id a1so14637784wig.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jun 2015 04:38:58 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Linux-sunxi <linux-sunxi@googlegroups.com>
Subject: [RFC 1/2] mtd: nand: sunxi: Add RX DMA support
Date: Fri, 12 Jun 2015 13:38:48 +0200
Message-Id: <1434109129-28183-2-git-send-email-r.spliet@ultimaker.com>
In-Reply-To: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
References: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Roy Spliet <r.spliet@ultimaker.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace PIO readout with DMA when supported. This contains both a direct
DMA method and one using a bounce buffer. PIO is still the preferred fall-back.
Follow-up patches should implement both tx and the nand-component's
"page access" mode, in which hardware automatically validates the ECC checksum.
---
 drivers/mtd/nand/sunxi_nand.c | 192 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 163 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 26df48f..5095a32 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -23,6 +23,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -250,6 +251,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @mod_clk:		NAND Controller mod clock
  * @assigned_cs:	bitmask describing already assigned CS lines
  * @clk_rate:		NAND controller current clock rate
+ * @dmach		DMA channel for RX and TX transfers
+ * @dma_complete	Completion object to wait for DMA transfer complete
  * @chips:		a list containing all the NAND chips attached to
  *			this NAND controller
  * @complete:		a completion object used to wait for NAND
@@ -263,8 +266,14 @@ struct sunxi_nfc {
 	struct clk *mod_clk;
 	unsigned long assigned_cs;
 	unsigned long clk_rate;
+	struct dma_chan *dmach;
+	struct completion dma_complete;
+	void *dma_buf;
+	dma_addr_t dma_buf_phy;
 	struct list_head chips;
 	struct completion complete;
+
+	void (*rx)(struct sunxi_nfc *nfc, u32 cmd, void *from, size_t cnt);
 };
 
 static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_hw_control *ctrl)
@@ -378,6 +387,126 @@ static int sunxi_nfc_dev_ready(struct mtd_info *mtd)
 	return ret;
 }
 
+static void sunxi_nfc_dma_irq_callback(void *param)
+{
+	struct sunxi_nfc *nfc = param;
+
+	complete(&nfc->dma_complete);
+}
+
+static void sunxi_nfc_rx_pio(struct sunxi_nfc *nfc, u32 cmd, void *buf,
+		size_t cnt)
+{
+	int ret;
+
+	writel(cmd, nfc->regs + NFC_REG_CMD);
+
+	ret = sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
+	if (ret)
+		return;
+
+	if (buf)
+		memcpy_fromio(buf, nfc->regs + NFC_RAM0_BASE, cnt);
+
+	return;
+}
+
+static int sunxi_nfc_rx_dma_transfer(struct sunxi_nfc *nfc, u32 cmd,
+		dma_addr_t dma_addr, size_t cnt)
+{
+	u32 ctl;
+	int ret = 0;
+	dma_cookie_t dma_cookie;
+	struct dma_async_tx_descriptor *desc = NULL;
+
+	ctl = readl(nfc->regs + NFC_REG_CTL);
+
+	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+	if (ret)
+		return -EIO;
+
+	writel(ctl | NFC_RAM_METHOD, nfc->regs + NFC_REG_CTL);
+
+	desc = dmaengine_prep_slave_single(nfc->dmach, dma_addr, cnt,
+					DMA_DEV_TO_MEM, DMA_PREP_INTERRUPT);
+
+	desc->callback = sunxi_nfc_dma_irq_callback;
+	desc->callback_param = nfc;
+
+	dma_cookie = dmaengine_submit(desc);
+	if (dma_cookie < 0) {
+		dev_dbg(nfc->dev, "DMA cookie error %d\n", dma_cookie);
+		ret = -EIO;
+		goto exit;
+	}
+
+	dma_async_issue_pending(nfc->dmach);
+
+	cmd |= NFC_WAIT_FLAG;
+	writel(cmd, nfc->regs + NFC_REG_CMD);
+
+	if (sunxi_nfc_wait_int(nfc, NFC_DMA_INT_FLAG, 0)) {
+		dev_dbg(nfc->dev, "DMA transfer timeout - NFC fifo\n");
+		dmaengine_terminate_all(nfc->dmach);
+		ret = -EIO;
+		goto exit;
+	}
+
+	if (!wait_for_completion_timeout(&nfc->dma_complete,
+				 msecs_to_jiffies(NFC_DEFAULT_TIMEOUT_MS))) {
+		dev_dbg(nfc->dev, "DMA transfer timeout\n");
+		dmaengine_terminate_all(nfc->dmach);
+		ret = -EIO;
+	}
+
+exit:
+	writel(ctl, nfc->regs + NFC_REG_CTL);
+	return ret;
+}
+
+static void sunxi_nfc_rx_dma(struct sunxi_nfc *nfc, u32 cmd, void *buf,
+		size_t cnt)
+{
+	dma_addr_t dma_addr;
+
+	/*
+	 * TODO: Sunxi DMA doesn't want to co-operate with transfers of size
+	 * not a multiple of 4B.
+	 */
+	if (!buf || cnt & 0x3) {
+		sunxi_nfc_rx_pio(nfc, cmd, buf, cnt);
+		return;
+	}
+
+	reinit_completion(&nfc->dma_complete);
+
+	if (virt_addr_valid(buf)) {
+		/* Direct DMA */
+		dma_addr = dma_map_single(nfc->dev, buf, cnt, DMA_FROM_DEVICE);
+		if (!dma_mapping_error(nfc->dev, dma_addr)) {
+			if (!sunxi_nfc_rx_dma_transfer(nfc, cmd, dma_addr,
+							cnt)) {
+				dma_unmap_single(nfc->dev, dma_addr, cnt,
+						DMA_FROM_DEVICE);
+				return;
+			}
+		}
+	}
+
+	if (nfc->dma_buf && cnt <= 8192) {
+		/* fall back to intermediate buffer */
+		dma_addr = nfc->dma_buf_phy;
+		if (!sunxi_nfc_rx_dma_transfer(nfc, cmd, dma_addr, cnt)) {
+			memcpy(buf, nfc->dma_buf, cnt);
+			return;
+		}
+	}
+
+	/* Fall back to PIO */
+	sunxi_nfc_rx_pio(nfc, cmd, buf, cnt);
+	return;
+}
+
 static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct nand_chip *nand = mtd->priv;
@@ -431,7 +560,6 @@ static void sunxi_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	int ret;
 	int cnt;
 	int offs = 0;
-	u32 tmp;
 
 	while (len > offs) {
 		cnt = min(len - offs, NFC_SRAM_SIZE);
@@ -441,16 +569,9 @@ static void sunxi_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 			break;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
-		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
-		writel(tmp, nfc->regs + NFC_REG_CMD);
 
-		ret = sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
-		if (ret)
-			break;
-
-		if (buf)
-			memcpy_fromio(buf + offs, nfc->regs + NFC_RAM0_BASE,
-				      cnt);
+		nfc->rx(nfc, NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD,
+			buf ? buf + offs : NULL, cnt);
 		offs += cnt;
 	}
 }
@@ -567,15 +688,8 @@ static int sunxi_nfc_hw_ecc_read_page(struct mtd_info *mtd,
 		if (ret)
 			return ret;
 
-		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | (1 << 30);
-		writel(tmp, nfc->regs + NFC_REG_CMD);
-
-		ret = sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
-		if (ret)
-			return ret;
-
-		memcpy_fromio(buf + (i * ecc->size),
-			      nfc->regs + NFC_RAM0_BASE, ecc->size);
+		nfc->rx(nfc, NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | (1 << 30),
+			buf + (i * ecc->size), ecc->size);
 
 		if (readl(nfc->regs + NFC_REG_ECC_ST) & 0x1) {
 			mtd->ecc_stats.failed++;
@@ -701,7 +815,6 @@ static int sunxi_nfc_hw_syndrome_ecc_read_page(struct mtd_info *mtd,
 	unsigned int max_bitflips = 0;
 	uint8_t *oob = chip->oob_poi;
 	int offset = 0;
-	int ret;
 	int cnt;
 	u32 tmp;
 	int i;
@@ -716,14 +829,8 @@ static int sunxi_nfc_hw_syndrome_ecc_read_page(struct mtd_info *mtd,
 	for (i = 0; i < ecc->steps; i++) {
 		chip->read_buf(mtd, NULL, ecc->size);
 
-		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | (1 << 30);
-		writel(tmp, nfc->regs + NFC_REG_CMD);
-
-		ret = sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
-		if (ret)
-			return ret;
-
-		memcpy_fromio(buf, nfc->regs + NFC_RAM0_BASE, ecc->size);
+		nfc->rx(nfc, NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | (1 << 30),
+			buf, ecc->size);
 		buf += ecc->size;
 		offset += ecc->size;
 
@@ -1398,6 +1505,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *r;
 	struct sunxi_nfc *nfc;
+	struct dma_slave_config slave_config = {};
 	int irq;
 	int ret;
 
@@ -1452,16 +1560,39 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_mod_clk_unprepare;
 
+	nfc->dmach = dma_request_slave_channel(dev, "rx-tx");
+	if (nfc->dmach) {
+		dev_info(dev, "Using DMA channel %d @ %08x", nfc->dmach->chan_id, r->start + NFC_REG_IO_DATA);
+		nfc->rx = sunxi_nfc_rx_dma;
+
+		slave_config.src_addr = r->start + NFC_REG_IO_DATA;
+		slave_config.dst_addr = r->start + NFC_REG_IO_DATA;
+		slave_config.src_addr_width = 4;
+		slave_config.dst_addr_width = 4;
+		slave_config.src_maxburst = 1;
+		slave_config.dst_maxburst = 1;
+		dmaengine_slave_config(nfc->dmach, &slave_config);
+		nfc->dma_buf = dma_alloc_coherent(dev, 8 * 1024,
+						&nfc->dma_buf_phy, GFP_KERNEL);
+		init_completion(&nfc->dma_complete);
+	} else {
+		dev_info(dev, "Using PIO");
+		nfc->rx = sunxi_nfc_rx_pio;
+	}
+
 	platform_set_drvdata(pdev, nfc);
 
 	ret = sunxi_nand_chips_init(dev, nfc);
 	if (ret) {
 		dev_err(dev, "failed to init nand chips\n");
-		goto out_mod_clk_unprepare;
+		goto out_mod_dma_unprepare;
 	}
 
 	return 0;
 
+out_mod_dma_unprepare:
+	dma_release_channel(nfc->dmach);
+	nfc->dmach = NULL;
 out_mod_clk_unprepare:
 	clk_disable_unprepare(nfc->mod_clk);
 out_ahb_clk_unprepare:
@@ -1476,6 +1607,9 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
 
 	sunxi_nand_chips_cleanup(nfc);
 
+	if (nfc->dmach)
+		dma_release_channel(nfc->dmach);
+
 	return 0;
 }
 
-- 
2.4.2


-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com
