Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63785C47254
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:17:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4F520675
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:17:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YF9FbR2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4F520675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3/BoqifDGOF4MjMM2Z6KmTbePK0RnRi0p91HC4o2AI=; b=YF9FbR2LGLqCjC
	nEXAm+w+vm1d/sVwWNxIJQx0412nUAvYJEqHNXexSD9XJI8tYItG5p8AZ6Yv/PGzcNWn9e2eJIcaD
	+3cILIzPITWYTecpA1CzC0sqZAxnTq45QnXPUfZi7SjV4kfnM+W4T5UWFqNCALxrEqQPcvg68aOXW
	h2GaaGZOFr+HORWacSzSshh/ZpMM1vVeNPr/6XELQyKfxGkDfpYW8m2nAXn2srk12u3VF+FZAzlK4
	PzEQ6Ue0OLL0UPSnfwpJoG8dAsFlbqi0VMG5Q/BpYPnIMYPhUp1hHQ/3JEBbL+AFO2ZDQoMmdh7lL
	C+Z5ZpqGStinDZGLgM1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVudg-0004Dq-2w; Tue, 05 May 2020 10:17:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVuaS-0007Ak-Vu
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 10:14:10 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35E012A1BE4;
 Tue,  5 May 2020 11:14:02 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 15/19] mtd: rawnand: cafe: Get rid of the legacy interface
 implementation
Date: Tue,  5 May 2020 12:13:49 +0200
Message-Id: <20200505101353.1776394-16-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200505101353.1776394-1-boris.brezillon@collabora.com>
References: <20200505101353.1776394-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_031405_383685_5497307A 
X-CRM114-Status: GOOD (  22.02  )
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

Now that exec_op() is implemented, we can safely get rid of all
legacy hooks implementations.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes in v2:
* Add R-b/T-b
---
 drivers/mtd/nand/raw/cafe_nand.c | 250 +------------------------------
 1 file changed, 6 insertions(+), 244 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 2f35faf13805..bcdd58e93666 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -151,12 +151,7 @@ struct cafe_priv {
 	struct pci_dev *pdev;
 	void __iomem *mmio;
 	struct rs_control *rs;
-	uint32_t ctl1;
 	uint32_t ctl2;
-	int datalen;
-	int nr_data;
-	int data_pos;
-	int page_addr;
 	bool usedma;
 	dma_addr_t dmaaddr;
 	unsigned char *dmabuf;
@@ -184,36 +179,16 @@ static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 #define cafe_readl(cafe, addr)			readl((cafe)->mmio + CAFE_##addr)
 #define cafe_writel(cafe, datum, addr)		writel(datum, (cafe)->mmio + CAFE_##addr)
 
-static int cafe_device_ready(struct nand_chip *chip)
-{
-	struct cafe_priv *cafe = nand_get_controller_data(chip);
-	int result = !!(cafe_readl(cafe, NAND_STATUS) &
-			CAFE_NAND_STATUS_FLASH_BUSY);
-	uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
-
-	cafe_writel(cafe, irqs, NAND_IRQ);
-
-	dev_dbg(&cafe->pdev->dev, "NAND device is%s ready, IRQ %x (%x) (%x,%x)\n",
-		result?"":" not", irqs, cafe_readl(cafe, NAND_IRQ),
-		cafe_readl(cafe, GLOBAL_IRQ), cafe_readl(cafe, GLOBAL_IRQ_MASK));
-
-	return result;
-}
-
-
 static void cafe_write_buf(struct nand_chip *chip, const uint8_t *buf, int len)
 {
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
 	if (cafe->usedma)
-		memcpy(cafe->dmabuf + cafe->datalen, buf, len);
+		memcpy(cafe->dmabuf, buf, len);
 	else
-		memcpy_toio(cafe->mmio + CAFE_NAND_WRITE_DATA + cafe->datalen, buf, len);
+		memcpy_toio(cafe->mmio + CAFE_NAND_WRITE_DATA, buf, len);
 
-	cafe->datalen += len;
-
-	dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes to write buffer. datalen 0x%x\n",
-		len, cafe->datalen);
+	dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes to write buffer.\n",	len);
 }
 
 static void cafe_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
@@ -221,212 +196,11 @@ static void cafe_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
 	if (cafe->usedma)
-		memcpy(buf, cafe->dmabuf + cafe->datalen, len);
+		memcpy(buf, cafe->dmabuf, len);
 	else
-		memcpy_fromio(buf, cafe->mmio + CAFE_NAND_READ_DATA + cafe->datalen, len);
+		memcpy_fromio(buf, cafe->mmio + CAFE_NAND_READ_DATA, len);
 
-	dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes from position 0x%x in read buffer.\n",
-		len, cafe->datalen);
-	cafe->datalen += len;
-}
-
-static uint8_t cafe_read_byte(struct nand_chip *chip)
-{
-	struct cafe_priv *cafe = nand_get_controller_data(chip);
-	uint8_t d;
-
-	cafe_read_buf(chip, &d, 1);
-	dev_dbg(&cafe->pdev->dev, "Read %02x\n", d);
-
-	return d;
-}
-
-static void cafe_nand_cmdfunc(struct nand_chip *chip, unsigned command,
-			      int column, int page_addr)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct cafe_priv *cafe = nand_get_controller_data(chip);
-	int adrbytes = 0;
-	uint32_t ctl1;
-	uint32_t doneint = CAFE_NAND_IRQ_CMD_DONE;
-
-	dev_dbg(&cafe->pdev->dev, "cmdfunc %02x, 0x%x, 0x%x\n",
-		command, column, page_addr);
-
-	if (command == NAND_CMD_ERASE2 || command == NAND_CMD_PAGEPROG) {
-		/* Second half of a command we already calculated */
-		cafe_writel(cafe,
-			    cafe->ctl2 |
-			    CAFE_NAND_CTRL2_HAS_CMD2 |
-			    CAFE_FIELD_PREP(NAND_CTRL2, CMD2, command),
-			    NAND_CTRL2);
-		ctl1 = cafe->ctl1;
-		dev_dbg(&cafe->pdev->dev, "Continue command, ctl1 %08x, #data %d\n",
-			cafe->ctl1, cafe->nr_data);
-		goto do_command;
-	}
-	/* Reset ECC engine */
-	cafe_writel(cafe, 0, NAND_CTRL2);
-
-	/* Emulate NAND_CMD_READOOB on large-page chips */
-	if (mtd->writesize > 512 &&
-	    command == NAND_CMD_READOOB) {
-		column += mtd->writesize;
-		command = NAND_CMD_READ0;
-	}
-
-	/* FIXME: Do we need to send read command before sending data
-	   for small-page chips, to position the buffer correctly? */
-
-	if (column != -1) {
-		cafe_writel(cafe, column, NAND_ADDR1);
-		adrbytes = 2;
-		if (page_addr != -1)
-			goto write_adr2;
-	} else if (page_addr != -1) {
-		cafe_writel(cafe, page_addr & 0xffff, NAND_ADDR1);
-		page_addr >>= 16;
-	write_adr2:
-		cafe_writel(cafe, page_addr, NAND_ADDR2);
-		adrbytes += 2;
-		if (mtd->size > mtd->writesize << 16)
-			adrbytes++;
-	}
-
-	cafe->data_pos = cafe->datalen = 0;
-
-	/* Set command valid bit, mask in the chip select bit  */
-	ctl1 = CAFE_NAND_CTRL1_HAS_CMD |
-	       CAFE_FIELD_PREP(NAND_CTRL1, CMD, command) |
-	       (cafe->ctl1 & CAFE_NAND_CTRL1_CE);
-
-	/* Set RD or WR bits as appropriate */
-	if (command == NAND_CMD_READID || command == NAND_CMD_STATUS) {
-		ctl1 |= CAFE_NAND_CTRL1_HAS_DATA_IN;
-		/* Always 5 bytes, for now */
-		cafe->datalen = 4;
-		/* And one address cycle -- even for STATUS, since the controller doesn't work without */
-		adrbytes = 1;
-	} else if (command == NAND_CMD_READ0 || command == NAND_CMD_READ1 ||
-		   command == NAND_CMD_READOOB || command == NAND_CMD_RNDOUT) {
-		ctl1 |= CAFE_NAND_CTRL1_HAS_DATA_IN;
-		/* For now, assume just read to end of page */
-		cafe->datalen = mtd->writesize + mtd->oobsize - column;
-	} else if (command == NAND_CMD_SEQIN)
-		ctl1 |= CAFE_NAND_CTRL1_HAS_DATA_OUT;
-
-	/* Set number of address bytes */
-	if (adrbytes)
-		ctl1 |= CAFE_NAND_CTRL1_HAS_ADDR |
-			CAFE_FIELD_PREP(NAND_CTRL1, NUM_ADDR_CYC, adrbytes - 1);
-
-	if (command == NAND_CMD_SEQIN || command == NAND_CMD_ERASE1) {
-		/* Ignore the first command of a pair; the hardware
-		   deals with them both at once, later */
-		cafe->ctl1 = ctl1;
-		dev_dbg(&cafe->pdev->dev, "Setup for delayed command, ctl1 %08x, dlen %x\n",
-			cafe->ctl1, cafe->datalen);
-		return;
-	}
-	/* RNDOUT and READ0 commands need a following byte */
-	if (command == NAND_CMD_RNDOUT)
-		cafe_writel(cafe,
-			    cafe->ctl2 | CAFE_NAND_CTRL2_HAS_CMD2 |
-			    CAFE_FIELD_PREP(NAND_CTRL2, CMD2, NAND_CMD_RNDOUTSTART),
-			    NAND_CTRL2);
-	else if (command == NAND_CMD_READ0 && mtd->writesize > 512)
-		cafe_writel(cafe,
-			    cafe->ctl2 | CAFE_NAND_CTRL2_HAS_CMD2 |
-			    CAFE_FIELD_PREP(NAND_CTRL2, CMD2, NAND_CMD_READSTART),
-			    NAND_CTRL2);
-
- do_command:
-	dev_dbg(&cafe->pdev->dev, "dlen %x, ctl1 %x, ctl2 %x\n",
-		cafe->datalen, ctl1, cafe_readl(cafe, NAND_CTRL2));
-
-	/* NB: The datasheet lies -- we really should be subtracting 1 here */
-	cafe_writel(cafe, cafe->datalen, NAND_DATA_LEN);
-	cafe_writel(cafe, CAFE_NAND_IRQ_CMD_DONE | CAFE_NAND_IRQ_DMA_DONE,
-		    NAND_IRQ);
-	if (cafe->usedma &&
-	    (ctl1 & (CAFE_NAND_CTRL1_HAS_DATA_IN |
-		     CAFE_NAND_CTRL1_HAS_DATA_OUT))) {
-		uint32_t dmactl = CAFE_NAND_DMA_CTRL_ENABLE |
-				  CAFE_NAND_DMA_CTRL_RESERVED;
-
-		dmactl |= CAFE_FIELD_PREP(NAND_DMA_CTRL, DATA_LEN,
-					  cafe->datalen);
-		/* If WR or RD bits set, set up DMA */
-		if (ctl1 & CAFE_NAND_CTRL1_HAS_DATA_IN) {
-			/* It's a read */
-			dmactl |= CAFE_NAND_DMA_CTRL_DATA_IN;
-			/* ... so it's done when the DMA is done, not just
-			   the command. */
-			doneint = CAFE_NAND_IRQ_DMA_DONE;
-		}
-		cafe_writel(cafe, dmactl, NAND_DMA_CTRL);
-	}
-	cafe->datalen = 0;
-
-	if (unlikely(regdebug)) {
-		int i;
-		printk("About to write command %08x to register 0\n", ctl1);
-		for (i=4; i< 0x5c; i+=4)
-			printk("Register %x: %08x\n", i, readl(cafe->mmio + i));
-	}
-
-	cafe_writel(cafe, ctl1, NAND_CTRL1);
-	/* Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine. */
-	ndelay(100);
-
-	if (1) {
-		int c;
-		uint32_t irqs;
-
-		for (c = 500000; c != 0; c--) {
-			irqs = cafe_readl(cafe, NAND_IRQ);
-			if (irqs & doneint)
-				break;
-			udelay(1);
-			if (!(c % 100000))
-				dev_dbg(&cafe->pdev->dev, "Wait for ready, IRQ %x\n", irqs);
-			cpu_relax();
-		}
-		cafe_writel(cafe, doneint, NAND_IRQ);
-		dev_dbg(&cafe->pdev->dev, "Command %x completed after %d usec, irqs %x (%x)\n",
-			command, 500000-c, irqs, cafe_readl(cafe, NAND_IRQ));
-	}
-
-	WARN_ON(cafe->ctl2 & CAFE_NAND_CTRL2_AUTO_WRITE_ECC);
-
-	switch (command) {
-
-	case NAND_CMD_CACHEDPROG:
-	case NAND_CMD_PAGEPROG:
-	case NAND_CMD_ERASE1:
-	case NAND_CMD_ERASE2:
-	case NAND_CMD_SEQIN:
-	case NAND_CMD_RNDIN:
-	case NAND_CMD_STATUS:
-	case NAND_CMD_RNDOUT:
-		cafe_writel(cafe, cafe->ctl2, NAND_CTRL2);
-		return;
-	}
-	nand_wait_ready(chip);
-	cafe_writel(cafe, cafe->ctl2, NAND_CTRL2);
-}
-
-static void cafe_select_chip(struct nand_chip *chip, int chipnr)
-{
-	struct cafe_priv *cafe = nand_get_controller_data(chip);
-
-	dev_dbg(&cafe->pdev->dev, "select_chip %d\n", chipnr);
-
-	/* Mask the appropriate bit into the stored value of ctl1
-	   which will be used by cafe_nand_cmdfunc() */
-	cafe->ctl1 &= ~CAFE_NAND_CTRL1_CE;
-	cafe->ctl1 |= CAFE_FIELD_PREP(NAND_CTRL1, CE, chipnr);
+	dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes from read buffer.\n", len);
 }
 
 static irqreturn_t cafe_nand_interrupt(int irq, void *id)
@@ -783,7 +557,6 @@ static int cafe_nand_exec_subop(struct nand_chip *chip,
 	bool waitrdy = false;
 	unsigned int i, j;
 
-	cafe->datalen = 0;
 	ctrl1 |= CAFE_FIELD_PREP(NAND_CTRL1, CE, subop->cs);
 
 	for (i = 0; i < subop->ninstrs; i++) {
@@ -1020,17 +793,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		goto out_ior;
 	}
 
-	cafe->nand.legacy.cmdfunc = cafe_nand_cmdfunc;
-	cafe->nand.legacy.dev_ready = cafe_device_ready;
-	cafe->nand.legacy.read_byte = cafe_read_byte;
-	cafe->nand.legacy.read_buf = cafe_read_buf;
-	cafe->nand.legacy.write_buf = cafe_write_buf;
-	cafe->nand.legacy.select_chip = cafe_select_chip;
-	cafe->nand.legacy.set_features = nand_get_set_features_notsupp;
-	cafe->nand.legacy.get_features = nand_get_set_features_notsupp;
-
-	cafe->nand.legacy.chip_delay = 0;
-
 	/* Enable the following for a flash based bad block table */
 	cafe->nand.bbt_options = NAND_BBT_USE_FLASH;
 
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
