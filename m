Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DB6C3064D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewvFeNqRjMF/tH1debJnVoT/9KpyaM1bTIe4lTHswjg=; b=teIMjdv3G8M9ow
	wrA42uwm7CVkRsAhCvnLII6JaGWgvktuhOwCA6zw+oj5y3A05Gi7b8yfKpZRimHUosHIMs9v9mDxO
	TUe7q1JygBKRYUGnzWYOAMJ7cUB1WmbSLfMzTT/oCQJxFZk3GCHF3U/90eJUii1UAfqOr/e8atcLU
	NEC31ho2I5x0pzDRD5rpw13FWO93BD+jFiphyC0TVHMNa7gRTYjsK6PI/eJFv3Eh33OvOvdppwoYG
	TV+fRO5RjAgNJ6yCPRtkLVRlnXKzYqXgCZDxytN/QUKqRTbZXL0zcv/A3SwyjhV9s4dWXOvOlq6r6
	c9Mkan7HExyVKGZKHE1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqfR-0000000AmHn-0tzN;
	Thu, 27 Jun 2024 15:04:09 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqfM-0000000AmCi-066c
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 15:04:06 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52ce9ba0cedso6255426e87.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500642; x=1720105442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5FTNx2rCNap2yPKn2SRwkf+hAfqm2EY2VmQhMm4aLY=;
        b=uRv1mqtzncqJCR+8zzGmP0ctU8WebZIL5/9XPS+M0aFaxrJi0j2H88yu5ttWW0ajqr
         zWdas9HIlG2Mtos7YY7mDtUlz2SU//Gb1PNtOhxB+3Lsj5pfhEL8DqOnFxldklrwYs0r
         Y6IUfIzmLrpMHy5JyYzufVf1j4nw6xorFseAhtPmKaCA9awjCElpbrBDBNoNAQzdX7br
         jenub/+XYwzimPYhW46rGk9b27caS8YHd5pWIHG6s7Jf+Bgpq3Y2o7i0xYlfeaCJTUVs
         1JtSrinaNLuq8CejSg3k33ypR8XX23PS+kKl7hbjC8fj2syZ4QEywa1lhrDeK1h6gyUo
         QkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500642; x=1720105442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5FTNx2rCNap2yPKn2SRwkf+hAfqm2EY2VmQhMm4aLY=;
        b=VkuhF9NJnrKHfHQyrT5136n1FYNxPsHFedtLJNjIeAWiePIVB3N6lDhoeIPoAyinK+
         dRcgagNdMO4/GSsAz7YNu0zlfc3zQuo2fC0cPWbZV6ny3RSup/eVjVQv/anS0gK2Kt1M
         NL3agl4NIOghR4Cty4462log9fBGSeQJK4JpBXWLdkrcjPMKSpazRGOeDtACEh8VqHNn
         4mspIhyTaWVPkkwczfO7B45c/xRpc/HPEVuI75SPz4hBtrxoK4wIUwzCWZodP6hFBYbU
         BnUb27ILUhwfNL7ZZ+P+v00lk87BLfJMxq8UXZkAhDVawe4ho+bFI60gMtiOFOXh4hVv
         oCZg==
X-Forwarded-Encrypted: i=1; AJvYcCUkFO2XTdlsQ/0mTWruo+CHFYUgCwWOtsVP2scJbbMx4iqfsjGfDcm2SbBSLnuhC9dcWkMNsmYLwRH7hj+9WYe9NvpVGLx7wepn7pN6ag==
X-Gm-Message-State: AOJu0Ywri5uyxgY9Zfr0MdvyVKOaWA5UInPzYXXCAcCN+iuAcQfzI3Bt
	ZyumuX2i9cvNxB5wjRFxAJnfdfEahUmD0re/oRpjCQCGsPj9Rp2DSlKwOL4mIgk=
X-Google-Smtp-Source: AGHT+IFaCOczeRwgth2PoGX5w8JSSpXqYuck4bxLDzgZZHJxAcaMiwEJUeV2dPwYS1wMX1lq67pxMA==
X-Received: by 2002:a05:6512:2031:b0:52c:e119:7f1 with SMTP id 2adb3069b0e04-52ce185273amr8721983e87.51.1719500641673;
        Thu, 27 Jun 2024 08:04:01 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:04:00 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 08/12] dmaengine: Add dma router for pl08x in LPC32XX SoC
Date: Thu, 27 Jun 2024 17:00:26 +0200
Message-Id: <20240627150046.258795-9-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_080404_219372_D27849E6 
X-CRM114-Status: GOOD (  30.57  )
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

LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer,
this driver allows to route a signal request line thru the multiplexer for
given peripheral.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- Fix struct declaration order
- Removed unused variables
- Break search loop if expected lpc32xx_muxes[i].signal is found

Changes for v4:
- This patch is new in v4

 MAINTAINERS                  |   1 +
 drivers/dma/Kconfig          |   9 ++
 drivers/dma/Makefile         |   1 +
 drivers/dma/lpc32xx-dmamux.c | 195 +++++++++++++++++++++++++++++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 drivers/dma/lpc32xx-dmamux.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ceec359c68fc..118d48747641 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2404,6 +2404,7 @@ R:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+F:	drivers/dma/lpc32xx-dmamux.c
 
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 002a5ec80620..aeace3d7e066 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -378,6 +378,15 @@ config LPC18XX_DMAMUX
 	  Enable support for DMA on NXP LPC18xx/43xx platforms
 	  with PL080 and multiplexed DMA request lines.
 
+config LPC32XX_DMAMUX
+	bool "NXP LPC32xx DMA MUX for PL080"
+	depends on ARCH_LPC32XX || COMPILE_TEST
+	depends on OF && AMBA_PL08X
+	select MFD_SYSCON
+	help
+	  Support for PL080 multiplexed DMA request lines on
+	  LPC32XX platrofm.
+
 config LS2X_APB_DMA
 	tristate "Loongson LS2X APB DMA support"
 	depends on LOONGARCH || COMPILE_TEST
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index 802ca916f05f..6f1350b62e7f 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_INTEL_IOATDMA) += ioat/
 obj-y += idxd/
 obj-$(CONFIG_K3_DMA) += k3dma.o
 obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
+obj-$(CONFIG_LPC32XX_DMAMUX) += lpc32xx-dmamux.o
 obj-$(CONFIG_LS2X_APB_DMA) += ls2x-apb-dma.o
 obj-$(CONFIG_MILBEAUT_HDMAC) += milbeaut-hdmac.o
 obj-$(CONFIG_MILBEAUT_XDMAC) += milbeaut-xdmac.o
diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
new file mode 100644
index 000000000000..351d7e23e615
--- /dev/null
+++ b/drivers/dma/lpc32xx-dmamux.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright 2024 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+//
+// Based on TI DMA Crossbar driver by:
+//   Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
+//   Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_dma.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#define LPC32XX_SSP_CLK_CTRL 0x78
+#define LPC32XX_I2S_CLK_CTRL 0x7c
+
+struct lpc32xx_dmamux {
+	int signal;
+	char *name_sel0;
+	char *name_sel1;
+	int muxval;
+	int muxreg;
+	int bit;
+	bool busy;
+};
+
+struct lpc32xx_dmamux_data {
+	struct dma_router dmarouter;
+	struct regmap *reg;
+	spinlock_t lock; /* protects busy status flag */
+};
+
+/* From LPC32x0 User manual "3.2.1 DMA request signals" */
+static struct lpc32xx_dmamux lpc32xx_muxes[] = {
+	{
+		.signal = 3,
+		.name_sel0 = "spi2-rx-tx",
+		.name_sel1 = "ssp1-rx",
+		.muxreg = LPC32XX_SSP_CLK_CTRL,
+		.bit = 5,
+	},
+	{
+		.signal = 10,
+		.name_sel0 = "uart7-rx",
+		.name_sel1 = "i2s1-dma1",
+		.muxreg = LPC32XX_I2S_CLK_CTRL,
+		.bit = 4,
+	},
+	{
+		.signal = 11,
+		.name_sel0 = "spi1-rx-tx",
+		.name_sel1 = "ssp1-tx",
+		.muxreg = LPC32XX_SSP_CLK_CTRL,
+		.bit = 4,
+	},
+	{
+		.signal = 14,
+		.name_sel0 = "none",
+		.name_sel1 = "ssp0-rx",
+		.muxreg = LPC32XX_SSP_CLK_CTRL,
+		.bit = 3,
+	},
+	{
+		.signal = 15,
+		.name_sel0 = "none",
+		.name_sel1 = "ssp0-tx",
+		.muxreg = LPC32XX_SSP_CLK_CTRL,
+		.bit = 2,
+	},
+};
+
+static void lpc32xx_dmamux_release(struct device *dev, void *route_data)
+{
+	struct lpc32xx_dmamux_data *dmamux = dev_get_drvdata(dev);
+	struct lpc32xx_dmamux *mux = route_data;
+
+	dev_dbg(dev, "releasing dma request signal %d routed to %s\n",
+		mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
+
+	guard(spinlock)(&dmamux->lock);
+
+	mux->busy = false;
+}
+
+static void *lpc32xx_dmamux_reserve(struct of_phandle_args *dma_spec,
+				    struct of_dma *ofdma)
+{
+	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
+	struct device *dev = &pdev->dev;
+	struct lpc32xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
+	unsigned long flags;
+	struct lpc32xx_dmamux *mux = NULL;
+	int i;
+
+	if (dma_spec->args_count != 3) {
+		dev_err(&pdev->dev, "invalid number of dma mux args\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lpc32xx_muxes); i++) {
+		if (lpc32xx_muxes[i].signal == dma_spec->args[0]) {
+			mux = &lpc32xx_muxes[i];
+			break;
+		}
+	}
+	if (!mux) {
+		dev_err(&pdev->dev, "invalid mux request number: %d\n",
+			dma_spec->args[0]);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (dma_spec->args[2] > 1) {
+		dev_err(&pdev->dev, "invalid dma mux value: %d\n",
+			dma_spec->args[1]);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* The of_node_put() will be done in the core for the node */
+	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
+	if (!dma_spec->np) {
+		dev_err(&pdev->dev, "can't get dma master\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	spin_lock_irqsave(&dmamux->lock, flags);
+	if (mux->busy) {
+		spin_unlock_irqrestore(&dmamux->lock, flags);
+		dev_err(dev, "dma request signal %d busy, routed to %s\n",
+			mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
+		of_node_put(dma_spec->np);
+		return ERR_PTR(-EBUSY);
+	}
+
+	mux->busy = true;
+	mux->muxval = dma_spec->args[2] ? BIT(mux->bit) : 0;
+
+	regmap_update_bits(dmamux->reg, mux->muxreg, BIT(mux->bit), mux->muxval);
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+
+	dma_spec->args[2] = 0;
+	dma_spec->args_count = 2;
+
+	dev_dbg(dev, "dma request signal %d routed to %s\n",
+		mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
+
+	return mux;
+}
+
+static int lpc32xx_dmamux_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct lpc32xx_dmamux_data *dmamux;
+
+	dmamux = devm_kzalloc(&pdev->dev, sizeof(*dmamux), GFP_KERNEL);
+	if (!dmamux)
+		return -ENOMEM;
+
+	dmamux->reg = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(dmamux->reg)) {
+		dev_err(&pdev->dev, "syscon lookup failed\n");
+		return PTR_ERR(dmamux->reg);
+	}
+
+	spin_lock_init(&dmamux->lock);
+	platform_set_drvdata(pdev, dmamux);
+	dmamux->dmarouter.dev = &pdev->dev;
+	dmamux->dmarouter.route_free = lpc32xx_dmamux_release;
+
+	return of_dma_router_register(np, lpc32xx_dmamux_reserve,
+				      &dmamux->dmarouter);
+}
+
+static const struct of_device_id lpc32xx_dmamux_match[] = {
+	{ .compatible = "nxp,lpc3220-dmamux" },
+	{},
+};
+
+static struct platform_driver lpc32xx_dmamux_driver = {
+	.probe	= lpc32xx_dmamux_probe,
+	.driver = {
+		.name = "lpc32xx-dmamux",
+		.of_match_table = lpc32xx_dmamux_match,
+	},
+};
+
+static int __init lpc32xx_dmamux_init(void)
+{
+	return platform_driver_register(&lpc32xx_dmamux_driver);
+}
+arch_initcall(lpc32xx_dmamux_init);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
