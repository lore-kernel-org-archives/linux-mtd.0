Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4981EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Addb4UEiquXqwICdiy1L910D6n86s2zkxaLKMY6Qvfw=; b=3J2SUVIXQKBArR
	AJlhiTUw8CEAbCbHRv08KHjUfPt4Ed4q/gorHZ1BNCUvNtlM69S0MFSCeZZ0L/Hsxhcvxv6oTW/wv
	wepY9OVvsTiPB4LMYZm/2CWF9kD43H7vrB/6IkI2HvcqzoNi9i+W3BJQDxgb1wKVQ8dLh6ZrWSb9n
	ToBhKD+6+eCAPPyyG/cjh76vtT3YrGwThOlECSc5P1sJ2nVYaD/MXAcXLIh3jZ8TcyARSCDFq7J/Q
	7F0smC88LusFtvizCa5GoYL662clt7SE/EnogHQ/qbeXLFecK7h7ofghCgth7Vg7bUQQqkDdMghfM
	HqPf/PEjPKLjro1HtbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrJO-0059Eh-Kn; Tue, 19 Apr 2022 17:06:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqvT-004xNR-1X; Tue, 19 Apr 2022 16:42:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92706B819DE;
 Tue, 19 Apr 2022 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A17C385AE;
 Tue, 19 Apr 2022 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386520;
 bh=vkbNMot1HaZLmF1XKNGCizpp67huD2tFJl0uD4gcruA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FSCbZpV1Dc9c7lTc/j0AP0FhjBo0afHIiy8rSFm4J/COwse/hlE0MWtRdvFHeiMXM
 4ksw2hp7kEcEo4tbc46HfPt8ZVavi3JNqVWlbeyRH559HmFG+FH+7d9mnWOqfvDYZM
 HN+N3F3N13povD3AscGRy7ycI594O9fAs0HfDIxVJbBSXoHKMaeZruEjL1amcbSbrI
 J9jkxz9AnOTZDgxht0kvzZJsFNe3GuYjqehOo7xje4o0kHt9NgweFyW0d+C0dKADlu
 BgMJln0qIyDqp4gJ2N6G44SYtjHA+7UbS+mSA0MqYyNc/qyiJmB+yOhR9A6R35UYyb
 3Yf66fWoNuKNA==
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
Subject: [PATCH 24/48] ARM: pxa: mainstone-wm97xx: use gpio lookup table
Date: Tue, 19 Apr 2022 18:37:46 +0200
Message-Id: <20220419163810.2118169-25-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094203_467013_95090C0C 
X-CRM114-Status: GOOD (  22.82  )
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

This driver hardcodes gpio numbers without a header file.
Use lookup tables instead.

Cc: Marek Vasut <marek.vasut@gmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c                |  9 +++++
 arch/arm/mach-pxa/palmld.c                   |  9 +++++
 arch/arm/mach-pxa/palmt5.c                   |  9 +++++
 arch/arm/mach-pxa/palmtx.c                   |  9 +++++
 drivers/input/touchscreen/mainstone-wm97xx.c | 35 ++++++++------------
 5 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index f0072e63b456..599736c93163 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -548,6 +548,14 @@ static struct gpiod_lookup_table mainstone_pcmcia_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table mainstone_wm97xx_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 4, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init mainstone_init(void)
 {
 	int SW7 = 0;  /* FIXME: get from SCR (Mst doc section 3.2.1.1) */
@@ -562,6 +570,7 @@ static void __init mainstone_init(void)
 		      "mst-pcmcia1", MST_PCMCIA_INPUTS, 0, NULL,
 		      NULL, mst_pcmcia1_irqs);
 	gpiod_add_lookup_table(&mainstone_pcmcia_gpio_table);
+	gpiod_add_lookup_table(&mainstone_wm97xx_gpio_table);
 
 	pxa_set_ffuart_info(NULL);
 	pxa_set_btuart_info(NULL);
diff --git a/arch/arm/mach-pxa/palmld.c b/arch/arm/mach-pxa/palmld.c
index d821606ce0b5..32308c63884e 100644
--- a/arch/arm/mach-pxa/palmld.c
+++ b/arch/arm/mach-pxa/palmld.c
@@ -347,6 +347,14 @@ static struct gpiod_lookup_table palmld_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmld_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmld_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmld_pin_config));
@@ -355,6 +363,7 @@ static void __init palmld_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmld_mci_gpio_table);
+	gpiod_add_lookup_table(&palmld_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMLD_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_irda_init(GPIO_NR_PALMLD_IR_DISABLE);
diff --git a/arch/arm/mach-pxa/palmt5.c b/arch/arm/mach-pxa/palmt5.c
index 460a8b1043a5..463b62ec1b01 100644
--- a/arch/arm/mach-pxa/palmt5.c
+++ b/arch/arm/mach-pxa/palmt5.c
@@ -190,6 +190,14 @@ static struct gpiod_lookup_table palmt5_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmt5_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmt5_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmt5_pin_config));
@@ -198,6 +206,7 @@ static void __init palmt5_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmt5_mci_gpio_table);
+	gpiod_add_lookup_table(&palmt5_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMT5_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_udc_init(GPIO_NR_PALMT5_USB_DETECT_N,
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index 86460d6ea721..c0d0762540ab 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -345,6 +345,14 @@ static struct gpiod_lookup_table palmtx_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmtx_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmtx_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmtx_pin_config));
@@ -353,6 +361,7 @@ static void __init palmtx_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmtx_mci_gpio_table);
+	gpiod_add_lookup_table(&palmtx_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMTX_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_udc_init(GPIO_NR_PALMTX_USB_DETECT_N,
diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index f8564b398eb3..87655105ef3a 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -21,6 +21,7 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/wm97xx.h>
@@ -58,7 +59,7 @@ static const struct continuous cinfo[] = {
 /* continuous speed index */
 static int sp_idx;
 static u16 last, tries;
-static int irq;
+static struct gpio_desc *gpiod_irq;
 
 /*
  * Pen sampling frequency (Hz) in continuous mode.
@@ -194,28 +195,21 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 	/* IRQ driven touchscreen is used on Palm hardware */
 	if (machine_is_palmt5() || machine_is_palmtx() || machine_is_palmld()) {
 		pen_int = 1;
-		irq = 27;
 		/* There is some obscure mutant of WM9712 interbred with WM9713
 		 * used on Palm HW */
 		wm->variant = WM97xx_WM1613;
-	} else if (machine_is_mainstone() && pen_int)
-		irq = 4;
-
-	if (irq) {
-		ret = gpio_request(irq, "Touchscreen IRQ");
-		if (ret)
-			goto out;
-
-		ret = gpio_direction_input(irq);
-		if (ret) {
-			gpio_free(irq);
-			goto out;
-		}
+	}
+
+	if (pen_int) {
+		gpiod_irq = gpiod_get(wm->dev, "touch", GPIOD_IN);
+		if (IS_ERR(gpiod_irq))
+			pen_int = 0;
+	}
 
-		wm->pen_irq = gpio_to_irq(irq);
+	if (pen_int) {
+		wm->pen_irq = gpiod_to_irq(gpiod_irq);
 		irq_set_irq_type(wm->pen_irq, IRQ_TYPE_EDGE_BOTH);
-	} else /* pen irq not supported */
-		pen_int = 0;
+	}
 
 	/* codec specific irq config */
 	if (pen_int) {
@@ -242,7 +236,6 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 		}
 	}
 
-out:
 	return ret;
 }
 
@@ -250,8 +243,8 @@ static void wm97xx_acc_shutdown(struct wm97xx *wm)
 {
 	/* codec specific deconfig */
 	if (pen_int) {
-		if (irq)
-			gpio_free(irq);
+		if (gpiod_irq)
+			gpiod_put(gpiod_irq);
 		wm->pen_irq = 0;
 	}
 }
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
