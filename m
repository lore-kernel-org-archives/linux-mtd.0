Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B1C88E72
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8/oLd24NEZI5hAKQKU7gEww60B7LLIE8wzRheLGsjs=; b=G/mONeU6QGG3wE
	wTdrvD7Sl+JpTPBAzidG7jnsbX7H8/Th8et6S/AcBRtAuW9+9aJ1b+DaH3DxeDOidYvXlBRpgSFpI
	3pjZH0YdyKSxEZdd9Ctx+ifnMbgsslTE6cbv9H3Ap3hLDzrc3O55Cm44IgACQT3EeFrqR2o4joQuO
	AfktpJ+qPam2CpAPwvPDuWZhBgI9cLv7xcvvlaHU/e0UVVeqYeLKlPmK99m35gTPw4epE6J6/t8YW
	zOKcxmkooR23x8/m4LYdgsiQm9Nxmba1sy5gT3gatsxqpLoXCXR42ubeb54DrvqYO53goAHR7kzQs
	+TuotQFxtHz2rajS/3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw9-00000004fPf-2R0n;
	Mon, 14 Sep 2026 21:10:01 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw5-00000004fMO-0zzP
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:09:59 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae7166ebso1500212eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420196; x=1790024996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=lO0GEOOKSPVx1BzoMDRMkXi50460P3ravSYnt3A6UkpcHyCrUFqvsC4oJWm/4fCOWO
         PRD6G2/F/kTdPJQ42DpTN8uCz887RJ6q+K3rM4OJK3H+JP74uqQe3oLHZySVMiChfeVe
         DEJWYUGwATOK+yBDMau9XwIBz3e89UR4xdNFwR0Ik081RSkwLwioudsGuu9qnk3Hzcja
         p+JG72Ehzmg0KK+fPu+DTwlcIU5QzK63xBo23fnPO6CCIbq3//ncsAMfT3uZSZ3A3md8
         WlTcUcEGQLuKTy+WrDt3L+i5fE/5joH46XrAdSx0hMMDnxyi3N4UIK5X9Y7H2x8iCsgH
         5kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420196; x=1790024996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=VWCQlSk5YXPDN/SBnhZgP7Hv7ZpHjZRID9H/+/V8IDU7aYEZg+414nAvvJMT9w0hCh
         NB3vNDl2UiEu9sH2k/DjTOima5PF/RiZxVPSdhio8kibuzQMPwEqv6k6DqMV6gYta7Ke
         3LhigSjCf1+GkbzVmSsl/fkKescoLWl31+PNJx4jkfYwh31CMk8GK2kovotI6Pb6HyeS
         Zd7j9IPDblWa9prdzBhmF7ZP6rD4dDNTO+i3BBm9WxoLkmctjeIwZTkKQJOVwlZku4v7
         IEaSx/5mfz5+Na0F6Wt4MgddNWW4xHwHd2XzIFBpjff93Hp65R/C2e0b8n66Onu3mxnu
         XkBQ==
X-Gm-Message-State: AFuF++mVBFszMQHm42t6/pc5FSRQoIee0KTIGmi7eKghZof1TM4toZLV
	s6C0aO+521Ihbs+QBo0BQGTsSOg3n3HBEQ3HBlBpGb9JCvUAASUPctNQ
X-Gm-Gg: AYBFou3Hs4Lo5JQUsyTwFZM1sn6Zum9otp2zRbTsbiyI1Nsl+OWP8x3MNfODWOFgfn/
	2cIseK7gsW3Kfm0FlcpEJLGkFIdYHmz8/J/cztNQIa1HJOr/K4l518lkZuO9Q9O5iymMKn2fHWO
	hPFusVO4je2d56PXbdr33F/oAq4PwRj7uvJybOmL3G312c416U1e4fZunSINHBvGi5VXaN57lKJ
	X3VPUmStLXyEznXo8vyVLZAxvEdIzaeYg9qKTCMwXDAJ40C4lq7Wu3/5jC2DWc4XykHrHMZrZKZ
	T4Mp7dY17rPKYeLwVfrQpXLqKff8ZzLQAlspl35xMmUvwfY1IfxfD+BuBUSKFIzQloucPtl3kVl
	AQ7Oa7Akz2vymk79KP0++kaJDzW8sd5loDIFlKGJQf8CfkTO6v21N55PYLCRzIPHIt8qietAKWz
	tjTrJNBEHGgyrPjI7LtvCsBbIE/vxtOyTtBJqMhxS+JHEPnYOhOba0ZWkrjRgLW9BcN1ddQOZxG
	pZcJz3jdaTfpFAKtvdj6XMKrmKq7hLPS219/SFyjhvAGW4R8OaBA256NBMWlGaopF+0WP3dZ6Ah
	LZe/FznJwPr71f+KryD2lXi6Q+gykD+sthCLWPFjNd8zfB+P08S2eq2js86+i9BOhmm2KmfPH4a
	WmVtiA8f9AFd1ylOOe0NK8Yjh3iVb
X-Received: by 2002:a05:6820:4d01:b0:6a1:4507:3544 with SMTP id 006d021491bc7-6c540d62bbfmr2624632eaf.28.1789420196428;
        Mon, 14 Sep 2026 14:09:56 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:09:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:47 -0600
Subject: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_140957_299226_047421A7 
X-CRM114-Status: GOOD (  21.49  )
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
