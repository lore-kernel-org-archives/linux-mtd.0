Return-Path: <SRS0=+X7X=A2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49121C43446
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 09:04:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1736B20672
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 09:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DO+cICO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1736B20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcBGGLuzEJneuZhjiA87Un0hR5qusrdH4HCSIkLMftM=; b=DO+cICO7RFlvDmFD1eJ0JPxdzT
	ViJsKicoLo1Jr2/5MlFWM/hwvNPgLw2Ehn08472QuvOjSHjDB0FKz8IOYdY4TFC16Za+0i4hQ6kmw
	ZbtYKi6FVD9Ujpq2+F9JeAeyPt0R39TDUvZkN7htumIjOdSR4blFjzkxu2UtXQUgOxk421lz4lhTW
	JbSIXuxY8wwnJgOw9r+jVtQHF6eahel0GXBBAErGy875Cp98M8oM6ZrYsnoQayC+7HAsqoBVElEaV
	xYXuiHomUID5uzRJDG9PBBc9/ASQrNFtQs6J1RpnQcwIG3jXuO609WtUAiV1Cyd4ZbhCWQU9bZtcw
	Yg87SPFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvdKx-0003sd-47; Wed, 15 Jul 2020 09:04:23 +0000
Received: from lucky1.263xmail.com ([211.157.147.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvdKj-0003nH-Hs; Wed, 15 Jul 2020 09:04:11 +0000
Received: from localhost (unknown [192.168.167.209])
 by lucky1.263xmail.com (Postfix) with ESMTP id 34272B05E3;
 Wed, 15 Jul 2020 17:03:59 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P9169T139648078694144S1594803824986898_; 
 Wed, 15 Jul 2020 17:03:59 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6e632bb10910e47e4efc1cd4d0e425a3>
X-RL-SENDER: yifeng.zhao@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: yifeng.zhao@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Yifeng Zhao <yifeng.zhao@rock-chips.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v7 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND flash
 controller
Date: Wed, 15 Jul 2020 17:03:39 +0800
Message-Id: <20200715090342.28339-2-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715090342.28339-1-yifeng.zhao@rock-chips.com>
References: <20200715090342.28339-1-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_050410_160652_E6886730 
X-CRM114-Status: GOOD (  13.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, heiko@sntech.de,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Documentation support for Rockchip RK3xxx NAND flash controllers

Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
---

Changes in v7:
- Fix some wrong define

Changes in v6:
- Fix some wrong define
- Modified the definition of compatible

Changes in v5:
- Fix some wrong define.
- Add boot-medium define.
- Remove some compatible define.

Changes in v4:
- The compatible define with rkxx_nfc.
- Add assigned-clocks.
- Fix some wrong defineChanges in.

Changes in v3:
- Change the title for the dt-bindings.

Changes in v2: None

 .../mtd/rockchip,nand-controller.yaml         | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
new file mode 100644
index 000000000000..493705a55638
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/rockchip,nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoCs NAND FLASH Controller (NFC)
+
+allOf:
+  - $ref: "nand-controller.yaml#"
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,px30-nfc
+      - const: rockchip,rk2928-nfc
+      - const: rockchip,rv1108-nfc
+      - items:
+          - const: rockchip,rk3036-nfc
+          - const: rockchip,rk2928-nfc
+      - items:
+          - const: rockchip,rk3308-nfc
+          - const: rockchip,rv1108-nfc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ahb
+      - const: nfc
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[0-7]$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 7
+
+      nand-ecc-mode:
+        const: hw
+
+      nand-ecc-step-size:
+        const: 1024
+
+      nand-ecc-strength:
+        enum: [16, 24, 40, 60, 70]
+        description:
+          The ECC configurations that can be supported are as follows.
+            NFC v600 ECC 16, 24, 40, 60
+              RK2928, RK3066, RK3188
+
+            NFC v622 ECC 16, 24, 40, 60
+              RK3036, RK3128
+
+            NFC v800 ECC 16
+              RK3308, RV1108
+
+            NFC v900 ECC 16, 40, 60, 70
+              RK3326, PX30
+
+      nand-bus-width:
+        const: 8
+
+      rockchip,boot-blks:
+        minimum: 2
+        default: 16
+        allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          The NFC driver need this information to select ECC
+          algorithms supported by the boot ROM.
+          Only used in combination with 'nand-is-boot-medium'.
+
+      rockchip,boot-ecc-strength:
+        enum: [16, 24, 40, 60, 70]
+        allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          If specified it indicates that a different BCH/ECC setting is
+          supported by the boot ROM.
+            NFC v600 ECC 16, 24
+              RK2928, RK3066, RK3188
+
+            NFC v622 ECC 16, 24, 40, 60
+              RK3036, RK3128
+
+            NFC v800 ECC 16
+              RK3308, RV1108
+
+            NFC v900 ECC 16, 70
+              RK3326, PX30
+
+          Only used in combination with 'nand-is-boot-medium'.
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
+    #include <dt-bindings/clock/rk3308-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    nfc: nand-controller@ff4b0000 {
+      compatible = "rockchip,rk3308-nfc",
+                   "rockchip,rv1108-nfc";
+      reg = <0x0 0xff4b0000 0x0 0x4000>;
+      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
+      clock-names = "ahb", "nfc";
+      assigned-clocks = <&clks SCLK_NANDC>;
+      assigned-clock-rates = <150000000>;
+
+      pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_csn0
+                   &flash_rdn &flash_rdy &flash_wrn>;
+      pinctrl-names = "default";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        label = "rk-nand";
+        nand-bus-width = <8>;
+        nand-ecc-mode = "hw";
+        nand-ecc-step-size = <1024>;
+        nand-ecc-strength = <16>;
+        nand-is-boot-medium;
+        rockchip,boot-blks = <8>;
+        rockchip,boot-ecc-strength = <16>;
+      };
+    };
+
+...
-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
