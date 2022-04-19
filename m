Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6909CC43217
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAbpgNVGS6CvkBPaWltMoAk9dPOGtFKmNb5FJQZEilQ=; b=2QQ0Uvzv6/XL1E
	/rkziOKbwrUC9ssKIkJRJ/9lN2VH/++gx7w4orIfnHB9APfXcQ4ISjbBUEx6RlDYUj4Td+djDW36b
	ym5fAKTJKP2tsYn7Vs/RmNoZBXv4aH0P8/EAugLZ+pHRdDr1rFACFieFJ78Y7Frwpfqc4slkLTmFQ
	CJrema4v1jW41oZS3yZWibg1AGfoiouEzMwg2qVPhIbf5T+b5uHeGDp7m2wwFKl0WH60ZMNrS7TlD
	8VWI1b11xJSagKewdJQZSIYRX+263Ic8I8gM5yxIJahobJ6KNcFVyOBGWHCU/Fg7x5ZMUY34zwy7s
	IpH43LRTNmeC5mxHULNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrSB-005DiD-Mk; Tue, 19 Apr 2022 17:15:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqwR-004xzq-Ol; Tue, 19 Apr 2022 16:43:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F59961828;
 Tue, 19 Apr 2022 16:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ECDC385AD;
 Tue, 19 Apr 2022 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386582;
 bh=XMfk0O3QBhz94b688wif9fT9MesrG60MJQFx6+JOR7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OyQ0i3+beAWzJBfVtjzbEbEG6UQmG0elXn7H/64gtW2jdmo85cTny3DFofm4YWk26
 resGDEVxeYXDCEBoi+Mx+bHuhMlafP63G9kgkQD0pmbNlpXrgmphdLMFmSTDHKODM1
 jUS2PLlKyzCtItMP5m8BWr2O7h90mAv4o3gzr2csamszwUDnuuc/49xNa8395GBqWJ
 9gvv3KVEqBr8Fw340rBJDxyqUfV46LB5NeT2qOAhAiNk4ddchKUbBQTdHYcwd/MEej
 ov5g41F+UxI/Qn/rxpRwVLD2MlH238KoEwdQas8Sb+V8WiQeUGVN3Vz4ZKQ+DKjHlg
 vxdDK+bIiTV/Q==
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
Subject: [PATCH 32/48] ASoC: pxa: ac97: use normal MMIO accessors
Date: Tue, 19 Apr 2022 18:37:54 +0200
Message-Id: <20220419163810.2118169-33-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094303_960711_0921CB8D 
X-CRM114-Status: GOOD (  29.55  )
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

To avoid dereferencing hardwired constant pointers from a global header
file, change the driver to use devm_platform_ioremap_resource for getting
an __iomem pointer, and then using readl/writel on that.

Each pointer dereference gets changed by a search&replace, which leads
to a few overlong lines, but seems less risky than trying to clean up
the code at the same time.

Cc: alsa-devel@alsa-project.org
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/arm/pxa2xx-ac97-lib.c                   | 124 ++++++++++--------
 .../arm/pxa2xx-ac97-regs.h                    |  42 +++---
 sound/arm/pxa2xx-ac97.c                       |   1 -
 3 files changed, 92 insertions(+), 75 deletions(-)
 rename arch/arm/mach-pxa/include/mach/regs-ac97.h => sound/arm/pxa2xx-ac97-regs.h (71%)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 572b73d73762..e55c0421718b 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -21,15 +21,17 @@
 
 #include <sound/pxa2xx-lib.h>
 
-#include <mach/regs-ac97.h>
 #include <linux/platform_data/asoc-pxa.h>
 
+#include "pxa2xx-ac97-regs.h"
+
 static DEFINE_MUTEX(car_mutex);
 static DECLARE_WAIT_QUEUE_HEAD(gsr_wq);
 static volatile long gsr_bits;
 static struct clk *ac97_clk;
 static struct clk *ac97conf_clk;
 static int reset_gpio;
+static void __iomem *ac97_reg_base;
 
 extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
 
@@ -46,7 +48,7 @@ extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
 int pxa2xx_ac97_read(int slot, unsigned short reg)
 {
 	int val = -ENODEV;
-	volatile u32 *reg_addr;
+	u32 __iomem *reg_addr;
 
 	if (slot > 0)
 		return -ENODEV;
@@ -55,31 +57,33 @@ int pxa2xx_ac97_read(int slot, unsigned short reg)
 
 	/* set up primary or secondary codec space */
 	if (cpu_is_pxa25x() && reg == AC97_GPIO_STATUS)
-		reg_addr = slot ? &SMC_REG_BASE : &PMC_REG_BASE;
+		reg_addr = ac97_reg_base +
+			   (slot ? SMC_REG_BASE : PMC_REG_BASE);
 	else
-		reg_addr = slot ? &SAC_REG_BASE : &PAC_REG_BASE;
+		reg_addr = ac97_reg_base +
+			   (slot ? SAC_REG_BASE : PAC_REG_BASE);
 	reg_addr += (reg >> 1);
 
 	/* start read access across the ac97 link */
-	GSR = GSR_CDONE | GSR_SDONE;
+	writel(GSR_CDONE | GSR_SDONE, ac97_reg_base + GSR);
 	gsr_bits = 0;
-	val = (*reg_addr & 0xffff);
+	val = (readl(reg_addr) & 0xffff);
 	if (reg == AC97_GPIO_STATUS)
 		goto out;
-	if (wait_event_timeout(gsr_wq, (GSR | gsr_bits) & GSR_SDONE, 1) <= 0 &&
-	    !((GSR | gsr_bits) & GSR_SDONE)) {
+	if (wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE, 1) <= 0 &&
+	    !((readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE)) {
 		printk(KERN_ERR "%s: read error (ac97_reg=%d GSR=%#lx)\n",
-				__func__, reg, GSR | gsr_bits);
+				__func__, reg, readl(ac97_reg_base + GSR) | gsr_bits);
 		val = -ETIMEDOUT;
 		goto out;
 	}
 
 	/* valid data now */
-	GSR = GSR_CDONE | GSR_SDONE;
+	writel(GSR_CDONE | GSR_SDONE, ac97_reg_base + GSR);
 	gsr_bits = 0;
-	val = (*reg_addr & 0xffff);
+	val = (readl(reg_addr) & 0xffff);
 	/* but we've just started another cycle... */
-	wait_event_timeout(gsr_wq, (GSR | gsr_bits) & GSR_SDONE, 1);
+	wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE, 1);
 
 out:	mutex_unlock(&car_mutex);
 	return val;
@@ -88,25 +92,27 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_read);
 
 int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val)
 {
-	volatile u32 *reg_addr;
+	u32 __iomem *reg_addr;
 	int ret = 0;
 
 	mutex_lock(&car_mutex);
 
 	/* set up primary or secondary codec space */
 	if (cpu_is_pxa25x() && reg == AC97_GPIO_STATUS)
-		reg_addr = slot ? &SMC_REG_BASE : &PMC_REG_BASE;
+		reg_addr = ac97_reg_base +
+			   (slot ? SMC_REG_BASE : PMC_REG_BASE);
 	else
-		reg_addr = slot ? &SAC_REG_BASE : &PAC_REG_BASE;
+		reg_addr = ac97_reg_base +
+			   (slot ? SAC_REG_BASE : PAC_REG_BASE);
 	reg_addr += (reg >> 1);
 
-	GSR = GSR_CDONE | GSR_SDONE;
+	writel(GSR_CDONE | GSR_SDONE, ac97_reg_base + GSR);
 	gsr_bits = 0;
-	*reg_addr = val;
-	if (wait_event_timeout(gsr_wq, (GSR | gsr_bits) & GSR_CDONE, 1) <= 0 &&
-	    !((GSR | gsr_bits) & GSR_CDONE)) {
+	writel(val, reg_addr);
+	if (wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_CDONE, 1) <= 0 &&
+	    !((readl(ac97_reg_base + GSR) | gsr_bits) & GSR_CDONE)) {
 		printk(KERN_ERR "%s: write error (ac97_reg=%d GSR=%#lx)\n",
-				__func__, reg, GSR | gsr_bits);
+				__func__, reg, readl(ac97_reg_base + GSR) | gsr_bits);
 		ret = -EIO;
 	}
 
@@ -120,17 +126,17 @@ static inline void pxa_ac97_warm_pxa25x(void)
 {
 	gsr_bits = 0;
 
-	GCR |= GCR_WARM_RST;
+	writel(readl(ac97_reg_base + GCR) | (GCR_WARM_RST), ac97_reg_base + GCR);
 }
 
 static inline void pxa_ac97_cold_pxa25x(void)
 {
-	GCR &=  GCR_COLD_RST;  /* clear everything but nCRST */
-	GCR &= ~GCR_COLD_RST;  /* then assert nCRST */
+	writel(readl(ac97_reg_base + GCR) & ( GCR_COLD_RST), ac97_reg_base + GCR);  /* clear everything but nCRST */
+	writel(readl(ac97_reg_base + GCR) & (~GCR_COLD_RST), ac97_reg_base + GCR);  /* then assert nCRST */
 
 	gsr_bits = 0;
 
-	GCR = GCR_COLD_RST;
+	writel(GCR_COLD_RST, ac97_reg_base + GCR);
 }
 #endif
 
@@ -142,15 +148,15 @@ static inline void pxa_ac97_warm_pxa27x(void)
 	/* warm reset broken on Bulverde, so manually keep AC97 reset high */
 	pxa27x_configure_ac97reset(reset_gpio, true);
 	udelay(10);
-	GCR |= GCR_WARM_RST;
+	writel(readl(ac97_reg_base + GCR) | (GCR_WARM_RST), ac97_reg_base + GCR);
 	pxa27x_configure_ac97reset(reset_gpio, false);
 	udelay(500);
 }
 
 static inline void pxa_ac97_cold_pxa27x(void)
 {
-	GCR &=  GCR_COLD_RST;  /* clear everything but nCRST */
-	GCR &= ~GCR_COLD_RST;  /* then assert nCRST */
+	writel(readl(ac97_reg_base + GCR) & ( GCR_COLD_RST), ac97_reg_base + GCR);  /* clear everything but nCRST */
+	writel(readl(ac97_reg_base + GCR) & (~GCR_COLD_RST), ac97_reg_base + GCR);  /* then assert nCRST */
 
 	gsr_bits = 0;
 
@@ -158,7 +164,7 @@ static inline void pxa_ac97_cold_pxa27x(void)
 	clk_prepare_enable(ac97conf_clk);
 	udelay(5);
 	clk_disable_unprepare(ac97conf_clk);
-	GCR = GCR_COLD_RST | GCR_WARM_RST;
+	writel(GCR_COLD_RST | GCR_WARM_RST, ac97_reg_base + GCR);
 }
 #endif
 
@@ -168,26 +174,26 @@ static inline void pxa_ac97_warm_pxa3xx(void)
 	gsr_bits = 0;
 
 	/* Can't use interrupts */
-	GCR |= GCR_WARM_RST;
+	writel(readl(ac97_reg_base + GCR) | (GCR_WARM_RST), ac97_reg_base + GCR);
 }
 
 static inline void pxa_ac97_cold_pxa3xx(void)
 {
 	/* Hold CLKBPB for 100us */
-	GCR = 0;
-	GCR = GCR_CLKBPB;
+	writel(0, ac97_reg_base + GCR);
+	writel(GCR_CLKBPB, ac97_reg_base + GCR);
 	udelay(100);
-	GCR = 0;
+	writel(0, ac97_reg_base + GCR);
 
-	GCR &=  GCR_COLD_RST;  /* clear everything but nCRST */
-	GCR &= ~GCR_COLD_RST;  /* then assert nCRST */
+	writel(readl(ac97_reg_base + GCR) & ( GCR_COLD_RST), ac97_reg_base + GCR);  /* clear everything but nCRST */
+	writel(readl(ac97_reg_base + GCR) & (~GCR_COLD_RST), ac97_reg_base + GCR);  /* then assert nCRST */
 
 	gsr_bits = 0;
 
 	/* Can't use interrupts on PXA3xx */
-	GCR &= ~(GCR_PRIRDY_IEN|GCR_SECRDY_IEN);
+	writel(readl(ac97_reg_base + GCR) & (~(GCR_PRIRDY_IEN|GCR_SECRDY_IEN)), ac97_reg_base + GCR);
 
-	GCR = GCR_WARM_RST | GCR_COLD_RST;
+	writel(GCR_WARM_RST | GCR_COLD_RST, ac97_reg_base + GCR);
 }
 #endif
 
@@ -213,10 +219,10 @@ bool pxa2xx_ac97_try_warm_reset(void)
 #endif
 		snd_BUG();
 
-	while (!((GSR | gsr_bits) & (GSR_PCR | GSR_SCR)) && timeout--)
+	while (!((readl(ac97_reg_base + GSR) | gsr_bits) & (GSR_PCR | GSR_SCR)) && timeout--)
 		mdelay(1);
 
-	gsr = GSR | gsr_bits;
+	gsr = readl(ac97_reg_base + GSR) | gsr_bits;
 	if (!(gsr & (GSR_PCR | GSR_SCR))) {
 		printk(KERN_INFO "%s: warm reset timeout (GSR=%#lx)\n",
 				 __func__, gsr);
@@ -250,10 +256,10 @@ bool pxa2xx_ac97_try_cold_reset(void)
 #endif
 		snd_BUG();
 
-	while (!((GSR | gsr_bits) & (GSR_PCR | GSR_SCR)) && timeout--)
+	while (!((readl(ac97_reg_base + GSR) | gsr_bits) & (GSR_PCR | GSR_SCR)) && timeout--)
 		mdelay(1);
 
-	gsr = GSR | gsr_bits;
+	gsr = readl(ac97_reg_base + GSR) | gsr_bits;
 	if (!(gsr & (GSR_PCR | GSR_SCR))) {
 		printk(KERN_INFO "%s: cold reset timeout (GSR=%#lx)\n",
 				 __func__, gsr);
@@ -268,8 +274,10 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_try_cold_reset);
 
 void pxa2xx_ac97_finish_reset(void)
 {
-	GCR &= ~(GCR_PRIRDY_IEN|GCR_SECRDY_IEN);
-	GCR |= GCR_SDONE_IE|GCR_CDONE_IE;
+	u32 gcr = readl(ac97_reg_base + GCR);
+	gcr &= ~(GCR_PRIRDY_IEN|GCR_SECRDY_IEN);
+	gcr |= GCR_SDONE_IE|GCR_CDONE_IE;
+	writel(gcr, ac97_reg_base + GCR);
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_finish_reset);
 
@@ -277,9 +285,9 @@ static irqreturn_t pxa2xx_ac97_irq(int irq, void *dev_id)
 {
 	long status;
 
-	status = GSR;
+	status = readl(ac97_reg_base + GSR);
 	if (status) {
-		GSR = status;
+		writel(status, ac97_reg_base + GSR);
 		gsr_bits |= status;
 		wake_up(&gsr_wq);
 
@@ -287,9 +295,9 @@ static irqreturn_t pxa2xx_ac97_irq(int irq, void *dev_id)
 		   since they tend to spuriously trigger when MMC is used
 		   (hardware bug? go figure)... */
 		if (cpu_is_pxa27x()) {
-			MISR = MISR_EOC;
-			PISR = PISR_EOC;
-			MCSR = MCSR_EOC;
+			writel(MISR_EOC, ac97_reg_base + MISR);
+			writel(PISR_EOC, ac97_reg_base + PISR);
+			writel(MCSR_EOC, ac97_reg_base + MCSR);
 		}
 
 		return IRQ_HANDLED;
@@ -301,7 +309,7 @@ static irqreturn_t pxa2xx_ac97_irq(int irq, void *dev_id)
 #ifdef CONFIG_PM
 int pxa2xx_ac97_hw_suspend(void)
 {
-	GCR |= GCR_ACLINK_OFF;
+	writel(readl(ac97_reg_base + GCR) | (GCR_ACLINK_OFF), ac97_reg_base + GCR);
 	clk_disable_unprepare(ac97_clk);
 	return 0;
 }
@@ -321,6 +329,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	int irq;
 	pxa2xx_audio_ops_t *pdata = dev->dev.platform_data;
 
+	ac97_reg_base = devm_platform_ioremap_resource(dev, 0);
+	if (IS_ERR(ac97_reg_base)) {
+		dev_err(&dev->dev, "Missing MMIO resource\n");
+		return PTR_ERR(ac97_reg_base);
+	}
+
 	if (pdata) {
 		switch (pdata->reset_gpio) {
 		case 95:
@@ -398,7 +412,7 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	return 0;
 
 err_irq:
-	GCR |= GCR_ACLINK_OFF;
+	writel(readl(ac97_reg_base + GCR) | (GCR_ACLINK_OFF), ac97_reg_base + GCR);
 err_clk2:
 	clk_put(ac97_clk);
 	ac97_clk = NULL;
@@ -416,7 +430,7 @@ void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 {
 	if (cpu_is_pxa27x())
 		gpio_free(reset_gpio);
-	GCR |= GCR_ACLINK_OFF;
+	writel(readl(ac97_reg_base + GCR) | (GCR_ACLINK_OFF), ac97_reg_base + GCR);
 	free_irq(platform_get_irq(dev, 0), NULL);
 	if (ac97conf_clk) {
 		clk_put(ac97conf_clk);
@@ -430,13 +444,19 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_remove);
 
 u32 pxa2xx_ac97_read_modr(void)
 {
-	return MODR;
+	if (!ac97_reg_base)
+		return 0;
+
+	return readl(ac97_reg_base + MODR);
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_read_modr);
 
 u32 pxa2xx_ac97_read_misr(void)
 {
-	return MISR;
+	if (!ac97_reg_base)
+		return 0;
+
+	return readl(ac97_reg_base + MISR);
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_read_misr);
 
diff --git a/arch/arm/mach-pxa/include/mach/regs-ac97.h b/sound/arm/pxa2xx-ac97-regs.h
similarity index 71%
rename from arch/arm/mach-pxa/include/mach/regs-ac97.h
rename to sound/arm/pxa2xx-ac97-regs.h
index ec09b9635e25..ae638a1b919b 100644
--- a/arch/arm/mach-pxa/include/mach/regs-ac97.h
+++ b/sound/arm/pxa2xx-ac97-regs.h
@@ -2,25 +2,23 @@
 #ifndef __ASM_ARCH_REGS_AC97_H
 #define __ASM_ARCH_REGS_AC97_H
 
-#include "pxa-regs.h"
-
 /*
  * AC97 Controller registers
  */
 
-#define POCR		__REG(0x40500000)  /* PCM Out Control Register */
+#define POCR		(0x0000)  	/* PCM Out Control Register */
 #define POCR_FEIE	(1 << 3)	/* FIFO Error Interrupt Enable */
 #define POCR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define PICR		__REG(0x40500004)  /* PCM In Control Register */
+#define PICR		(0x0004) 	/* PCM In Control Register */
 #define PICR_FEIE	(1 << 3)	/* FIFO Error Interrupt Enable */
 #define PICR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define MCCR		__REG(0x40500008)  /* Mic In Control Register */
+#define MCCR		(0x0008)  	/* Mic In Control Register */
 #define MCCR_FEIE	(1 << 3)	/* FIFO Error Interrupt Enable */
 #define MCCR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define GCR		__REG(0x4050000C)  /* Global Control Register */
+#define GCR		(0x000C) 	 /* Global Control Register */
 #ifdef CONFIG_PXA3xx
 #define GCR_CLKBPB	(1 << 31)	/* Internal clock enable */
 #endif
@@ -36,21 +34,21 @@
 #define GCR_COLD_RST	(1 << 1)	/* AC'97 Cold Reset (0 = active) */
 #define GCR_GIE		(1 << 0)	/* Codec GPI Interrupt Enable */
 
-#define POSR		__REG(0x40500010)  /* PCM Out Status Register */
+#define POSR		(0x0010)  	/* PCM Out Status Register */
 #define POSR_FIFOE	(1 << 4)	/* FIFO error */
 #define POSR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define PISR		__REG(0x40500014)  /* PCM In Status Register */
+#define PISR		(0x0014)  	/* PCM In Status Register */
 #define PISR_FIFOE	(1 << 4)	/* FIFO error */
 #define PISR_EOC	(1 << 3)	/* DMA End-of-Chain (exclusive clear) */
 #define PISR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define MCSR		__REG(0x40500018)  /* Mic In Status Register */
+#define MCSR		(0x0018)  	/* Mic In Status Register */
 #define MCSR_FIFOE	(1 << 4)	/* FIFO error */
 #define MCSR_EOC	(1 << 3)	/* DMA End-of-Chain (exclusive clear) */
 #define MCSR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define GSR		__REG(0x4050001C)  /* Global Status Register */
+#define GSR		(0x001C)  	/* Global Status Register */
 #define GSR_CDONE	(1 << 19)	/* Command Done */
 #define GSR_SDONE	(1 << 18)	/* Status Done */
 #define GSR_RDCS	(1 << 15)	/* Read Completion Status */
@@ -69,34 +67,34 @@
 #define GSR_MIINT	(1 << 1)	/* Modem In Interrupt */
 #define GSR_GSCI	(1 << 0)	/* Codec GPI Status Change Interrupt */
 
-#define CAR		__REG(0x40500020)  /* CODEC Access Register */
+#define CAR		(0x0020)  	/* CODEC Access Register */
 #define CAR_CAIP	(1 << 0)	/* Codec Access In Progress */
 
-#define PCDR		__REG(0x40500040)  /* PCM FIFO Data Register */
-#define MCDR		__REG(0x40500060)  /* Mic-in FIFO Data Register */
+#define PCDR		(0x0040)  	/* PCM FIFO Data Register */
+#define MCDR		(0x0060)  	/* Mic-in FIFO Data Register */
 
-#define MOCR		__REG(0x40500100)  /* Modem Out Control Register */
+#define MOCR		(0x0100)  	/* Modem Out Control Register */
 #define MOCR_FEIE	(1 << 3)	/* FIFO Error */
 #define MOCR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define MICR		__REG(0x40500108)  /* Modem In Control Register */
+#define MICR		(0x0108)  	/* Modem In Control Register */
 #define MICR_FEIE	(1 << 3)	/* FIFO Error */
 #define MICR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define MOSR		__REG(0x40500110)  /* Modem Out Status Register */
+#define MOSR		(0x0110)  	/* Modem Out Status Register */
 #define MOSR_FIFOE	(1 << 4)	/* FIFO error */
 #define MOSR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define MISR		__REG(0x40500118)  /* Modem In Status Register */
+#define MISR		(0x0118)  	/* Modem In Status Register */
 #define MISR_FIFOE	(1 << 4)	/* FIFO error */
 #define MISR_EOC	(1 << 3)	/* DMA End-of-Chain (exclusive clear) */
 #define MISR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define MODR		__REG(0x40500140)  /* Modem FIFO Data Register */
+#define MODR		(0x0140)  	/* Modem FIFO Data Register */
 
-#define PAC_REG_BASE	__REG(0x40500200)  /* Primary Audio Codec */
-#define SAC_REG_BASE	__REG(0x40500300)  /* Secondary Audio Codec */
-#define PMC_REG_BASE	__REG(0x40500400)  /* Primary Modem Codec */
-#define SMC_REG_BASE	__REG(0x40500500)  /* Secondary Modem Codec */
+#define PAC_REG_BASE	(0x0200)  	/* Primary Audio Codec */
+#define SAC_REG_BASE	(0x0300)  	/* Secondary Audio Codec */
+#define PMC_REG_BASE	(0x0400)  	/* Primary Modem Codec */
+#define SMC_REG_BASE	(0x0500)  	/* Secondary Modem Codec */
 
 #endif /* __ASM_ARCH_REGS_AC97_H */
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index 57c3e12e6629..c162086455ad 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -21,7 +21,6 @@
 #include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
-#include <mach/regs-ac97.h>
 #include <linux/platform_data/asoc-pxa.h>
 
 static void pxa2xx_ac97_legacy_reset(struct snd_ac97 *ac97)
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
