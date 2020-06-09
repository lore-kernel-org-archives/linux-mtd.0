Return-Path: <SRS0=GuhJ=7W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279A0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 07:42:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2B52074B
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 07:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oNUL6lXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2B52074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B9MK5QYMWcMXGajTTFCnLEI0wBRBUnc77WHwGxALphY=; b=oNUL6lXdeJgIQgMwiBao+B2VFq
	U5Q60eO61LmaDNlPR8/Jh2tYM3YYuEK9laKB/N5ANj2f9kX/OEYDE4y9Bo+yu0Edn5TEhlGORA71p
	lNynreJdV7W3fIF45zPlUtk3eFJ0TaowrvPMiTBeVCTP4Pn/QFTx54bkgB60aFzVqKSdVT9oqqsPv
	1kd4dYqDuYs1SeofIK/fbl3HCe+6IuuTzwsQeDHsixGHUgcJa5kUauL8kV5yVUK2P8g6y+wUisKZ9
	D6pcvr5CI7WNENAc0vUiryeB4SlvXJ0RqJQZ9m8396js6s6DaYSOLpghMI/9gzFJMTkAA0Q+IipiK
	AaJX3uaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiYtu-0003yn-Tp; Tue, 09 Jun 2020 07:42:26 +0000
Received: from lucky1.263xmail.com ([211.157.147.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiYsC-0002HD-5U; Tue, 09 Jun 2020 07:40:43 +0000
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 0E980C3810;
 Tue,  9 Jun 2020 15:40:29 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from ubuntu18.lan (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31250T139912844142336S1591688422511107_; 
 Tue, 09 Jun 2020 15:40:29 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <eff317781d3eb59a5582b697a7d81b16>
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
Subject: [PATCH v6 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND flash
 controller
Date: Tue,  9 Jun 2020 15:40:18 +0800
Message-Id: <20200609074020.23860-2-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609074020.23860-1-yifeng.zhao@rock-chips.com>
References: <20200609074020.23860-1-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_004040_554649_3D4E7E8D 
X-CRM114-Status: GOOD (  13.92  )
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

Changes in v6:
- Fix some wrong define
- Modified the definition of compatible

Changes in v5:
- Fix some wrong define
- Add boot-medium define
- Remove some compatible define

Changes in v4:
- The compatible define with rkxx_nfc
- Add assigned-clocks
- Fix some wrong define

Changes in v3:
- Change the title for the dt-bindings

Changes in v2: None

 .../mtd/rockchip,nand-controller.yaml         | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
new file mode 100644
index 000000000000..f753fe8248aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
@@ -0,0 +1,154 @@
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
+          - const: rockchip,rk3326-nfc
+          - const: rockchip,px30-nfc
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
+  pinctrl-0:
+    maxItems: 1
+
+  pinctrl-names:
+    const: default
+
+  power-domains:
+     maxItems: 1
+
+patternProperties:
+  "^nand@[a-f0-9]$":
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
+          - NFCv900(PX30 and RK3326) support ecc strength 16, 40, 60 and 70.
+          - NFCv600(RK3066 and RK2928) support ecc strength 16, 24, 40 and 60.
+          - NFCv622(RK3036 and RK3128) support ecc strength 16, 24, 40 and 60.
+          - NFCv800(RK3308 and RV1108) support ecc strength 16.
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
+          algorithms supported by the BOOTROM.
+          Only used in combination with 'nand-is-boot-medium'.
+
+      rockchip,boot-ecc-strength:
+        enum: [16, 24, 40, 60, 70]
+        allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          If specified it indicates that a different BCH/ECC setting is
+          supported by the BOOTROM.
+          - NFCv900(PX30 and RK3326) support ecc strength 16 and 70.
+          - NFCv600(RK3066 and RK2928) support ecc strength 16, 24, 40 and 60.
+          - NFCv622(RK3036 and RK3128) support ecc strength 16, 24, 40 and 60.
+          - NFCv800(RK3308 and RV1108) support ecc strength 16.
+          Only used in combination with 'nand-is-boot-medium'.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
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
