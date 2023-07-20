Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA99EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVwmSHe6n5gUVq26DCRBwm9Cf1AiLt2wOYttikEO8vE=; b=rjVw/AUcBmwC+G
	obwM/kt9U9wZsb/x/DINQxUinlGU/yiw+1vMGKzIx4S086lDkmwGhP4Xzhm84rxMvy5PJxkXAunjO
	V10BbiX6+HKkyQLvDEd5np6G097XzydKKN3nSpEa70qJbbGjJ20nx9woZYa9u7QJ47Y0HpFQxtlEa
	MFaKOpC35RNJD6sfUsPOGlrAeWxt+nBQdwwLQ+V8JR6WN9ZWik1h58WDKbEJgzX+jWrXQrG7f+SL8
	RxfnCe/mHcNWWKx8sVxO4gU2KRGeS5Md3IzEvMyXd1N8miW7J3XhNU7TA7RYajEDCOUEgcIKT//pu
	DQWlexuyDbVGE4a2E18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP3R-00AJmu-0G;
	Thu, 20 Jul 2023 08:30:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP2y-00AJNP-1d;
	Thu, 20 Jul 2023 08:30:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBFF561B04;
	Thu, 20 Jul 2023 08:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A081C611B2;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841797;
	bh=ZaxORRml2/lUTaXfWV+lqHl7eKYvLegbVtQFCdOuGEM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=Pfkali8TESsCKFDto9+HeftpFHrTEYgJJ79jBRAI1DHoTczxpHW1/Lb4QVhLEn5bq
	 ByBA4lwOkabboSlIkPMIZ5aryrW/nMpVRzdt6WBkXRIFLxZZcrtJywtloexryqZqgP
	 p9gvuP3za3oyCSWU0gz7EjGoznbTm/HmWmzfCkue49ixAEvq9xjfKaT2SH0pURpbr4
	 GpiH+jgyvV5ouKjyU4Y/F/rAC3wGbbK3+eXofeWobzmKFKAAmdvSWDu8djsmILWR8r
	 pynMauCrlJ0cJpmjGU86pthFsg7gHjnRlSAHlzLRQ64KKMVSZixTbl42l25GjIT87h
	 9iShgIpTvcfkQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162FCC04FDF;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:10 +0300
Subject: [PATCH v3 10/42] dt-bindings: rtc: Add Cirrus EP93xx
MIME-Version: 1.0
Message-Id: <20230605-ep93xx-v3-10-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852590; l=1502;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=+WJELTPi3SR7doWQgplH5f3NbLfPmDLMIfALGyN06QE=; =?utf-8?q?b=3DcenhKOgIJxOV?=
 =?utf-8?q?n12V9vrA3E1aFvJSNOu5v5StgwWBq4m0DqfHsUBodXUS8L+KZbmGzHEjkkVNaUAA?=
 36Q7NOp3DA+B+6xLeqQyy5kWtN5/t1Mx6AO2fjvLelovXEYnzlCc
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_013004_672426_F69B0EFB 
X-CRM114-Status: GOOD (  15.04  )
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
RTC block used in these SoCs.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml b/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml
new file mode 100644
index 000000000000..63572c197e92
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/cirrus,ep9301-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus EP93xx Real Time Clock controller
+
+maintainers:
+  - Hartley Sweeten <hsweeten@visionengravers.com>
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9301-rtc
+      - items:
+          - enum:
+              - cirrus,ep9302-rtc
+              - cirrus,ep9307-rtc
+              - cirrus,ep9312-rtc
+              - cirrus,ep9315-rtc
+          - const: cirrus,ep9301-rtc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@80920000 {
+      compatible = "cirrus,ep9301-rtc";
+      reg = <0x80920000 0x100>;
+    };
+

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
