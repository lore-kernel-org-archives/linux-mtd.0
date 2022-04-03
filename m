Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D8DC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnViy5maz7jtmNzXE4Uh8OIMPXFLdGYi6ZZAHGXzyu8=; b=tNdlY/ByGC9wV9
	l9dPOjedYzxgLPROG0KBlxyOm6nJTUh+7ceH6ZYRKEcK+5NQGpBUmZfredKKdzS+jPwbqBHyVz6sy
	192Qxl1yNpJVpys/gVn9NseXCgS1Q7avla9LD7gRI72dYRFucTVRgQxQ7uG6gEptWbrnRP42xUVz3
	aukUkqhtzh4XWsFQbw6Z35+s7koZYhS/hZupN59XAlga78WiocuzrYy/fN76rFXuQ656oWmG3aTxB
	CfBXaaZS/dqBPXeoi+/aS7pK8Q3mJZANJfcP6rDxTt+dqdqhcj1grrNSSVIGKxC8F57akgfkUaQQS
	89Q/AJ8QoGnTWwCGNp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb0Bq-00BTty-AD; Sun, 03 Apr 2022 13:22:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb05C-00BRM1-C2; Sun, 03 Apr 2022 13:15:56 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 ku13-20020a17090b218d00b001ca8fcd3adeso666714pjb.2; 
 Sun, 03 Apr 2022 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/KKxa3qfvCVRnTRZ4freu2hqQtZPY0z6h6IaQVcQg/k=;
 b=m/vENM9lvhogRoIDlbupYgq5rx0p0TaAeNuLAb4TO7miAG2u+gYAWrM0TdgdKKH4wW
 CjOo2kI3Hh3/B1zKZri9bq7YmKARrXX+Ns7NDHfrOuRkluAzL7G2J3SkJcm01NS9QhuS
 lVv2KOITKHKEGckXA+DkfR5Oh1L4vrRTDWrqWF2j9WySVKHZvv/z8hiCz/oFufZn2Fet
 OinBXy5286a0MW++V4c+++x+CGX8V5vy7+Ng+6XlydVquBCsc+DNJVhYJ60WjYUtxBC/
 7g+Y4AJi+OU5ljLKfHEO4cBWCrdufx6a0te3MXj2HP5j61wLClEWHEVAT0atyDv4npGW
 fVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/KKxa3qfvCVRnTRZ4freu2hqQtZPY0z6h6IaQVcQg/k=;
 b=baU4twvyAXVh8IMKX2XzHS7Ge3DWnOnRPNsz1reYGnz4IXDah9DhpdEIPUb0YCned4
 FTp9wjtcF3kyyPnRFE4oPUIxZRYszGb/ERt8sUZbNS4YPe60sHzWVZgPQgST+tZvSgws
 iqbYKls8qiPtuq+hXCDBnY0ogZ0+9clWDYFSGc08LFgSHEmxdbTSFrp3OwQmVOYB+v3L
 CiprRRqvsmbddLnwsCRUzZYRU28nDyLMfN/6dedYdhsgbAIg110oV9YWlbHvDykP9IqG
 eyFQqoJT03KwcdBjL6+MqfbCTdwUtcJBQfKBxsFDUt7pbMUKF7zcvdc8LUpeNARC1BP8
 746w==
X-Gm-Message-State: AOAM531cgC7sAsjFoZrzlb9xc1cAL3qsV+D1faymVOUww7faGzXsudp1
 3cE30P1y/3vQWz8ZZuE7Oi8+p2HFKlcbLzXVX4Y=
X-Google-Smtp-Source: ABdhPJxXGMDGVeqCKGOYjvMF3Px/SiCfGZsXLdIYstyqOWgeLYeNgR12ds/8r8Dq4tb3lQ8nGLb7og==
X-Received: by 2002:a17:90a:af86:b0:1c7:db8e:8589 with SMTP id
 w6-20020a17090aaf8600b001c7db8e8589mr21369924pjq.94.1648991753046; 
 Sun, 03 Apr 2022 06:15:53 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm9272416pfu.35.2022.04.03.06.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 06:15:52 -0700 (PDT)
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
Subject: [PATCH resend 3/4] dt-bindings: spi: add binding doc for spi-mtk-snfi
Date: Sun,  3 Apr 2022 21:14:52 +0800
Message-Id: <20220403131453.1269229-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403131453.1269229-1-gch981213@gmail.com>
References: <20220403131453.1269229-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_061554_476215_9D420EA9 
X-CRM114-Status: GOOD (  13.87  )
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
