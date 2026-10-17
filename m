Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BEACCF2C9
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXySm2aPDo+au9xtP3v0akyctU5EnnNaBye7ZyctwVQ=; b=C7FnU/5JvTVXHk
	hlk6ZEl1cTBUgAwTehB5MT/k9XyzJzKT4+xwo6WdQGiqHG8bBoH7OpLkWbBV6V4KCzvggCTZ3a3g/
	PizJlbFSlezHb3jvTvoPiMeWJZJ5hdQzsRKDC8M4Qs8vvIFW8FAaR/RDXVTM/dEdjXYEjgG5FsvDE
	3DjgBIFZFFCUD8LMTS5xfaWUQp2ZKP3uZDXzbt+sDMAr+d55PN22U3zuWmJMPKG1CXbvgtlK25VJL
	BH1gdg9t1ZArNsqLMuNJcSPKLSv/okmsBorf3ChRtUAeLzXBJgG54al+eMY8o1rRiNcn2TVdcRR1n
	t0ztZMrDM+7vgMwj1DEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMT-0000000597a-1gdv;
	Sat, 17 Oct 2026 19:46:34 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMH-000000058tK-0O74
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:24 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-53656465d1dso514036b6e.2
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266380; x=1792871180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+Qvi+dU4vtXa5pndLAyH0EZ9I1y6W0niIp108EHDPk=;
        b=m4AuBxI3J/+bBNgRIm/9z2u/NSKiQEu4J4jBv6maaKdE54DbM3nO0kE8SJM3ZVlTFg
         GElqRUta+kfY+lFqGtJ63pujQy6JoVyQufwEQBIQ/e6+59O8CDmovrsqgLJyXYiolvRN
         gWjUIglVxz1Z/UeJc/2SXwcrkM8TV7cJ1xRNdxC7K3lcJbu4jK04KlwhrC8rrwPpwWEo
         l0FnLxA2ivxH5sNp2NfXGYiq879ANn31QV6lw8qH89HabRk6KvhYNv+fi3BJxPbLGtRE
         6e2Cs7EsxtLMaRwtAEUcuF3+PnHtMGFaQ9S6v4WKpgWOAVZdYTSruXh0oYeAxh8Gk1qr
         B/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266380; x=1792871180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+Qvi+dU4vtXa5pndLAyH0EZ9I1y6W0niIp108EHDPk=;
        b=kOQa69TvzA890kwBFmSVHt36FSJVtRbuLYs9eYqmZU0opj0vfZ3aMARmrBCIb4ekGV
         sDWQ/pumx3NP7us+PQ3a7f4wXm+rbJvQQxNOVZMgUP6pUIV0sbh8J2Mbt17kOTEHpVqF
         Rlx7ESks2weo+Mi0SpuoSVQXqpcH981UFyDSs2TTdlU+uuU6CYVfwG69YRKKAbPKbPLk
         ZXRWGXOcnhQOgpdHA/WPBV4avKX9L3KVQFrpdWPVOfXEAHEqW02MU4/ef5TFzh3jwa2E
         Dpu4A4VzQsQkrNqocmuHWLXmNEgSEvepWtvLjx4SyjEkE8ezGGwtGbUWMOf4S5udeEiQ
         BWMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwe1jTc7TuNZb1epTND80Nbbx0pttTDGCKx+NoVUj6c7hg58IXf9kM0teaIfP0qltLhtAE2IPtMYlE=@lists.infradead.org
X-Gm-Message-State: AFq9FYL3CQz5x0YfBIj7MLRn1NOq44SnfS5SCbCzekLyl6fV1CpXO0ga
	JYgdMwiIDQcUuIjIzeuUVv1oxzRyFueAPg9G2+xNaDUMuPmsuC8XEyGc
X-Gm-Gg: AYBFou1AayGbDznptwN0YoiKuUk57p1tBnEgjTTNL0WW9Am7rfCZN7o6KyeeCqB8P2y
	2dFWWGjI3rUFYObHMj6ffD9veakHEHA0vm+qFO2E7LVEqfNVjKpAWORauo1GqKvYk+MkteUs9CZ
	Mw1peg58RQZlMJ4pJLgowjkHzlhTSgk9bKTA4+PDHXLJBbPacpljl/QPriCvSB+L6rQZRM8TukH
	hLrRpN0qEqIVMSQeZcWdu+5CXUOt9eBPVaGNZ3sVzZ8yOaRs8qTV7GgangaDHsYfXBFcexCJCl8
	UhbAr/D5zDeThnd5kjHe5BclbhkTsaWu60LGzo3dSmpRTTVJ+NXC4NdkaaMUZzQCIMb3ZR9emBI
	RWflnp26+Tg40nelSP+NUlp+Bd0CQfvHcx6UmZTw6btdLqigzZDyEu1mhM8gYy7qL25wC2ebpfR
	Yi2724VZwtsazh1fVA8OAfzFv7F8GWw9nheDLWtvyK1rgHXVxzhHPp2e09+WYpKBAWXyqh5KkgB
	HIyJ1qyAXDha4+x1UqqPNqBdvoP8Y25UZtALhKflD8EBawkm8muF53SW5NoQlXV946aWuMiYDp3
	ES9S3zvPfvPDBgem4AF8ZSnWY8BxVdeYk5wh8ihFVU/MxoyR+mzamzJ8iehvPH4yhrd3QPO1kh4
	6DlxgvsjfWjEOsnv3M5I8dA==
X-Received: by 2002:a05:6808:4f28:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-53cd1cb5c49mr3420662b6e.58.1792266379933;
        Sat, 17 Oct 2026 12:46:19 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:00 -0600
Subject: [PATCH v9 05/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-5-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124621_210821_6D6BB790 
X-CRM114-Status: GOOD (  24.95  )
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
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 29715d179d22..5b736a4a7fe9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -401,6 +401,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -420,6 +421,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -441,18 +443,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
@@ -462,16 +466,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
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
+			/*
+			 * The handler removes acknowledged events from the mask.
+			 * An empty mask means all requested events were acknowledged.
+			 */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -484,6 +500,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2664,6 +2686,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2672,6 +2695,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
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
