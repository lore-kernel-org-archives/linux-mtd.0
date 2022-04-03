Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CB9C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnViy5maz7jtmNzXE4Uh8OIMPXFLdGYi6ZZAHGXzyu8=; b=JzZCsShefM+no1
	WJVlTQtCETWIM/fvdd9to5IorgF5FSl18oMnI4fadv/n2YoSnnB4zPjd6KomNsMqgRgFVV3RvM7IE
	OryvENPUwPYVwYjcU1iuS3zn4VCIvPwYp2HBoKetu4pUlKLr+i9SP/n//7Z521eHWVvgYR9FdksJe
	ceY/8zdRmL0cjIEzf4NWzw4SvhpkzoAKI/rZfHlQJ2KD6w6ErC6k4BVZFKl9NmrD8KPxs6CUe4KXI
	McAa0VDa2Q7weGNz92JNQlHtrCyW6rOfdjrEc8nes2KsIc3p+UtFABjd/CrseGNcfJe6na68PnLtp
	rSaxmkqZjnjnjKKDeUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb04I-00BQus-Lm; Sun, 03 Apr 2022 13:14:58 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb02R-00BPzq-3l; Sun, 03 Apr 2022 13:13:06 +0000
Received: by mail-pg1-x536.google.com with SMTP id q142so4413589pgq.9;
 Sun, 03 Apr 2022 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/KKxa3qfvCVRnTRZ4freu2hqQtZPY0z6h6IaQVcQg/k=;
 b=dugHyQtseLH9JljgoEtCYnigEgJBPF1GzRq77Blwr5VwydDlIgm7zgdfv5mhL8QBQW
 ErRlsVna50fxWxVAuT6fQ2oOoPzBymTcbRjit0dPvjwPM47NxwNikGe3qaZ2oBrR2q7W
 llftZ1RmN33+8o2OqaGjaO4S6DbXKiT0rSIXxO3RL2fcIvD71cYUtvc9gT5IzpVHs+Mh
 W1sYPEKQt4T6OW0oLKDsqs2H2gjOnByViZ2+IT/7xymv0uy5v2bFheahUIVDUfvPmRks
 GGqQ93oWuLkmj4N7yOKWsqFEg7XA1NOvRf2ytvKFgXS+wxsvt4HI4xhxDyp2oiEiyVxl
 p9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/KKxa3qfvCVRnTRZ4freu2hqQtZPY0z6h6IaQVcQg/k=;
 b=1i5Ca31IeR8cjS/oCpaWIV40/0xu6PS8lvASFjeHt4kiVm4W6vzl9zmFYrmzHygxAe
 IFEIBxP1GPgj1QZRnt2t/PIqeAOG+xRH8Lsuqo8cZR+Y88uBsOzzGuFvUaPlY2Ml8E1O
 /0QnqbbCyynMgxz09BWobAE4zYsSM9WB2nvDNWxhXwK0v/0641CZBqFUSHbkzB0+IAA/
 l3NvLuG4AonSc+D7fGy4Fl50HecG8gTZAFWrbYUIisN4E9kIzHyibQHtGE9wLqV2fTKB
 DYIHZviuStcySGvQgimUxRuYPjUV1W1r4LXOxitWWTTk4SWpYLnxhJ7Xd3ZrJmQ+Lp+c
 oZgw==
X-Gm-Message-State: AOAM5333X5M+/44FsodNgJv5tAWGBIBaIz73M4D85li9HqyAptaqM4Pk
 arouebNA5F910RSZMJrucM+fkJDaUvHUhidSbF8=
X-Google-Smtp-Source: ABdhPJwhx9fr9yzvmrdeEe1YToKKzbD6LhENwF6p9LuKBg7aFviHBI1YFdOHrSc6eBYZBZwDH1K5sA==
X-Received: by 2002:a63:c45:0:b0:399:2629:7743 with SMTP id
 5-20020a630c45000000b0039926297743mr645219pgm.24.1648991581722; 
 Sun, 03 Apr 2022 06:13:01 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 x123-20020a623181000000b004fdf99d25f6sm1554857pfx.80.2022.04.03.06.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 06:13:01 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@lists.infradead.org
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
 linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH 3/4] dt-bindings: spi: add binding doc for spi-mtk-snfi
Date: Sun,  3 Apr 2022 21:11:53 +0800
Message-Id: <20220403131154.1267887-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403131154.1267887-1-gch981213@gmail.com>
References: <20220403131154.1267887-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_061303_196720_F2FB53D5 
X-CRM114-Status: GOOD (  14.03  )
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
 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
new file mode 100644
index 000000000000..166c6b50b9d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
@@ -0,0 +1,87 @@
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
+  ecc-engine:
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
+        ecc-engine = <&bch>;
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
