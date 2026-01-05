Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C47CD0409
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 21:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2t0xXERqk42Ds+x+149diGV7YdBNb6c9f5HUwSM1G0=; b=gN5zrRCdnWrTp/
	5a3BqEmLb3yul159/zRrN0EpYVzkKNSDE7D+iy4/eY5tA6nBm/x58qGfLE/6VOeKgtz1hox0zIoEm
	UBisVRNSG8tJPFihGflkYevGU/W7FtuJFAdTMpxq2P26ko81/6iFdIIw6DF3t4A6jCAE+nwZaAWe4
	rYIoal5yyDD6JSdzIX6DRWJ6vlXU1DbGuUoPfcLXr+SsFrkYAjVY4dZP3KcTED+IeW2ibgwDoy7gG
	nL6hzFMA4xMMf7A6tNb+YIXxQoT+DEWE2+pYcKl6UNubk1oX48zr/2silUchjUG+74v4wGYKEpBjT
	8UbQN3cL6duuvgdgrcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrmx-0000000C5oD-2UGQ;
	Mon, 05 Jan 2026 21:06:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrmu-0000000C5m3-01z0;
	Mon, 05 Jan 2026 21:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2000408DF;
	Mon,  5 Jan 2026 21:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78641C16AAE;
	Mon,  5 Jan 2026 21:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767647211;
	bh=SGqvyNbapL7DF9Ho4FGpHDUF7ldVAxZx9cM+6JpIZxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BPRyBdJhlShaF11A/HZfsOSVgD1I/OTDE5XtAhZU82hLcYzy9o10QI2LHCyM2fn+I
	 nfj+rG13/TJFKMe41GOAmMmCsUk10Wvnr98E7g/UGNUo17Z2TNhyiFyimEL0df2b//
	 94MBGpaHHG2I7/nw2tcWtumtiAiJv4DMK42X1cocgxwzWWJ6FFuThNwRkISt5kMdkz
	 AJjMBXIfvZ64e8knok5pbijfVagliZFihk4L7J8hBzteWnPYMMXDQduu56DYIZgfrv
	 O9ucJePTGltILVSFki2XH0+YEAsY1vF8v7yb045/iwQNElDP4xrwhR92KF2RaXMqp/
	 qgAG0uBZFHipw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 05 Jan 2026 15:06:43 -0600
Subject: [PATCH v3 1/3] mtd: nand: atmel: Defer probe if SRAM is missing
MIME-Version: 1.0
Message-Id: <20260105-at91-probe-v3-1-594013ff2965@kernel.org>
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
In-Reply-To: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_130652_067329_DE062E97 
X-CRM114-Status: GOOD (  10.11  )
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

The Atmel NAND controller driver depends on an SRAM pool and has an
implicit assumption that the SRAM pool has already been created.
Changing the initcall ordering can break this. Unfortunately, fw_devlink
can't save us here as there's not a standard property to track the
dependency. So it's up to deferring probe to save us.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Use dev_err_probe()
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 83ba4ebd02d4..e7fdf532c5fe 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2304,10 +2304,8 @@ atmel_hsmc_nand_controller_init(struct atmel_hsmc_nand_controller *nc)
 
 	nc->sram.pool = of_gen_pool_get(nc->base.dev->of_node,
 					 "atmel,nfc-sram", 0);
-	if (!nc->sram.pool) {
-		dev_err(nc->base.dev, "Missing SRAM\n");
-		return -ENOMEM;
-	}
+	if (!nc->sram.pool)
+		return dev_err_probe(nc->base.dev, -EPROBE_DEFER, "Missing SRAM\n");
 
 	nc->sram.virt = (void __iomem *)gen_pool_dma_alloc(nc->sram.pool,
 							   ATMEL_NFC_SRAM_SIZE,

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
