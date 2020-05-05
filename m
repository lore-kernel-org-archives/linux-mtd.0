Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57444C47254
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197C020721
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZuXl5nFn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197C020721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Akj5aEOdZzxWydbsQ9fFiNunw4WtolM3mGvgvaHtEBY=; b=ZuXl5nFnPPPL2U
	awfnYF53+TTkATgqiWwUizpFZT6kkic4AkaHEpzCOcmPH2GICb5qKxviopM1QZzioFU5Z/vTIKJ0S
	VesgJ57IuorGoz3EcBDKzzvBVXiw018+Jib9Mm67/ZRf13w8fGfmHZfkHv4iAAbXycRUSkuPztd1n
	256qzr7ANOs15Bh/S8FJPVzaDWo/jydKAvHmXCgEo04Fl21qsw5XwwOEDZ6Aitcj7FANC3CXnwtMl
	nSgbBIQAYE+En1bET4ydjpSwvKjxFd+4NlD7AN0u5PuTTQgoMZFSiMx9YiLKZkBcqSqfOC1REt0JZ
	s570fW8TYZaDGicSAxQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVufb-00061O-KW; Tue, 05 May 2020 10:19:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVuaV-0007CS-A5
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 10:14:11 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1758D2A1CC3;
 Tue,  5 May 2020 11:14:03 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 18/19] mtd: rawnand: cafe: Drop the cafe_{readl,
 writel}() wrappers
Date: Tue,  5 May 2020 12:13:52 +0200
Message-Id: <20200505101353.1776394-19-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200505101353.1776394-1-boris.brezillon@collabora.com>
References: <20200505101353.1776394-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_031407_675391_D67AE9AE 
X-CRM114-Status: GOOD (  16.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Given how long this driver has been there we can safely assume that
nobody cares about PIO support. Getting rid of these macros allows for
easy register name greping.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes in v2:
* New patch
---
 drivers/mtd/nand/raw/cafe_nand.c | 134 +++++++++++++------------------
 1 file changed, 58 insertions(+), 76 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 022c7a3e4073..2f20032b4df7 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -175,10 +175,6 @@ module_param_array(timing, int, &numtimings, 0644);
 
 static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
-/* Make it easier to switch to PIO if we need to */
-#define cafe_readl(cafe, addr)			readl((cafe)->mmio + CAFE_##addr)
-#define cafe_writel(cafe, datum, addr)		writel(datum, (cafe)->mmio + CAFE_##addr)
-
 static void cafe_write_buf(struct nand_chip *chip, const void *buf,
 			   unsigned int len)
 {
@@ -209,14 +205,14 @@ static irqreturn_t cafe_nand_interrupt(int irq, void *id)
 	struct mtd_info *mtd = id;
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
-	u32 irqs = cafe_readl(cafe, NAND_IRQ);
-	cafe_writel(cafe,
-		    irqs & ~(CAFE_NAND_IRQ_CMD_DONE | CAFE_NAND_IRQ_DMA_DONE),
-		    NAND_IRQ);
+	u32 irqs = readl(cafe->mmio + CAFE_NAND_IRQ);
+	writel(irqs & ~(CAFE_NAND_IRQ_CMD_DONE | CAFE_NAND_IRQ_DMA_DONE),
+	       cafe->mmio + CAFE_NAND_IRQ);
 	if (!irqs)
 		return IRQ_NONE;
 
-	dev_dbg(&cafe->pdev->dev, "irq, bits %x (%x)\n", irqs, cafe_readl(cafe, NAND_IRQ));
+	dev_dbg(&cafe->pdev->dev, "irq, bits %x (%x)\n", irqs,
+		readl(cafe->mmio + CAFE_NAND_IRQ));
 	return IRQ_HANDLED;
 }
 
@@ -250,8 +246,8 @@ static int cafe_nand_read_page(struct nand_chip *chip, u8 *buf,
 	u32 ecc_result, status;
 
 	dev_dbg(&cafe->pdev->dev, "ECC result %08x SYN1,2 %08x\n",
-		cafe_readl(cafe, NAND_ECC_RESULT),
-		cafe_readl(cafe, NAND_ECC_SYN_REG(0)));
+		readl(cafe->mmio + CAFE_NAND_ECC_RESULT),
+		readl(cafe->mmio + CAFE_NAND_ECC_SYN_REG(0)));
 
 	nand_read_page_op(chip, page, 0, pagebuf,
 			  mtd->writesize + mtd->oobsize);
@@ -259,7 +255,7 @@ static int cafe_nand_read_page(struct nand_chip *chip, u8 *buf,
 	if (buf != pagebuf)
 		memcpy(buf, pagebuf, mtd->writesize);
 
-	ecc_result = cafe_readl(cafe, NAND_ECC_RESULT);
+	ecc_result = readl(cafe->mmio + CAFE_NAND_ECC_RESULT);
 	status = CAFE_FIELD_GET(NAND_ECC_RESULT, STATUS, ecc_result);
 	if (checkecc && status == CAFE_NAND_ECC_RESULT_CORRECTABLE_ERRS) {
 		unsigned short syn[8], pat[4];
@@ -268,7 +264,7 @@ static int cafe_nand_read_page(struct nand_chip *chip, u8 *buf,
 		int i, n;
 
 		for (i=0; i<8; i+=2) {
-			u32 tmp = cafe_readl(cafe, NAND_ECC_SYN_REG(i));
+			u32 tmp = readl(cafe->mmio + CAFE_NAND_ECC_SYN_REG(i));
 			u16 idx;
 
 			idx = FIELD_GET(CAFE_NAND_ECC_SYN_FIELD(i), tmp);
@@ -315,10 +311,12 @@ static int cafe_nand_read_page(struct nand_chip *chip, u8 *buf,
 		}
 
 		if (n < 0) {
-			dev_dbg(&cafe->pdev->dev, "Failed to correct ECC at %08x\n",
-				cafe_readl(cafe, NAND_ADDR2) * 2048);
+			dev_dbg(&cafe->pdev->dev,
+				"Failed to correct ECC at %08x\n",
+				readl(cafe->mmio + CAFE_NAND_ADDR2) * 2048);
 			for (i = 0; i < 0x5c; i += 4)
-				printk("Register %x: %08x\n", i, readl(cafe->mmio + i));
+				printk("Register %x: %08x\n", i,
+				       readl(cafe->mmio + i));
 			mtd->ecc_stats.failed++;
 		} else {
 			dev_dbg(&cafe->pdev->dev, "Corrected %d symbol errors\n", n);
@@ -494,11 +492,11 @@ static int cafe_nand_attach_chip(struct nand_chip *chip)
 		return -ENOMEM;
 
 	/* Set up DMA address */
-	cafe_writel(cafe, lower_32_bits(cafe->dmaaddr), NAND_DMA_ADDR0);
-	cafe_writel(cafe, upper_32_bits(cafe->dmaaddr), NAND_DMA_ADDR1);
+	writel(lower_32_bits(cafe->dmaaddr), cafe->mmio + CAFE_NAND_DMA_ADDR0);
+	writel(upper_32_bits(cafe->dmaaddr), cafe->mmio + CAFE_NAND_DMA_ADDR1);
 
 	dev_dbg(&cafe->pdev->dev, "Set DMA address to %x (virt %p)\n",
-		cafe_readl(cafe, NAND_DMA_ADDR0), cafe->dmabuf);
+		readl(cafe->mmio + CAFE_NAND_DMA_ADDR0), cafe->dmabuf);
 
 	/* Restore the DMA flag */
 	cafe->usedma = usedma;
@@ -589,8 +587,8 @@ static int cafe_nand_exec_subop(struct nand_chip *chip,
 			ctrl1 |= CAFE_NAND_CTRL1_HAS_ADDR |
 				 CAFE_FIELD_PREP(NAND_CTRL1, NUM_ADDR_CYC,
 						 instr->ctx.addr.naddrs - 1);
-			cafe_writel(cafe, addr1, NAND_ADDR1);
-			cafe_writel(cafe, addr2, NAND_ADDR2);
+			writel(addr1, cafe->mmio + CAFE_NAND_ADDR1);
+			writel(addr2, cafe->mmio + CAFE_NAND_ADDR2);
 			break;
 
 		case NAND_OP_DATA_IN_INSTR:
@@ -615,8 +613,8 @@ static int cafe_nand_exec_subop(struct nand_chip *chip,
 	}
 
 	if (data_instr >= 0)
-		cafe_writel(cafe, nand_subop_get_data_len(subop, data_instr),
-			    NAND_DATA_LEN);
+		writel(nand_subop_get_data_len(subop, data_instr),
+		       cafe->mmio + CAFE_NAND_DATA_LEN);
 
 	if (cafe->usedma && data_instr >= 0) {
 		u32 dmactrl = CAFE_NAND_DMA_CTRL_ENABLE |
@@ -628,7 +626,7 @@ static int cafe_nand_exec_subop(struct nand_chip *chip,
 		if (ctrl1 & CAFE_NAND_CTRL1_HAS_DATA_IN)
 			dmactrl |= CAFE_NAND_DMA_CTRL_DATA_IN;
 
-		cafe_writel(cafe, dmactrl, NAND_DMA_CTRL);
+		writel(dmactrl, cafe->mmio + CAFE_NAND_DMA_CTRL);
 
 		/*
 		 * If the last instruction is a data transfer and we're using
@@ -642,10 +640,10 @@ static int cafe_nand_exec_subop(struct nand_chip *chip,
 	}
 
 	/* Clear the pending interrupts before starting the operation. */
-	cafe_writel(cafe, wait, NAND_IRQ);
+	writel(wait, cafe->mmio + CAFE_NAND_IRQ);
 
-	cafe_writel(cafe, ctrl2, NAND_CTRL2);
-	cafe_writel(cafe, ctrl1, NAND_CTRL1);
+	writel(ctrl2, cafe->mmio + CAFE_NAND_CTRL2);
+	writel(ctrl1, cafe->mmio + CAFE_NAND_CTRL1);
 
 	ret = readl_poll_timeout(cafe->mmio + CAFE_NAND_IRQ, status,
 				 (status & wait) == wait, 1, USEC_PER_SEC);
@@ -695,17 +693,17 @@ static void cafe_nand_init(struct cafe_priv *cafe)
 	u32 ctrl;
 
 	/* Start off by resetting the NAND controller completely */
-	cafe_writel(cafe, CAFE_GLOBAL_RESET_NAND, GLOBAL_RESET);
-	cafe_writel(cafe, 0, GLOBAL_RESET);
-	cafe_writel(cafe, 0xffffffff, NAND_IRQ_MASK);
+	writel(CAFE_GLOBAL_RESET_NAND, cafe->mmio + CAFE_GLOBAL_RESET);
+	writel(0, cafe->mmio + CAFE_GLOBAL_RESET);
+	writel(0xffffffff, cafe->mmio + CAFE_NAND_IRQ_MASK);
 
 	/* Restore timing configuration */
-	cafe_writel(cafe, timing[0], NAND_TIMING1);
-	cafe_writel(cafe, timing[1], NAND_TIMING2);
-	cafe_writel(cafe, timing[2], NAND_TIMING3);
+	writel(timing[0], cafe->mmio + CAFE_NAND_TIMING1);
+	writel(timing[1], cafe->mmio + CAFE_NAND_TIMING2);
+	writel(timing[2], cafe->mmio + CAFE_NAND_TIMING3);
 
 	/* Disable master reset, enable NAND clock */
-	ctrl = cafe_readl(cafe, GLOBAL_CTRL);
+	ctrl = readl(cafe->mmio + CAFE_GLOBAL_CTRL);
 	ctrl &= ~(CAFE_GLOBAL_SW_RESET_SET |
 		  CAFE_GLOBAL_SW_RESET_CLEAR |
 		  CAFE_GLOBAL_MASTER_RESET_SET |
@@ -714,45 +712,31 @@ static void cafe_nand_init(struct cafe_priv *cafe)
 	ctrl |= CAFE_GLOBAL_NAND_CLK_ENABLE |
 		CAFE_GLOBAL_SDH_CLK_ENABLE |
 		CAFE_GLOBAL_CCIC_CLK_ENABLE;
-	cafe_writel(cafe,
-		    ctrl |
-		    CAFE_GLOBAL_MASTER_RESET_SET |
-		    CAFE_GLOBAL_SW_RESET_SET,
-		    GLOBAL_CTRL);
-	cafe_writel(cafe,
-		    ctrl |
-		    CAFE_GLOBAL_MASTER_RESET_CLEAR |
-		    CAFE_GLOBAL_SW_RESET_CLEAR,
-		    GLOBAL_CTRL);
+	writel(ctrl | CAFE_GLOBAL_MASTER_RESET_SET | CAFE_GLOBAL_SW_RESET_SET,
+	       cafe->mmio + CAFE_GLOBAL_CTRL);
+	writel(ctrl | CAFE_GLOBAL_MASTER_RESET_CLEAR |
+	       CAFE_GLOBAL_SW_RESET_CLEAR,
+	       cafe->mmio + CAFE_GLOBAL_CTRL);
 
-	cafe_writel(cafe, 0, NAND_DMA_CTRL);
+	writel(0, cafe->mmio + CAFE_NAND_DMA_CTRL);
 
-	cafe_writel(cafe,
-		    CAFE_GLOBAL_NAND_CLK_ENABLE |
-		    CAFE_GLOBAL_SDH_CLK_ENABLE |
-		    CAFE_GLOBAL_CCIC_CLK_ENABLE |
-		    CAFE_GLOBAL_MASTER_RESET_SET |
-		    CAFE_GLOBAL_SW_RESET_CLEAR,
-		    GLOBAL_CTRL);
-	cafe_writel(cafe,
-		    CAFE_GLOBAL_NAND_CLK_ENABLE |
-		    CAFE_GLOBAL_SDH_CLK_ENABLE |
-		    CAFE_GLOBAL_CCIC_CLK_ENABLE |
-		    CAFE_GLOBAL_MASTER_RESET_CLEAR |
-		    CAFE_GLOBAL_SW_RESET_CLEAR,
-		    GLOBAL_CTRL);
+	writel(CAFE_GLOBAL_NAND_CLK_ENABLE | CAFE_GLOBAL_SDH_CLK_ENABLE |
+	       CAFE_GLOBAL_CCIC_CLK_ENABLE | CAFE_GLOBAL_MASTER_RESET_SET |
+	       CAFE_GLOBAL_SW_RESET_CLEAR,
+	       cafe->mmio + CAFE_GLOBAL_CTRL);
+	writel(CAFE_GLOBAL_NAND_CLK_ENABLE | CAFE_GLOBAL_SDH_CLK_ENABLE |
+	       CAFE_GLOBAL_CCIC_CLK_ENABLE | CAFE_GLOBAL_MASTER_RESET_CLEAR |
+	       CAFE_GLOBAL_SW_RESET_CLEAR,
+	       cafe->mmio + CAFE_GLOBAL_CTRL);
 
 	/* Set up DMA address */
-	cafe_writel(cafe, lower_32_bits(cafe->dmaaddr), NAND_DMA_ADDR0);
-	cafe_writel(cafe, upper_32_bits(cafe->dmaaddr), NAND_DMA_ADDR1);
+	writel(lower_32_bits(cafe->dmaaddr), cafe->mmio + CAFE_NAND_DMA_ADDR0);
+	writel(upper_32_bits(cafe->dmaaddr), cafe->mmio + CAFE_NAND_DMA_ADDR1);
 
 	/* Enable NAND IRQ in global IRQ mask register */
-	cafe_writel(cafe,
-		    CAFE_GLOBAL_IRQ_PCI_ERROR |
-		    CAFE_GLOBAL_IRQ_CCIC |
-		    CAFE_GLOBAL_IRQ_SDH |
-		    CAFE_GLOBAL_IRQ_NAND,
-		    GLOBAL_IRQ_MASK);
+	writel(CAFE_GLOBAL_IRQ_PCI_ERROR | CAFE_GLOBAL_IRQ_CCIC |
+	       CAFE_GLOBAL_IRQ_SDH | CAFE_GLOBAL_IRQ_NAND,
+	       cafe->mmio + CAFE_GLOBAL_IRQ_MASK);
 }
 
 static int cafe_nand_probe(struct pci_dev *pdev,
@@ -808,9 +792,9 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		dev_dbg(&cafe->pdev->dev, "Using provided timings (%08x %08x %08x)\n",
 			timing[0], timing[1], timing[2]);
 	} else {
-		timing[0] = cafe_readl(cafe, NAND_TIMING1);
-		timing[1] = cafe_readl(cafe, NAND_TIMING2);
-		timing[2] = cafe_readl(cafe, NAND_TIMING3);
+		timing[0] = readl(cafe->mmio + CAFE_NAND_TIMING1);
+		timing[1] = readl(cafe->mmio + CAFE_NAND_TIMING2);
+		timing[2] = readl(cafe->mmio + CAFE_NAND_TIMING3);
 
 		if (timing[0] | timing[1] | timing[2]) {
 			dev_dbg(&cafe->pdev->dev, "Timing registers already set (%08x %08x %08x)\n",
@@ -854,9 +838,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	nand_cleanup(&cafe->nand);
  out_irq:
 	/* Disable NAND IRQ in global IRQ mask register */
-	cafe_writel(cafe,
-		    cafe_readl(cafe, GLOBAL_IRQ_MASK) & ~CAFE_GLOBAL_IRQ_NAND,
-		    GLOBAL_IRQ_MASK);
+	writel(readl(cafe->mmio + CAFE_GLOBAL_IRQ_MASK) & ~CAFE_GLOBAL_IRQ_NAND,
+	       cafe->mmio + CAFE_GLOBAL_IRQ_MASK);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
 	return err;
@@ -869,9 +852,8 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
 	/* Disable NAND IRQ in global IRQ mask register */
-	cafe_writel(cafe,
-		    cafe_readl(cafe, GLOBAL_IRQ_MASK) & ~CAFE_GLOBAL_IRQ_NAND,
-		    GLOBAL_IRQ_MASK);
+	writel(readl(cafe->mmio + CAFE_GLOBAL_IRQ_MASK) & ~CAFE_GLOBAL_IRQ_NAND,
+	       cafe->mmio + CAFE_GLOBAL_IRQ_MASK);
 	nand_release(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
