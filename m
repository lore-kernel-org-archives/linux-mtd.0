Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEEEC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 03:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mjjDkOgvGIc7CJw+yjvntasaCx5dvrmapkW09zCl6M=; b=iHQUwwhIWymF+p
	Vci1BdF8LOfDfaM5XOmSgoz1ovnSqddzIuMp9YgLWcl6ZjuIw041aFo3aLobo8MAv9EUZoJiL1Ytu
	JSIXcoPcQ9UuA9bMTlRf8VnJmHD8Mitz8428lVUW8l+mdTcqjwLPmWbtGQe25gh8Z2k9ixhu8F0Bj
	AKL8gzKBytYwX1l5RdgekcXSJTj7bfJIrSyUgIEOy4faOeEeJ5+eLPZQ/t/OaF46KwNgE62U65VSd
	MauFhzjIZE1xpnxEufUu3JEAqIG9V+JBiByoWSKxnJEKvJPbBLgRcAGo7qJYm2ajICBpWmybLI005
	k3FfuPCpdqe4vZYRseXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niSv2-005fH8-Mn; Sun, 24 Apr 2022 03:28:17 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niStK-005eKL-Sp; Sun, 24 Apr 2022 03:26:32 +0000
Received: by mail-pg1-x532.google.com with SMTP id h5so10589714pgc.7;
 Sat, 23 Apr 2022 20:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=515OXkaaLsXBOTXwN+W2kLxRXcgyH7f1wIj3RDCO+iM=;
 b=GgklGDM6qZ3gecj3Y4PMhHIKiY52vuaTClV6/xRXB7+VYkSg12LeK8yXgdPpGUBqbs
 W7u7gV0TezjWnnrE/2yIyIqS3marQDgFypZmHS1fuZoXFeygJjjzAcoXHC2vAPvx3LVF
 M8mGeYSYSoVTJJcJorPuDFl3gGffkUAjfdgwp59PAtUR4AFmPEkyuUXnlhW2aaQfz1MX
 3nuyS+YK9VTI6GRaJ5kOO+6ze5fiei427xP3DQ4qV0WMrpFDuoXTk5ahhLOGP6m8t328
 mWfzBWkiwH/rDRRGOuCQLpbLTlW9bkDiXMkZn2WvVzCDtBUApNeeFQiBD+7TzEEVfMhN
 aZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=515OXkaaLsXBOTXwN+W2kLxRXcgyH7f1wIj3RDCO+iM=;
 b=FVoU4u6PYB09rqzq3KTHNtU+S5YgKUGFYMs0pJvCrNix3SZEHndxjs/7ztdJZvVnm+
 i+1BR9r6BVHVuk5y9D2zid2QhbfQ1UAYpAin3ooSeu6fkj84reZ2ZhV4vW9o6FGDNTwp
 rPufLu5RP4QDRIxF3EcUokzDUCAKdKnwCS3iFaZpO1ewEleAmnjsxxu2BarZtAyYLRVS
 5VW5izqLxGIW5bppLa01oDSuEtiyylGn6l4QCzbvu2nw4WzkkQ58twKnxTwgpMyEOzVB
 bXdh7G+lKwSxHhV4q8e4H3DNpc2iiCVKlt4jrPD59xjm4QJ7Vxda0aOtRTJp5H34mC+a
 njpw==
X-Gm-Message-State: AOAM531R9IOna7aDuJvKa3NHNVlk0fVThbwy7e0e/nsd13ytvTbB9/dx
 fV+yhCFoT8XhP2GBqO3KX/o=
X-Google-Smtp-Source: ABdhPJxnUi/hi4CZA6156zTJSdh8sfTwaRohBb39mkA9j+vd6Pg/vHrI8ib1eX88yWsXuxsZu+0yXg==
X-Received: by 2002:a05:6a00:134b:b0:50c:f10e:8eff with SMTP id
 k11-20020a056a00134b00b0050cf10e8effmr9674817pfu.79.1650770789721; 
 Sat, 23 Apr 2022 20:26:29 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 r76-20020a632b4f000000b003820643e1c2sm5790724pgr.59.2022.04.23.20.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 20:26:29 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v6 4/5] spi: dt-bindings: add binding doc for spi-mtk-snfi
Date: Sun, 24 Apr 2022 11:25:26 +0800
Message-Id: <20220424032527.673605-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424032527.673605-1-gch981213@gmail.com>
References: <20220424032527.673605-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_202630_993670_2501723D 
X-CRM114-Status: GOOD (  13.58  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
  1. add a blank line between properties in dt binding doc
  2. rename ecc-engine to nand-ecc-engine for the generic properties

Change since v2: none
Change since v3: fix a missing rename in v1
Change since v4: fix typo: piplined -> pipelined
Change since v5: none

 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
new file mode 100644
index 000000000000..6e6e02c91780
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
+  in single, dual or quad IO mode with pipelined ECC encoding/decoding
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
