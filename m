Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBD5C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/N3l2WLSwHxalxcUuCauZRPz9MOB/ygplyvI6zYnyw=; b=Yj4jT+whDors84
	UOD9ncapcnNZWhRNMH628HYDs2jRWeVkfvqv9EOoCKXBOEs4RmGTf89k4btTa8Wa+DeRK61081jgg
	rfX5CmySSOrvC4xj5lRZ9A/oEWoEOEWbQDxbeHrHabv5Ikws6fIoz28xyrCyoLLFBxLMBXiXY9f/9
	url3iXFHccL87wotRVC86ae2Ru1hcE4YywjfmlUi0tx8I6F/mKoTukZagYv4UgsR53+zb1JfrJECU
	eqCdBnfwDZxIN4jDj98qURoCXC3A96yBY7gUJSXd+zzAhw87P+mhNFOtL+Vl/KRRC3IiWfHBv8EAg
	p8XAGgxBsrfhPkn47ong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQ0s-00AXHw-0x;
	Thu, 20 Jul 2023 09:31:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP36-00AJNP-15;
	Thu, 20 Jul 2023 08:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A162061BA7;
	Thu, 20 Jul 2023 08:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB618C116CB;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841798;
	bh=B41VfWjJUYNCAgyaPP+TYEOPCZQ82oy+u4UZlDn4QsA=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=JbFJwH4VeKiXMfCUHpVso7qsQGWoIaii0h9/KOgKuOmXuJPD2HDtJGfP2hhmAJHxC
	 +pQbmKCmhbwsEguNTRmA2D+rDhOkch1IvxtZ3nfOJcF7EJyjwQpjnngBybe5dZanSJ
	 9eMFeYHk77c3GVyLiEJdwhn/CSe8ZlWIOGW1gWDU5svMQPs37EKPmMpBlWjHvypHGF
	 bGwFHGMWC/iuaDNyoNYO1Vvpu6/CmHl7fydPnTW09qsL4AGGqSJYW3Z4A0n9wUsHo6
	 HyYJFjtY23oN/ZuOpgwZld0RmezpuiTpdOGSLCsDAi/Wkpq1ApNxyOxmaT0mcqyIC9
	 kIKobMurH5jHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1844C05053;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:22 +0300
Subject: [PATCH v3 22/42] dma: cirrus: add DT support for Cirrus EP93xx
MIME-Version: 1.0
Message-Id: <20230605-ep93xx-v3-22-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
To: Hartley Sweeten <hsweeten@visionengravers.com>, 
 Lennert Buytenhek <kernel@wantstofly.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>, 
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, 
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=6877;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=Q54A7sVkI/IbwRjo56tAXtqK4EnifqnuJhkrT/M+cqk=; =?utf-8?q?b=3DkUkeyK+easjH?=
 =?utf-8?q?jaYYKYrZA2DfE76vfQBnaBtNnVU8gi1hrFaI3Ojm3MURz8q9fZxHR99C49v5LdLC?=
 GUIPIt4yA1sfmEh79rsMOnL2V983f+1lJlTJr9y7vFYhk+DFeKMv
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_013012_508485_D1FE9BC2 
X-CRM114-Status: GOOD (  25.67  )
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
Reply-To: nikita.shubin@maquefel.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Nikita Shubin <nikita.shubin@maquefel.me>

- drop subsys_initcall code
- add OF ID match table with data
- add of_probe for device tree

Co-developed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/dma/ep93xx_dma.c                 | 131 ++++++++++++++++++++++++++++---
 include/linux/platform_data/dma-ep93xx.h |   4 +
 2 files changed, 122 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 5338a94f1a69..1b38180e2a2c 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -20,6 +20,8 @@
 #include <linux/dmaengine.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -104,6 +106,11 @@
 #define DMA_MAX_CHAN_BYTES		0xffff
 #define DMA_MAX_CHAN_DESCRIPTORS	32
 
+enum ep93xx_dma_type {
+	M2P_DMA,
+	M2M_DMA,
+};
+
 struct ep93xx_dma_engine;
 static int ep93xx_dma_slave_config_write(struct dma_chan *chan,
 					 enum dma_transfer_direction dir,
@@ -216,6 +223,11 @@ struct ep93xx_dma_engine {
 	struct ep93xx_dma_chan	channels[];
 };
 
+struct ep93xx_edma_data {
+	u32	id;
+	size_t	num_channels;
+};
+
 static inline struct device *chan2dev(struct ep93xx_dma_chan *edmac)
 {
 	return &edmac->chan.dev->device;
@@ -1315,22 +1327,82 @@ static void ep93xx_dma_issue_pending(struct dma_chan *chan)
 	ep93xx_dma_advance_work(to_ep93xx_dma_chan(chan));
 }
 
-static int __init ep93xx_dma_probe(struct platform_device *pdev)
+
+#ifdef CONFIG_OF
+static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pdev)
 {
-	struct ep93xx_dma_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct device_node *np = pdev->dev.of_node;
+	const struct ep93xx_edma_data *data;
 	struct ep93xx_dma_engine *edma;
 	struct dma_device *dma_dev;
-	size_t edma_size;
-	int ret, i;
+	int i;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return ERR_PTR(dev_err_probe(&pdev->dev, -ENODEV, "No device match found\n"));
 
-	edma_size = pdata->num_channels * sizeof(struct ep93xx_dma_chan);
-	edma = kzalloc(sizeof(*edma) + edma_size, GFP_KERNEL);
+	edma = devm_kzalloc(&pdev->dev,
+					  struct_size(edma, channels, data->num_channels),
+				      GFP_KERNEL);
 	if (!edma)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
+	edma->m2m = data->id;
+	edma->num_channels = data->num_channels;
 	dma_dev = &edma->dma_dev;
+
+	INIT_LIST_HEAD(&dma_dev->channels);
+	for (i = 0; i < edma->num_channels; i++) {
+		struct ep93xx_dma_chan *edmac = &edma->channels[i];
+
+		edmac->chan.device = dma_dev;
+		edmac->regs = devm_platform_ioremap_resource(pdev, i);
+		edmac->irq = platform_get_irq(pdev, i);
+		edmac->edma = edma;
+
+		edmac->clk = of_clk_get(np, i);
+
+		if (IS_ERR(edmac->clk)) {
+			dev_warn(&pdev->dev, "failed to get clock\n");
+			continue;
+		}
+
+		spin_lock_init(&edmac->lock);
+		INIT_LIST_HEAD(&edmac->active);
+		INIT_LIST_HEAD(&edmac->queue);
+		INIT_LIST_HEAD(&edmac->free_list);
+		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
+
+		list_add_tail(&edmac->chan.device_node,
+			      &dma_dev->channels);
+	}
+
+	return edma;
+}
+#else
+static int ep93xx_dma_of_probe(struct platform_device *pdev,
+			struct ep93xx_dma_engine *edma)
+{
+	return -EINVAL;
+}
+#endif
+
+static struct ep93xx_dma_engine *ep93xx_init_from_pdata(struct platform_device *pdev)
+{
+	struct ep93xx_dma_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct ep93xx_dma_engine *edma;
+	struct dma_device *dma_dev;
+	int i;
+
+	edma = devm_kzalloc(&pdev->dev,
+			    struct_size(edma, channels, pdata->num_channels),
+			    GFP_KERNEL);
+	if (!edma)
+		return ERR_PTR(-ENOMEM);
+
 	edma->m2m = platform_get_device_id(pdev)->driver_data;
 	edma->num_channels = pdata->num_channels;
+	dma_dev = &edma->dma_dev;
 
 	INIT_LIST_HEAD(&dma_dev->channels);
 	for (i = 0; i < pdata->num_channels; i++) {
@@ -1359,6 +1431,25 @@ static int __init ep93xx_dma_probe(struct platform_device *pdev)
 			      &dma_dev->channels);
 	}
 
+	return edma;
+}
+
+static int ep93xx_dma_probe(struct platform_device *pdev)
+{
+	struct ep93xx_dma_engine *edma;
+	struct dma_device *dma_dev;
+	int ret, i;
+
+	if (platform_get_device_id(pdev))
+		edma = ep93xx_init_from_pdata(pdev);
+	else
+		edma = ep93xx_dma_of_probe(pdev);
+
+	if (!edma)
+		return PTR_ERR(edma);
+
+	dma_dev = &edma->dma_dev;
+
 	dma_cap_zero(dma_dev->cap_mask);
 	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
 	dma_cap_set(DMA_CYCLIC, dma_dev->cap_mask);
@@ -1410,6 +1501,23 @@ static int __init ep93xx_dma_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static const struct ep93xx_edma_data edma_m2p = {
+	.id = M2P_DMA,
+	.num_channels = 10,
+};
+
+static const struct ep93xx_edma_data edma_m2m = {
+	.id = M2M_DMA,
+	.num_channels = 2,
+};
+
+static const struct of_device_id ep93xx_dma_of_ids[] = {
+	{ .compatible = "cirrus,ep9301-dma-m2p", .data = &edma_m2p },
+	{ .compatible = "cirrus,ep9301-dma-m2m", .data = &edma_m2m },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ep93xx_dma_of_ids);
+
 static const struct platform_device_id ep93xx_dma_driver_ids[] = {
 	{ "ep93xx-dma-m2p", 0 },
 	{ "ep93xx-dma-m2m", 1 },
@@ -1419,15 +1527,12 @@ static const struct platform_device_id ep93xx_dma_driver_ids[] = {
 static struct platform_driver ep93xx_dma_driver = {
 	.driver		= {
 		.name	= "ep93xx-dma",
+		.of_match_table = ep93xx_dma_of_ids,
 	},
 	.id_table	= ep93xx_dma_driver_ids,
+	.probe		= ep93xx_dma_probe,
 };
 
-static int __init ep93xx_dma_module_init(void)
-{
-	return platform_driver_probe(&ep93xx_dma_driver, ep93xx_dma_probe);
-}
-subsys_initcall(ep93xx_dma_module_init);
-
+module_platform_driver(ep93xx_dma_driver);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@iki.fi>");
 MODULE_DESCRIPTION("EP93xx DMA driver");
diff --git a/include/linux/platform_data/dma-ep93xx.h b/include/linux/platform_data/dma-ep93xx.h
index 54b41d1468ef..b5b4bd5f9a9e 100644
--- a/include/linux/platform_data/dma-ep93xx.h
+++ b/include/linux/platform_data/dma-ep93xx.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/of.h>
 #include <dt-bindings/dma/cirrus,ep93xx-dma.h>
 
 /**
@@ -51,6 +52,9 @@ struct ep93xx_dma_platform_data {
 
 static inline bool ep93xx_dma_chan_is_m2p(struct dma_chan *chan)
 {
+	if (of_device_is_compatible(dev_of_node(chan->device->dev), "cirrus,ep9301-dma-m2p"))
+		return true;
+
 	return !strcmp(dev_name(chan->device->dev), "ep93xx-dma-m2p");
 }
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
