Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0F2CC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CIaOflRgYyf/mp7UUWoB/VCreZA6pUMDCrMUbsmPng=; b=oaFABZ703R6Y1z
	ZhzBKkWB0aIxA4l7O7fxOm2LI/DooBChnoh35Kbm+QpaQ8ZkgoHO7HCajaUD3ui/LWTHab3ym/FdR
	1HxNq7Tr475yujCVC+ELh+pfuwd4LIlP2rG+W+whDaB1CsqJr8nqDZmq68q4KtwHg85OATXPeTNly
	IuxUPiOAGhVo6r6lOLKT8uj5nDs/uWw9AV47UIlGuRdWRdxmBD4Z9UcRw/WJRioQWIDfGGGSm4cbj
	2aLu3si3/x94ioMvA9xl0J3hjtC4L9Kp55mp2l11F4XshZR7zGjEewKlyGDaZlT1G0ax7UahPd2Ti
	LwUdcni+k5Xr+lMY+zRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMR-0000000GYDu-3xJW;
	Thu, 15 Oct 2026 01:34:23 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMM-0000000GY90-3BOg
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:20 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6c8f6a53fabso5890256eaf.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028058; x=1792632858; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnbuymXcTtfKlGuvgEcxzPNrCMdjSx6DCt9Jhk4Q3PI=;
        b=pDdXkm4Jzq+u20T92zJMpnjgjeXX53vlQIQI3Q/E3br13I2Y78L4kPyHLGGIgkRBdt
         VdAGuiVDJ0CBQbNsr2Xz50I3fVY9iC4T+fW3wpYNYwB2gdnYhuNK+3rHnrsLBZeDEwvS
         N1jf1tBg1LzR0/4SvnjWEgz5qTPloOfwELBfFfc7qstDODK4OPl4+SaYW8OWumNyT9+w
         9JEBMJ/Lxc2sl+16I5/3fcg2FMyoPn36yUs0O8iUfVRT3NvfHcrVgTRiYRLUYwDPUhJp
         VLQEGJbXWEJPT0U4EjlJmMgdXb2HsZ22LBPwYN4J3RvLossF4xM0E337Q/ND0ymq05hf
         qhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028058; x=1792632858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnbuymXcTtfKlGuvgEcxzPNrCMdjSx6DCt9Jhk4Q3PI=;
        b=lgBDmuhRYmLMJoQD95l1JE21EQUGRU2s91qz7DlixiH1I99d1SY9k6FwFiAbNF0CO7
         2EHHuQHgKhTvEh2nROu0ZqCoI2kHKnSNjf63FMF50Dq3U+pZ85ScQLJdUgksYQZ0QskV
         qLZ6CxnXbIBZAMzydYpsA6qmQt/4AImcPxc6ev3BIloBAVAucyfXTpYOow+JQWD10zRP
         1y11ukFSgvej+STWAdqV0Pi6ykJPwhNfTtKq8Fbo2jYb74zT3pPlI2TVk5EHdtKPVjtU
         pk0/SBsVcTFiMkqSAHcVoxvDhZ1+2LcoT0ITaFNvXtpQIxN3iW1DOXPEs6gDd7wjm9CO
         vBjw==
X-Forwarded-Encrypted: i=1; AKwUvBxOx0+HwwxhRn9EQ1jdbd33nQTUsueMgZU6Az5SxbJzYC4iOOievcnbBM4dieyvLFtlrzOdrDCOM9Y=@lists.infradead.org
X-Gm-Message-State: AFq9FYKXlIvH0uBHms/l9S7Jul3tNNbMkoWlcEQQ9zppfI5gGTiNsuNW
	TFCcGGOM27Ro5dUCA3rqcYKlAPgRuoro+atMD5L7HrR6mIYGHefBmZk7
X-Gm-Gg: AYBFou3UmyYfzjSbStFdXmhcyqwc/Nw9r7NCI+n3D68XRjEsR8+YP8XVi2Kpq2gvth6
	Ee3BSMqSsAFCCG1tin5B813xQRTktwvScs8ye6xfm5MOinQnnQhRmJOfT4XxxYL+OK2VWOxamJ2
	XwkuGkOXHOaCxabjXozFWIZohc39e9mi17cVZXpaBaBvuyAsWhTrrbYCUfXFiWZOKWHhxT8GV8Z
	wLQz9CwqMRR7XLlt1s89MPnlIEksmJ1dGK8gX8h6OeCZl09Z2yLfvwJHu/rhpst63lC9UbLA2I1
	RZQ3UnH9AkyTLix8Reyrrm0JhELTtNF4yLJQ7NIbhZ0RENK6QsXlcaCc24TBEltDB/XL66FMTP4
	cxhQludxLDC51vmzEzSc8AMtFtnYr+ez7Xejcmp4OoqINynmAg0+znfl8qu2L8dX22WML2261Z0
	h9h7HGrvib0EpnG/fw+aM6AIASUpyi4ZdBKNARvmYKCnJke+o/fkMpJPXToJCahe1+9v39rYoOZ
	8yIz8UPBTBJeTNYLl+wUPtrhdwvz211ts41wJxAGMV4U26BHn4Gl83CEOYZEULCjaSqGxLJy7hK
	HTrqxKQTXkWgpicQi3ESxmttMAv2Gs1H5HBLAReeN20aJogpEOhjAHqT8TBKUT3JNSEkTxPqZ79
	A0sA1a4R6j2vXaqEoDNHf
X-Received: by 2002:a05:6820:5056:b0:6f5:a844:b12 with SMTP id 006d021491bc7-6f5a84410admr7628975eaf.57.1792028057776;
        Wed, 14 Oct 2026 18:34:17 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:51 -0600
Subject: [PATCH v7 04/16] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-4-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_183419_220450_03A3E646 
X-CRM114-Status: GOOD (  24.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The controller uses one completion for successive interrupt-driven
waits. Some transfers wait for both command completion and DMA
completion. The handler acknowledges each event and masks it, leaving
any outstanding event enabled; it calls complete() when all requested
events have arrived.

sunxi_nfc_interrupt() currently calls complete() before updating those
registers. A successful waiter can wake on another CPU and start the
next operation before the old handler acknowledges status or rewrites
the mask. Move complete() after those updates so waking the waiter
cannot precede the handler's last controller access.

A timeout also needs to exclude an unfinished handler. With PREEMPT_RT,
the flags-zero IRQ request is forced threaded. Near the timeout
boundary, that thread can be preempted after reading status and enable
bits while the waiter times out, clears the device mask and rearms the
next wait. The saved snapshot can then restore an obsolete
remaining-event mask or, if it satisfies the old wait, complete the new
wait. Masking the device does not invalidate the running handler's local
values. Repeating init_completion() can also reset its waitqueue lock
during complete(). This lifetime problem was identified by code
inspection during review.

Initialize the completion once in probe and use reinit_completion() for
each wait. On timeout, call disable_irq() before clearing controller
state so existing handling finishes and no new handler can enter during
cleanup. Then mask and acknowledge the events, read back the mask to
flush those writes, and re-enable the IRQ line. Keep partial-event
handling in the IRQ handler and leave polling and controller/DMA abort
handling unchanged.

This keeps additional synchronization on the timeout path, without a
driver lock in every interrupt and wait. The caller can sleep, this IRQ
is not registered as shared, and the handler does not acquire the
controller mutex held by the caller. The tradeoff is unbounded cleanup
latency and no priority inheritance: a starved IRQ thread can prevent
timeout cleanup from returning and block other operations on the
controller. This is a handler-lifetime boundary, not an RT
recovery-latency guarantee.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6c0d3e2d2be2..bc38330c0e36 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -393,6 +393,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -412,6 +413,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -433,12 +435,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 	if (!(ien & st))
 		return IRQ_NONE;
 
-	if ((ien & st) == ien)
-		complete(&nfc->complete);
-
+	/* Finish updating the interrupt state before waking the next operation. */
 	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
 
+	if ((ien & st) == ien)
+		complete(&nfc->complete);
+
 	return IRQ_HANDLED;
 }
 
@@ -454,16 +457,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
+		if (!ret) {
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
 			ret = -ETIMEDOUT;
-		else
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -476,6 +482,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (!use_polling && ret) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2650,6 +2662,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2658,6 +2671,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
