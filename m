Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEBBC88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8/oLd24NEZI5hAKQKU7gEww60B7LLIE8wzRheLGsjs=; b=IS7OjoS5+tvb27
	s0vQJ+0xjhlWLtnAFMBdG78YsEZltzYcINTLKYG8bIdOCMKDoGym3OF13MAOgx9WbaByJtNfi5hiZ
	/6Y53sZeFE2bCsN9iNXplQz2tN/0Db/XRxPC2A0uD8BrV6TZc+tteI2V9zehWwi76ZsBozOB2irLF
	tAmGWFU+eKmvFauE+09/wXMqwUiLWQbGerFjLXn4vGGa6U3+4PMyJZW9T1C0jj/KfWYtiJ8u1DPtR
	ICelnrtnQBcStCxUyIx1zrFUD2N18U2fwj6YOuQt01DfTSu74aeYlk3gu/EtBof/H+usAMwLZvitO
	xMg94lMeVTJ6RAIjsIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5www-00000002CbG-2hzw;
	Mon, 14 Sep 2026 03:01:42 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwt-00000002CYt-2JDZ
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:40 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-804e42309a5so401705a34.2
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354898; x=1789959698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=pj7kdfHXvvm5lZFQYdCWYymqCqjSziQb1xGOlq8PBxdFyWgojJF7x8nU/u6bYBNdB2
         3E6w3i5Eqq9SyNoyQylE0QtCRbHOY6NsTqQaCuhv/agE75zNH0mUCXDEYCROm83mOpbn
         eedTi/gas1MPqa1p9Rh+r90/I+DhgZjzgF5CdM+YlPHYoxeXaSTM0K0ka6ExNXgJ+8S0
         JnHBJpSdJzogdjSNrhaXlQ1yUuZNhhgH0MWJNMjpmqlkGwBz0zE3X7lyHBV/XAcvl6YL
         zoRFxp6w+3CLYge7pZLGVFr+OTws2zRcL8Y1LEhkyEjJ+e8zQuSAHYBoMCk06TpVdHQI
         Sj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354898; x=1789959698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=MN2dZwm2y8eLsms0ARTg7JXQzJf5Y53+FGvESirs/6wQzjP/vWTBtXAjOUgZ1MM9C2
         46FLtfxw+D52wFzxSyuM/7GfiaaOkEfq+T7lkITTHOCA+mSHBuK16LOCBOIt0+KgYi+B
         jgcofMbJI7acBU4hWKHhJW/a7xMvW0eTCvarb+AMbgtXQkbM82dco0KLAwe1ggjMasDZ
         LdNO5foaBSVpWlPgIo9Ced353i6vzW01t5k3Z2Bl4lf/c8AL0Ti4au76joR093ZEoD+3
         hIgBI2oTVof+C/FOSXR9t+ngf+NCsdO+oeqVRX2AIhsfeX8U0KuJWE/rmu2zgajJbKhq
         Omzw==
X-Gm-Message-State: AFuF++m1aUdNTSmR63gQvTBrreDifeAZ1VpuMd7yO7T0sUZPQLWFY7D5
	fwinMxThi1dYrzjMkQmDB9f5FQPI9NDS04Nbq7PVPPJYVPdAmrlJJdxN
X-Gm-Gg: AYBFou3D5lgYDeEh0sSnFjbMOhDy2YtnjZUGiE9i8t971d+ebZxMugLHJaLTu9CxqdX
	lTvmc8GmnD3vGU4vuljE+3DqXHC6Kh57DdeZGYotaWd7Q9DVvtcQIVgL2KFJADWFHIASrnRhyQf
	E/BdQBoNSgeLGZejGeJtjLzQCYHJaMITzBiUT971yDvIgi4L7PGkp8GXRwXgtyxHMvTdlKLhCEg
	yaRHWoHaeCL9awOSro7+aMN6fThsaZ3yEcdjuUSy02C8tqPzd7ft6c6WfU2NGWnQ487hFT2ovXd
	krwFtnewVNTcNh4DxLWlhYNOkvUafkWXQDKasOfR2KDUrgM6HvR4LNe/iMbZrvExzYP32B5WnQ+
	OjIiC9gEr6fWFazg8xHOYRzfYEWmEujeU1UsE7dS8NaP6rBpWaBVvzTKqwordATj8dNTn3YRwov
	UslHy4Gkpl3cQAb6xAsUzVrNciDCllzL3hunW4e7azUmSE3UwUfjiW7sXyXB77Z//bZroWN1Dzw
	Nx4sptYfXw5P3XQh4U8vgFm9BYMX5ToXqFrvgmqDN3bAXWTOGc5aESHF6Ma2ggTpTP4nk9PvCrj
	cLYQa8OWqPzrKyQ9OzknyPRv2Grp/Cx4T94bzG6FVV24K8wZl3B95S7pqUxTUTNt3lwWqzlurJf
	T2Ea94em4eoaXrzf18BWm/GgjmzxYY1RJemPIEIlW
X-Received: by 2002:a05:6830:81fb:b0:7fb:547f:98bc with SMTP id 46e09a7af769-80897394cd9mr261168a34.5.1789354898430;
        Sun, 13 Sep 2026 20:01:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:07 -0600
Subject: [PATCH v5 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-1-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200139_600775_99618B1B 
X-CRM114-Status: GOOD (  21.34  )
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
