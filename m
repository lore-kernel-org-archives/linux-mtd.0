Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E143BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 04:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73JccCovsV12dNpSryAl9gLMcfQy1cA0vKYqIZOPwq4=; b=tjfclhbgCa7u/b
	bum2pfTm5bY7yGs3mtRujRcm3d1R7o9vUbJuV2KaVuzHL7wt7NSM/M2nWRo7Z6uyJNz1ZBdAjPLBm
	BVSGaiWIzTrNLYk7a1Ptn7mLDZ8aYB5f884FO864BZfHkZpiXGY2bjI76ypoGOidrqQcMz0sTqWeS
	7kSPjJwqGcydRbgO6tO6Sq2BGAJJzspYhjvRvcfLOitXfbh5c0EXdK1da8DdxRnUKtrWElHgbxUqg
	PiAXkdqfaSf3238IjklTHVPNqBbJelUG01bOE/zFsXzqf3Gkqwipy8rqyE7UdzeUFKQ+GFH2LhgLd
	5fsVVoq2wrJ/bkbfLSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbDyO-00CyCH-1S; Mon, 04 Apr 2022 04:05:48 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbDvL-00CwrV-8o; Mon, 04 Apr 2022 04:02:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 g15-20020a17090adb0f00b001caa9a230c7so446352pjv.5; 
 Sun, 03 Apr 2022 21:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfEtvk/s/Tlo3wlHXU74Q4H8ayC5m0FP7P7VI6BDFQw=;
 b=SY9me3+ZFGSzbG5Zlb+xvg1u5vmiQFoCFLZ5mcXHg5icMmxA/vn1CnwHCYyRkvv18k
 o7SP+rMH+l/qrKJXu8zJBzu02qsvi18l3Lg1Kt4ju0WpHxq4TVupD8i0rIOOMA5cJofd
 hNjJ/YH2e19EffhEsxIImxdGwjh5E6QzDFYJpRMBfpfGEPey1lMCpL81a5PxxqrkiAA6
 rvYE0sysJDNJ3MoBu1fnq3mL2bh6A6y+sQRe4RC7X1Q370/zDyMqhEssxm/rnyPBN8vx
 5b88KTsRqLwnnAHwpJocc4KaDYzUSylnbHOVTF2KW65raaAPI1dY3JL3Rg+FS89+yBHM
 CYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfEtvk/s/Tlo3wlHXU74Q4H8ayC5m0FP7P7VI6BDFQw=;
 b=XUuAQu53q6tgDEQB/JAefzOEcEcaD3/BoH/CofDTVl/yEKU9wuKMHhkURb7ZDcDe7j
 0N5BvYKbinUgPZPouNe3BZ4d9Rn29S0pgBSAjV+qLz3orDG8sRE7bNa8bDm9PA5qKbiq
 HkRSyr8014acVolG2z1zx4Pqrp2H36kBv/LQgy5lmJvbko+c2gzRBDfLsmvT1PqYrW9J
 uFpNuewALbcI4dkcj0UPkk3ro63mcL7GKA8myDg37Nop6oNQ3WaWILsLU9DA+DmpRSce
 9oj6dplOAkWVHdk7vBxGqhvnfW4IO2Rt0bXek/+zJlL+GsVKK/1i7XfgYte7izh26/Y3
 wh9w==
X-Gm-Message-State: AOAM531tpvwI4PLi5jKZUd/eACRPI2f4A3D0m/IfpbPorVxWk5cwBmRf
 ADvTBLgNsc3nExrVjUafY1c=
X-Google-Smtp-Source: ABdhPJwmlVUux3KK0CILPmZB72JazQKgbEB4OeZXfQ3XUCgQPAGNa9JOqUktz74ZHMMjYnXVVSAk2g==
X-Received: by 2002:a17:902:f544:b0:153:bb8a:9374 with SMTP id
 h4-20020a170902f54400b00153bb8a9374mr21653712plf.154.1649044957791; 
 Sun, 03 Apr 2022 21:02:37 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 j70-20020a638b49000000b003985b5ddaa1sm8756191pge.49.2022.04.03.21.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 21:02:37 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Date: Mon,  4 Apr 2022 12:01:52 +0800
Message-Id: <20220404040153.1509966-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404040153.1509966-1-gch981213@gmail.com>
References: <20220404040153.1509966-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_210239_343517_EDD559B0 
X-CRM114-Status: GOOD (  14.44  )
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
