Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036FAC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 00:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC90C206D4
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 00:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DIq0++1c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="pFXsq/qv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC90C206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EJfgbrBKNdC6OfQfGHiBQGrax4AeuUHZu74q/uyACpw=; b=DIq0++1cZk8LXr
	fFZoeBGhJN53K2xAlaZlJE8xSWjDYkimrOvPXLIcvqTwd34N50mRhHJvNGh7yU4lrxi8nGa1Jm4Q3
	tyXXAPYuLxM6F1Y0dREHI79P7tjIaqr//PVYneD9IP6OA8Oe8NCZWrTW6ky7VGHafATYzJEKjF2QP
	7IxrU4tohVb6T9nKXy3+hdWVf17jo5zZovVvfrz+bHNdY5ygm13wQDcyIVqtm3I0wft+SleYvZflM
	dlcl87aq4yHtK1sQiCt1EH77wnjKufoGpGl+ju8QGfKxDazRHLNrd38j8j6eRdUUb+OH6UBXH8H8G
	FECYBSFHOiNtP0P+V+hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCVi-0003aL-CO; Wed, 20 May 2020 00:23:02 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCVd-0003Xz-E5
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 00:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589934174; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=S4TMOQR23TFpFNf/Gdrrq65wyImfAOA6VASHODQN8A8=;
 b=pFXsq/qv/ySG1OgqJMAkj47v1iFVwABNrhzagp24huDrvQQD7/2MOGfDRL8kP21Pv7ixuC
 YqzHiUe9AvbE+hvbSjuBo8cgHvQYq2EZzDV+6T6G1QxIlG9TkztILSEs8uwYgQth4/w1fw
 7Y33eInpQqi0G3I/Hzs0azYubnoc1rQ=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: Convert ingenic,
 pinctrl.txt to YAML
Date: Wed, 20 May 2020 02:22:32 +0200
Message-Id: <20200520002234.418025-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_172257_846660_9F6F1A91 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: devicetree@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.

In the process, some compatible strings now require a fallback, as the
corresponding SoCs are pin-compatible with their fallback variant.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
        - remove 'additionalProperties: false' since we will have pin conf nodes

 .../bindings/pinctrl/ingenic,pinctrl.txt      |  81 -----------
 .../bindings/pinctrl/ingenic,pinctrl.yaml     | 136 ++++++++++++++++++
 2 files changed, 136 insertions(+), 81 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
deleted file mode 100644
index d9b2100c98e8..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ /dev/null
@@ -1,81 +0,0 @@
-Ingenic XBurst pin controller
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-For the XBurst SoCs, pin control is tightly bound with GPIO ports. All pins may
-be used as GPIOs, multiplexed device functions are configured within the
-GPIO port configuration registers and it is typical to refer to pins using the
-naming scheme "PxN" where x is a character identifying the GPIO port with
-which the pin is associated and N is an integer from 0 to 31 identifying the
-pin within that GPIO port. For example PA0 is the first pin in GPIO port A, and
-PB31 is the last pin in GPIO port B. The jz4740, the x1000 and the x1830
-contains 4 GPIO ports, PA to PD, for a total of 128 pins. The jz4760, the
-jz4770 and the jz4780 contains 6 GPIO ports, PA to PF, for a total of 192 pins.
-
-
-Required properties:
---------------------
-
- - compatible: One of:
-    - "ingenic,jz4740-pinctrl"
-    - "ingenic,jz4725b-pinctrl"
-    - "ingenic,jz4760-pinctrl"
-    - "ingenic,jz4760b-pinctrl"
-    - "ingenic,jz4770-pinctrl"
-    - "ingenic,jz4780-pinctrl"
-    - "ingenic,x1000-pinctrl"
-    - "ingenic,x1000e-pinctrl"
-    - "ingenic,x1500-pinctrl"
-    - "ingenic,x1830-pinctrl"
- - reg: Address range of the pinctrl registers.
-
-
-Required properties for sub-nodes (GPIO chips):
------------------------------------------------
-
- - compatible: Must contain one of:
-    - "ingenic,jz4740-gpio"
-    - "ingenic,jz4760-gpio"
-    - "ingenic,jz4770-gpio"
-    - "ingenic,jz4780-gpio"
-    - "ingenic,x1000-gpio"
-    - "ingenic,x1830-gpio"
- - reg: The GPIO bank number.
- - interrupt-controller: Marks the device node as an interrupt controller.
- - interrupts: Interrupt specifier for the controllers interrupt.
- - #interrupt-cells: Should be 2. Refer to
-   ../interrupt-controller/interrupts.txt for more details.
- - gpio-controller: Marks the device node as a GPIO controller.
- - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
-    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
-    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
- - gpio-ranges: Range of pins managed by the GPIO controller. Refer to
-   ../gpio/gpio.txt for more details.
-
-
-Example:
---------
-
-pinctrl: pin-controller@10010000 {
-	compatible = "ingenic,jz4740-pinctrl";
-	reg = <0x10010000 0x400>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	gpa: gpio@0 {
-		compatible = "ingenic,jz4740-gpio";
-		reg = <0>;
-
-		gpio-controller;
-		gpio-ranges = <&pinctrl 0 0 32>;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <28>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
new file mode 100644
index 000000000000..5be2b1e95b36
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs pin controller devicetree bindings
+
+description: >
+  Please refer to pinctrl-bindings.txt in this directory for details of the
+  common pinctrl bindings used by client devices, including the meaning of the
+  phrase "pin configuration node".
+
+  For the Ingenic SoCs, pin control is tightly bound with GPIO ports. All pins
+  may be used as GPIOs, multiplexed device functions are configured within the
+  GPIO port configuration registers and it is typical to refer to pins using the
+  naming scheme "PxN" where x is a character identifying the GPIO port with
+  which the pin is associated and N is an integer from 0 to 31 identifying the
+  pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
+  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and the X1830
+  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The JZ4760, the
+  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total of 192
+  pins.
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  nodename:
+    pattern: "^pinctrl@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-pinctrl
+        - ingenic,jz4725b-pinctrl
+        - ingenic,jz4760-pinctrl
+        - ingenic,jz4770-pinctrl
+        - ingenic,jz4780-pinctrl
+        - ingenic,x1000-pinctrl
+        - ingenic,x1500-pinctrl
+        - ingenic,x1830-pinctrl
+      - items:
+        - const: ingenic,jz4760b-pinctrl
+        - const: ingenic,jz4760-pinctrl
+      - items:
+        - const: ingenic,x1000e-pinctrl
+        - const: ingenic,x1000-pinctrl
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^gpio@[0-9]$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - ingenic,jz4740-gpio
+          - ingenic,jz4725b-gpio
+          - ingenic,jz4760-gpio
+          - ingenic,jz4770-gpio
+          - ingenic,jz4780-gpio
+          - ingenic,x1000-gpio
+          - ingenic,x1500-gpio
+          - ingenic,x1830-gpio
+
+      reg:
+        items:
+          - description: The GPIO bank number
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+        description:
+          Refer to ../interrupt-controller/interrupts.txt for more details.
+
+      interrupts:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - gpio-controller
+      - "#gpio-cells"
+      - interrupts
+      - interrupt-controller
+      - "#interrupt-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    pin-controller@10010000 {
+      compatible = "ingenic,jz4770-pinctrl";
+      reg = <0x10010000 0x600>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      gpio@0 {
+        compatible = "ingenic,jz4770-gpio";
+        reg = <0>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 32>;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <17>;
+      };
+    };
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
