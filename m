Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A8AC4320A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:32:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 793F560241
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 793F560241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyABSZJ1DVNxoGOidXySTRWqkta5jHFEzQMcGByIuzY=; b=Zlghc1nepBNVR2
	zLQ7X3/qdqzCSj489nY5o471tYhkJnC8X38VmnY4QZcuGgvfV5hZm6GnsnMpEw5JIwSEO7KzrYaC2
	qGkfzvNQcGR0k6yC09QEeg1ZH5qgES92J3YM/zIeZtFCOD+EVMK2ATIqFKtzJmBDtgt41yxXPwhuf
	6Y1L8gnAZN8K6JEbPFXTA/qsGARdbJhmHk5+pf1FDX1H9jO11A6mTGjNT/X+ptAwCAL6IYW1iyKoS
	P0cEJbwK4ioKiUQ//NBIz2rInXc9LO+z3QC1+X4PnCe8S+NKaT+jqLYt4n9+wIm7dtSrFAurm7VuU
	VAHBq2EUA/gu4G7We4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnxf-000hkE-2h; Tue, 17 Aug 2021 01:32:15 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvd-000gex-U6
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:11 +0000
Received: by mail-lf1-x133.google.com with SMTP id x27so38184199lfu.5
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1rOuTQcx9Elf9jGsA5Ck42tuk06UuZfodHaWyKuopa4=;
 b=nLg7hn8A5q/Vx/CDPzbsu0UZcMhezzX4poGP9+aJl2GMGcJhQYqkUnj5Qjl2cn36JS
 TRG8tU87zTvHq5zgQXHaUfSGmd+O/0lOIjEqYc1BrK9zX8G0pOagT0C0wooOsAF5RN7B
 yK/7WuO8b06VawvO6kBp681V6kBFyVQi0S6F6onYaebnZX8T/ICfdcFvXSYrhsgVKUYL
 K9LhVT6ka2mjmSQGZXodX88ijX4Dp4wQUWAkjBdKY6Y5GWYluTSb3kBlJweMyYfHhACG
 IxdIRBbwpMCTUUHhK75ttkWtdcgq0pw9a09WmdFz57TCTIW/Tn8SPuEy+khxI9rWUJ9M
 eM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1rOuTQcx9Elf9jGsA5Ck42tuk06UuZfodHaWyKuopa4=;
 b=AQsiKYHROPtNVHv14duyt6nsFg9wLcKVlCh6+k8Bxr+RxMt8UTNhcSJiO9I9yLFsOW
 p6dVd4YtBEaXr+cpOOwCFUG45uhGjweSOekJOEU7a2YRLsm7c3knsXHF7e3w0E+XRFhV
 UsKiL5v+bV0wdgRNh4XI46yD0Rs/e1fwbaotz46nLpxSCN+kKG8zo4hKno6wvqMf0RNh
 UMj2mlbrBgKOgwwNr5DufuJ2x4VPeOvrUhvEZWHOD/w25f2fAg26IW8WRrAdr7BgVLrk
 3A/fjFqd6UNT+u968lOdd3b1xex3fpjEMTGfNW0wu8K4/4WVV6JQmD7xrxsAQ0FG2zCc
 jbKw==
X-Gm-Message-State: AOAM530sxOTLGCPJdiMQFfwrMcRhGeWe+6w81e2vqsztAsf/TcZ9Te3/
 qM9Rw55vdaWCXwud+PXBTnE=
X-Google-Smtp-Source: ABdhPJwYUUWzqvmh2TbyZ8slt93fpku6uQ4CmSmfQ4fl39kgqkYGTl90+c9np45vo/m/xAMOfWGCEg==
X-Received: by 2002:ac2:43c4:: with SMTP id u4mr476965lfl.357.1629163808543;
 Mon, 16 Aug 2021 18:30:08 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:08 -0700 (PDT)
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
Subject: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
Date: Tue, 17 Aug 2021 04:27:26 +0300
Message-Id: <20210817012754.8710-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183010_018436_7EC1504D 
X-CRM114-Status: GOOD (  14.27  )
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

Document tegra-clocks sub-node which describes Tegra SoC clocks that
require a higher voltage of the core power domain in order to operate
properly on a higher clock rates.  Each node contains a phandle to OPP
table and power domain.

The root PLLs and system clocks don't have any specific device dedicated
to them, clock controller is in charge of managing power for them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.yaml    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..7f5cd27e4ce0 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -42,6 +42,48 @@ properties:
   "#reset-cells":
     const: 1
 
+  tegra-clocks:
+    description: child nodes are the output clocks from the CAR
+    type: object
+
+    patternProperties:
+      "^[a-z]+[0-9]+$":
+        type: object
+        properties:
+          compatible:
+            allOf:
+              - items:
+                  - enum:
+                      - nvidia,tegra20-sclk
+                      - nvidia,tegra30-sclk
+                      - nvidia,tegra30-pllc
+                      - nvidia,tegra30-plle
+                      - nvidia,tegra30-pllm
+              - const: nvidia,tegra-clock
+
+          operating-points-v2:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description:
+              Phandle to OPP table that contains frequencies, voltages and
+              opp-supported-hw property, which is a bitfield indicating
+              SoC process or speedo ID mask.
+
+          clocks:
+            items:
+              - description: node's clock
+
+          power-domains:
+            maxItems: 1
+            description: phandle to the core SoC power domain
+
+        required:
+          - compatible
+          - operating-points-v2
+          - clocks
+          - power-domains
+
+        additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -59,6 +101,15 @@ examples:
         reg = <0x60006000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+
+        tegra-clocks {
+            sclk {
+                compatible = "nvidia,tegra20-sclk", "nvidia,tegra-clock";
+                operating-points-v2 = <&opp_table>;
+                clocks = <&tegra_car TEGRA20_CLK_SCLK>;
+                power-domains = <&domain>;
+            };
+        };
     };
 
     usb-controller@c5004000 {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
