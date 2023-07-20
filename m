Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE46EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcObZc+JYa9g7DAs9wx0+KFGA+MUaEXvGKmv4oemz2M=; b=gev7be8Sxta5XE
	afHhMg4/XRklr+FhukhIpJSd4g6sOvf/ErRZSArV9rTPpTlruh8d46c7gCkWHXeq8RhM+TyQSuu71
	C6LXp9w1A0ngxl9ASoiUqD/MW5DcOA6mOi3RwjluyokNhX5IgXnIjj3awQ2FSPDnfPUpv33T5Ivzi
	e411KUT49f8ahmLwieP6bfBans6zqBlHvM7CceMfTxgNrm4FLYayvVVCXzcfQFU8dyL/ZWD087llU
	0ls94gLYqnQleVMCCnTDgzUx11omOEoQekofwF2FUz8UH+xigJSmjDGd4y6FYEuCGpdfcUOV93aKi
	J9UfIwbxXFYvotn1zYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP51-00AL5Y-0G;
	Thu, 20 Jul 2023 08:32:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP3H-00AJRi-0v;
	Thu, 20 Jul 2023 08:30:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 240A561943;
	Thu, 20 Jul 2023 08:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C66EC00939;
	Thu, 20 Jul 2023 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841799;
	bh=D0zmWfpY4Zxds3pI9qoqO5QwtVSarYugW4yFNdti8Q0=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=Jv7h+tlB1D4diowhIg135C6ImPqAa+Cmjeq4JsjWftAmW2n7sBmFcAmbXIzL8Ym9y
	 BRnM7ZZ6DoiLmhbYWpNAmgW8KDDfclYLD8FRZj21ThtsS97ueB5/1HS8a03lP/0flN
	 mIV9lxFJrOcvLZcjqMupIt/NaX7j/b8fkAoaSbJF1dRce6WMrKQfYEEQLi6XUHS1NQ
	 3PndgRFBDmbaAJpM5FNo0MdpgiyoEmpErY/PUPUvcVTJmZS4qyrWGe3OMMXjPH8Z9a
	 qGaMRvaJ3vGhiDYQGcKw/+g6ugY5B9zue42n4xvXXR+WkdxqFhCLfJaZO0Lu2PHSRu
	 MyPrBlOv5m+dQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C81C10F19;
	Thu, 20 Jul 2023 08:29:59 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:42 +0300
Subject: [PATCH v3 42/42] ASoC: cirrus: edb93xx: Delete driver
MIME-Version: 1.0
Message-Id: <20230605-ep93xx-v3-42-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=4962;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=K42b6S3Gkw/OZtsjmZjMwv/18r4+mbuwFRUMVcpcY+I=; =?utf-8?q?b=3DIGZ2FeCPE78X?=
 =?utf-8?q?cF95Zy3oR8xxaO6xwqnalDqB5TnbzsJf8QwYoyPEiTB3t8yvZZ1/Rzsu5n/5Wq+d?=
 NvVfE54nAYukLYe2jXVfWiK7KxIOWkgx8kBBnHCzn8co5COdM7XY
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_013023_493447_21B3758B 
X-CRM114-Status: GOOD (  20.92  )
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

From: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Can be replaced with "simple-audio-card" for the rates up to 50kHz, refer
to commit "ARM: dts: ep93xx: Add EDB9302 DT".

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 sound/soc/cirrus/Kconfig   |   9 ----
 sound/soc/cirrus/Makefile  |   4 --
 sound/soc/cirrus/edb93xx.c | 117 ---------------------------------------------
 3 files changed, 130 deletions(-)

diff --git a/sound/soc/cirrus/Kconfig b/sound/soc/cirrus/Kconfig
index 38a83c4dcc2d..97def4e53fbc 100644
--- a/sound/soc/cirrus/Kconfig
+++ b/sound/soc/cirrus/Kconfig
@@ -31,12 +31,3 @@ config SND_EP93XX_SOC_I2S_WATCHDOG
 
 endif # if SND_EP93XX_SOC_I2S
 
-config SND_EP93XX_SOC_EDB93XX
-	tristate "SoC Audio support for Cirrus Logic EDB93xx boards"
-	depends on SND_EP93XX_SOC && (MACH_EDB9301 || MACH_EDB9302 || MACH_EDB9302A || MACH_EDB9307A || MACH_EDB9315A)
-	select SND_EP93XX_SOC_I2S
-	select SND_SOC_CS4271_I2C if I2C
-	select SND_SOC_CS4271_SPI if SPI_MASTER
-	help
-	  Say Y or M here if you want to add support for I2S audio on the
-	  Cirrus Logic EDB93xx boards.
diff --git a/sound/soc/cirrus/Makefile b/sound/soc/cirrus/Makefile
index 19a86daad660..5916c03888cb 100644
--- a/sound/soc/cirrus/Makefile
+++ b/sound/soc/cirrus/Makefile
@@ -6,7 +6,3 @@ snd-soc-ep93xx-i2s-objs	 			:= ep93xx-i2s.o
 obj-$(CONFIG_SND_EP93XX_SOC)			+= snd-soc-ep93xx.o
 obj-$(CONFIG_SND_EP93XX_SOC_I2S)		+= snd-soc-ep93xx-i2s.o
 
-# EP93XX Machine Support
-snd-soc-edb93xx-objs				:= edb93xx.o
-
-obj-$(CONFIG_SND_EP93XX_SOC_EDB93XX)		+= snd-soc-edb93xx.o
diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
deleted file mode 100644
index f49caab21a25..000000000000
--- a/sound/soc/cirrus/edb93xx.c
+++ /dev/null
@@ -1,117 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SoC audio for EDB93xx
- *
- * Copyright (c) 2010 Alexander Sverdlin <subaparts@yandex.ru>
- *
- * This driver support CS4271 codec being master or slave, working
- * in control port mode, connected either via SPI or I2C.
- * The data format accepted is I2S or left-justified.
- * DAPM support not implemented.
- */
-
-#include <linux/platform_device.h>
-#include <linux/gpio.h>
-#include <linux/module.h>
-#include <linux/soc/cirrus/ep93xx.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
-#include <asm/mach-types.h>
-
-static int edb93xx_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	int err;
-	unsigned int mclk_rate;
-	unsigned int rate = params_rate(params);
-
-	/*
-	 * According to CS4271 datasheet we use MCLK/LRCK=256 for
-	 * rates below 50kHz and 128 for higher sample rates
-	 */
-	if (rate < 50000)
-		mclk_rate = rate * 64 * 4;
-	else
-		mclk_rate = rate * 64 * 2;
-
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk_rate,
-				     SND_SOC_CLOCK_IN);
-	if (err)
-		return err;
-
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_rate,
-				      SND_SOC_CLOCK_OUT);
-}
-
-static const struct snd_soc_ops edb93xx_ops = {
-	.hw_params	= edb93xx_hw_params,
-};
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_CPU("ep93xx-i2s")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("spi0.0", "cs4271-hifi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("ep93xx-i2s")));
-
-static struct snd_soc_dai_link edb93xx_dai = {
-	.name		= "CS4271",
-	.stream_name	= "CS4271 HiFi",
-	.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBC_CFC,
-	.ops		= &edb93xx_ops,
-	SND_SOC_DAILINK_REG(hifi),
-};
-
-static struct snd_soc_card snd_soc_edb93xx = {
-	.name		= "EDB93XX",
-	.owner		= THIS_MODULE,
-	.dai_link	= &edb93xx_dai,
-	.num_links	= 1,
-};
-
-static int edb93xx_probe(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = &snd_soc_edb93xx;
-	int ret;
-
-	ret = ep93xx_i2s_acquire();
-	if (ret)
-		return ret;
-
-	card->dev = &pdev->dev;
-
-	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-			ret);
-		ep93xx_i2s_release();
-	}
-
-	return ret;
-}
-
-static void edb93xx_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-	ep93xx_i2s_release();
-}
-
-static struct platform_driver edb93xx_driver = {
-	.driver		= {
-		.name	= "edb93xx-audio",
-	},
-	.probe		= edb93xx_probe,
-	.remove_new	= edb93xx_remove,
-};
-
-module_platform_driver(edb93xx_driver);
-
-MODULE_AUTHOR("Alexander Sverdlin <subaparts@yandex.ru>");
-MODULE_DESCRIPTION("ALSA SoC EDB93xx");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:edb93xx-audio");

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
