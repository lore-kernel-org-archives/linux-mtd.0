Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374FCC54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:25:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE05820661
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UTnvsItc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE05820661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvppYe4jM+nSp1/PCrxPToRHji3++Jf3Dx8skhVh+V4=; b=UTnvsItcTGiI50
	Kla4scCPgYc0iwaaMibq4Sybt4Xyy0hmVOQyAE9skkNuVl+Vt09I+SU+yCEMlNJ1jE1dTwTJJp4U+
	4pVZ1ERFZGXSohUR2B7n4JAU1Gr9ctgaarRkPOjMScArjYoZCKeoGgJT/VeyoZYLlfM2DS0MVKbQq
	2Zm8mbUZeWy6fUodLY29T6psnvs7kW1Rb8gAh9pX+R+GJKVGUV/HrItHyFwDBJsleaC60FZ0npxfr
	GTb/becETZBL/gvtv7MhyVSC7OkpbD/oOkJ4SaDCM91Sl7v35QqTjINkzxy7xLz5KQ5HpcT/2nvu0
	n5obQCIL2tLx2pCITyRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSz4M-0001SL-4O; Mon, 27 Apr 2020 08:24:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSz0J-00068G-RO
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:20:44 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D40E52A09D3;
 Mon, 27 Apr 2020 09:20:37 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 07/17] mtd: rawnand: cafe: Get rid of the debug module param
Date: Mon, 27 Apr 2020 10:20:17 +0200
Message-Id: <20200427082028.394719-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427082028.394719-1-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_012040_172084_F6EDDF03 
X-CRM114-Status: GOOD (  15.01  )
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

Dynamic prink already offers conditional debug traces enablement, let's
not define a new way to do the same thing.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 59 ++++++++++++++------------------
 1 file changed, 25 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 863dd4a8dd42..55fa0bf2806a 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -10,10 +10,7 @@
  */
 
 #include <linux/bitfield.h>
-#define DEBUG
-
 #include <linux/device.h>
-#undef DEBUG
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
@@ -170,9 +167,6 @@ module_param(usedma, int, 0644);
 static int skipbbt = 0;
 module_param(skipbbt, int, 0644);
 
-static int debug = 0;
-module_param(debug, int, 0644);
-
 static int regdebug = 0;
 module_param(regdebug, int, 0644);
 
@@ -185,9 +179,6 @@ module_param_array(timing, int, &numtimings, 0644);
 
 static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
-/* Hrm. Why isn't this already conditional on something in the struct device? */
-#define cafe_dev_dbg(dev, args...) do { if (debug) dev_dbg(dev, ##args); } while(0)
-
 /* Make it easier to switch to PIO if we need to */
 #define cafe_readl(cafe, addr)			readl((cafe)->mmio + CAFE_##addr)
 #define cafe_writel(cafe, datum, addr)		writel(datum, (cafe)->mmio + CAFE_##addr)
@@ -201,7 +192,7 @@ static int cafe_device_ready(struct nand_chip *chip)
 
 	cafe_writel(cafe, irqs, NAND_IRQ);
 
-	cafe_dev_dbg(&cafe->pdev->dev, "NAND device is%s ready, IRQ %x (%x) (%x,%x)\n",
+	dev_dbg(&cafe->pdev->dev, "NAND device is%s ready, IRQ %x (%x) (%x,%x)\n",
 		result?"":" not", irqs, cafe_readl(cafe, NAND_IRQ),
 		cafe_readl(cafe, GLOBAL_IRQ), cafe_readl(cafe, GLOBAL_IRQ_MASK));
 
@@ -220,7 +211,7 @@ static void cafe_write_buf(struct nand_chip *chip, const uint8_t *buf, int len)
 
 	cafe->datalen += len;
 
-	cafe_dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes to write buffer. datalen 0x%x\n",
+	dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes to write buffer. datalen 0x%x\n",
 		len, cafe->datalen);
 }
 
@@ -233,8 +224,8 @@ static void cafe_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
 	else
 		memcpy_fromio(buf, cafe->mmio + CAFE_NAND_READ_DATA + cafe->datalen, len);
 
-	cafe_dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes from position 0x%x in read buffer.\n",
-		  len, cafe->datalen);
+	dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes from position 0x%x in read buffer.\n",
+		len, cafe->datalen);
 	cafe->datalen += len;
 }
 
@@ -244,7 +235,7 @@ static uint8_t cafe_read_byte(struct nand_chip *chip)
 	uint8_t d;
 
 	cafe_read_buf(chip, &d, 1);
-	cafe_dev_dbg(&cafe->pdev->dev, "Read %02x\n", d);
+	dev_dbg(&cafe->pdev->dev, "Read %02x\n", d);
 
 	return d;
 }
@@ -258,7 +249,7 @@ static void cafe_nand_cmdfunc(struct nand_chip *chip, unsigned command,
 	uint32_t ctl1;
 	uint32_t doneint = CAFE_NAND_IRQ_CMD_DONE;
 
-	cafe_dev_dbg(&cafe->pdev->dev, "cmdfunc %02x, 0x%x, 0x%x\n",
+	dev_dbg(&cafe->pdev->dev, "cmdfunc %02x, 0x%x, 0x%x\n",
 		command, column, page_addr);
 
 	if (command == NAND_CMD_ERASE2 || command == NAND_CMD_PAGEPROG) {
@@ -270,8 +261,8 @@ static void cafe_nand_cmdfunc(struct nand_chip *chip, unsigned command,
 			    NAND_CTRL2);
 		ctl1 = cafe->ctl1;
 		cafe->ctl2 &= ~CAFE_NAND_CTRL2_AUTO_WRITE_ECC;
-		cafe_dev_dbg(&cafe->pdev->dev, "Continue command, ctl1 %08x, #data %d\n",
-			  cafe->ctl1, cafe->nr_data);
+		dev_dbg(&cafe->pdev->dev, "Continue command, ctl1 %08x, #data %d\n",
+			cafe->ctl1, cafe->nr_data);
 		goto do_command;
 	}
 	/* Reset ECC engine */
@@ -333,8 +324,8 @@ static void cafe_nand_cmdfunc(struct nand_chip *chip, unsigned command,
 		/* Ignore the first command of a pair; the hardware
 		   deals with them both at once, later */
 		cafe->ctl1 = ctl1;
-		cafe_dev_dbg(&cafe->pdev->dev, "Setup for delayed command, ctl1 %08x, dlen %x\n",
-			  cafe->ctl1, cafe->datalen);
+		dev_dbg(&cafe->pdev->dev, "Setup for delayed command, ctl1 %08x, dlen %x\n",
+			cafe->ctl1, cafe->datalen);
 		return;
 	}
 	/* RNDOUT and READ0 commands need a following byte */
@@ -350,7 +341,7 @@ static void cafe_nand_cmdfunc(struct nand_chip *chip, unsigned command,
 			    NAND_CTRL2);
 
  do_command:
-	cafe_dev_dbg(&cafe->pdev->dev, "dlen %x, ctl1 %x, ctl2 %x\n",
+	dev_dbg(&cafe->pdev->dev, "dlen %x, ctl1 %x, ctl2 %x\n",
 		cafe->datalen, ctl1, cafe_readl(cafe, NAND_CTRL2));
 
 	/* NB: The datasheet lies -- we really should be subtracting 1 here */
@@ -399,12 +390,12 @@ static void cafe_nand_cmdfunc(struct nand_chip *chip, unsigned command,
 				break;
 			udelay(1);
 			if (!(c % 100000))
-				cafe_dev_dbg(&cafe->pdev->dev, "Wait for ready, IRQ %x\n", irqs);
+				dev_dbg(&cafe->pdev->dev, "Wait for ready, IRQ %x\n", irqs);
 			cpu_relax();
 		}
 		cafe_writel(cafe, doneint, NAND_IRQ);
-		cafe_dev_dbg(&cafe->pdev->dev, "Command %x completed after %d usec, irqs %x (%x)\n",
-			     command, 500000-c, irqs, cafe_readl(cafe, NAND_IRQ));
+		dev_dbg(&cafe->pdev->dev, "Command %x completed after %d usec, irqs %x (%x)\n",
+			command, 500000-c, irqs, cafe_readl(cafe, NAND_IRQ));
 	}
 
 	WARN_ON(cafe->ctl2 & CAFE_NAND_CTRL2_AUTO_WRITE_ECC);
@@ -433,7 +424,7 @@ static void cafe_select_chip(struct nand_chip *chip, int chipnr)
 	if (chipnr < 0 || chipnr > 1)
 		return;
 
-	cafe_dev_dbg(&cafe->pdev->dev, "select_chip %d\n", chipnr);
+	dev_dbg(&cafe->pdev->dev, "select_chip %d\n", chipnr);
 
 	/* Mask the appropriate bit into the stored value of ctl1
 	   which will be used by cafe_nand_cmdfunc() */
@@ -452,7 +443,7 @@ static irqreturn_t cafe_nand_interrupt(int irq, void *id)
 	if (!irqs)
 		return IRQ_NONE;
 
-	cafe_dev_dbg(&cafe->pdev->dev, "irq, bits %x (%x)\n", irqs, cafe_readl(cafe, NAND_IRQ));
+	dev_dbg(&cafe->pdev->dev, "irq, bits %x (%x)\n", irqs, cafe_readl(cafe, NAND_IRQ));
 	return IRQ_HANDLED;
 }
 
@@ -484,9 +475,9 @@ static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
 	unsigned int max_bitflips = 0;
 	u32 ecc_result, status;
 
-	cafe_dev_dbg(&cafe->pdev->dev, "ECC result %08x SYN1,2 %08x\n",
-		     cafe_readl(cafe, NAND_ECC_RESULT),
-		     cafe_readl(cafe, NAND_ECC_SYN_REG(0)));
+	dev_dbg(&cafe->pdev->dev, "ECC result %08x SYN1,2 %08x\n",
+		cafe_readl(cafe, NAND_ECC_RESULT),
+		cafe_readl(cafe, NAND_ECC_SYN_REG(0)));
 
 	nand_read_page_op(chip, page, 0, buf, mtd->writesize);
 	chip->legacy.read_buf(chip, chip->oob_poi, mtd->oobsize);
@@ -718,8 +709,8 @@ static int cafe_nand_attach_chip(struct nand_chip *chip)
 	cafe_writel(cafe, lower_32_bits(cafe->dmaaddr), NAND_DMA_ADDR0);
 	cafe_writel(cafe, upper_32_bits(cafe->dmaaddr), NAND_DMA_ADDR1);
 
-	cafe_dev_dbg(&cafe->pdev->dev, "Set DMA address to %x (virt %p)\n",
-		     cafe_readl(cafe, NAND_DMA_ADDR0), cafe->dmabuf);
+	dev_dbg(&cafe->pdev->dev, "Set DMA address to %x (virt %p)\n",
+		cafe_readl(cafe, NAND_DMA_ADDR0), cafe->dmabuf);
 
 	/* Restore the DMA flag */
 	cafe->usedma = usedma;
@@ -901,16 +892,16 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	}
 
 	if (numtimings == 3) {
-		cafe_dev_dbg(&cafe->pdev->dev, "Using provided timings (%08x %08x %08x)\n",
-			     timing[0], timing[1], timing[2]);
+		dev_dbg(&cafe->pdev->dev, "Using provided timings (%08x %08x %08x)\n",
+			timing[0], timing[1], timing[2]);
 	} else {
 		timing[0] = cafe_readl(cafe, NAND_TIMING1);
 		timing[1] = cafe_readl(cafe, NAND_TIMING2);
 		timing[2] = cafe_readl(cafe, NAND_TIMING3);
 
 		if (timing[0] | timing[1] | timing[2]) {
-			cafe_dev_dbg(&cafe->pdev->dev, "Timing registers already set (%08x %08x %08x)\n",
-				     timing[0], timing[1], timing[2]);
+			dev_dbg(&cafe->pdev->dev, "Timing registers already set (%08x %08x %08x)\n",
+				timing[0], timing[1], timing[2]);
 		} else {
 			dev_warn(&cafe->pdev->dev, "Timing registers unset; using most conservative defaults\n");
 			timing[0] = timing[1] = timing[2] = 0xffffffff;
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
