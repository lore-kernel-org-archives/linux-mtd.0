Return-Path: <SRS0=3X/b=OC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C653C4167D
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:12:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B97561050
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B97561050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umzyBfQZM8tR9eFMQfW0C25i6R9pZ3rlfgR+OSd7PKU=; b=T/IP6ZwmOY5LsI
	MSRlhm1LTjcv2d/2UGJ2JN6CXdUbs1/gi94E5c07wn9swUFq5IRbuJklc4X57nvpD1KfzsMqtWG06
	Zb1qUd+u3P8xAC47fCBTI4AYY6zkCvmyxeNYVLgjTjtR1M1Qb47VIJ3sQ6Ans0vAD/DS6UXx5IP4r
	eHZ0fwAzB4EcQzMHcJPCc0ZF+7Qhay4kB18KFPjZphNDeICVKAICupgq5rkO0b3iFTfn2H8X/3rMm
	hc9dHyfpQ+RBS0iddGRfQv43xyEV65tgRzf/FtnLlc7LlfSk3AfvmMAYGEYl7uEP3lpKNRJ14KwdB
	l0rC/gEQZdi5cJpVVH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPVpZ-00H7oF-3y; Sun, 12 Sep 2021 20:12:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnO-00H6OG-7l
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:09:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id s24so5121199wmh.4
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XIkaLltNAZEHFO/c9xmZHlt7cmXZw7U8aSqzSL63yiM=;
 b=ijQ9VUVd3E+yAzhUW8LN+qmTp2ecRP2mmWkjTl8uAZSPA/zpjjwrm91O4PToKeDqC4
 vFO3mTKegg4IVvavhdrn+MbBPEpbxDgUBdh7DqlctW88vqJAie0ybyRePtB0ZKvhjjSg
 b/7a3Q6HAWJrkVAy2fywVfzvbX+UyY+AJRdulaqhxB5JkZguuPBwEVKs9rq+R7MQ8oTS
 T2lYnk8I/S7QPhedjPhkp9y79Iqn8sPawMmPQZytgNJCLQ1cquISSJH4xb8LXTpwJI//
 DMAae/2QaieRbscwgAfhPwKD2x6lrNKA7L32d8Qadur4oH0Po7NY3LnqcOAePA1x9BPV
 5e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIkaLltNAZEHFO/c9xmZHlt7cmXZw7U8aSqzSL63yiM=;
 b=bSJgZo5y8rGvYPLAYlW6s/Ydez7CGLi66ZFjBrnP7aXYcp+7b6yeZqOAsR21x79iSr
 5AFIkMmnmI2a5/fishTd5EnRmvRa6GE2ym/v3/+wkvhGfUyucDrXEcr7XXotg8A1CaCy
 xsueJ1KmjaUR2/yIwJApzUhEGCNE/d0STZLKOGiQB9dzJ8Cfa8PJ5LQn38txNoujW0X1
 SRHLOybH+x3lawJlp67lUnTIALkliYoxJTmXr61e1RdyB2k59MOxmcpsEyRTSMSdQN5E
 QG1lMS3bCdsYwkbclgq3WycWYs3jFR/dbrUAB0L5tdlYlxWK6ttF1gw453nYScZ/zwdP
 z3bA==
X-Gm-Message-State: AOAM532egFfxKyM3zUeJAMUuLUfa5PAGei/caZekxP3bd8HK2/z0GJcR
 0AMx7dWny7bXRgxjQifq15c=
X-Google-Smtp-Source: ABdhPJxyxUlin+TcDC9SzEGP88oLSNh0QPSkbXUWBt5/tW6RXe2v6I0t3nNYmR/wNfym5p2nWbp1lw==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr1537846wmq.77.1631477385110; 
 Sun, 12 Sep 2021 13:09:45 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 05/34] dt-bindings: clock: tegra-car: Document new clock
 sub-nodes
Date: Sun, 12 Sep 2021 23:08:03 +0300
Message-Id: <20210912200832.12312-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_130946_343610_177400DB 
X-CRM114-Status: GOOD (  13.11  )
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

Document sub-nodes which describe Tegra SoC clocks that require a higher
voltage of the core power domain in order to operate properly on a higher
clock rates.  Each node contains a phandle to OPP table and power domain.

The root PLLs and system clocks don't have any specific device dedicated
to them, clock controller is in charge of managing power for them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..f832abb7f11a 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -42,6 +42,36 @@ properties:
   "#reset-cells":
     const: 1
 
+patternProperties:
+  "^(sclk)|(pll-[cem])$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - nvidia,tegra20-sclk
+          - nvidia,tegra30-sclk
+          - nvidia,tegra30-pllc
+          - nvidia,tegra30-plle
+          - nvidia,tegra30-pllm
+
+      operating-points-v2: true
+
+      clocks:
+        items:
+          - description: node's clock
+
+      power-domains:
+        maxItems: 1
+        description: phandle to the core SoC power domain
+
+    required:
+      - compatible
+      - operating-points-v2
+      - clocks
+      - power-domains
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -59,6 +89,13 @@ examples:
         reg = <0x60006000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+
+        sclk {
+            compatible = "nvidia,tegra20-sclk";
+            operating-points-v2 = <&opp_table>;
+            clocks = <&tegra_car TEGRA20_CLK_SCLK>;
+            power-domains = <&domain>;
+        };
     };
 
     usb-controller@c5004000 {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
