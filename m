Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA70CC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6PRr05uG79r96ln+sZoJzDhjXmW6jPT2f0OS0ObJgA=; b=QWEX5r7J7EwO7b
	IKCN+LYkWKmuGy/v+nb32vmOB/4raPwfb0kSePkacdjc4+02MPTSMIuRw4RGzcro2U8Iooo9nM/l+
	gWMqramfQX8KTw2nRJkPiM8yexuThzcBwwr8k45kthHQ7MSS99OcAYEjjfNctmOGWmNOFFC6lmpwo
	srBIn7dsknE1uS+LqbVnW12TLBm/Fq9QiZZYCytNUw1Nqc27bptlB11spkhFHe2WmSBoYLg7blw2y
	h8HD1OpH7EWKFKFQW83D3o0fQj5FapIGsK/MqKTIw/4npd4n+bMART/YC535WY+ZkDB9zfRJIddOI
	rFSUlBVP5bn/EO1gpm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYt1-00000001sJy-26s6;
	Fri, 16 Oct 2026 03:45:39 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYsw-00000001sDY-093h
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:35 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-825487fb37bso3635621a34.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122333; x=1792727133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piZMAcnvcZQBNALlEjasAqt9FGU3IFC9Bc/Ax/PGx1o=;
        b=qj/7N9U25GQPmDzWt9ZttChkkK8I1RUfpRjLxTUzqOcCn6EddZ7J+MCSpWUlKu2oVr
         Sl2rNCTJ3aq7UMLBef5Mn/TrEjpAMJyotvCjJeYPslZy1cAIQsqhhNszKxBoffrbC1LG
         JM/6uzeFZz+QUMiERDGsg6DDvDB6MDFBeqOR2s+a68Zyaok88coO4tB/46eDwhfIXzEL
         WWvHhfCOe2D8ShavlVwxSUiGmzbMMmyZfBqWla0KDgWnDrl6CbRXxUkwJVH/cY24e2yA
         EbgnUbgGPl6Guv8hiCmYAa5DdvGOYKpzQuQs8bzzEkll7AFE3bK1fXhctDH0sIZQ8YPI
         zgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122333; x=1792727133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piZMAcnvcZQBNALlEjasAqt9FGU3IFC9Bc/Ax/PGx1o=;
        b=y0f1vXJ9uSBOkaRSbmVrorrXrkm3Dm9JxXVtwaFyAy8RbethrA37AGUQhENWJm33Uy
         u+Pb7ongQsR71mHxtnva3f411i/fxP1tRhbnSGECHaNhLxblDThqzctUV6QnpVbjv3sm
         +ixollf4Tj9ITmG/RM+ykuk1W/nuMB1b5DObsB1NXcqtbZeH4S0+QNWtROoxXhMMWsTL
         J3tHKhU8sbO6qgPZhk2tLlobv8ZnSBnk7KtOBQ6sJbV2c0RAhkHh0bHiuFw0aKjTr+cP
         OOq7foRSgt1h5+A4tKUygtS7EUfWhDP9KXGeHB+efqGpPv7VmyhUtZAvBa0CHsNni+Up
         n6Ag==
X-Forwarded-Encrypted: i=1; AKwUvByKjePkN1tBjzstaBlR7fe7IH4ZryPHihs2xjt36JsUTDNUMfAlVJLGaLzxZdGdOSAlwT0jsMk9JA0=@lists.infradead.org
X-Gm-Message-State: AFq9FYKId/3EGvKmz6wRR3mvLqIwAUPTyG6CIRls0+KuklARcaQSDvxd
	GdnOObcBc7P6ANfccUW3mNjfkcarWxmig0ekYl5rab7LzppbJX7OKUhh
X-Gm-Gg: AYBFou0K1JhqcQhCy2OxKzwd1yf8msAzqwmAtcGMV0Olb4ZGrBmNrmrmvIrKrvnRDdk
	s2iJFFo74Dy5in5BNC56dfrxkps6quXpzPmcI8tGka7dwcHYtjY4uuAPccgrFTRHk1qnx490W/F
	lDgfa5e+jA0ewsUT9oR60fBRb6Pp0qMu/gAVNKGhGQfsanIZNMaf2tadVC+3kYkFUw7GLlLs8nM
	cP6C6biOOEZpVMMYPOP/EpSeSMSQReh7cXvWScoZ6QYJHizWJGiqqzba6MvljH6j1SBVzu6bWA9
	xTZp7JPM4k8LqbXTHw6RmRmvj3/P2W8J57exNQpwQhS0dUfUY6JjwvEYUGh+dd/f1tK1aPnFsOq
	J/SSpATzLR8Jtv5UrGSAhlAXvcfRVMuM4JNYa83MKg1HS+L8er4RR47lZAgFElF5ewcOxUcuv5R
	7IlnpXs/2ATf4JJ3k1VY/BHy7lzk0OmbWc3z7PMVw344zZNDqeXh/izVRmy2fY7D4dKW/nV/UC2
	W3bMmIlPkXEd/MduIrD4EB4tWR/mjIeazg8u8M2rICUgpwppz1vmt43YolEcs1k77ovx2KN8OYo
	1XgBraBWeHAGaWqe1M1q1TlIioy/mMXAyfiUG8rK5bVGyrmAzXz0l5HoAGYosOKbHhc1ovdUCA9
	u0LEvPcJoCLW/jcCcDK7qJ08pO9UWCVeU
X-Received: by 2002:a05:6830:270d:b0:80c:d34f:5f63 with SMTP id 46e09a7af769-8309814be28mr19957456a34.28.1792122332994;
        Thu, 15 Oct 2026 20:45:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:19 -0600
Subject: [PATCH v8 04/17] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-4-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_204534_097309_893A5245 
X-CRM114-Status: GOOD (  25.33  )
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
cleanup.

The hardware may have finished before the delayed handler runs, or the
handler may complete the wait while disable_irq() drains it. Recheck
status against the remaining enabled events before clearing either
register. Events already acknowledged by the handler no longer appear
in that mask; if none remain, the wait has completed. This also handles
command and DMA events arriving separately without requiring an
already acknowledged status bit to be set again.

Then mask and acknowledge the events, read back the mask to flush those
writes, and re-enable the IRQ line even if the recheck changed the
timeout to success. Keep partial-event handling in the IRQ handler and
leave polling and controller/DMA abort handling unchanged.

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
 drivers/mtd/nand/raw/sunxi_nand.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6c0d3e2d2be2..f7ddd4116bf4 100644
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
@@ -433,18 +435,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
 
 static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 				 bool use_polling, unsigned int timeout_ms)
 {
+	bool irq_disabled = false;
 	int ret;
 
 	if (events & ~NFC_INT_MASK)
@@ -454,16 +458,25 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
-			ret = -ETIMEDOUT;
-		else
+		if (!ret) {
+			u32 pending, status;
+
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
+			irq_disabled = true;
+			/* The handler removes acknowledged events from the mask. */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -476,6 +489,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2650,6 +2669,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2658,6 +2678,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
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
