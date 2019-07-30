Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7D0C0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 18:16:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 094412064A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 18:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r92aSPeb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GMsUVWRU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 094412064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eimd+Kj7cdHGbm54MeiUCtvgUSZte2SfzKIu+hN5kns=; b=r92aSPebc4m0N6
	688qEHqCFAvGV8gCiN4+vk1uCns7kEqhs6wPAOhlQjU6V7ZbllamlKZ/IN/tGRropVuMSGSfnqqGw
	Y+mWsj6H7KVSMUkg3UkDV/IcZbkfxGpdlMN5Pc8MFTvWsZEgL2WmqFgBxEWIM+16BuzTGnSpNSQoP
	Pxm4xXEBjMzjPyjQVQrTyZmAzHom1NVeISKDt3D3740XB4NOz/QFX1UyZWtF8Yaw15mZwPDgSiubV
	gT/c9W65t700hKwgOomy8wnXt4bObitRKrZxws6E9IKYzXiDKjD8JVicVZGBwLrGgIqDIg6KSNKx4
	xggcHtD/1p1tVorjRgRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsWfx-00020v-6U; Tue, 30 Jul 2019 18:16:41 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsWfg-0001lw-Gf
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 18:16:29 +0000
Received: by mail-pf1-x443.google.com with SMTP id 19so30258017pfa.4
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2019 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p5RXXsJ4e7VkeUHqrbY1IBvBfJ/z9E69a8edPnsDJdQ=;
 b=GMsUVWRU1aTB1hWSiYZ1yAHVCz3KA2ZakCDiEbHmhhMz9lBM+S7FVB4L5n5H6H5b7I
 a+V6A1cm8rKTkEVe9O10c9KE01cFXuO2I7/xyU9a+3JPf7Ypvy+wJIzcwPaX5a1UeMtN
 YRxWZCQShkBcbMB3nfX0+dBg/+B4Nb/ZW5yMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p5RXXsJ4e7VkeUHqrbY1IBvBfJ/z9E69a8edPnsDJdQ=;
 b=QZqOxQ/H2gGeDvMwOi8tKb+9StATVHrAeyodZ/a6xTlVvN7Pil++nGkcLgpJYgeR32
 ZpV1zE6ZUtCxpn+UElYUZe0zI39TtMmdIy/LDhcY4xs5chJB7QqzB9unBUtQs1X9AeEe
 Tb8QF1jh078bhD2SkduBxOB9nKQqCRClcLOSdhzChi5urYgL83+S5s42G63ZgovELlfv
 Ua44rXIglpfmtZTsKGBVY0abYzW+TaVAGBJfK/qMv6ax6WGZHMpq/im0pTRuos3WQV88
 ekPFOtxRm2XMU7tFnRK82YXVzDyXGEduxwlokp26ab5arRf3lE05z4oDwYxnaPueviL5
 VpOw==
X-Gm-Message-State: APjAAAVivEawdz8s63Jm7TJmsyRu5Wh7GioQIC3Dgjls0GW4n18ZBRu2
 Gw0TzyESHjVKIboYayW/D+f0ww==
X-Google-Smtp-Source: APXvYqzdmoE2JLem/gbX1r3OvXzJEHBzGCQNGOjvOY6r5ot2LQEojL9LCQ0tBaIgf+wJXvZLyLIL+A==
X-Received: by 2002:a65:4304:: with SMTP id j4mr112698627pgq.419.1564510583820; 
 Tue, 30 Jul 2019 11:16:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 11:16:23 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 30/57] mtd: Remove dev_err() usage after platform_get_irq()
Date: Tue, 30 Jul 2019 11:15:30 -0700
Message-Id: <20190730181557.90391-31-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_111624_561470_21BD5147 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/mtd/devices/spear_smi.c        | 1 -
 drivers/mtd/nand/raw/denali_dt.c       | 4 +---
 drivers/mtd/nand/raw/hisi504_nand.c    | 4 +---
 drivers/mtd/nand/raw/lpc32xx_mlc.c     | 1 -
 drivers/mtd/nand/raw/marvell_nand.c    | 4 +---
 drivers/mtd/nand/raw/meson_nand.c      | 4 +---
 drivers/mtd/nand/raw/mtk_ecc.c         | 4 +---
 drivers/mtd/nand/raw/mtk_nand.c        | 1 -
 drivers/mtd/nand/raw/omap2.c           | 8 ++------
 drivers/mtd/nand/raw/sh_flctl.c        | 4 +---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 5 +----
 drivers/mtd/nand/raw/sunxi_nand.c      | 4 +---
 drivers/mtd/spi-nor/cadence-quadspi.c  | 4 +---
 13 files changed, 11 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 986f81d2f93e..7f6f6f1d965f 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -933,7 +933,6 @@ static int spear_smi_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENODEV;
-		dev_err(&pdev->dev, "invalid smi irq\n");
 		goto err;
 	}
 
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 5e14836f6bd5..df992554a66f 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -167,10 +167,8 @@ static int denali_dt_probe(struct platform_device *pdev)
 
 	denali->dev = dev;
 	denali->irq = platform_get_irq(pdev, 0);
-	if (denali->irq < 0) {
-		dev_err(dev, "no irq defined\n");
+	if (denali->irq < 0)
 		return denali->irq;
-	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "denali_reg");
 	denali->reg = devm_ioremap_resource(dev, res);
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index 6a4626a8bf95..0b48be54ba6f 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -751,10 +751,8 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	mtd  = nand_to_mtd(chip);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "no IRQ resource defined\n");
+	if (irq < 0)
 		return -ENXIO;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	host->iobase = devm_ioremap_resource(dev, res);
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 78b31f845c50..241b58b83240 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -773,7 +773,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	host->irq = platform_get_irq(pdev, 0);
 	if (host->irq < 0) {
-		dev_err(&pdev->dev, "failed to get platform irq\n");
 		res = -EINVAL;
 		goto release_dma_chan;
 	}
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index fc49e13d81ec..fb5abdcfb007 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2862,10 +2862,8 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 		return PTR_ERR(nfc->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to retrieve irq\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	nfc->core_clk = devm_clk_get(&pdev->dev, "core");
 
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index ea57ddcec41e..84b82d823952 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1398,10 +1398,8 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "no NFC IRQ resource\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	ret = meson_nfc_clk_init(nfc);
 	if (ret) {
diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index 74595b644b7c..75f1fa3d4d35 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -527,10 +527,8 @@ static int mtk_ecc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get irq: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
 	if (ret) {
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 373d47d1ba4c..b8305e39ab51 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1540,7 +1540,6 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(dev, "no nfi irq resource\n");
 		ret = -EINVAL;
 		goto clk_disable;
 	}
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 8d881a28140e..dccc927c5fa5 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1967,10 +1967,8 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 
 	case NAND_OMAP_PREFETCH_IRQ:
 		info->gpmc_irq_fifo = platform_get_irq(info->pdev, 0);
-		if (info->gpmc_irq_fifo <= 0) {
-			dev_err(dev, "Error getting fifo IRQ\n");
+		if (info->gpmc_irq_fifo <= 0)
 			return -ENODEV;
-		}
 		err = devm_request_irq(dev, info->gpmc_irq_fifo,
 				       omap_nand_irq, IRQF_SHARED,
 				       "gpmc-nand-fifo", info);
@@ -1982,10 +1980,8 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		}
 
 		info->gpmc_irq_count = platform_get_irq(info->pdev, 1);
-		if (info->gpmc_irq_count <= 0) {
-			dev_err(dev, "Error getting IRQ count\n");
+		if (info->gpmc_irq_count <= 0)
 			return -ENODEV;
-		}
 		err = devm_request_irq(dev, info->gpmc_irq_count,
 				       omap_nand_irq, IRQF_SHARED,
 				       "gpmc-nand-count", info);
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index e509c93737c4..058e99d0cbcf 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1129,10 +1129,8 @@ static int flctl_probe(struct platform_device *pdev)
 	flctl->fifo = res->start + 0x24; /* FLDTFIFO */
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get flste irq data: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, flctl_handle_flste, IRQF_SHARED,
 			       "flste", flctl);
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index e63acc077c18..1cc70fe2a4d7 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1912,11 +1912,8 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		if (irq != -EPROBE_DEFER)
-			dev_err(dev, "IRQ error missing or invalid\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(dev, irq, stm32_fmc2_irq, 0,
 			       dev_name(dev), fmc2);
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 89773293c64d..37a4ac0dd85b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2071,10 +2071,8 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		return PTR_ERR(nfc->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to retrieve irq\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	nfc->ahb_clk = devm_clk_get(dev, "ahb");
 	if (IS_ERR(nfc->ahb_clk)) {
diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 67f15a1f16fd..172d7a0a2454 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1375,10 +1375,8 @@ static int cqspi_probe(struct platform_device *pdev)
 
 	/* Obtain IRQ line. */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "Cannot obtain IRQ.\n");
+	if (irq < 0)
 		return -ENXIO;
-	}
 
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
-- 
Sent by a computer through tubes


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
