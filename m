Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCA5C54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y71Xf9PW2kBxX7sIJqEpUAzjZx/5MxsStQTzhuTe9D8=; b=22wG1Bnil+woxu
	fSHfjkwBmOA/ofX1r2HgKpgaB8YfzCKkC0fDoZleHC5NlTsanXj3ruCvgLiGWz8Dsiof7WgFNBQZd
	DQ1b+tDfWQoxqGGICbo8SzW4SHDlBA7YR66AaRJKjYMq3TW3ly++gCLwvIL5n2qA+wcUwkxYQD6p0
	ih2Oy1lEiMxQOuqUGqU6Hjx4SK59eQKKMoM1g6A+NytgFZAzTxuNvM2hDlSiSOkPjULTZW+4oTE/t
	4H9rdlrKGyxQO0aAGN2vjX0tep2QBCG20fFOOuMtWpO1COv2z8d4cL5oPoDJB9tmrTtJmJFHaA+Rq
	FPY355+PcGuKZ8TgXNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEWy-000zJz-8W; Fri, 13 Jan 2023 07:31:16 +0000
Received: from [2001:4bb8:181:656b:9509:7d20:8d39:f895] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDUc-000m1U-Nf; Fri, 13 Jan 2023 06:24:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 18/22] usb: remove ehci-sh
Date: Fri, 13 Jan 2023 07:23:35 +0100
Message-Id: <20230113062339.1909087-19-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
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

Now that arch/sh is removed this driver is dead code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/host/Kconfig    |   7 --
 drivers/usb/host/ehci-hcd.c |   7 --
 drivers/usb/host/ehci-sh.c  | 182 ------------------------------------
 3 files changed, 196 deletions(-)
 delete mode 100644 drivers/usb/host/ehci-sh.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index ca5f657c092cf4..ddd8b798626caf 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -279,13 +279,6 @@ config USB_EHCI_HCD_PPC_OF
 	  Enables support for the USB controller present on the PowerPC
 	  OpenFirmware platform bus.
 
-config USB_EHCI_SH
-	bool "EHCI support for SuperH USB controller"
-	depends on SUPERH || COMPILE_TEST
-	help
-	  Enables support for the on-chip EHCI controller on the SuperH.
-	  If you use the PCI EHCI controller, this option is not necessary.
-
 config USB_EHCI_EXYNOS
 	tristate "EHCI support for Samsung S5P/Exynos SoC Series"
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index a1930db0da1c3c..e6dfef3492aabe 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1309,10 +1309,6 @@ MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR (DRIVER_AUTHOR);
 MODULE_LICENSE ("GPL");
 
-#ifdef CONFIG_USB_EHCI_SH
-#include "ehci-sh.c"
-#endif
-
 #ifdef CONFIG_PPC_PS3
 #include "ehci-ps3.c"
 #endif
@@ -1330,9 +1326,6 @@ MODULE_LICENSE ("GPL");
 #endif
 
 static struct platform_driver * const platform_drivers[] = {
-#ifdef CONFIG_USB_EHCI_SH
-	&ehci_hcd_sh_driver,
-#endif
 #ifdef CONFIG_USB_EHCI_HCD_PPC_OF
 	&ehci_hcd_ppc_of_driver,
 #endif
diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
deleted file mode 100644
index c25c51d26f2603..00000000000000
--- a/drivers/usb/host/ehci-sh.c
+++ /dev/null
@@ -1,182 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * SuperH EHCI host controller driver
- *
- * Copyright (C) 2010  Paul Mundt
- *
- * Based on ohci-sh.c and ehci-atmel.c.
- */
-#include <linux/platform_device.h>
-#include <linux/clk.h>
-
-struct ehci_sh_priv {
-	struct clk *iclk, *fclk;
-	struct usb_hcd *hcd;
-};
-
-static int ehci_sh_reset(struct usb_hcd *hcd)
-{
-	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
-
-	ehci->caps = hcd->regs;
-
-	return ehci_setup(hcd);
-}
-
-static const struct hc_driver ehci_sh_hc_driver = {
-	.description			= hcd_name,
-	.product_desc			= "SuperH EHCI",
-	.hcd_priv_size			= sizeof(struct ehci_hcd),
-
-	/*
-	 * generic hardware linkage
-	 */
-	.irq				= ehci_irq,
-	.flags				= HCD_USB2 | HCD_DMA | HCD_MEMORY | HCD_BH,
-
-	/*
-	 * basic lifecycle operations
-	 */
-	.reset				= ehci_sh_reset,
-	.start				= ehci_run,
-	.stop				= ehci_stop,
-	.shutdown			= ehci_shutdown,
-
-	/*
-	 * managing i/o requests and associated device resources
-	 */
-	.urb_enqueue			= ehci_urb_enqueue,
-	.urb_dequeue			= ehci_urb_dequeue,
-	.endpoint_disable		= ehci_endpoint_disable,
-	.endpoint_reset			= ehci_endpoint_reset,
-
-	/*
-	 * scheduling support
-	 */
-	.get_frame_number		= ehci_get_frame,
-
-	/*
-	 * root hub support
-	 */
-	.hub_status_data		= ehci_hub_status_data,
-	.hub_control			= ehci_hub_control,
-
-#ifdef CONFIG_PM
-	.bus_suspend			= ehci_bus_suspend,
-	.bus_resume			= ehci_bus_resume,
-#endif
-
-	.relinquish_port		= ehci_relinquish_port,
-	.port_handed_over		= ehci_port_handed_over,
-	.clear_tt_buffer_complete	= ehci_clear_tt_buffer_complete,
-};
-
-static int ehci_hcd_sh_probe(struct platform_device *pdev)
-{
-	struct resource *res;
-	struct ehci_sh_priv *priv;
-	struct usb_hcd *hcd;
-	int irq, ret;
-
-	if (usb_disabled())
-		return -ENODEV;
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		ret = -ENODEV;
-		goto fail_create_hcd;
-	}
-
-	/* initialize hcd */
-	hcd = usb_create_hcd(&ehci_sh_hc_driver, &pdev->dev,
-			     dev_name(&pdev->dev));
-	if (!hcd) {
-		ret = -ENOMEM;
-		goto fail_create_hcd;
-	}
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(hcd->regs)) {
-		ret = PTR_ERR(hcd->regs);
-		goto fail_request_resource;
-	}
-	hcd->rsrc_start = res->start;
-	hcd->rsrc_len = resource_size(res);
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct ehci_sh_priv),
-			    GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto fail_request_resource;
-	}
-
-	/* These are optional, we don't care if they fail */
-	priv->fclk = devm_clk_get(&pdev->dev, "usb_fck");
-	if (IS_ERR(priv->fclk))
-		priv->fclk = NULL;
-
-	priv->iclk = devm_clk_get(&pdev->dev, "usb_ick");
-	if (IS_ERR(priv->iclk))
-		priv->iclk = NULL;
-
-	clk_enable(priv->fclk);
-	clk_enable(priv->iclk);
-
-	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to add hcd");
-		goto fail_add_hcd;
-	}
-	device_wakeup_enable(hcd->self.controller);
-
-	priv->hcd = hcd;
-	platform_set_drvdata(pdev, priv);
-
-	return ret;
-
-fail_add_hcd:
-	clk_disable(priv->iclk);
-	clk_disable(priv->fclk);
-
-fail_request_resource:
-	usb_put_hcd(hcd);
-fail_create_hcd:
-	dev_err(&pdev->dev, "init %s fail, %d\n", dev_name(&pdev->dev), ret);
-
-	return ret;
-}
-
-static int ehci_hcd_sh_remove(struct platform_device *pdev)
-{
-	struct ehci_sh_priv *priv = platform_get_drvdata(pdev);
-	struct usb_hcd *hcd = priv->hcd;
-
-	usb_remove_hcd(hcd);
-	usb_put_hcd(hcd);
-
-	clk_disable(priv->fclk);
-	clk_disable(priv->iclk);
-
-	return 0;
-}
-
-static void ehci_hcd_sh_shutdown(struct platform_device *pdev)
-{
-	struct ehci_sh_priv *priv = platform_get_drvdata(pdev);
-	struct usb_hcd *hcd = priv->hcd;
-
-	if (hcd->driver->shutdown)
-		hcd->driver->shutdown(hcd);
-}
-
-static struct platform_driver ehci_hcd_sh_driver = {
-	.probe		= ehci_hcd_sh_probe,
-	.remove		= ehci_hcd_sh_remove,
-	.shutdown	= ehci_hcd_sh_shutdown,
-	.driver		= {
-		.name	= "sh_ehci",
-	},
-};
-
-MODULE_ALIAS("platform:sh_ehci");
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
