Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618FEC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ac5n3PV3vaPk2fugdDMQOJFopR/DYyYgrar0gS2VWJg=; b=ppDiSsMcj7r1iA
	nTBo9h3c84gAqB8uTE/tVWhxNmWG+E2TAQnx5Mmje3tivvVdmRiRGBfsmsAVcbjB50rufRiqN/xwz
	N/aM1nEbckeNWrj1HBAIsrfl9f9ON0kotF7ZwhDI9kA85FR23TsRZJ8bdSIz+Ls0OgK3zh/70dCid
	WHprkX6t2JV0l4MkzPyMHX4wAD0luVHnZ/d6pTbq+2+xTU6HGVxoRJbhaCB4rnBUpu4Nk+z/L/B/6
	W+8cdMQOEtGZhBA5eAwbSF+Z88vxYv/i4r9yRuy4BPWHq6k+vO5tCEW0JRe1EWFizaW4+/YbkH9dB
	La9DbenO19FkOPKloOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngr9C-0054Kj-60; Tue, 19 Apr 2022 16:56:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngquK-004wgB-Ml; Tue, 19 Apr 2022 16:40:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57A46B819F8;
 Tue, 19 Apr 2022 16:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8675C385AD;
 Tue, 19 Apr 2022 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386450;
 bh=jhDfr1ZWF3PO87dsTFnhjEgY7CrgFIhStoxQAjgbO8c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IQZbCphc2aVG/7nQPc8i6SmaXQBHDLcd8lu8VCmzfuxTE9zQ1fttSmG7EuqkoEKfV
 +AijdqGUGVaVV7Gc6JQtpvmfbM8oJLiqSVhH1EBaliC1N03xEc1T1smfyTfNlPQ+ci
 g7D2ubLO4DZSZbQ1S7mLLZAjhkr/Lf9nzpyNW7rUgW2JoDBYVacKhRiIFK/VFk/Xdk
 UDw/LuEvBj9xe6IYc/bXh3fl9uuuA9b3Lcl7FHH7ZpoOjUIFEYceuWcUa/cIuAsEha
 DxLdKbU1RVdss4xqHuQUN0IBiEAqCfNSmrZdnpLyeTBHr4KtQrWshWX4LLED0dDmoN
 GxgomaIMHhKEQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>,
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, patches@opensource.cirrus.com,
 linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
Subject: [PATCH 15/48] ARM: pxa: tosa: use gpio descriptor for audio
Date: Tue, 19 Apr 2022 18:37:37 +0200
Message-Id: <20220419163810.2118169-16-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094053_075405_5E8D2D52 
X-CRM114-Status: GOOD (  21.25  )
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

From: Arnd Bergmann <arnd@arndb.de>

The audio driver should not use a hardwired gpio number
from the header. Change it to use a lookup table.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/tosa.c | 12 ++++++++++++
 sound/soc/pxa/tosa.c     | 16 +++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 9476ed0f55e9..5a16a025192c 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -887,6 +887,17 @@ static struct platform_device wm9712_device = {
 	.id	= -1,
 };
 
+static struct gpiod_lookup_table tosa_audio_gpio_table = {
+	.dev_id = "tosa-audio",
+	.table = {
+		GPIO_LOOKUP("tc6393xb",
+			    TOSA_GPIO_L_MUTE - TOSA_TC6393XB_GPIO_BASE,
+			    "l-mute", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+
 static struct platform_device tosa_audio_device = {
 	.name	= "tosa-audio",
 	.id	= -1,
@@ -944,6 +955,7 @@ static void __init tosa_init(void)
 	PMCR = 0x01;
 
 	gpiod_add_lookup_table(&tosa_mci_gpio_table);
+	gpiod_add_lookup_table(&tosa_audio_gpio_table);
 	pxa_set_mci_info(&tosa_mci_platform_data);
 	pxa_set_ficp_info(&tosa_ficp_platform_data);
 	pxa_set_i2c_info(NULL);
diff --git a/sound/soc/pxa/tosa.c b/sound/soc/pxa/tosa.c
index 06226f9b863e..157e6bcacffd 100644
--- a/sound/soc/pxa/tosa.c
+++ b/sound/soc/pxa/tosa.c
@@ -16,14 +16,13 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <mach/tosa.h>
 #include <linux/platform_data/asoc-pxa.h>
 
 #define TOSA_HP        0
@@ -35,6 +34,7 @@
 
 static int tosa_jack_func;
 static int tosa_spk_func;
+static struct gpio_desc *l_mute_gpio;
 
 static void tosa_ext_control(struct snd_soc_dapm_context *dapm)
 {
@@ -128,7 +128,7 @@ static int tosa_set_spk(struct snd_kcontrol *kcontrol,
 static int tosa_hp_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(TOSA_GPIO_L_MUTE, SND_SOC_DAPM_EVENT_ON(event) ? 1 : 0);
+	gpiod_set_value(l_mute_gpio, SND_SOC_DAPM_EVENT_ON(event) ? 1 : 0);
 	return 0;
 }
 
@@ -222,25 +222,23 @@ static int tosa_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &tosa;
 	int ret;
 
-	ret = gpio_request_one(TOSA_GPIO_L_MUTE, GPIOF_OUT_INIT_LOW,
-			       "Headphone Jack");
+	l_mute_gpio = devm_gpiod_get(&pdev->dev, "l-mute", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(l_mute_gpio);
 	if (ret)
 		return ret;
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
-		gpio_free(TOSA_GPIO_L_MUTE);
-	}
+
 	return ret;
 }
 
 static int tosa_remove(struct platform_device *pdev)
 {
-	gpio_free(TOSA_GPIO_L_MUTE);
 	return 0;
 }
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
