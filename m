Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99B8EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9oNJVOnU3tvtgTaATfLvje69HhnZPVFV6/4sGR+0Ts=; b=0s8W2dMPkjNOr7
	Zp8fa/oinvohymnmCT/WFFA0shSrrOghVxBOCmh87JzdbEErS1IYNfbZ2Wx7SdJGDMpIj9bt88Tkc
	vwxpB7tnE99K72FPaOe2JqF+G7vUjlGQS0a+1uadAGdnuxyd7V/OCovS6fegpbP2s1VGTIUexjuCc
	J+il8TDooDFotCI9Pzgfe8jGLERHkbCA2EtbuZ0MHuz61AD0mVnXT7jbd++aaAHmLAkTxjdrZ7I+F
	nkg09AyT/noEnQ4LaPxNBW/CDf0BD/nxyWc1uRj9CS4MIxzqXuD+9KRlA7qc0QLyYRV8ndUtTRwbe
	7Pop9DQ4pKB6xWfKJY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP3F-00AJem-2u;
	Thu, 20 Jul 2023 08:30:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP2w-00AJOZ-2p;
	Thu, 20 Jul 2023 08:30:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B96061A01;
	Thu, 20 Jul 2023 08:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8C12C611B0;
	Thu, 20 Jul 2023 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841796;
	bh=aU77H+NFqBJ65zWNkO4MZQ89gC5/i/NcxlnAPPiY4S0=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=rdO9u+lao3MBzjwZAouroGX98qvkO9/uQb+nykk3PQH4YFLt7u5cgv9+mOTzRU3GD
	 BQBQoZMBDU8tdRH8CQ4zLMohPEdju4QJqoxk5jJCN+0i4j6LNlwb3epQOiAaJwQwZK
	 GnDYDzsKj3A3gYHB11HXuMj5yJs1XIEHgn+QwUnSEE1gF625oNIt6056973YJfwegS
	 8o5U7ssbTZBVU7YAi1D8Z9NBD6gHXzpBo6unsAFYit7spBGyOnBKZpaL63Sbf2XnuY
	 1mRbij3tmKpdmTaxT6U6K3EFjJyfwCMdz0hfKxDVO6HDP5mD6RYIv1r9eMwF4VtS5W
	 O8pPaf+MniM1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B25C04FDF;
	Thu, 20 Jul 2023 08:29:56 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:08 +0300
Subject: [PATCH v3 08/42] dt-bindings: timers: Add Cirrus EP93xx
MIME-Version: 1.0
Message-Id: <20230605-ep93xx-v3-8-3d63a5f1103e@maquefel.me>
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
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852590; l=1736;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=ERcB/00oRoWqIGI8EmpdsPGmeP+HPJvciJobAwxbs2s=; =?utf-8?q?b=3Dbr3W4WGC3HVe?=
 =?utf-8?q?din5oRK84JzdS6NFMeEdq38CDMAi8LUdzdiIzScHEKE1IqMe4U5OCV4VWwD/vILN?=
 E5f5oEzlBMuJ5ipSHX8DoWtifb4tGVZ/Kzy/5BnUT8salnwpkO/X
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_013003_007092_22A10778 
X-CRM114-Status: GOOD (  15.19  )
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
timer block used in these SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../bindings/timer/cirrus,ep9301-timer.yaml        | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/cirrus,ep9301-timer.yaml b/Documentation/devicetree/bindings/timer/cirrus,ep9301-timer.yaml
new file mode 100644
index 000000000000..e463e11e259d
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/cirrus,ep9301-timer.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/cirrus,ep9301-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic EP93xx timer
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9301-timer
+      - items:
+          - enum:
+              - cirrus,ep9302-timer
+              - cirrus,ep9307-timer
+              - cirrus,ep9312-timer
+              - cirrus,ep9315-timer
+          - const: cirrus,ep9301-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@80810000 {
+      compatible = "cirrus,ep9301-timer";
+      reg = <0x80810000 0x100>;
+      interrupt-parent = <&vic1>;
+      interrupts = <19>;
+    };
+...

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
