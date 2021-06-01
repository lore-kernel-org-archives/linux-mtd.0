Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8340C4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 20:11:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73841613C5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 20:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73841613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taBCe9MedTkLICr0Wbcy0q22xpycM0z628q3EUoqNl4=; b=KEhmdxHUomiZvf
	Z6S1RNTk7Y0aJzF8sm0gms0Y7XVg+sh8LaA2tFY9W91SHNjiLlZJsNMNJqNAtaiqgVWhEKytn1ygk
	+yp5r0F5cfc8t69xSIR369d9qX26lWTKy3LnNixnrhpooN4G7by/oZO4W6K8c/3yrEXD5Aw12BXB2
	E1WjYFlY55U+yOyH8HlyByionyzLw5OmjQJXpLNFTvmXcWnNLaYpC25H/W60fp752MmHNIfmXxwd2
	q2eR/b8qcv9b69GYXE3qyym9kdyB9NKq4dbz5NzWolAgn9EFs0lhj66W0tRoqpZPE3XTxvVFpUgkh
	bmecDbThusycKHfo+w1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loAiw-000hju-Ih; Tue, 01 Jun 2021 20:10:50 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loAif-000hdm-EF; Tue, 01 Jun 2021 20:10:35 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id
 t6-20020a4ae9a60000b0290245a5133898so73535ood.4; 
 Tue, 01 Jun 2021 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcUUMExtnu0Erc+KV6ZLS5k3H19BD2zY2/L6Th+LVvs=;
 b=HYrYh1I8tDUYUIrssrpdcJcKrijkLQvDplLmwbrnKEolJDbNUacH0VTBj7j0+iK9ZR
 0iqS2Pfr/gQmDjBIyokiAchJiyicRqeWhbna9R0TZM6Ne2G4mYxIUHW5isEyuOfzBmAv
 6/vrPBowiFxMhcieAa0tO5HIWEeRGPmvt2WYlk4vuzbMV0YX4muMq4g1dvJcxpHdg1Xm
 OX4rHlEIru0aL9KjhJ76RbUF8m2An45FTkVNln8cs//jeUiirRVsZ/8gyXuJHFbP6JaB
 yVVRl/J6OY3N1wg/5ujle+Pptdw87jDeNzvgzaigWVy9sKocS5QmkDNOlAPdLUM8X4fv
 v7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcUUMExtnu0Erc+KV6ZLS5k3H19BD2zY2/L6Th+LVvs=;
 b=DdRsLX1iZuVCnw65ckFXYUQuJtLYMKM83Y7/YYCQ6IOW0ixmbuKLnMef6AHqPXtWXh
 PK2GFCb1+9TwHUzJzL4OaWg6THQyYSY4V597QpkSvdIq31w/nbMGyeYH696WxO6DjqgN
 QsiMpGHlaGF575jP1FNmJyNzg7+6x5tkJrWFWRsY+Ca7rRg5QFKGr1sQmp2o4JyJrkjP
 isGYoRIJWQdwsxzaUerhKkxAV3+g+zygeftWJZ+LkrJ0TRyXzk+I9Q0siA93/yW2999G
 UA8T9kIWl8vgV6l5IpPKuJ68x7FpEZWtOi3trsczoz19dWnRumy3tOQvtiJnSN5CyQKj
 kiZg==
X-Gm-Message-State: AOAM530CZaBukVx7NS9FSXC/J0WedpIvU+3+dPyFmhkPdjhGYSO2dMbQ
 C+k5Mnxjeha6PAZWr80tIto=
X-Google-Smtp-Source: ABdhPJyfYNvCuMl5zFmhxki/Kb1XoDS0IsWbq1QMPdOCAgCmGmZJWjuBvTeJiTPly57HWh9iMUewXw==
X-Received: by 2002:a4a:d809:: with SMTP id f9mr15514840oov.71.1622578230370; 
 Tue, 01 Jun 2021 13:10:30 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id p25sm468118ood.4.2021.06.01.13.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:10:29 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de, jbx6244@gmail.com,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3 1/4] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
Date: Tue,  1 Jun 2021 15:10:18 -0500
Message-Id: <20210601201021.4406-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601201021.4406-1-macroalpha82@gmail.com>
References: <20210601201021.4406-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_131033_535674_424CBAFD 
X-CRM114-Status: GOOD (  12.73  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add bindings for the Rockchip serial flash controller. New device
specific parameter of rockchip,sfc-no-dma included in documentation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/spi/rockchip,sfc.yaml | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/rockchip,sfc.yaml

diff --git a/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml b/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
new file mode 100644
index 000000000000..d5f8edd621ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/rockchip,sfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Serial Flash Controller (SFC)
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,px30-sfc
+      - const: rockchip,rk1806-sfc
+      - const: rockchip,rk1808-sfc
+      - const: rockchip,rk312x-sfc
+      - const: rockchip,rk3308-sfc
+      - const: rockchip,rv1108-sfc
+      - items:
+          - const: rockchip,rk3036-sfc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: sfc
+
+  power-domains:
+    maxItems: 1
+
+  rockchip,sfc-no-dma:
+    vendor,bool-property:
+      descrption: Boolean value for disabling DMA
+      type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sfc: spi@ff3a0000 {
+        compatible = "rockchip,px30-sfc","rockchip,rk3036-sfc";
+        reg = <0x0 0xff3a0000 0x0 0x4000>;
+        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
+        clock-names = "sfc", "ahb";
+        pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
+        pinctrl-names = "default";
+        power-domains = <&power PX30_PD_MMC_NAND>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <108000000>;
+            reg = <0>;
+            spi-rx-bus-width = <2>;
+            spi-tx-bus-width = <2>;
+        };
+    };
+
+...
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
