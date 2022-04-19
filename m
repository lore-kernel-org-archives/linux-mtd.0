Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003EFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijQeKmIaKvxzSS8w3j9zbs2AJ4jxy7L2xkgJ7kMDbQw=; b=d7cFaT1Ef+f8PK
	DntyJ/nmtF4Oy4YVlrAEIUTEQybzDciG17kbKDlGOKX6vsKVFsPf3TEfIZmv+zYFGhb/OnnDtZRrH
	56OSheJCQRvwaarWY3qV/0i0cAXykXlCnr/Hm0T3kgvVdz8Hww/nN9Ss9QSkgxR0QsX+yytW32UD/
	CalURzMK8Km2QTqUUmpaYTSRIZC7Mqb219oxdPh5cA0X12zLdtRV36+zRk6+bcSDPQl1VMD1osyTm
	zVQW/Qj5TCk1UgnOJ/AzGSIqJz+z9+JMhmt93c58JOOZTm8kLhaG75ten1uRUkREx4hRed9K9X2g3
	xFUV2b7HYlR21ZwBgk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrMR-005Atn-PM; Tue, 19 Apr 2022 17:09:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqvo-004xae-PX; Tue, 19 Apr 2022 16:42:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5004D60FAC;
 Tue, 19 Apr 2022 16:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553D4C385B2;
 Tue, 19 Apr 2022 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386543;
 bh=6Eb0nGTaa7inf2nC5qlMl31pJtmtNV3Kf+5eTPa8gHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CO7rCBuiK9AhgJ1IN4juEhgPNA30YC1p9bh8jWaUqHGuF4U7X5oPW4dLW8Qx7dH/V
 jvdLKFa39OvNa7NZiQZbpgXdY+4Y0fqRg3TgoutA+QCdu2NJzIaHcruOhT9c3p1SDy
 3KlM2qB9EABeNVlsHNOzcPl2/Lnre9Pp72kx4xJWxjfgCC05fTm6GM4XpLJuyyFN7h
 yMNiNpSV8C2fa04ZvzNIZlUIWviLtB4PbO9u6GRPuJD4EH8ktQOkKpk8PSuyFz+kwt
 5PbzTtheQR4cPnNU0VxZP6tU2sx1Pr8qNnC/9Jq0pXnEmKBR6/jlL/DmG5xx/wjiXz
 T4Z3ivbgbNP9A==
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
Subject: [PATCH 27/48] input: touchscreen: mainstone: sync with zylonite driver
Date: Tue, 19 Apr 2022 18:37:49 +0200
Message-Id: <20220419163810.2118169-28-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094224_958868_1F6D3224 
X-CRM114-Status: GOOD (  25.27  )
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

The two drivers are almost identical and can work on a variety
of hardware in principle. The mainstone driver supports additional
hardware, and the zylonite driver has a few cleanup patches.

Sync the two by adding the zylonite changes into the mainstone
one, and checking for the zylonite board to order to keep the
default behavior (interrupt enabled) there.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/mainstone-wm97xx.c | 59 ++++++++++----------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 618c80847d9f..940d3c92b1f8 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -24,9 +24,9 @@
 #include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/wm97xx.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/soc/pxa/cpu.h>
+#include <linux/wm97xx.h>
 
 #include <mach/regs-ac97.h>
 
@@ -42,23 +42,22 @@ struct continuous {
 #define WM_READS(sp) ((sp / HZ) + 1)
 
 static const struct continuous cinfo[] = {
-	{WM9705_ID2, 0, WM_READS(94), 94},
-	{WM9705_ID2, 1, WM_READS(188), 188},
-	{WM9705_ID2, 2, WM_READS(375), 375},
-	{WM9705_ID2, 3, WM_READS(750), 750},
-	{WM9712_ID2, 0, WM_READS(94), 94},
-	{WM9712_ID2, 1, WM_READS(188), 188},
-	{WM9712_ID2, 2, WM_READS(375), 375},
-	{WM9712_ID2, 3, WM_READS(750), 750},
-	{WM9713_ID2, 0, WM_READS(94), 94},
-	{WM9713_ID2, 1, WM_READS(120), 120},
-	{WM9713_ID2, 2, WM_READS(154), 154},
-	{WM9713_ID2, 3, WM_READS(188), 188},
+	{ WM9705_ID2, 0, WM_READS(94),  94  },
+	{ WM9705_ID2, 1, WM_READS(188), 188 },
+	{ WM9705_ID2, 2, WM_READS(375), 375 },
+	{ WM9705_ID2, 3, WM_READS(750), 750 },
+	{ WM9712_ID2, 0, WM_READS(94),  94  },
+	{ WM9712_ID2, 1, WM_READS(188), 188 },
+	{ WM9712_ID2, 2, WM_READS(375), 375 },
+	{ WM9712_ID2, 3, WM_READS(750), 750 },
+	{ WM9713_ID2, 0, WM_READS(94),  94  },
+	{ WM9713_ID2, 1, WM_READS(120), 120 },
+	{ WM9713_ID2, 2, WM_READS(154), 154 },
+	{ WM9713_ID2, 3, WM_READS(188), 188 },
 };
 
 /* continuous speed index */
 static int sp_idx;
-static u16 last, tries;
 static struct gpio_desc *gpiod_irq;
 
 /*
@@ -102,7 +101,7 @@ static void wm97xx_acc_pen_up(struct wm97xx *wm)
 {
 	unsigned int count;
 
-	schedule_timeout_uninterruptible(1);
+	msleep(1);
 
 	if (cpu_is_pxa27x()) {
 		while (MISR & (1 << 2))
@@ -117,13 +116,14 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 {
 	u16 x, y, p = 0x100 | WM97XX_ADCSEL_PRES;
 	int reads = 0;
+	static u16 last, tries;
 
 	/* When the AC97 queue has been drained we need to allow time
 	 * to buffer up samples otherwise we end up spinning polling
 	 * for samples.  The controller can't have a suitably low
 	 * threshold set to use the notifications it gives.
 	 */
-	schedule_timeout_uninterruptible(1);
+	msleep(1);
 
 	if (tries > 5) {
 		tries = 0;
@@ -193,6 +193,8 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 		/* There is some obscure mutant of WM9712 interbred with WM9713
 		 * used on Palm HW */
 		wm->variant = WM97xx_WM1613;
+	} else if (machine_is_zylonite()) {
+		pen_int = 1;
 	}
 
 	if (pen_int) {
@@ -253,13 +255,13 @@ static void wm97xx_irq_enable(struct wm97xx *wm, int enable)
 }
 
 static struct wm97xx_mach_ops mainstone_mach_ops = {
-	.acc_enabled = 1,
-	.acc_pen_up = wm97xx_acc_pen_up,
-	.acc_pen_down = wm97xx_acc_pen_down,
-	.acc_startup = wm97xx_acc_startup,
-	.acc_shutdown = wm97xx_acc_shutdown,
-	.irq_enable = wm97xx_irq_enable,
-	.irq_gpio = WM97XX_GPIO_2,
+	.acc_enabled	= 1,
+	.acc_pen_up	= wm97xx_acc_pen_up,
+	.acc_pen_down	= wm97xx_acc_pen_down,
+	.acc_startup	= wm97xx_acc_startup,
+	.acc_shutdown	= wm97xx_acc_shutdown,
+	.irq_enable	= wm97xx_irq_enable,
+	.irq_gpio	= WM97XX_GPIO_2,
 };
 
 static int mainstone_wm97xx_probe(struct platform_device *pdev)
@@ -274,14 +276,15 @@ static int mainstone_wm97xx_remove(struct platform_device *pdev)
 	struct wm97xx *wm = platform_get_drvdata(pdev);
 
 	wm97xx_unregister_mach_ops(wm);
+
 	return 0;
 }
 
 static struct platform_driver mainstone_wm97xx_driver = {
-	.probe = mainstone_wm97xx_probe,
-	.remove = mainstone_wm97xx_remove,
-	.driver = {
-		.name = "wm97xx-touch",
+	.probe	= mainstone_wm97xx_probe,
+	.remove	= mainstone_wm97xx_remove,
+	.driver	= {
+		.name	= "wm97xx-touch",
 	},
 };
 module_platform_driver(mainstone_wm97xx_driver);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
