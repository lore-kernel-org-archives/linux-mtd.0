Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D1AC54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ADFA20661
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9BgCN2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ADFA20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QJBE4EE+mtf5LmmHNojx+9XJpsAS2vTAw68y+UPBGA=; b=S9BgCN2cKm0Ab3
	mVTjcDSWoor5a+F4fqoGlLd9t/gE6T+Xy03GPPdawnYki5rImKJt8YWBkY2yG2AWkm1ZNbnbdW9e5
	ANX767ulFdaWNEpYm6lzVlG1XmwdlB/K8C9fO5rx5aACCkWya0bJNA420SvDfl29/jV/xMP0ZluM9
	NfQNnbWdmX898mQmBUAGdTDCNOWiOLWmr+qfzilXhUaq5/aHz8z/9zC/Xl2sZOPU71AnYa7/1kEW6
	OqQVI0A707xOCzYzM0XPJD6hpl3JydRoCqYmszrMRnQa2sW1p+k0P2ynSzuhDWBILPO9UOgxmadFb
	Tyxx8ryDxgM0xiAOBpyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSz5w-00054f-UO; Mon, 27 Apr 2020 08:26:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSz0K-000681-0Y
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:20:43 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 222792A09B1;
 Mon, 27 Apr 2020 09:20:37 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 06/17] mtd: rawnand: cafe: Factor out the controller
 initialization logic
Date: Mon, 27 Apr 2020 10:20:16 +0200
Message-Id: <20200427082028.394719-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427082028.394719-1-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_012040_332615_68A2E416 
X-CRM114-Status: GOOD (  16.27  )
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

The same code is present in the probe and resume path. Let's create
an init helper to factor that out.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 189 +++++++++++--------------------
 1 file changed, 67 insertions(+), 122 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index fbc18bc3d46b..863dd4a8dd42 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -774,12 +774,76 @@ static const struct nand_controller_ops cafe_nand_controller_ops = {
 	.detach_chip = cafe_nand_detach_chip,
 };
 
+static void cafe_nand_init(struct cafe_priv *cafe)
+{
+	u32 ctrl;
+
+	/* Start off by resetting the NAND controller completely */
+	cafe_writel(cafe, CAFE_GLOBAL_RESET_NAND, GLOBAL_RESET);
+	cafe_writel(cafe, 0, GLOBAL_RESET);
+	cafe_writel(cafe, 0xffffffff, NAND_IRQ_MASK);
+
+	/* Restore timing configuration */
+	cafe_writel(cafe, timing[0], NAND_TIMING1);
+	cafe_writel(cafe, timing[1], NAND_TIMING2);
+	cafe_writel(cafe, timing[2], NAND_TIMING3);
+
+	/* Disable master reset, enable NAND clock */
+	ctrl = cafe_readl(cafe, GLOBAL_CTRL);
+	ctrl &= ~(CAFE_GLOBAL_SW_RESET_SET |
+		  CAFE_GLOBAL_SW_RESET_CLEAR |
+		  CAFE_GLOBAL_MASTER_RESET_SET |
+		  CAFE_GLOBAL_MASTER_RESET_CLEAR |
+		  CAFE_GLOBAL_NAND_CLK_ENABLE);
+	ctrl |= CAFE_GLOBAL_NAND_CLK_ENABLE |
+		CAFE_GLOBAL_SDH_CLK_ENABLE |
+		CAFE_GLOBAL_CCIC_CLK_ENABLE;
+	cafe_writel(cafe,
+		    ctrl |
+		    CAFE_GLOBAL_MASTER_RESET_SET |
+		    CAFE_GLOBAL_SW_RESET_SET,
+		    GLOBAL_CTRL);
+	cafe_writel(cafe,
+		    ctrl |
+		    CAFE_GLOBAL_MASTER_RESET_CLEAR |
+		    CAFE_GLOBAL_SW_RESET_CLEAR,
+		    GLOBAL_CTRL);
+
+	cafe_writel(cafe, 0, NAND_DMA_CTRL);
+
+	cafe_writel(cafe,
+		    CAFE_GLOBAL_NAND_CLK_ENABLE |
+		    CAFE_GLOBAL_SDH_CLK_ENABLE |
+		    CAFE_GLOBAL_CCIC_CLK_ENABLE |
+		    CAFE_GLOBAL_MASTER_RESET_SET |
+		    CAFE_GLOBAL_SW_RESET_CLEAR,
+		    GLOBAL_CTRL);
+	cafe_writel(cafe,
+		    CAFE_GLOBAL_NAND_CLK_ENABLE |
+		    CAFE_GLOBAL_SDH_CLK_ENABLE |
+		    CAFE_GLOBAL_CCIC_CLK_ENABLE |
+		    CAFE_GLOBAL_MASTER_RESET_CLEAR |
+		    CAFE_GLOBAL_SW_RESET_CLEAR,
+		    GLOBAL_CTRL);
+
+	/* Set up DMA address */
+	cafe_writel(cafe, lower_32_bits(cafe->dmaaddr), NAND_DMA_ADDR0);
+	cafe_writel(cafe, upper_32_bits(cafe->dmaaddr), NAND_DMA_ADDR1);
+
+	/* Enable NAND IRQ in global IRQ mask register */
+	cafe_writel(cafe,
+		    CAFE_GLOBAL_IRQ_PCI_ERROR |
+		    CAFE_GLOBAL_IRQ_CCIC |
+		    CAFE_GLOBAL_IRQ_SDH |
+		    CAFE_GLOBAL_IRQ_NAND,
+		    GLOBAL_IRQ_MASK);
+}
+
 static int cafe_nand_probe(struct pci_dev *pdev,
 				     const struct pci_device_id *ent)
 {
 	struct mtd_info *mtd;
 	struct cafe_priv *cafe;
-	uint32_t ctrl;
 	int err = 0;
 
 	/* Very old versions shared the same PCI ident for all three
@@ -853,15 +917,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		}
 	}
 
-	/* Start off by resetting the NAND controller completely */
-	cafe_writel(cafe, CAFE_GLOBAL_RESET_NAND, GLOBAL_RESET);
-	cafe_writel(cafe, 0, GLOBAL_RESET);
+	cafe_nand_init(cafe);
 
-	cafe_writel(cafe, timing[0], NAND_TIMING1);
-	cafe_writel(cafe, timing[1], NAND_TIMING2);
-	cafe_writel(cafe, timing[2], NAND_TIMING3);
-
-	cafe_writel(cafe, 0xffffffff, NAND_IRQ_MASK);
 	err = request_irq(pdev->irq, &cafe_nand_interrupt, IRQF_SHARED,
 			  "CAFE NAND", mtd);
 	if (err) {
@@ -869,55 +926,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		goto out_ior;
 	}
 
-	/* Disable master reset, enable NAND clock */
-	ctrl = cafe_readl(cafe, GLOBAL_CTRL);
-	ctrl &= ~(CAFE_GLOBAL_SW_RESET_SET |
-		  CAFE_GLOBAL_SW_RESET_CLEAR |
-		  CAFE_GLOBAL_MASTER_RESET_SET |
-		  CAFE_GLOBAL_MASTER_RESET_CLEAR |
-		  CAFE_GLOBAL_NAND_CLK_ENABLE);
-	ctrl |= CAFE_GLOBAL_NAND_CLK_ENABLE |
-		CAFE_GLOBAL_SDH_CLK_ENABLE |
-		CAFE_GLOBAL_CCIC_CLK_ENABLE;
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
-
-	cafe_writel(cafe, 0, NAND_DMA_CTRL);
-
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
-
-	/* Enable NAND IRQ in global IRQ mask register */
-	cafe_writel(cafe,
-		    CAFE_GLOBAL_IRQ_PCI_ERROR |
-		    CAFE_GLOBAL_IRQ_CCIC |
-		    CAFE_GLOBAL_IRQ_SDH |
-		    CAFE_GLOBAL_IRQ_NAND,
-		    GLOBAL_IRQ_MASK);
-	cafe_dev_dbg(&cafe->pdev->dev, "Control %x, IRQ mask %x\n",
-		cafe_readl(cafe, GLOBAL_CTRL),
-		cafe_readl(cafe, GLOBAL_IRQ_MASK));
-
 	/* Do not use the DMA during the NAND identification */
 	cafe->usedma = 0;
 
@@ -980,74 +988,11 @@ MODULE_DEVICE_TABLE(pci, cafe_nand_tbl);
 
 static int cafe_nand_resume(struct pci_dev *pdev)
 {
-	uint32_t ctrl;
 	struct mtd_info *mtd = pci_get_drvdata(pdev);
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
-       /* Start off by resetting the NAND controller completely */
-	cafe_writel(cafe, CAFE_GLOBAL_RESET_NAND, GLOBAL_RESET);
-	cafe_writel(cafe, 0, GLOBAL_RESET);
-	cafe_writel(cafe, 0xffffffff, NAND_IRQ_MASK);
-
-	/* Restore timing configuration */
-	cafe_writel(cafe, timing[0], NAND_TIMING1);
-	cafe_writel(cafe, timing[1], NAND_TIMING2);
-	cafe_writel(cafe, timing[2], NAND_TIMING3);
-
-        /* Disable master reset, enable NAND clock */
-	ctrl = cafe_readl(cafe, GLOBAL_CTRL);
-	ctrl &= ~(CAFE_GLOBAL_SW_RESET_SET |
-		  CAFE_GLOBAL_SW_RESET_CLEAR |
-		  CAFE_GLOBAL_MASTER_RESET_SET |
-		  CAFE_GLOBAL_MASTER_RESET_CLEAR |
-		  CAFE_GLOBAL_NAND_CLK_ENABLE);
-	ctrl |= CAFE_GLOBAL_NAND_CLK_ENABLE |
-		CAFE_GLOBAL_SDH_CLK_ENABLE |
-		CAFE_GLOBAL_CCIC_CLK_ENABLE;
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
-
-	cafe_writel(cafe, 0, NAND_DMA_CTRL);
-
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
-
-	/* Set up DMA address */
-	cafe_writel(cafe, cafe->dmaaddr & 0xffffffff, NAND_DMA_ADDR0);
-	if (sizeof(cafe->dmaaddr) > 4)
-	/* Shift in two parts to shut the compiler up */
-		cafe_writel(cafe, (cafe->dmaaddr >> 16) >> 16, NAND_DMA_ADDR1);
-	else
-		cafe_writel(cafe, 0, NAND_DMA_ADDR1);
-
-	/* Enable NAND IRQ in global IRQ mask register */
-	cafe_writel(cafe,
-		    CAFE_GLOBAL_IRQ_PCI_ERROR |
-		    CAFE_GLOBAL_IRQ_CCIC |
-		    CAFE_GLOBAL_IRQ_SDH |
-		    CAFE_GLOBAL_IRQ_NAND,
-		    GLOBAL_IRQ_MASK);
+	cafe_nand_init(cafe);
 	return 0;
 }
 
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
