Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C0EC76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNF5ejcHdePns0PE1ZxwysE99V5jy9fnXPV1s8Wtihw=; b=D3pUZt7AoWXZoa
	x/vWZj90MOhVpJxewkkDg8wQr4R93jRt9HXtRITOINnKa6gn2c2LEAkmPilUI8zRo6ZtPhn8py70P
	ruKSRMBgUcJ7Mpl4jcLjshBQ3D4o9GsS9SgyhMdxQOWVscV2Bz94FhCVC2vWc0TTZLphsEiM4ansB
	EEet50JzlDvsuexdjzpty5y4gq5DO1JK6/IDp+eYSpDfl99hS9WVHFuoiPuDTck/pGDzgAN/NFphN
	vqek0iFTw9CeQ/S9p8FOb/Eoqx6uTE7YMj/3Zo1DKSa3z44wwwaY6s7fJ9wdrfeNNlL+/UqFTGu92
	phUXnbHYWecygQ08RlWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAEk-006QxN-0A;
	Fri, 31 Mar 2023 08:35:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piADs-006QKi-02
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:35:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j24so21631484wrd.0
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNLeYYmevUI4TEvtO58qWx9WKba4OWRb4gPC7pePliE=;
        b=QU/SMBwtauCDT26FDqkLVtUXOmKViF57BpBJbMyuNffLde2pjYSjYzzk4mMYgUY3RF
         Rv1j3nYCqzqWdV0ukZFmHVZEiyVWTayLisexL8iWTuSVhf0GnbgP1m/Kwr55kuXEC247
         H/1TlEwLAqO67ulQUFvz0q5cljRi5THKZtwqXZGj6DLmUrfgLnU8g5RDzJ3qX2TAyMkG
         JxtGinY/oJy51QsUfHANnB7s7NryhUeyS97DkLO3aOO3lWC99jyqeBVY2qo5YroHiBcG
         rbUVwa++BHOKgmdcC2Pxy8TIKtAb93DOo8j1YoPZJI3KBQiM7EvNk0av74pdYjvn/4oV
         D2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNLeYYmevUI4TEvtO58qWx9WKba4OWRb4gPC7pePliE=;
        b=seaazPpu/56Gg+lbBBBFlIGheHW6IQ/xlRrchZZ0jGMMXm9G4A89hFiWSTSfON7ChX
         uzjvbuK9ZioTNZibyADdEMsvl/tZ1upFmwg+m9qa+7oNtJOzeF41WM75RRjQIz/d7hHy
         /sfwVeMEFmay1LWQvG6af1pzTkhfyl/dPpHUTJ4qo5jN71ht72VcoEK+wGeyrbfn2m3q
         MzLQb0905T2GiwCR3PHnad4+yX6zPENnC9H4MAI+qMNExCNS7y9maeT9hjLSNaBSkvd/
         voetzXDig+n9YJ/FC8eLXi2E6gaE4wjWqVdISUT7Zllew8+qqTnrPAVAVHpGujAKqSNm
         u61A==
X-Gm-Message-State: AAQBX9cEyzd5q9dj9ixAj/wZ0kJJH8dN6pZdwSxaHTze3pwhyXiGB22M
	EZCOwU3M1fqWmJN4mD6OQAwqUg==
X-Google-Smtp-Source: AKy350bU8fJMNCxfVc86Lv2m3v2OU/27OaMpg82cazbgj/q2eFNxD3gWemqObAljC1iPMvpM3rDX1w==
X-Received: by 2002:a5d:63d1:0:b0:2d5:b6a9:772a with SMTP id c17-20020a5d63d1000000b002d5b6a9772amr20187850wrw.17.1680251699431;
        Fri, 31 Mar 2023 01:34:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:34:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:49 +0200
Subject: [PATCH RFC 11/20] net: stmmac: dwmac-oxnas: remove obsolete dwmac
 glue driver
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-11-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_013500_059365_A3EA97F6 
X-CRM114-Status: GOOD (  19.95  )
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 ethernet.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig       |  11 -
 drivers/net/ethernet/stmicro/stmmac/Makefile      |   1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c | 245 ----------------------
 3 files changed, 257 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index f77511fe4e87..8a0655d5f22e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -121,17 +121,6 @@ config DWMAC_MESON
 	  the stmmac device driver. This driver is used for Meson6,
 	  Meson8, Meson8b and GXBB SoCs.
 
-config DWMAC_OXNAS
-	tristate "Oxford Semiconductor OXNAS dwmac support"
-	default ARCH_OXNAS
-	depends on OF && COMMON_CLK && (ARCH_OXNAS || COMPILE_TEST)
-	select MFD_SYSCON
-	help
-	  Support for Ethernet controller on Oxford Semiconductor OXNAS SoCs.
-
-	  This selects the Oxford Semiconductor OXNASSoC glue layer support for
-	  the stmmac device driver. This driver is used for OX820.
-
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 057e4bab5c08..9b56324ccf7d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
-obj-$(CONFIG_DWMAC_OXNAS)	+= dwmac-oxnas.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
deleted file mode 100644
index 62a69a91ab22..000000000000
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
+++ /dev/null
@@ -1,245 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Oxford Semiconductor OXNAS DWMAC glue layer
- *
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- * Copyright (C) 2014 Daniel Golle <daniel@makrotopia.org>
- * Copyright (C) 2013 Ma Haijun <mahaijuns@gmail.com>
- * Copyright (C) 2012 John Crispin <blogic@openwrt.org>
- */
-
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-#include <linux/stmmac.h>
-
-#include "stmmac_platform.h"
-
-/* System Control regmap offsets */
-#define OXNAS_DWMAC_CTRL_REGOFFSET	0x78
-#define OXNAS_DWMAC_DELAY_REGOFFSET	0x100
-
-/* Control Register */
-#define DWMAC_CKEN_RX_IN        14
-#define DWMAC_CKEN_RXN_OUT      13
-#define DWMAC_CKEN_RX_OUT       12
-#define DWMAC_CKEN_TX_IN        10
-#define DWMAC_CKEN_TXN_OUT      9
-#define DWMAC_CKEN_TX_OUT       8
-#define DWMAC_RX_SOURCE         7
-#define DWMAC_TX_SOURCE         6
-#define DWMAC_LOW_TX_SOURCE     4
-#define DWMAC_AUTO_TX_SOURCE    3
-#define DWMAC_RGMII             2
-#define DWMAC_SIMPLE_MUX        1
-#define DWMAC_CKEN_GTX          0
-
-/* Delay register */
-#define DWMAC_TX_VARDELAY_SHIFT		0
-#define DWMAC_TXN_VARDELAY_SHIFT	8
-#define DWMAC_RX_VARDELAY_SHIFT		16
-#define DWMAC_RXN_VARDELAY_SHIFT	24
-#define DWMAC_TX_VARDELAY(d)		((d) << DWMAC_TX_VARDELAY_SHIFT)
-#define DWMAC_TXN_VARDELAY(d)		((d) << DWMAC_TXN_VARDELAY_SHIFT)
-#define DWMAC_RX_VARDELAY(d)		((d) << DWMAC_RX_VARDELAY_SHIFT)
-#define DWMAC_RXN_VARDELAY(d)		((d) << DWMAC_RXN_VARDELAY_SHIFT)
-
-struct oxnas_dwmac;
-
-struct oxnas_dwmac_data {
-	int (*setup)(struct oxnas_dwmac *dwmac);
-};
-
-struct oxnas_dwmac {
-	struct device	*dev;
-	struct clk	*clk;
-	struct regmap	*regmap;
-	const struct oxnas_dwmac_data	*data;
-};
-
-static int oxnas_dwmac_setup_ox810se(struct oxnas_dwmac *dwmac)
-{
-	unsigned int value;
-	int ret;
-
-	ret = regmap_read(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, &value);
-	if (ret < 0)
-		return ret;
-
-	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY */
-	value |= BIT(DWMAC_CKEN_GTX)		|
-		 /* Use simple mux for 25/125 Mhz clock switching */
-		 BIT(DWMAC_SIMPLE_MUX);
-
-	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
-
-	return 0;
-}
-
-static int oxnas_dwmac_setup_ox820(struct oxnas_dwmac *dwmac)
-{
-	unsigned int value;
-	int ret;
-
-	ret = regmap_read(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, &value);
-	if (ret < 0)
-		return ret;
-
-	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY */
-	value |= BIT(DWMAC_CKEN_GTX)		|
-		 /* Use simple mux for 25/125 Mhz clock switching */
-		BIT(DWMAC_SIMPLE_MUX)		|
-		/* set auto switch tx clock source */
-		BIT(DWMAC_AUTO_TX_SOURCE)	|
-		/* enable tx & rx vardelay */
-		BIT(DWMAC_CKEN_TX_OUT)		|
-		BIT(DWMAC_CKEN_TXN_OUT)	|
-		BIT(DWMAC_CKEN_TX_IN)		|
-		BIT(DWMAC_CKEN_RX_OUT)		|
-		BIT(DWMAC_CKEN_RXN_OUT)	|
-		BIT(DWMAC_CKEN_RX_IN);
-	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
-
-	/* set tx & rx vardelay */
-	value = DWMAC_TX_VARDELAY(4)	|
-		DWMAC_TXN_VARDELAY(2)	|
-		DWMAC_RX_VARDELAY(10)	|
-		DWMAC_RXN_VARDELAY(8);
-	regmap_write(dwmac->regmap, OXNAS_DWMAC_DELAY_REGOFFSET, value);
-
-	return 0;
-}
-
-static int oxnas_dwmac_init(struct platform_device *pdev, void *priv)
-{
-	struct oxnas_dwmac *dwmac = priv;
-	int ret;
-
-	/* Reset HW here before changing the glue configuration */
-	ret = device_reset(dwmac->dev);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(dwmac->clk);
-	if (ret)
-		return ret;
-
-	ret = dwmac->data->setup(dwmac);
-	if (ret)
-		clk_disable_unprepare(dwmac->clk);
-
-	return ret;
-}
-
-static void oxnas_dwmac_exit(struct platform_device *pdev, void *priv)
-{
-	struct oxnas_dwmac *dwmac = priv;
-
-	clk_disable_unprepare(dwmac->clk);
-}
-
-static int oxnas_dwmac_probe(struct platform_device *pdev)
-{
-	struct plat_stmmacenet_data *plat_dat;
-	struct stmmac_resources stmmac_res;
-	struct oxnas_dwmac *dwmac;
-	int ret;
-
-	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
-	if (ret)
-		return ret;
-
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
-	if (IS_ERR(plat_dat))
-		return PTR_ERR(plat_dat);
-
-	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
-	if (!dwmac) {
-		ret = -ENOMEM;
-		goto err_remove_config_dt;
-	}
-
-	dwmac->data = (const struct oxnas_dwmac_data *)of_device_get_match_data(&pdev->dev);
-	if (!dwmac->data) {
-		ret = -EINVAL;
-		goto err_remove_config_dt;
-	}
-
-	dwmac->dev = &pdev->dev;
-	plat_dat->bsp_priv = dwmac;
-	plat_dat->init = oxnas_dwmac_init;
-	plat_dat->exit = oxnas_dwmac_exit;
-
-	dwmac->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							"oxsemi,sys-ctrl");
-	if (IS_ERR(dwmac->regmap)) {
-		dev_err(&pdev->dev, "failed to have sysctrl regmap\n");
-		ret = PTR_ERR(dwmac->regmap);
-		goto err_remove_config_dt;
-	}
-
-	dwmac->clk = devm_clk_get(&pdev->dev, "gmac");
-	if (IS_ERR(dwmac->clk)) {
-		ret = PTR_ERR(dwmac->clk);
-		goto err_remove_config_dt;
-	}
-
-	ret = oxnas_dwmac_init(pdev, plat_dat->bsp_priv);
-	if (ret)
-		goto err_remove_config_dt;
-
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto err_dwmac_exit;
-
-
-	return 0;
-
-err_dwmac_exit:
-	oxnas_dwmac_exit(pdev, plat_dat->bsp_priv);
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
-
-	return ret;
-}
-
-static const struct oxnas_dwmac_data ox810se_dwmac_data = {
-	.setup = oxnas_dwmac_setup_ox810se,
-};
-
-static const struct oxnas_dwmac_data ox820_dwmac_data = {
-	.setup = oxnas_dwmac_setup_ox820,
-};
-
-static const struct of_device_id oxnas_dwmac_match[] = {
-	{
-		.compatible = "oxsemi,ox810se-dwmac",
-		.data = &ox810se_dwmac_data,
-	},
-	{
-		.compatible = "oxsemi,ox820-dwmac",
-		.data = &ox820_dwmac_data,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, oxnas_dwmac_match);
-
-static struct platform_driver oxnas_dwmac_driver = {
-	.probe  = oxnas_dwmac_probe,
-	.remove = stmmac_pltfr_remove,
-	.driver = {
-		.name           = "oxnas-dwmac",
-		.pm		= &stmmac_pltfr_pm_ops,
-		.of_match_table = oxnas_dwmac_match,
-	},
-};
-module_platform_driver(oxnas_dwmac_driver);
-
-MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
-MODULE_DESCRIPTION("Oxford Semiconductor OXNAS DWMAC glue layer");
-MODULE_LICENSE("GPL v2");

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
