Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDCDC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pd0fnAwvIozEMCu38Ei8jNvJUBLDwI8y5PcCP3qBRs4=; b=yqTvtR46Hmb976
	vT9T3GsWzvN9sgk35PSI4Ri72ClMh4BJ+m/5fds/sxYFZ5c4e7tI1aqU8JhlJra/dMh/8lzbqHV+u
	VGNzm8sZqVLp6lFSPQ5jGYqIpQYR8Ew+9ov07ebHsqmavIeNFpakOzapNaXbSAYvxcUpYT4wCCcWT
	YN/1X5yqHmCxm1FQJ1Tz3wbCGwHQu6hQrd0nXK0zpRX4spYM7CrbQwxy1WaBib5BuFUekcXm28WUw
	P81skCx+NiZXZl5jJAaKaS540WjYFRBKg4p45q8XLQCSiW8aGo1tIiiYO/EL8sKYHhAYxOBKJyENY
	On/Pn2dEYxR3D3+tsbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd9wZ-0032c5-AL; Sat, 09 Apr 2022 12:11:55 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd9u7-0031R5-G1; Sat, 09 Apr 2022 12:09:25 +0000
Received: by mail-pf1-x42c.google.com with SMTP id w7so10613085pfu.11;
 Sat, 09 Apr 2022 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JIDrFKLNsEctZXQNacWwFCIZpHz5T6ma++EIZMHibGY=;
 b=kjeJ+8ybFuav/2E1QcfwEyLC0grQYYUgqfVUoP3TWNbdykcn3FuvG9QMgBsIjXnW/6
 +sMEsppPzwiOKsUfnhp4HcyWgprlTgbdoHyoBT1lBJzebWTA7u0siWEoL1Yme21VwyEa
 JoOmVcoGCEqFiqFQJkVwUOql7PrW+iojilsyNXxQUu7+FnMPrB04nwIQmHs5EYI4JT2N
 wwqg8MLPhme/cA7JB4sQyjXcl9vzFW4MzSMvedGdZRxP75eSCqZNUi67rGsZJOC5GDbi
 Blg67UGpOZmTqi1ZR210szR2i4SEEmFWkSWdZb2p4iK+hEGDqNUZw48stu2l8pglVACo
 f6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIDrFKLNsEctZXQNacWwFCIZpHz5T6ma++EIZMHibGY=;
 b=4uHktMMF1Ugfow1h5l3JhKgNYOysdW0pfLaK5u1sL9K4yBsjPaqUhoNHyEAIxAgEGm
 X8CgTzrwwCDD34qQSwtig16i5AwMk1Oj5mHG8PyKD1ZMAZ2zDEwO64aX3MbfDc0Sgl1c
 ar49xFpKMXQG7mo36J5b4lSZEK7/jpPQRFYs0xFxR3scXpfa9Ju2ftxzsb8gj3/ns9tu
 Xd63H0k3bUJL5Ll9oDftGSFjvlCmTcBQGMocMmlP/0SGYqfkiJ3mHB6KMdLySlYa3nV7
 6FDLAkgutA9TL5ptUI1e9c+XQdGCFvwhfGweY7FOoET5t5wXdQdn1t75thj5D3QUqRmR
 4IhA==
X-Gm-Message-State: AOAM531vjpGA47fI7ZLDsyn5kfi5ZL9oLTMKlJ3u4ZOtUBVfouW3RGSR
 D8+ThnOW10cgv5oXGmlC84s=
X-Google-Smtp-Source: ABdhPJzVLWfBVW0fiqRDnjbxiOd/l4AHyUuh6+F4EAJhezVBCLAqT493FkU3/oiaSTZAiwEfRAYvAQ==
X-Received: by 2002:a63:a0d:0:b0:399:460c:ffb9 with SMTP id
 13-20020a630a0d000000b00399460cffb9mr18983442pgk.43.1649506161890; 
 Sat, 09 Apr 2022 05:09:21 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 a85-20020a621a58000000b0050569a135besm8307357pfa.201.2022.04.09.05.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 05:09:21 -0700 (PDT)
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
Subject: [PATCH v5 4/5] spi: dt-bindings: add binding doc for spi-mtk-snfi
Date: Sat,  9 Apr 2022 20:08:18 +0800
Message-Id: <20220409120819.3124209-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409120819.3124209-1-gch981213@gmail.com>
References: <20220409120819.3124209-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_050923_591802_C44C3218 
X-CRM114-Status: GOOD (  13.81  )
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
