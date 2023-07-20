Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B20EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKBICCsWCqiuT1tfjeTQc9SwCsaYgilUyPd+hRj31yU=; b=36zJNjZYyHfrrU
	aRB7H15AYZoYaMVbB40Rii2SmFr6RcyJPiQ0jVb/g3NrMx3RZ45YG98nGbY1Srzx7fVh1T+DWyFrs
	fwR97f4JXExqJlvOGdqvm5f/bHGs6dhoYtlk734xtYHl4Da3D1G1kqMB7mx01sVfnqPxstJP0QZ4w
	3zVgz56um1opXruGRi47ZMaGYaVeSXzLZmNF67Rkp36uqjTAe1YYql19y4/uiL1DW/ist49krG0Dv
	0YkFKtPt86UkV498+wJ3bd2AV1+VKaHNmNFI2prW4aP4gSDg1e4NOsEWteGDLN2h4QAbrVzCg8wY4
	AjpgFifExnU5awgivtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP2x-00AJOt-2f;
	Thu, 20 Jul 2023 08:30:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP2t-00AJLh-1X;
	Thu, 20 Jul 2023 08:30:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E254C619E5;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DF26C4339A;
	Thu, 20 Jul 2023 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841796;
	bh=xHFqGn/KVspE6DtaBu0kUVJymWNV6FzrvFMW+ty+9BM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=BIw0xWSeECybeHoq3ZR62ODj4BOH5nEfFFBK6p3r1I+kYcyfrLMK3E3nnhTUNazId
	 Y2BH5hsSQZZsL3oXSheXF2Rf/fJEKgpbUsl2BMDj4FOmFFMZn3mt3kYqZYjDxFaXfi
	 cSwf/uXg4nNKX7uGlZvJgZR02hhIHJJw4MaUXzJcX7rdrIkMgiMzJYQRZkI3wqPVw0
	 imNrpO/eF7fTW2h0nOGZpLHgeAIdbg1Ka+gYbCk6Ny1wuqjSl7m2EycXsCpr19oaOD
	 K4KOtkpcTN+nqir9ovlZCbecc76qr1Zg8hJ/2+ypTS84otUuXRMXrC5rWiH7Cm2jIH
	 eN2omeWWq743g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DB3C0015E;
	Thu, 20 Jul 2023 08:29:55 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:02 +0300
Subject: [PATCH v3 02/42] dt-bindings: clock: Add Cirrus EP93xx
MIME-Version: 1.0
Message-Id: <20230605-ep93xx-v3-2-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852590; l=2996;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=EbpLLhgOdlzi42v0HhzMU4hUER0yYIZWVBtRqrAV9bg=; =?utf-8?q?b=3Diqo5fZDwNJlA?=
 =?utf-8?q?A5U8uQbmiq3VlhW6FowgUfUMH8tiN9OPFWWPQjy/q97IGg/0iNk1icOrmpvN3x/c?=
 LlTLhXYuCJx5Ns2GKg/5gzIgjixhquXqnGn7X9YLLA211F8eWFb5
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_012959_603201_9D5566F6 
X-CRM114-Status: GOOD (  15.52  )
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

This adds device tree bindings for the Cirrus Logic EP93xx
clock block used in these SoCs.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../bindings/clock/cirrus,ep9301-clk.yaml          | 46 ++++++++++++++++++++++
 include/dt-bindings/clock/cirrus,ep93xx-clock.h    | 41 +++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,ep9301-clk.yaml b/Documentation/devicetree/bindings/clock/cirrus,ep9301-clk.yaml
new file mode 100644
index 000000000000..111e016601fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,ep9301-clk.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cirrus,ep9301-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic ep93xx SoC's clock controller
+
+maintainers:
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9301-clk
+      - items:
+          - enum:
+              - cirrus,ep9302-clk
+              - cirrus,ep9307-clk
+              - cirrus,ep9312-clk
+              - cirrus,ep9315-clk
+          - const: cirrus,ep9301-clk
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    items:
+      - description: reference clock
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+      compatible = "cirrus,ep9301-clk";
+      #clock-cells = <1>;
+      clocks = <&xtali>;
+    };
+...
diff --git a/include/dt-bindings/clock/cirrus,ep93xx-clock.h b/include/dt-bindings/clock/cirrus,ep93xx-clock.h
new file mode 100644
index 000000000000..3cd053c0fdea
--- /dev/null
+++ b/include/dt-bindings/clock/cirrus,ep93xx-clock.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+#ifndef DT_BINDINGS_CIRRUS_EP93XX_CLOCK_H
+#define DT_BINDINGS_CIRRUS_EP93XX_CLOCK_H
+
+#define EP93XX_CLK_UART1	0
+#define EP93XX_CLK_UART2	1
+#define EP93XX_CLK_UART3	2
+
+#define EP93XX_CLK_ADC		3
+#define EP93XX_CLK_ADC_EN	4
+
+#define EP93XX_CLK_KEYPAD   5
+
+#define EP93XX_CLK_VIDEO	6
+
+#define EP93XX_CLK_I2S_MCLK	7
+#define EP93XX_CLK_I2S_SCLK	8
+#define EP93XX_CLK_I2S_LRCLK	9
+
+#define EP93XX_CLK_UART		10
+#define EP93XX_CLK_SPI		11
+#define EP93XX_CLK_PWM		12
+#define EP93XX_CLK_USB		13
+
+#define EP93XX_CLK_M2M0		14
+#define EP93XX_CLK_M2M1		15
+
+#define EP93XX_CLK_M2P0		16
+#define EP93XX_CLK_M2P1		17
+#define EP93XX_CLK_M2P2		18
+#define EP93XX_CLK_M2P3		19
+#define EP93XX_CLK_M2P4		20
+#define EP93XX_CLK_M2P5		21
+#define EP93XX_CLK_M2P6		22
+#define EP93XX_CLK_M2P7		23
+#define EP93XX_CLK_M2P8		24
+#define EP93XX_CLK_M2P9		25
+
+#define EP93XX_CLK_END      26
+
+#endif /* DT_BINDINGS_CIRRUS_EP93XX_CLOCK_H */

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
