Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4CBC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tybnlHCozN0/YVR3+MjrZGSi23PaOqNQ04+UOLvLcRQ=; b=DkCly92lhlbPlA
	GFiTlxG8mYLwtbHU7F6fVCTsms1lxySVgcsLKpKOqnmyt1arHg/S2M8MrePQA2OSPZfFqcm+sgIR2
	Is0rsAvCNrxI3h83412EGLFCB/8lkxd2JbGuAsRANd4m/5C58U1YlWjzNdQOOujberFWQoCfselQN
	lg4BLIxUrM3gRCUMPd+HKRgisPWmpox7Rlmk5Asx287a4v17GgHt7+X/L2gyQZlrbxycyqiL7l9k6
	IpW5ZKpSEyyCLULNaY39tdg8VXYnuEt4ZG+8viMqAvqXC17qFL+Q6xSXJrWjDyxvdEs70lfV8WGv8
	JQt4k/lme0g6cx0OM/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTmp-00CapI-4P; Thu, 07 Apr 2022 15:11:03 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTjc-00CZJ3-0c; Thu, 07 Apr 2022 15:07:45 +0000
Received: by mail-pg1-x530.google.com with SMTP id c2so5162992pga.10;
 Thu, 07 Apr 2022 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHH8URcVdx/+hyKXsjtF0nQnTEIMOFJIt9J1ByleSrc=;
 b=gwIXZn9FpRhJULaKeuLSKqDxgNq/YqI/YNBzqRZnbHqVl2XV+7gWWwEfi9nvDnNvVH
 /b3M4JgFtWu33U1x5qsrmwlt0Qe7J4ArtXnVPVj1EWuNEFNMLyQ5z/S4kaqkc+RJdNRa
 4eoBbN+OZDFK6qkYtSjp2cigX/4cQdEhumdH3nQ3bfWJA6XmfROShvIeWSkCYwRsGTwD
 Q4fwEg2rNjFZ3vgATh0dzxZoaIhAQgDs/GuFwYcWbQd4hkdxGP+IK0efbBoqkj0osJ22
 Uuge9s30zhKiIBiX2E/bSq/q0iIAuWHmK0ghg5mPW7BaHAaTjtKta/2mwikdfU8ni4Xn
 73uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHH8URcVdx/+hyKXsjtF0nQnTEIMOFJIt9J1ByleSrc=;
 b=AlFey681ycfSrmFuA3p6Y5hjkO0wFAjz7XXVbekuZLIdBL/njoEACUywZjuhZLb6+O
 46lM3bErrUxcatsyoQEqEuaYBuRgUIBZNDcmnd+/Prz3c+WUniyjYlE+2GMFWx0agNYS
 q31Lk6otbmUmRHrmoi/pDL2vEv6jNpOz+yYb1e5VAckSDPogUOUOAKB+LtNyKJbQ2PYx
 BbqSIpBtgMSAB4RulAMwSJiouzJqRJO5D59nhcakrspi3cV/UPryP0NYSZsACngzEx2H
 pttbj6X+Ant2Q89+tw10GzPfc0ZjEnn7FpWB6CRWJ1cyKHKmVKz5Qvat3OMna2E1Kvdi
 YuVA==
X-Gm-Message-State: AOAM531/oekdLKUuasPiXeRd8M9+N/JumQmJc5lVfD2UA959tt8R6x8W
 a7Qt9GRF4OqI5qYlmb/kAqo=
X-Google-Smtp-Source: ABdhPJzWQ+75cseGNPG9TF8t7fk9EWxHtVHkklo3hJEPgO7HpYj29ZtuLh79GWbuPh2/d1+7mgaWig==
X-Received: by 2002:a63:68c4:0:b0:386:231b:f71c with SMTP id
 d187-20020a6368c4000000b00386231bf71cmr11365646pgc.208.1649344060865; 
 Thu, 07 Apr 2022 08:07:40 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a63aa42000000b0038265eb2495sm19329908pgo.88.2022.04.07.08.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 08:07:40 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH v4 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Date: Thu,  7 Apr 2022 23:06:51 +0800
Message-Id: <20220407150652.21885-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407150652.21885-1-gch981213@gmail.com>
References: <20220407150652.21885-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_080744_102359_04EA6324 
X-CRM114-Status: GOOD (  14.54  )
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

Add device-tree binding documentation for Mediatek SPI-NAND Flash
Interface.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---

Changes since v1:
  1. add a blank line between properties in dt binding doc
  2. rename ecc-engine to nand-ecc-engine for the generic properties

Change since v2: none
Change since v3: fix a missing rename in v1

 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
new file mode 100644
index 000000000000..686b69e4924c
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI-NAND flash controller for MediaTek ARM SoCs
+
+maintainers:
+  - Chuanhong Guo <gch981213@gmail.com>
+
+description: |
+  The Mediatek SPI-NAND flash controller is an extended version of
+  the Mediatek NAND flash controller. It can perform standard SPI
+  instructions with one continuous write and one read for up-to 0xa0
+  bytes. It also supports typical SPI-NAND page cache operations
+  in single, dual or quad IO mode with piplined ECC encoding/decoding
+  using the accompanying ECC engine. There should be only one spi
+  slave device following generic spi bindings.
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7622-snand
+      - mediatek,mt7629-snand
+
+  reg:
+    items:
+      - description: core registers
+
+  interrupts:
+    items:
+      - description: NFI interrupt
+
+  clocks:
+    items:
+      - description: clock used for the controller
+      - description: clock used for the SPI bus
+
+  clock-names:
+    items:
+      - const: nfi_clk
+      - const: pad_clk
+
+  nand-ecc-engine:
+    description: device-tree node of the accompanying ECC engine.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - nand-ecc-engine
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt7622-clk.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      snfi: spi@1100d000 {
+        compatible = "mediatek,mt7622-snand";
+        reg = <0 0x1100d000 0 0x1000>;
+        interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&pericfg CLK_PERI_NFI_PD>, <&pericfg CLK_PERI_SNFI_PD>;
+        clock-names = "nfi_clk", "pad_clk";
+        nand-ecc-engine = <&bch>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+          compatible = "spi-nand";
+          reg = <0>;
+          spi-tx-bus-width = <4>;
+          spi-rx-bus-width = <4>;
+          nand-ecc-engine = <&snfi>;
+        };
+      };
+    };
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
