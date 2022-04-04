Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4454DC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 13:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zImhWbGDeHD8kIJeNAyqd8mBwO6tdRmRPeQiyFLUAYA=; b=3F4ULWqTbVrp48
	hEd6zUyPLBkhhQxJ/FTlIi1f40dAD3/Pipg9Gm4YU/tSxAm9LUhW+jE4NPudhnTdIHaEqEvMzVgd7
	Z2x8BvQA47JStXZfsHnAHDipYFiQWJL+XnK12VccRtqJAVBLvtc9nB0EMqDHWmChkTNVs6mL7I8p2
	Z2zD5190wyfnhiZsOjrR0z3ORhSmr7k7lkFXV0GxW00jU25CcyyAl/tiAUmlu8IMPk55m6S6gCx2g
	2nosX6D3LhvBizEx3X4EwMe5t276mamwQejMIdSCuqq4TVVpoupfgcB/EIhzY6Y0HcmHPPz0V1UeU
	Y3KXnY7uPos0dZS+Ez8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMei-00F4is-Uc; Mon, 04 Apr 2022 13:22:05 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMbw-00F3NK-DP; Mon, 04 Apr 2022 13:19:14 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 n6-20020a17090a670600b001caa71a9c4aso1861133pjj.1; 
 Mon, 04 Apr 2022 06:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98aVPRaNhVnkIOSZnYElkwg+49rD2FQkbB69NIxSTfE=;
 b=NL8gLX8E+sH/tNr35bCSGT4gXz9oMntlDmpJUtLlLt0o9MP8wmZoljFQp81AsuHj8H
 2cdYJYml9OBlr7Yjn+XRPUSn87POzc/F/nXIPSDhsQvNPyk+rzDhp6WFX9ftn0AKXbHa
 S9HXO60agVyl3ZxH1286cL5+7qrhgjeJMpKkPtaE38VKN0S2oWf/0LCdK6/42IS0kTJF
 STi1PPKwYIEMPlxaSn9Rfh1HK1jfWeHWANLcxAAYHgVXgQxcFvl+5xpR+2rrpWjHD5xN
 vZ6gqusuMiXLWTfHcJrnA9yh+BPuuesJB8yjciZeCJYa9jvwTixyd3OPsfw/OpgLqPpo
 fV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98aVPRaNhVnkIOSZnYElkwg+49rD2FQkbB69NIxSTfE=;
 b=s1LTAMvPC8i3je2g95DGeG18KQ44tU9a3sJGefT//jAdM7bLEa0G1YQPYpWH3AqbMt
 vThM9sWdfLQOznTLuq/vYtf2t3TmNJM3yutplrkxnXxeDSofq55Fydo2nD0AptdKxGE7
 dpPPzZuXZQlYdH3+JIJ5M4hH//Wzf08YcnEh1J+rF9v3peXodyYLCPPaZ7LX27ZWvbym
 5a9cjWy46dF1WtxY/LLFKb2/HwUkF6+CgnNmVuPpUaFzqGcMSajuW2EPHdvmh8DtQVUJ
 EA4KTe4nsGmXEjpjl/gUnnSSNPSf0ksjzYNjUa2yV/ya2wfm/pol8CwxLMEnfWmXGGiW
 DnRA==
X-Gm-Message-State: AOAM531maDN5gS1OiBSyxRiefnWdBdve5L1xD5GnVLDeQBtahhXrA4ym
 /AJXQs3TazgT6zz+tQ0bri4=
X-Google-Smtp-Source: ABdhPJzL3HBKcckUym89Z5K3IPFvGspzrZ+1sxI3Ch0mb2rBwiORgcMWVDDQ/TTLEJwlwEMmDdlgsA==
X-Received: by 2002:a17:90b:3851:b0:1c7:80f9:5306 with SMTP id
 nl17-20020a17090b385100b001c780f95306mr26204291pjb.207.1649078349422; 
 Mon, 04 Apr 2022 06:19:09 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm12475705pfj.43.2022.04.04.06.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 06:19:09 -0700 (PDT)
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
Subject: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Date: Mon,  4 Apr 2022 21:18:17 +0800
Message-Id: <20220404131818.1817794-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404131818.1817794-1-gch981213@gmail.com>
References: <20220404131818.1817794-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_061912_495373_F7F5840C 
X-CRM114-Status: GOOD (  14.65  )
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

 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
new file mode 100644
index 000000000000..7d57570ad617
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
+  - ecc-engine
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
