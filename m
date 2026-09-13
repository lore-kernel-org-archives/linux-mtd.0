Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E04C88E5C
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8/oLd24NEZI5hAKQKU7gEww60B7LLIE8wzRheLGsjs=; b=lnLLUml4IbxT6K
	T0WthDHcjeCdqSU7EJaVMLTTG3NVu9+8kERjW0u9NE655t4+QVZjNyFR55VuORfsJHuywu9ek9rOo
	Qg2YXdRItMCZu1MsG6ulc7J5JE37/mifLnC9RhcrFGLLjNA3sUcZTUK0HM4JsoiFY9vXAgT8FAtq1
	9MBU3zhAomwfq5B/u23wp69VGmfX6qCL55fDgZBL2KXZHkJcbTPU+IFxK5FoPyU4N5OZr5qzZn1aQ
	Be0aZTxCyxuH1XAU/kWSj2bZR4YcPQ5JwP3Dqp7WN6qYVwKNf9P7MAnpmYvz4RH6f2YxsamfArMH/
	0eV6BWHE+bkck20geWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSq-00000001MCB-1fAf;
	Sun, 13 Sep 2026 04:05:12 +0000
Received: from mail-oo2-x16.google.com ([2607:f8b0:4864:31::16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSn-00000001MAP-3YIF
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:11 +0000
Received: by mail-oo2-x16.google.com with SMTP id 006d021491bc7-6b390bcab0cso496589eaf.2
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272309; x=1789877109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=Cl+FOqpQ7qsw09tG2GdyRS+8kAhltdg9NE5JBEgEnxzY6UtjtiDU7V4Ibp5xtDqioB
         ekREdgtCNlOvd87kyr7UeEz5a1fFI7TB7szO/4ildtFO/7X/3PZvzHOZLpNDPzSneIsn
         Zi/NVIrV13+YhFn64TC3Q0+SD5pPhmSDXnzdFVbMg4VXzJOHj1Zp0lXqwQhhFE3sBiRK
         97VxnXlsx65/EkCK4G/gSZn62e3FxeZkdmoXPDE/JvFugzIfr9eLWss8fbpg80Pa5C9M
         RjzYkFjIIrDDK29qJp4MWMgLw9aTr6+ntO7Obh6rlurGYYGNl0ZbpA96t2mn/Yqdts1+
         LTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272309; x=1789877109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=dPPg3hMamuXj5jyci0ybMe2A+mx29OCdLA5ZJlla75IxsOKJwioo2Z5f1jg/Bv1Ayx
         CHMchVeLWu1nBhDqgfZzoeJE7yQ2XkRA2gE2Sn/cALaZLUW1cC9neagvaljZkkMfElMU
         pExm3UhrM8xAn2DwbSgN1TFbGQ2C49tre7lBqt6PfYX253qZLc3E0JLgKaSU/SM2wx0k
         +vV01UaHP9yDvMQedAWeIM2bw0VLWncL1KCftI0rDtgOhkuBF6Sw4cLo+tykx0yv2HYQ
         Vt2nGdKedn43oY+AWYFu9TObfTZT149ziZgzN4h9kMi6vdYCWxYhRrE2Lf+mUecJHkad
         imqg==
X-Gm-Message-State: AFuF++m5e8zI87tjSm/VE6wKNOrrCTSUUMcxzvKOcBES0mpZMQG9CMey
	y20Bx1li/zveq0f/VzCHjqIL9sLeHCjYdi02TfiTuKFfNTVTi+yg3Wx2
X-Gm-Gg: AYBFou13OeaI23fHl9NNzzlAFHf63epMBLIJt/zw7QPvRpH2VrO1AhRuGFIqp42l5Rq
	ei8QoPlt+kvGBu4D01zfGCOF125HBUQKciqFWhcp/scIrnAv9JAxpS1riVM3HJkq19JqNOEa4mI
	HE5zgxGiGk4pMOLD0CyeszheF1/+jIkHcqcjThLK72UaxkUtq13OW0Gz0mLwpTZgYJWsrkwOJCf
	B8KsbwMST8b00qtN8HFXZXfOfnl/xZnXC0u79gDIzdJ/vnUXe609FxKTa+vu0qOlaRuOaDK8WTg
	Zv1NoTG1LXkpxiLEDZG+zs0RynuT4kCL0kY1/ymuriFrPXaJTCJlAAXifHvQtfhDLe7p5mvNsqm
	YEYcz03/52QIFilqTKdK2n0ALRE+XdrRrkHc1A2A1T9a9U1PGEGcFSCPn5PVtNiVMqD171fpuQ3
	Zo8fF90AbYI0fnmfjG+h/6zOEt6gyP7oSL/4CSLksLsa4/h6IElXKaHEY4lUpyOs2t8AryLRoTr
	JQvp3RqiRS7Mr8xAXd//ikwKl5zW4Zi/sR1Sz2jqSsWLW+gg0lrTbHm5YY+r2ttm93GayWx6JQ7
	hhcFTmgfZ0QFMDxTHhZa+7YOE47VVTKULH8xHf52QZAjA2JpZPqu0PUUFuv6MxNICNzlAmKlXn8
	SYJ5z322lZSohB/U/Ew6pPwhu4inZ8w==
X-Received: by 2002:a4a:e90a:0:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c24f2660eemr2474010eaf.67.1789272308682;
        Sat, 12 Sep 2026 21:05:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:52 -0600
Subject: [PATCH v4 01/17] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-1-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_210509_902438_E106A142 
X-CRM114-Status: GOOD (  21.24  )
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

A timed-out wait can return while the interrupt handler is still using
the previous operation's interrupt status and enable mask. Starting the
next wait calls init_completion() on the same object, which can reset its
waitqueue lock while the old handler calls complete(). The old handler
can also complete the new wait or restore an obsolete interrupt mask.

Initialize the completion once in probe and use reinit_completion() for
each interrupt-driven wait. On timeout, disable and synchronize the IRQ
before masking controller interrupts and acknowledging the waited-for
events. Draining the handler first also prevents a partial-event handler
from rewriting the enable mask after it has been cleared. Flush these
register writes before re-enabling the IRQ line, leaving the controller's
interrupt sources masked.

For successful waits, move complete() after the handler's register updates
so that the next operation cannot race with those updates. Keep polling
unchanged and leave controller and DMA abort handling to the existing
callers.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..e50cf5b6a730 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -374,6 +374,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -393,6 +394,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
 
@@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
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
@@ -457,6 +463,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (!use_polling && ret) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2617,6 +2629,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2625,6 +2638,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
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
