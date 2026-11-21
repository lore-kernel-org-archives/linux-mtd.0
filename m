Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD38606ACC4
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A1c/Gt1B;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6UTD+gu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vsD034YMBK7iWnDGTP3c0X/Lk0sQ3H5ad2i0v2VMPHE=; b=A1c/Gt1BZ6nJzJ/mDPCwfSyn2a
	rayIBcVTUgTP30neuZ1SU62nb+xHd6UnAWca6l4wpI1RzCfcB21N3jiInhn+b7v/O7Dw4PRgSMpm2
	YPn1TT//IEcMoVb44BcpDJ5N9nAmIS/tRtIS8XzcK0jNBb4ldUfzra+fESrUUn+07w/5UwEOoNN/Q
	VuTK2rCsSmdaQdSc1tEakaYUJMhC8msFR12vQxltdQXUZwYwj2QegnPhlxyhwCR9lsaQRHfq+jvRq
	F7ZxBus58MZnmfriRxmthR6AcUNo/udFSj4689jh1NJb44IFBW/nkD9xgjt2hO8GL0ZMN+z/Liykl
	tIRjdRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZeD-0000000GaAm-0zgu;
	Sat, 21 Nov 2026 01:12:09 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdE-0000000GZIE-1Rrv
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:16 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4a76f63b243so2101516fac.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223467; x=1795828267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
        b=y6UTD+guZHnPvU066aZIor/7AX1Rw8K+H9SCyRtfUqeDZm3EQQPPpzMXzeAmj13doJ
         wEjhUIuJ+BGUwR/QvpFibsDAtFV+6qILg3zJtDx8EACJKW/taEN0eP+LUTZPEZZ2113L
         KNEW5KD7W/olVzeD+VABHkNfOC0Uwb0aj+7Oddn74xDtf4JFv+clEnps4U61u3OzV2CY
         OcmzMOXT88gu6L7yZkHDaxbKEWrOm5lyTQLPctAwTLdhLf7VBVXwdeUdw64OWYxZYyE6
         xrPRvx2T3pV4Icxj9wLKtCoEOxQkNMBuQ7Ikiy0X61j7DcA+e8O2QKFoAH6CLK6q/RG3
         9aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223467; x=1795828267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
        b=qQwGpFEDub3x/RoQUnFopuJOLG983EB3rmxkkFV0b+e24bkcdC+Fi/dhvd4gKqkPk1
         AA0FSD/5O6VBCLhWnCfX8UrQNXT+Z14iQZH+yoXHL5xG2C4TfrgP8AOrQ7D0AfS75WiT
         +G1TZ4D5ISufEuollXlwh+3ngqqm3Nf3ayXJoQL+DYvmm1QY6n818T3Q23TYlFoxU4zv
         FczYQ804pm+A2FvYCr4d4Rl5UmKZjs5gCrGltAKHYsn9Kovxtp9ckqiYDyg+RvAlXDWT
         WWr1hOg+n/tgsLJl+ct7iVg0DZyMhFslrl8IRo/F47Q2DChdakjM5QTHk/HO3xDPzdFU
         bb3Q==
X-Forwarded-Encrypted: i=1; AL+hErHJr3Kh0qc1UK5h4LMRLhTnqdWa7qrbunSScAKbrcZFz9TIPUtyButavrBaU5wF42Zrzgp3cXpfupw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+n7KWTfn6odcr850Jud7EwHvaKx+q6ZQNPY4AUlWX4it14ImVO
	s8MkGwVUYHAaP4AOnGJ8+yDIBSc16LTxuoWkY242daXWeQLIEZm0d9GG
X-Gm-Gg: AYBFou0xvmfdEksXwHwxD4pHPgWrj1PpiZnzvr8tBEFe4a+v62ztQGZoKDhqok0NDqk
	u+QBDLvYtDvTlIBzahBb5DNzEWi1oP4N2JN7sOeJDErSpV2S7K7rmMqmSVUh8nVZQYvrxEquw1T
	gFnXQdemZQdyROATsHqwU7Kw3SHvT21eP5Zxz9l7rrdZiez7mzGKyrigpAA8zjvQBeeMhAHjgUH
	xPuU+9QKnlt8DY3LLrhXGlTqiBfdv/QAr5tn+Qezmm65WC6uwS41kgEVlHB/6C5UvbefejIaHX/
	xGX+rgLGhEOIJtjSaUFKmbCwG6pgzAbo/fuHDkx8SmAHc/4Cv4IyzsM6JYU+jVksKxE1tSzz6Nx
	J01GaL58k55fz9bx6AArlC9jTbjuDoOWbYf/rEVVU7/PuB9/M9uhVjuBB60irb2NyTQOsGSHqBJ
	jpp74QdtsbGpYYVyJYYHZkgJY5I9GSJVuR73MV3+t3f8yYq3YFecSKz2+fqwgnoZVTsD1CZHg++
	do4ZUVt+520gkvcTETcJTmCDln417wkPNTzgQpJYsOhDQWePNpnxqWp/Ejn+uJpRm4Un9R3GyC0
	VGsKM4uuf6rul4wPxT/MEmWhpogBvLUQb9JOhJmbwhOUaic4txAq4JTaCs4jSxDuOnLxa54Q9BX
	4jbnrFEijFFhnz/Hy6ZkGm5N27r8ZKuHT8DHAW4GAaU/UkPGsLZejo5+eQVjn0Q1TLJY58kkXSN
	Lq9MwI2iv/R1M7qUXomQ1Ppc4r44iNtdxpHfaLqmyo1vkVeq6Wu60/
X-Received: by 2002:a05:6808:3a19:b0:4f1:a3ac:a637 with SMTP id 5614622812f47-57a0b6533e2mr3933225b6e.27.1795223467204;
        Fri, 20 Nov 2026 17:11:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:31 -0700
Subject: [PATCH v11 08/26] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-8-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171110_323049_8FB603C2 
X-CRM114-Status: GOOD (  23.26  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Back-to-back NAND transfers can time out or appear to complete early if
the previous IRQ handler changes the interrupt mask or signals the
controller's completion after the next transfer starts.

On success, acknowledge the events and update the mask before calling
complete(). On timeout, masking the device alone is not enough: on
PREEMPT_RT the IRQ thread can be preempted after reading the old status
and mask, then resume after the next wait is armed. Initialize the
completion once at probe and use reinit_completion() for each wait.
On timeout, drain the handler with disable_irq() before clearing state.

Recheck status against the events still enabled after the handler has
drained. Command and DMA completion can arrive separately; the handler
has already acknowledged and masked any events it handled. An empty
remaining mask therefore means the transfer completed. Flush the mask
and acknowledgment before re-enabling the IRQ.

Normal NAND I/O waits in process context. The IRQ is not shared, and
the handler needs no lock held by the waiter. Only timeout cleanup
needs to drain the handler. Its latency is not bounded on PREEMPT_RT:
there is no priority inheritance if the IRQ thread is starved.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c5e429318de2..6d7384aac917 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -378,6 +378,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -397,6 +398,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -418,18 +420,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
@@ -439,16 +443,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
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
@@ -461,6 +477,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2559,6 +2581,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2567,6 +2590,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
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
