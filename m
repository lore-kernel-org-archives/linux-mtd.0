Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D9DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3iswcKYwEiW3BJ0FrueOY4n0FiE4xmNYuObj5lz+LA=; b=Ac6rWX4YUnOGvd
	q2iG9XRjdjrEd0H4cHeu69HzPcP9bcsTbCQr19OUX9AzXRVBYk7tyrsAEiovtFrqMGvzZpa7+4olX
	UepFosq4i38pq9CJiEndxqj+395mk3EgHvuds/EQpUh8qydOJ6AE72Kx3xdLfBrF8pWIX3AsKgR3l
	EDR4CW+VoOz0qlBMBGxCKvuJY+n/X8ivezN1dMQQiuw9nYO79OfpllEJbmGYBCel2hkVrnHz7Roh9
	PQjthpKv84RMhLDCWGhCN+OlDZurbtm4k4pc8op+/aqyM9gb2JMVZznLeo/u7S2HBnx9psT4ZvOCG
	78KyxhAlLHf8UUnmiBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrKH-0059i9-Oq; Tue, 19 Apr 2022 17:07:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqvZ-004xRQ-3X; Tue, 19 Apr 2022 16:42:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8045761868;
 Tue, 19 Apr 2022 16:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61CCC385AC;
 Tue, 19 Apr 2022 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386528;
 bh=pMXP3tiz+pXmptnDBsvlTEJvLY7a6WjIQlAUDseVC7c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WNtq6L7kYzLqPo1CgDnRfCSkhbU40rWot44wiH0w7KY5q5PTaeX6yBsSjejpCMIO5
 7YyF6BGgXkj9KCnK6hk1vKyGqJQqYGi0k986h/js2Dhzln1p0JAC3zoc9J0QoVPOEL
 TweRk/7T+kSDIDXkf8Ls1dRyo2LMdJPLhNkThXg9d52y29Ru+lYVKiNP2G3UFkn5vQ
 cGC7cmPNtQJ2U0GFsNug3uLKlp06uWSZX6uTKLJ1lTu+kvNpDykOw9NqOoWZtYj2UY
 ruEFGMjX0RkqbWcX1HOwB0ciYaSwKKyyeA+rysBsucYttmfP/kQc1miV4a16y8Cds+
 GVXQTXNlRlmpA==
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
Subject: [PATCH 25/48] ARM: pxa: zylonite: use gpio lookup instead mfp header
Date: Tue, 19 Apr 2022 18:37:47 +0200
Message-Id: <20220419163810.2118169-26-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094209_297005_9FD695B9 
X-CRM114-Status: GOOD (  21.85  )
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

The mach/mfp.h header is only used by this one driver
for hardcoded gpio numbers. Change that to use a lookup
table instead.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/zylonite.c                | 31 +++++++++++++++++++++
 drivers/input/touchscreen/zylonite-wm97xx.c | 20 +++++++------
 2 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index c48dd6d03df9..ba6dc86da855 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -32,6 +32,7 @@
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
+#include <mach/mfp.h>
 
 #include "devices.h"
 #include "generic.h"
@@ -425,6 +426,35 @@ static void __init zylonite_init_ohci(void)
 static inline void zylonite_init_ohci(void) {}
 #endif /* CONFIG_USB_OHCI_HCD || CONFIG_USB_OHCI_HCD_MODULE */
 
+static struct gpiod_lookup_table zylonite_wm97xx_touch_gpio15_table = {
+	.dev_id = "wm97xx-touch.0",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", mfp_to_gpio(MFP_PIN_GPIO15),
+			    "touch", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table zylonite_wm97xx_touch_gpio26_table = {
+	.dev_id = "wm97xx-touch.0",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", mfp_to_gpio(MFP_PIN_GPIO26),
+			    "touch", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+static void __init zylonite_init_wm97xx_touch(void)
+{
+	if (!IS_ENABLED(CONFIG_TOUCHSCREEN_WM97XX_ZYLONITE))
+		return;
+
+	if (cpu_is_pxa320())
+		gpiod_add_lookup_table(&zylonite_wm97xx_touch_gpio15_table);
+	else
+		gpiod_add_lookup_table(&zylonite_wm97xx_touch_gpio26_table);
+}
+
 static void __init zylonite_init(void)
 {
 	pxa_set_ffuart_info(NULL);
@@ -450,6 +480,7 @@ static void __init zylonite_init(void)
 	zylonite_init_nand();
 	zylonite_init_leds();
 	zylonite_init_ohci();
+	zylonite_init_wm97xx_touch();
 }
 
 MACHINE_START(ZYLONITE, "PXA3xx Platform Development Kit (aka Zylonite)")
diff --git a/drivers/input/touchscreen/zylonite-wm97xx.c b/drivers/input/touchscreen/zylonite-wm97xx.c
index f57bdf083188..cabdd6e3c6f8 100644
--- a/drivers/input/touchscreen/zylonite-wm97xx.c
+++ b/drivers/input/touchscreen/zylonite-wm97xx.c
@@ -17,14 +17,13 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/soc/pxa/cpu.h>
 #include <linux/wm97xx.h>
 
-#include <mach/mfp.h>
 #include <mach/regs-ac97.h>
 
 struct continuous {
@@ -181,14 +180,17 @@ static struct wm97xx_mach_ops zylonite_mach_ops = {
 static int zylonite_wm97xx_probe(struct platform_device *pdev)
 {
 	struct wm97xx *wm = platform_get_drvdata(pdev);
-	int gpio_touch_irq;
-
-	if (cpu_is_pxa320())
-		gpio_touch_irq = mfp_to_gpio(MFP_PIN_GPIO15);
-	else
-		gpio_touch_irq = mfp_to_gpio(MFP_PIN_GPIO26);
+	struct gpio_desc *gpio_touch_irq;
+	int err;
+
+	gpio_touch_irq = devm_gpiod_get(&pdev->dev, "touch", GPIOD_IN);
+	err = PTR_ERR_OR_ZERO(gpio_touch_irq);
+	if (err) {
+		dev_err(&pdev->dev, "Cannot get irq gpio: %d\n", err);
+		return err;
+	}
 
-	wm->pen_irq = gpio_to_irq(gpio_touch_irq);
+	wm->pen_irq = gpiod_to_irq(gpio_touch_irq);
 	irq_set_irq_type(wm->pen_irq, IRQ_TYPE_EDGE_BOTH);
 
 	wm97xx_config_gpio(wm, WM97XX_GPIO_13, WM97XX_GPIO_IN,
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
