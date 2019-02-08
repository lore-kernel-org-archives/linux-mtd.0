Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24458C282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:10:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8CB62147C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mwaNbwz8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="olVwhAsp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8CB62147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l+AmaNHfXUk9OQSQcML+gcqm09VdYu4E/Ro0JLHTvvQ=; b=mwaNbwz8rsiM3kBhqoagFIAIsk
	MTQNxAkaA4nPbIM/3WJsI6CG8immTwJmheGoNIVMl1+cSK8Uw5DR/UVpvRazqjZQUrmXFDFvn5PX5
	mEhu2kvsCavv+HYBq9nHM1UO9leOM7yX/dSQTSbCtP7S6B+yXW1kx1MFYkHdnujRmhnoGSusrUPJi
	JMK5wuEAvBddUTLiE2QvT8i+WcJINdzLL4hPu1EN+oOOkTvY46du272ADy06aLTSLiosIQ/zJG9N1
	nxfP1OuH1tlNkFBATXvblXAKDr9gVaw9RdwUPY9YJkRDOJlbA4IQ8s3MRBlq17WWNL+OnBB9rF61E
	pEX6jR2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs1Ev-0000Ba-J6; Fri, 08 Feb 2019 08:10:25 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs1Dt-0006P6-Ts
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 08:09:26 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x188902E007241;
 Fri, 8 Feb 2019 17:09:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x188902E007241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549613346;
 bh=FWcCJjEq8f/6i4xahnidBxZk+rUMKWgh+Bly4jpfp0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=olVwhAspSguC9wwqWq2B51Gt4JLcqpKdPCzHgVByZ+2JUdyZPlxBB/hDLea1kytp6
 FstQkB/ReKmGXLuxencnsxsS6T+Pfg2JBxsuupXK41Ev+IsO/QpzW8b0Q9oBMbR4Sg
 ZM91WfyHzKNzgDLuHp2pHbck9rAIfXwtbMoNa6tTyzDtFChq/hRcsCHNPfb33cuZDb
 glULfOnRdlUbYDSAQJ0agDI92GfLAVRUp081RrhouPZpJ4D0/SOdaEmNdzzh3cfI3r
 rzEb2EWRyD7XNCZPwkG/pI8EzHmUDI2pIn9YrOKNylY10xz41HaPM1+307KZgxa/qD
 9En1x9qqcBnmA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 05/11] mtd: rawnand: denali: rename irq_status to irq_stat
Date: Fri,  8 Feb 2019 17:08:49 +0900
Message-Id: <1549613335-30319-6-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_000922_401516_70E1C2CF 
X-CRM114-Status: GOOD (  17.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I will add the third argument to denali_wait_for_irq() in the
following commit. Then, some lines will exceed 80 columns.

Rename 'irq_status' to 'irq_stat'. Saving two characters will avoid
line-wrapping in some places, and keep the code clean.

I replaced uint32_t with u32 in the touched lines. This will reduce
the reports from 'scripts/checkpatch.pl --strict'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 60 +++++++++++++++++++++----------------------
 drivers/mtd/nand/raw/denali.h |  4 +--
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index bd7df25..9e63cbd 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -121,10 +121,10 @@ static void denali_disable_irq(struct denali_nand_info *denali)
 }
 
 static void denali_clear_irq(struct denali_nand_info *denali,
-			     int bank, uint32_t irq_status)
+			     int bank, u32 irq_stat)
 {
 	/* write one to clear bits */
-	iowrite32(irq_status, denali->reg + INTR_STATUS(bank));
+	iowrite32(irq_stat, denali->reg + INTR_STATUS(bank));
 }
 
 static void denali_clear_irq_all(struct denali_nand_info *denali)
@@ -139,24 +139,24 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 {
 	struct denali_nand_info *denali = dev_id;
 	irqreturn_t ret = IRQ_NONE;
-	uint32_t irq_status;
+	u32 irq_stat;
 	int i;
 
 	spin_lock(&denali->irq_lock);
 
 	for (i = 0; i < DENALI_NR_BANKS; i++) {
-		irq_status = ioread32(denali->reg + INTR_STATUS(i));
-		if (irq_status)
+		irq_stat = ioread32(denali->reg + INTR_STATUS(i));
+		if (irq_stat)
 			ret = IRQ_HANDLED;
 
-		denali_clear_irq(denali, i, irq_status);
+		denali_clear_irq(denali, i, irq_stat);
 
 		if (i != denali->active_bank)
 			continue;
 
-		denali->irq_status |= irq_status;
+		denali->irq_stat |= irq_stat;
 
-		if (denali->irq_status & denali->irq_mask)
+		if (denali->irq_stat & denali->irq_mask)
 			complete(&denali->complete);
 	}
 
@@ -170,7 +170,7 @@ static void denali_reset_irq(struct denali_nand_info *denali)
 	unsigned long flags;
 
 	spin_lock_irqsave(&denali->irq_lock, flags);
-	denali->irq_status = 0;
+	denali->irq_stat = 0;
 	denali->irq_mask = 0;
 	spin_unlock_irqrestore(&denali->irq_lock, flags);
 }
@@ -179,16 +179,16 @@ static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
 				    uint32_t irq_mask)
 {
 	unsigned long time_left, flags;
-	uint32_t irq_status;
+	u32 irq_stat;
 
 	spin_lock_irqsave(&denali->irq_lock, flags);
 
-	irq_status = denali->irq_status;
+	irq_stat = denali->irq_stat;
 
-	if (irq_mask & irq_status) {
+	if (irq_mask & irq_stat) {
 		/* return immediately if the IRQ has already happened. */
 		spin_unlock_irqrestore(&denali->irq_lock, flags);
-		return irq_status;
+		return irq_stat;
 	}
 
 	denali->irq_mask = irq_mask;
@@ -203,7 +203,7 @@ static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
 		return 0;
 	}
 
-	return denali->irq_status;
+	return denali->irq_stat;
 }
 
 static void denali_select_target(struct nand_chip *chip, int cs)
@@ -294,7 +294,7 @@ static int denali_sw_ecc_fixup(struct nand_chip *chip,
 	unsigned int err_byte, err_sector, err_device;
 	uint8_t err_cor_value;
 	unsigned int prev_sector = 0;
-	uint32_t irq_status;
+	u32 irq_stat;
 
 	denali_reset_irq(denali);
 
@@ -349,8 +349,8 @@ static int denali_sw_ecc_fixup(struct nand_chip *chip,
 	 * Once handle all ECC errors, controller will trigger an
 	 * ECC_TRANSACTION_DONE interrupt.
 	 */
-	irq_status = denali_wait_for_irq(denali, INTR__ECC_TRANSACTION_DONE);
-	if (!(irq_status & INTR__ECC_TRANSACTION_DONE))
+	irq_stat = denali_wait_for_irq(denali, INTR__ECC_TRANSACTION_DONE);
+	if (!(irq_stat & INTR__ECC_TRANSACTION_DONE))
 		return -EIO;
 
 	return max_bitflips;
@@ -408,7 +408,7 @@ static int denali_pio_read(struct denali_nand_info *denali, u32 *buf,
 			   size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	uint32_t irq_status, ecc_err_mask;
+	u32 irq_stat, ecc_err_mask;
 	int i;
 
 	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
@@ -421,21 +421,21 @@ static int denali_pio_read(struct denali_nand_info *denali, u32 *buf,
 	for (i = 0; i < size / 4; i++)
 		buf[i] = denali->host_read(denali, addr);
 
-	irq_status = denali_wait_for_irq(denali, INTR__PAGE_XFER_INC);
-	if (!(irq_status & INTR__PAGE_XFER_INC))
+	irq_stat = denali_wait_for_irq(denali, INTR__PAGE_XFER_INC);
+	if (!(irq_stat & INTR__PAGE_XFER_INC))
 		return -EIO;
 
-	if (irq_status & INTR__ERASED_PAGE)
+	if (irq_stat & INTR__ERASED_PAGE)
 		memset(buf, 0xff, size);
 
-	return irq_status & ecc_err_mask ? -EBADMSG : 0;
+	return irq_stat & ecc_err_mask ? -EBADMSG : 0;
 }
 
 static int denali_pio_write(struct denali_nand_info *denali, const u32 *buf,
 			    size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	uint32_t irq_status;
+	u32 irq_stat;
 	int i;
 
 	denali_reset_irq(denali);
@@ -443,9 +443,9 @@ static int denali_pio_write(struct denali_nand_info *denali, const u32 *buf,
 	for (i = 0; i < size / 4; i++)
 		denali->host_write(denali, addr, buf[i]);
 
-	irq_status = denali_wait_for_irq(denali,
+	irq_stat = denali_wait_for_irq(denali,
 				INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL);
-	if (!(irq_status & INTR__PROGRAM_COMP))
+	if (!(irq_stat & INTR__PROGRAM_COMP))
 		return -EIO;
 
 	return 0;
@@ -464,7 +464,7 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 			   size_t size, int page, int write)
 {
 	dma_addr_t dma_addr;
-	uint32_t irq_mask, irq_status, ecc_err_mask;
+	u32 irq_mask, irq_stat, ecc_err_mask;
 	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
 	int ret = 0;
 
@@ -501,17 +501,17 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 	denali_reset_irq(denali);
 	denali->setup_dma(denali, dma_addr, page, write);
 
-	irq_status = denali_wait_for_irq(denali, irq_mask);
-	if (!(irq_status & INTR__DMA_CMD_COMP))
+	irq_stat = denali_wait_for_irq(denali, irq_mask);
+	if (!(irq_stat & INTR__DMA_CMD_COMP))
 		ret = -EIO;
-	else if (irq_status & ecc_err_mask)
+	else if (irq_stat & ecc_err_mask)
 		ret = -EBADMSG;
 
 	iowrite32(0, denali->reg + DMA_ENABLE);
 
 	dma_unmap_single(denali->dev, dma_addr, size, dir);
 
-	if (irq_status & INTR__ERASED_PAGE)
+	if (irq_stat & INTR__ERASED_PAGE)
 		memset(buf, 0xff, size);
 
 	return ret;
diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
index c8c2620..46296f2 100644
--- a/drivers/mtd/nand/raw/denali.h
+++ b/drivers/mtd/nand/raw/denali.h
@@ -299,9 +299,9 @@ struct denali_nand_info {
 	void __iomem *reg;		/* Register Interface */
 	void __iomem *host;		/* Host Data/Command Interface */
 	struct completion complete;
-	spinlock_t irq_lock;		/* protect irq_mask and irq_status */
+	spinlock_t irq_lock;		/* protect irq_mask and irq_stat */
 	u32 irq_mask;			/* interrupts we are waiting for */
-	u32 irq_status;			/* interrupts that have happened */
+	u32 irq_stat;			/* interrupts that have happened */
 	int irq;
 	void *buf;			/* for syndrome layout conversion */
 	int dma_avail;			/* can support DMA? */
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
