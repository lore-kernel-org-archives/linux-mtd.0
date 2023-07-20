Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CA7C04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N06h0LLn+8K/PEh16N05aTJESNo7sxj1QgHwz8uG9eI=; b=ASHfi0vNEoZE4g
	3uvNykSDwRvUAynr+J8rFVZHk2W/sAEh1mLvpOYJ1D3kLCVJ+56Vd9XYil0CJfXJjvFCk/poMO8Iv
	kqfY+iWABKNRAu4gmutE3m/y8/4IZgqhwD70NbYuJQGSLzUoasueWOu1uoXQOycZZnMw15Fp8xePl
	VQIk/+/tPZLrHJy456BeN/kGMXEVvft/LkTBeLqO2tW/EV/HB5+W8lmesyVfgg1RSs0rdwXO9OduE
	xYbpt2oCdTBraFPOTuJYqfZRy2bz4PIW2GMFb8rwKDjZdyP7XwNO201Dm6SNXbdgbfI7KXRQEIM7X
	SEGWeitGYSsbKvx5fqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQ0r-00AXHp-1W;
	Thu, 20 Jul 2023 09:31:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP35-00AJRi-0S;
	Thu, 20 Jul 2023 08:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B4F261929;
	Thu, 20 Jul 2023 08:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D88A3C116B4;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841797;
	bh=ATo2o1/z5lWJAyh/jr+9aVD9maOrJiU0DXY7mZLkgZg=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=lRUonWS0+cCKSp6NH3B0+0J3sTNPfxq2IjQjBwYL+K+W31gpLlVpK/sAFVx+Js87A
	 5d7kNwfeqGjA8KQF1apKJuUbnmQPpYCcmT8HUszVyXoSjhV+9h7qCTs0+plUwY+/pE
	 50mU/w9yaznrrSWQKZmfw74c94ukQTFnAFZQfjk2jnAhgagJ1W+NjcJtAx8N7rb1oY
	 p520b0mpTp3jZnio41+2XOIyPRYW7fPq7wGgWi2xie43/SjQmtHCttK7+Fl7fJSdQ1
	 SE89IecXApcQhM6333YSo4pnVzDLoL5qx1U+pMpHIKLnRuyDfik41/VAbHVPjcYGcM
	 2xsUGd8fJ6JMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3042C18E1B;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:21 +0300
Subject: [PATCH v3 21/42] dt-bindings: dma: Add Cirrus EP93xx
MIME-Version: 1.0
Message-Id: <20230605-ep93xx-v3-21-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=8666;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=aXXlGe/xBEf3HwMFX6kd2KXsEwj1QIDN8Sh3QWPPNM4=; =?utf-8?q?b=3DFwF4B/KCZXfq?=
 =?utf-8?q?wZFDxkkWmSraU+dmJgUdgDd8nn3CbUw7j1djwRkZa0Dv+Wi+uDY1QZiKi7J7rxox?=
 SU8SSoNYB+CaqbJtBh5fxrY0bEbsryMeUMNIYFFHjtJqOVcJzWbe
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_013011_306877_6099A4CE 
X-CRM114-Status: GOOD (  18.33  )
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

Add YAML bindings for ep93xx SoC DMA.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../bindings/dma/cirrus,ep9301-dma-m2m.yaml        |  72 ++++++++++++
 .../bindings/dma/cirrus,ep9301-dma-m2p.yaml        | 124 +++++++++++++++++++++
 include/dt-bindings/dma/cirrus,ep93xx-dma.h        |  26 +++++
 include/linux/platform_data/dma-ep93xx.h           |  21 +---
 4 files changed, 223 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/cirrus,ep9301-dma-m2m.yaml b/Documentation/devicetree/bindings/dma/cirrus,ep9301-dma-m2m.yaml
new file mode 100644
index 000000000000..c8f57e000865
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/cirrus,ep9301-dma-m2m.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/cirrus,ep9301-dma-m2m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logick ep93xx SoC DMA controller
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9301-dma-m2m
+      - items:
+          - enum:
+              - cirrus,ep9302-dma-m2m
+              - cirrus,ep9307-dma-m2m
+              - cirrus,ep9312-dma-m2m
+              - cirrus,ep9315-dma-m2m
+          - const: cirrus,ep9301-dma-m2m
+
+  reg:
+    items:
+      - description: m2m0 channel registers
+      - description: m2m1 channel registers
+
+  clocks:
+    items:
+      - description: m2m0 channel gate clock
+      - description: m2m1 channel gate clock
+
+  clock-names:
+    items:
+      - const: m2m0
+      - const: m2m1
+
+  interrupts:
+    items:
+      - description: m2m0 channel interrupt
+      - description: m2m1 channel interrupt
+
+  '#dma-cells': true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cirrus,ep93xx-clock.h>
+    dma-controller@80000100 {
+      compatible = "cirrus,ep9301-dma-m2m";
+      reg = <0x80000100 0x0040>,
+            <0x80000140 0x0040>;
+      clocks = <&eclk EP93XX_CLK_M2M0>,
+              <&eclk EP93XX_CLK_M2M1>;
+      clock-names = "m2m0", "m2m1";
+      interrupt-parent = <&vic0>;
+      interrupts = <17>, <18>;
+      #dma-cells = <1>;
+    };
+
+...
+
diff --git a/Documentation/devicetree/bindings/dma/cirrus,ep9301-dma-m2p.yaml b/Documentation/devicetree/bindings/dma/cirrus,ep9301-dma-m2p.yaml
new file mode 100644
index 000000000000..e3090421c328
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/cirrus,ep9301-dma-m2p.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/cirrus,ep9301-dma-m2p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logick ep93xx SoC M2P DMA controller
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9301-dma-m2p
+      - items:
+          - enum:
+              - cirrus,ep9302-dma-m2p
+              - cirrus,ep9307-dma-m2p
+              - cirrus,ep9312-dma-m2p
+              - cirrus,ep9315-dma-m2p
+          - const: cirrus,ep9301-dma-m2p
+
+  reg:
+    items:
+      - description: m2p0 channel registers
+      - description: m2p1 channel registers
+      - description: m2p2 channel registers
+      - description: m2p3 channel registers
+      - description: m2p4 channel registers
+      - description: m2p5 channel registers
+      - description: m2p6 channel registers
+      - description: m2p7 channel registers
+      - description: m2p8 channel registers
+      - description: m2p9 channel registers
+
+  clocks:
+    items:
+      - description: m2p0 channel gate clock
+      - description: m2p1 channel gate clock
+      - description: m2p2 channel gate clock
+      - description: m2p3 channel gate clock
+      - description: m2p4 channel gate clock
+      - description: m2p5 channel gate clock
+      - description: m2p6 channel gate clock
+      - description: m2p7 channel gate clock
+      - description: m2p8 channel gate clock
+      - description: m2p9 channel gate clock
+
+  clock-names:
+    items:
+      - const: m2p0
+      - const: m2p1
+      - const: m2p2
+      - const: m2p3
+      - const: m2p4
+      - const: m2p5
+      - const: m2p6
+      - const: m2p7
+      - const: m2p8
+      - const: m2p9
+
+  interrupts:
+    items:
+      - description: m2p0 channel interrupt
+      - description: m2p1 channel interrupt
+      - description: m2p2 channel interrupt
+      - description: m2p3 channel interrupt
+      - description: m2p4 channel interrupt
+      - description: m2p5 channel interrupt
+      - description: m2p6 channel interrupt
+      - description: m2p7 channel interrupt
+      - description: m2p8 channel interrupt
+      - description: m2p9 channel interrupt
+
+  '#dma-cells': true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cirrus,ep93xx-clock.h>
+    dma-controller@80000000 {
+      compatible = "cirrus,ep9301-dma-m2p";
+      reg =   <0x80000000 0x0040>,
+              <0x80000040 0x0040>,
+              <0x80000080 0x0040>,
+              <0x800000c0 0x0040>,
+              <0x80000240 0x0040>,
+              <0x80000200 0x0040>,
+              <0x800002c0 0x0040>,
+              <0x80000280 0x0040>,
+              <0x80000340 0x0040>,
+              <0x80000300 0x0040>;
+      clocks = <&eclk EP93XX_CLK_M2P0>,
+              <&eclk EP93XX_CLK_M2P1>,
+              <&eclk EP93XX_CLK_M2P2>,
+              <&eclk EP93XX_CLK_M2P3>,
+              <&eclk EP93XX_CLK_M2P4>,
+              <&eclk EP93XX_CLK_M2P5>,
+              <&eclk EP93XX_CLK_M2P6>,
+              <&eclk EP93XX_CLK_M2P7>,
+              <&eclk EP93XX_CLK_M2P8>,
+              <&eclk EP93XX_CLK_M2P9>;
+      clock-names = "m2p0", "m2p1",
+              "m2p2", "m2p3",
+              "m2p4", "m2p5",
+              "m2p6", "m2p7",
+              "m2p8", "m2p9";
+      interrupt-parent = <&vic0>;
+      interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>;
+      #dma-cells = <1>;
+    };
+
+...
+
diff --git a/include/dt-bindings/dma/cirrus,ep93xx-dma.h b/include/dt-bindings/dma/cirrus,ep93xx-dma.h
new file mode 100644
index 000000000000..21c7324eb27e
--- /dev/null
+++ b/include/dt-bindings/dma/cirrus,ep93xx-dma.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+#ifndef DT_BINDINGS_CIRRUS_EP93XX_DMA_H
+#define DT_BINDINGS_CIRRUS_EP93XX_DMA_H
+
+/*
+ * M2P channels.
+ *
+ * Note that these values are also directly used for setting the PPALLOC
+ * register.
+ */
+#define EP93XX_DMA_I2S1         0
+#define EP93XX_DMA_I2S2         1
+#define EP93XX_DMA_AAC1         2
+#define EP93XX_DMA_AAC2         3
+#define EP93XX_DMA_AAC3         4
+#define EP93XX_DMA_I2S3         5
+#define EP93XX_DMA_UART1        6
+#define EP93XX_DMA_UART2        7
+#define EP93XX_DMA_UART3        8
+#define EP93XX_DMA_IRDA         9
+/* M2M channels */
+#define EP93XX_DMA_SSP          10
+#define EP93XX_DMA_IDE          11
+
+#endif /* DT_BINDINGS_CIRRUS_EP93XX_DMA_H */
+
diff --git a/include/linux/platform_data/dma-ep93xx.h b/include/linux/platform_data/dma-ep93xx.h
index eb9805bb3fe8..54b41d1468ef 100644
--- a/include/linux/platform_data/dma-ep93xx.h
+++ b/include/linux/platform_data/dma-ep93xx.h
@@ -5,26 +5,7 @@
 #include <linux/types.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
-
-/*
- * M2P channels.
- *
- * Note that these values are also directly used for setting the PPALLOC
- * register.
- */
-#define EP93XX_DMA_I2S1		0
-#define EP93XX_DMA_I2S2		1
-#define EP93XX_DMA_AAC1		2
-#define EP93XX_DMA_AAC2		3
-#define EP93XX_DMA_AAC3		4
-#define EP93XX_DMA_I2S3		5
-#define EP93XX_DMA_UART1	6
-#define EP93XX_DMA_UART2	7
-#define EP93XX_DMA_UART3	8
-#define EP93XX_DMA_IRDA		9
-/* M2M channels */
-#define EP93XX_DMA_SSP		10
-#define EP93XX_DMA_IDE		11
+#include <dt-bindings/dma/cirrus,ep93xx-dma.h>
 
 /**
  * struct ep93xx_dma_data - configuration data for the EP93xx dmaengine

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
