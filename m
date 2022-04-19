Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B28DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hu5iGuVg+zoyx9kvyQx2dot7ljBDD1mM4za4gYLSxqA=; b=en4I5g5zmbBThq
	UaaINEz1Z1qXf5s8LyiG/WGnED8DAJdulyspR5e0+55BEnE+yVCOeEQTKarHlrdxwxXGIrvEDw0DR
	AZQnltMFqxcgI8K+/R4r4dMrHlPusEBFkhZWv+EE/fZRuA3B6A9z+MEqT5GVq7vFVfe4CKeXRSKB8
	a9ZoGnNIV4qj1QWVRydUcZf0MmAXfLyUO0BDF5rsyTJ+SBh6GRB4HlmBjCyAslaQSy2Oo0dDmtyu7
	wO3WxWcRIhsUnQM7B+GprDbzymBlFK9poB/YLG7BaiqYjUhGPxxllSLxLC23bZ8BFSSeC/mVwFl1A
	BP1kJ0z/m6murH0wDHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrOC-005Bk1-1v; Tue, 19 Apr 2022 17:11:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqvw-004xgO-Eu; Tue, 19 Apr 2022 16:42:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED60461870;
 Tue, 19 Apr 2022 16:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A777C385AC;
 Tue, 19 Apr 2022 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386551;
 bh=ZitIFNWOGNclnWEkC5k5wKgP8LZADBB8lqdOWZNB8wQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M+b/M4GGqpVoZ/vtuDGOrUAXIOp7QmnE+sliunl9FKuasZGbZF8J7WC0f5+dwHIfV
 QC+dZIBkk7Hf4pg+kZCT8EC/A41AqH2ENGG3vZIkxJLPpRBM+Aex4V3HjClb5ZY2s8
 QXyUz7wFF1e86cNx2J/LH32cIfYAT9jRVz/3EZvQYWNJDZXGGvuD5wmAvR7FCCQYz2
 NZPv5X3QIar8bWv9pUOFMdDuQHRolS5csdfPn4P7i2wmWxafJsowCMdw66MeqUo3e4
 4cfMCEif39tK7z2xRA3fIStlRIiOkBAdJrgnC88utYEWooh/HHVaMdBdkWFUYWuz/m
 6oQTHQqp34oXw==
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
Subject: [PATCH 28/48] Input: touchscreen: use wrapper for pxa2xx ac97
 registers
Date: Tue, 19 Apr 2022 18:37:50 +0200
Message-Id: <20220419163810.2118169-29-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094232_676368_0D46A124 
X-CRM114-Status: GOOD (  20.81  )
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

To avoid a dependency on the pxa platform header files with
hardcoded registers, change the driver to call a wrapper
in the pxa2xx-ac97-lib that encapsulates all the other
ac97 stuff.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-input@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/Kconfig            |  2 ++
 drivers/input/touchscreen/mainstone-wm97xx.c | 16 ++++++++--------
 drivers/input/touchscreen/zylonite-wm97xx.c  | 12 ++++++------
 include/sound/pxa2xx-lib.h                   |  4 ++++
 sound/arm/pxa2xx-ac97-lib.c                  | 12 ++++++++++++
 5 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 43c7d6e5bdc0..2d70c945b20a 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -902,6 +902,7 @@ config TOUCHSCREEN_WM9713
 config TOUCHSCREEN_WM97XX_MAINSTONE
 	tristate "WM97xx Mainstone/Palm accelerated touch"
 	depends on TOUCHSCREEN_WM97XX && ARCH_PXA
+	depends on SND_PXA2XX_LIB_AC97
 	help
 	  Say Y here for support for streaming mode with WM97xx touchscreens
 	  on Mainstone, Palm Tungsten T5, TX and LifeDrive systems.
@@ -914,6 +915,7 @@ config TOUCHSCREEN_WM97XX_MAINSTONE
 config TOUCHSCREEN_WM97XX_ZYLONITE
 	tristate "Zylonite accelerated touch"
 	depends on TOUCHSCREEN_WM97XX && MACH_ZYLONITE
+	depends on SND_PXA2XX_LIB_AC97
 	select TOUCHSCREEN_WM9713
 	help
 	  Say Y here for support for streaming mode with the touchscreen
diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 940d3c92b1f8..8f6fe68f1f99 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -28,7 +28,7 @@
 #include <linux/soc/pxa/cpu.h>
 #include <linux/wm97xx.h>
 
-#include <mach/regs-ac97.h>
+#include <sound/pxa2xx-lib.h>
 
 #include <asm/mach-types.h>
 
@@ -104,11 +104,11 @@ static void wm97xx_acc_pen_up(struct wm97xx *wm)
 	msleep(1);
 
 	if (cpu_is_pxa27x()) {
-		while (MISR & (1 << 2))
-			MODR;
+		while (pxa2xx_ac97_read_misr() & (1 << 2))
+			pxa2xx_ac97_read_modr();
 	} else if (cpu_is_pxa3xx()) {
 		for (count = 0; count < 16; count++)
-			MODR;
+			pxa2xx_ac97_read_modr();
 	}
 }
 
@@ -130,7 +130,7 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 		return RC_PENUP;
 	}
 
-	x = MODR;
+	x = pxa2xx_ac97_read_modr();
 	if (x == last) {
 		tries++;
 		return RC_AGAIN;
@@ -138,10 +138,10 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 	last = x;
 	do {
 		if (reads)
-			x = MODR;
-		y = MODR;
+			x = pxa2xx_ac97_read_modr();
+		y = pxa2xx_ac97_read_modr();
 		if (pressure)
-			p = MODR;
+			p = pxa2xx_ac97_read_modr();
 
 		dev_dbg(wm->dev, "Raw coordinates: x=%x, y=%x, p=%x\n",
 			x, y, p);
diff --git a/drivers/input/touchscreen/zylonite-wm97xx.c b/drivers/input/touchscreen/zylonite-wm97xx.c
index cabdd6e3c6f8..ed7eae638713 100644
--- a/drivers/input/touchscreen/zylonite-wm97xx.c
+++ b/drivers/input/touchscreen/zylonite-wm97xx.c
@@ -24,7 +24,7 @@
 #include <linux/soc/pxa/cpu.h>
 #include <linux/wm97xx.h>
 
-#include <mach/regs-ac97.h>
+#include <sound/pxa2xx-lib.h>
 
 struct continuous {
 	u16 id;    /* codec id */
@@ -79,7 +79,7 @@ static void wm97xx_acc_pen_up(struct wm97xx *wm)
 	msleep(1);
 
 	for (i = 0; i < 16; i++)
-		MODR;
+		pxa2xx_ac97_read_modr();
 }
 
 static int wm97xx_acc_pen_down(struct wm97xx *wm)
@@ -100,7 +100,7 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 		return RC_PENUP;
 	}
 
-	x = MODR;
+	x = pxa2xx_ac97_read_modr();
 	if (x == last) {
 		tries++;
 		return RC_AGAIN;
@@ -108,10 +108,10 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 	last = x;
 	do {
 		if (reads)
-			x = MODR;
-		y = MODR;
+			x = pxa2xx_ac97_read_modr();
+		y = pxa2xx_ac97_read_modr();
 		if (pressure)
-			p = MODR;
+			p = pxa2xx_ac97_read_modr();
 
 		dev_dbg(wm->dev, "Raw coordinates: x=%x, y=%x, p=%x\n",
 			x, y, p);
diff --git a/include/sound/pxa2xx-lib.h b/include/sound/pxa2xx-lib.h
index 95100cff25d1..0a6f8dabf8c4 100644
--- a/include/sound/pxa2xx-lib.h
+++ b/include/sound/pxa2xx-lib.h
@@ -52,4 +52,8 @@ extern int pxa2xx_ac97_hw_resume(void);
 extern int pxa2xx_ac97_hw_probe(struct platform_device *dev);
 extern void pxa2xx_ac97_hw_remove(struct platform_device *dev);
 
+/* modem registers, used by touchscreen driver */
+u32 pxa2xx_ac97_read_modr(void);
+u32 pxa2xx_ac97_read_misr(void);
+
 #endif
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 8c79d224f03b..572b73d73762 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -428,6 +428,18 @@ void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_remove);
 
+u32 pxa2xx_ac97_read_modr(void)
+{
+	return MODR;
+}
+EXPORT_SYMBOL_GPL(pxa2xx_ac97_read_modr);
+
+u32 pxa2xx_ac97_read_misr(void)
+{
+	return MISR;
+}
+EXPORT_SYMBOL_GPL(pxa2xx_ac97_read_misr);
+
 MODULE_AUTHOR("Nicolas Pitre");
 MODULE_DESCRIPTION("Intel/Marvell PXA sound library");
 MODULE_LICENSE("GPL");
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
