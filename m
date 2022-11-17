Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2461DC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfMBt3Dbs7/XyZfIVveKo+utcqOgkqAUdKPt1pgLsNI=; b=Ja+1LCkBzBAUBu
	ZiCvQgWQO5zzJLz+xl9xkMVykEvF7ueQQpMz35p+eAIti/RQHvr+p45DMYLzNNTuZ8YB9ejFcwdtC
	xT8yQjI9SXOHgCEf8xoTtRR5leeT9RMPhqImCUEpQLseFb5NwCq04NAmnOyGm4o/YIJYyjSiTcolB
	9z/7bcChMGdfoxhVm8ffOVvYiVNnTEpsaGri65nfNLl3/JOmMu7A7mXx2OzuDq+A3TZ4jq0mjs+3y
	NcccFiuSjoeWpBU3xmfJhluJcyKlsaewT4vLq31cmW8VBQGsj0DQs1EM4cn9vxL3zl8q8dDudJuuE
	D1S0vSzp31n3oWLAQdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveCW-00DqTT-Ix; Thu, 17 Nov 2022 12:41:04 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveAq-00Dp9W-IS
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 12:39:32 +0000
Received: by mail-lj1-x235.google.com with SMTP id d3so2560304ljl.1
        for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2022 04:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJFFdNTCilBROsHdo24V63ZbZAhhEEgqcZxfhZbN7o8=;
        b=rdz5PIXMqObB86l1KhoZJKcSKbC+xg6NRkgTB1NATFdSIlglOWlXRIvjuNjAzjvTCO
         y8zZsFvyNaBAJ3JYgXO1JPdPh3To3UQBQF8ZYT+Xs+SqZ3Pz85WQP1ifCFiiPrF+7IsA
         igQY+5y+DrCUl7a8xmGOtKdzQJMqiZDbwefYzZghibsOKI6dmXc/er8ez17uTiah1G7l
         7mQ4NF/RzyMelV1c9UT/LoARjsuZLkFC3+x+2gPh/sPASOPAxd0p4szB44T219qd73o3
         xVm9bFa2ZmqMpeG1LwRd/nrLaH2Uk+lR7uJv3y937vG7+grMPRcepOLACr3489eRm49J
         vqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJFFdNTCilBROsHdo24V63ZbZAhhEEgqcZxfhZbN7o8=;
        b=ucYKpoeFtPK4LUFt98ZkTCQ5RCbKRpYV4TwdxOpsplJAKExH1euZcPtQcChWSA032J
         E9Wat+V3E5HC/y5OwHcIyZ6XhtYDgh2h2wV/J9ZTW8/flPUF2BC5zRkNxUKIsd+OEaZv
         0BQIe2ucYgn98MG8dn1vJ2Vgmw/0aaIeDD7dB9Kw3jsE1X43DbagOVaSK4NNwARKNjvJ
         6MI8mOQvdDskZlw9sH4UBK1sLiOrmJc0E1/geh4S2LqHxMibtqY3RWLvX6wH0TatJwiR
         gFumN0BEGJzoatJVQgP5Ji8c92t5wRYuwyKWjTNFRAgcpPbdh7YRdOFZI4ZlIEOCutB7
         k0Hg==
X-Gm-Message-State: ANoB5pn2vSvnAHgKCNJWJm5cwTFAaSS1elJfebOQXh1tttNZ+gR4ZoI6
	xgWpHTq+cR6kswfMKtpKoA6UPA==
X-Google-Smtp-Source: AA0mqf7DipsuY/Cd5bO8hrjb2IxaeO35/7waWPRAbVpXYlqoqtTpdo18Hp5PA/jEtmhgdlbc5yHKpQ==
X-Received: by 2002:a05:651c:987:b0:26f:c065:4e99 with SMTP id b7-20020a05651c098700b0026fc0654e99mr997284ljq.394.1668688759946;
        Thu, 17 Nov 2022 04:39:19 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u28-20020ac24c3c000000b004972b0bb426sm127855lfq.257.2022.11.17.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 04:39:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 8/9] dt-bindings: clock: drop redundant part of title
Date: Thu, 17 Nov 2022 13:38:49 +0100
Message-Id: <20221117123850.368213-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_043920_671621_58916B87 
X-CRM114-Status: GOOD (  11.29  )
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

The Devicetree bindings document does not have to say in the title that
it is a "Devicetree binding", but instead just describe the hardware.

Drop "Devicetree bindings" in various forms:

  find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
    -exec sed -i -e 's/^title: [dD]evice[ -]\?[tT]ree [cC]lock [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2 Clock Controller/' {} \;

  find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
    -exec sed -i -e 's/^title: [cC]lock [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2 Clock Controller/' {} \;

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/calxeda.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/imx1-clock.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/imx21-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx23-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx25-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx27-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx28-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx31-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx35-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx5-clock.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/imx6q-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx6sl-clock.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/imx6sll-clock.yaml     | 2 +-
 Documentation/devicetree/bindings/clock/imx6sx-clock.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/imx6ul-clock.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/imx7d-clock.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml | 2 +-
 Documentation/devicetree/bindings/clock/imx7ulp-scg-clock.yaml | 2 +-
 Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml   | 2 +-
 Documentation/devicetree/bindings/clock/ti,lmk04832.yaml       | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/calxeda.yaml b/Documentation/devicetree/bindings/clock/calxeda.yaml
index a34cbf3c9aaf..a88fbe20fef1 100644
--- a/Documentation/devicetree/bindings/clock/calxeda.yaml
+++ b/Documentation/devicetree/bindings/clock/calxeda.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/calxeda.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Device Tree Clock bindings for Calxeda highbank platform
+title: Calxeda highbank platform Clock Controller
 
 description: |
   This binding covers the Calxeda SoC internal peripheral and bus clocks
diff --git a/Documentation/devicetree/bindings/clock/imx1-clock.yaml b/Documentation/devicetree/bindings/clock/imx1-clock.yaml
index 56f524780b1a..7ade4c32aff3 100644
--- a/Documentation/devicetree/bindings/clock/imx1-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx1-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx1-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX1 CPUs
+title: Freescale i.MX1 CPUs Clock Controller
 
 maintainers:
   - Alexander Shiyan <shc_work@mail.ru>
diff --git a/Documentation/devicetree/bindings/clock/imx21-clock.yaml b/Documentation/devicetree/bindings/clock/imx21-clock.yaml
index e2d50544700a..79cc843703ec 100644
--- a/Documentation/devicetree/bindings/clock/imx21-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx21-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx21-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX21
+title: Freescale i.MX21 Clock Controller
 
 maintainers:
   - Alexander Shiyan <shc_work@mail.ru>
diff --git a/Documentation/devicetree/bindings/clock/imx23-clock.yaml b/Documentation/devicetree/bindings/clock/imx23-clock.yaml
index 7e890ab9c77d..5e71c9219500 100644
--- a/Documentation/devicetree/bindings/clock/imx23-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx23-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx23-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX23
+title: Freescale i.MX23 Clock Controller
 
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
diff --git a/Documentation/devicetree/bindings/clock/imx25-clock.yaml b/Documentation/devicetree/bindings/clock/imx25-clock.yaml
index 1792e138984b..c626a158590e 100644
--- a/Documentation/devicetree/bindings/clock/imx25-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx25-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx25-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX25
+title: Freescale i.MX25 Clock Controller
 
 maintainers:
   - Sascha Hauer <s.hauer@pengutronix.de>
diff --git a/Documentation/devicetree/bindings/clock/imx27-clock.yaml b/Documentation/devicetree/bindings/clock/imx27-clock.yaml
index 99925aa22a4c..71d78a0b551f 100644
--- a/Documentation/devicetree/bindings/clock/imx27-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx27-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx27-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX27
+title: Freescale i.MX27 Clock Controller
 
 maintainers:
   - Fabio Estevam <festevam@gmail.com>
diff --git a/Documentation/devicetree/bindings/clock/imx28-clock.yaml b/Documentation/devicetree/bindings/clock/imx28-clock.yaml
index a542d680b1ca..4aaad7b9c66e 100644
--- a/Documentation/devicetree/bindings/clock/imx28-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx28-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx28-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX28
+title: Freescale i.MX28 Clock Controller
 
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
diff --git a/Documentation/devicetree/bindings/clock/imx31-clock.yaml b/Documentation/devicetree/bindings/clock/imx31-clock.yaml
index 168c8ada5e81..50a8498eef8a 100644
--- a/Documentation/devicetree/bindings/clock/imx31-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx31-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx31-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX31
+title: Freescale i.MX31 Clock Controller
 
 maintainers:
   - Fabio Estevam <festevam@gmail.com>
diff --git a/Documentation/devicetree/bindings/clock/imx35-clock.yaml b/Documentation/devicetree/bindings/clock/imx35-clock.yaml
index 6415bb6a8d04..c063369de3ec 100644
--- a/Documentation/devicetree/bindings/clock/imx35-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx35-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx35-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX35
+title: Freescale i.MX35 Clock Controller
 
 maintainers:
   - Steffen Trumtrar <s.trumtrar@pengutronix.de>
diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index c0e19ff92c76..423c0142c1d3 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx5-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX5
+title: Freescale i.MX5 Clock Controller
 
 maintainers:
   - Fabio Estevam <festevam@gmail.com>
diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
index 4f4637eddb8b..bae4fcb3aacc 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX6 Quad
+title: Freescale i.MX6 Quad Clock Controller
 
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
index b83c8f43d664..c85ff6ea3d24 100644
--- a/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx6sl-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX6 SoloLite
+title: Freescale i.MX6 SoloLite Clock Controller
 
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
index 484894a4b23f..6b549ed1493c 100644
--- a/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx6sll-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX6 SLL
+title: Freescale i.MX6 SLL Clock Controller
 
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
index e6c795657c24..55dcad18b7c6 100644
--- a/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx6sx-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX6 SoloX
+title: Freescale i.MX6 SoloX Clock Controller
 
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
index 6a51a3f51cd9..be54d4df5afa 100644
--- a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx6ul-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX6 UltraLite
+title: Freescale i.MX6 UltraLite Clock Controller
 
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/imx7d-clock.yaml b/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
index cefb61db01a8..e7d8427e4957 100644
--- a/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx7d-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX7 Dual
+title: Freescale i.MX7 Dual Clock Controller
 
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml b/Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml
index 739c3378f8c8..76842038f52e 100644
--- a/Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx7ulp-pcc-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX7ULP Peripheral Clock Control (PCC) modules
+title: Freescale i.MX7ULP Peripheral Clock Control (PCC) modules Clock Controller
 
 maintainers:
   - A.s. Dong <aisheng.dong@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/imx7ulp-scg-clock.yaml b/Documentation/devicetree/bindings/clock/imx7ulp-scg-clock.yaml
index d06344d7e34f..5e25bc6d1372 100644
--- a/Documentation/devicetree/bindings/clock/imx7ulp-scg-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx7ulp-scg-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx7ulp-scg-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MX7ULP System Clock Generation (SCG) modules
+title: Freescale i.MX7ULP System Clock Generation (SCG) modules Clock Controller
 
 maintainers:
   - A.s. Dong <aisheng.dong@nxp.com>
diff --git a/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
index 03fc5c1a2939..777af4aad4b2 100644
--- a/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imxrt1050-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for Freescale i.MXRT
+title: Freescale i.MXRT Clock Controller
 
 maintainers:
   - Giulio Benetti <giulio.benetti@benettiengineering.com>
diff --git a/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml b/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml
index bd8173848253..73d17830f165 100644
--- a/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/ti,lmk04832.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Clock bindings for the Texas Instruments LMK04832
+title: Texas Instruments LMK04832 Clock Controller
 
 maintainers:
   - Liam Beguin <liambeguin@gmail.com>
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
