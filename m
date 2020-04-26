Return-Path: <SRS0=FVTc=6K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061A6C54FCB
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 19:01:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A25206BF
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 19:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZkKnC20";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="odiYDHWn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A25206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8VcA2CkeQe80l1S1A2tyj+BFKCcME+3KCpxNFFVobI=; b=cZkKnC20xR5UIN
	sVFr9chOqThM5Uz5dx+tYagGRyH9IbhXrNAIVXqPXbmXNES24gIxOFU3o9EpK2Zyc/7WVFsZHQknU
	hWIcMO7PawbtkRnNxD/H40rvgZ/UR4fS1uy2iXqfoMiWr0bw8HYLhSvY3qnVTSAOOr/ZHr/vMxAPV
	+y52XiJI7ub7aPSwVuXh3+7ms5uB8xABmG7hZ5iRvpyjMeMk95DSroGY3I+QyK0/AreKJ2TmqL/RR
	e0BwG3xDM8X1j0vZbxKT8sSB+SPA99OwyKMpYqq5NsaHjhtuWSkT3jzcSOvkbwaZsyZZp+XJpfgQn
	GMmU+jev6iMkYRdPvR3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSmX4-0003F8-Tg; Sun, 26 Apr 2020 19:01:38 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSmVd-0008WB-R0
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2020 19:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1587927551; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4g9D4y5gDtWMMffSqwXa5g3+cluAqfYCl9HnWWe2i54=;
 b=odiYDHWnFPVSxmcMC8qtWCwc2Zt9LEnWgvXRbcr3KT6IdjyQbI2tDd5ZyS++f2DvZgh+bn
 1OeHDLyfoPZTnxbZjK6DPB/95K61//aVz/92NgXI3Zl1a9HtrYDHI9gFnUgmjeZbBcrdwk
 iVhkBOZU1Qvoew2RkpkAI7LWAavNOHs=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 6/8] dt-bindings: i2c: Convert i2c-jz4780.txt to YAML
Date: Sun, 26 Apr 2020 20:58:54 +0200
Message-Id: <20200426185856.38826-6-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_120010_300974_8DC39B63 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the i2c-jz4780.txt file to ingenic,i2c.yaml.

Two things were changed in the process:
- the clock-frequency property can now only be set to the two values
  that can be set by the hardware;
- the dmas and dma-names properties are now required.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/i2c/i2c-jz4780.txt    | 33 --------
 .../devicetree/bindings/i2c/ingenic,i2c.yaml  | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt b/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
deleted file mode 100644
index d229eff5ca1b..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Ingenic JZ4780 I2C Bus controller
-
-Required properties:
-- compatible: should be one of the following:
-  - "ingenic,jz4780-i2c" for the JZ4780
-  - "ingenic,x1000-i2c" for the X1000
-- reg: Should contain the address & size of the I2C controller registers.
-- interrupts: Should specify the interrupt provided by parent.
-- clocks: Should contain a single clock specifier for the JZ4780 I2C clock.
-- clock-frequency: desired I2C bus clock frequency in Hz.
-
-Recommended properties:
-- pinctrl-names: should be "default";
-- pinctrl-0: phandle to pinctrl function
-
-Example
-
-/ {
-	i2c4: i2c4@10054000 {
-		compatible = "ingenic,jz4780-i2c";
-		reg = <0x10054000 0x1000>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <56>;
-
-		clocks = <&cgu JZ4780_CLK_SMB4>;
-		clock-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pins_i2c4_data>;
-
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
new file mode 100644
index 000000000000..4759b9a3eb18
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs I2C controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: "^i2c@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - ingenic,jz4780-i2c
+      - ingenic,x1000-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    enum: [ 100000, 400000 ]
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for RX
+      - description: DMA controller phandle and request line for TX
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-frequency
+  - dmas
+  - dma-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+    #include <dt-bindings/dma/jz4780-dma.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c@10054000 {
+      compatible = "ingenic,jz4780-i2c";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0x10054000 0x1000>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <56>;
+
+      clocks = <&cgu JZ4780_CLK_SMB4>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&pins_i2c4_data>;
+
+      dmas = <&dma JZ4780_DMA_SMB4_RX 0xffffffff>,
+             <&dma JZ4780_DMA_SMB4_TX 0xffffffff>;
+      dma-names = "rx", "tx";
+
+      clock-frequency = <400000>;
+
+      rtc@51 {
+        compatible = "nxp,pcf8563";
+        reg = <0x51>;
+
+        interrupt-parent = <&gpf>;
+        interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+      };
+    };
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
