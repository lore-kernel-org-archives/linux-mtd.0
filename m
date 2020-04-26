Return-Path: <SRS0=FVTc=6K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA804C54FCB
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 19:00:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93D1A206BF
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 19:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jlVKfu7r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="J1r27Qur"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93D1A206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gM0Dcr5XJQrifmbzkkaEaRTL19OQ43Yk/RbKrcsuAMs=; b=jlVKfu7rabe4rK
	WKnqrMOlROSAtPMXs4/g6U/Qbdimy8p3n9RFOWgNZFp4rpLWV7V8RHsA0IvQ9nrSWULnak4Oj3Of1
	ksidMHs9zalY+FZxF9pPqY+oA2My5V74l8zpHFX/hyj78i5soghVD6ah/PUVnsRV4Y6MSWxrip17C
	yhAQSABdERqmxGbpA5NW+pMBMFk2vRldshUh8cJIHJ52381r4yXfBPzwbBKU7n7zX5+PemoC2YtBl
	HVVpchicjFNYH43/1bKNrC/ZFFDrYyv0jFQV/SaXWFHAgEwHBaErra7HHEc781JvmAJ1IaTV1UDPS
	flPXj3it1vkAHYJ870VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSmVp-0001zE-LP; Sun, 26 Apr 2020 19:00:21 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSmUo-0006yl-7N
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2020 18:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1587927545; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBcEz9by+T4cFgShyhpvICcXahPKT+AnlbYY5I/mqIw=;
 b=J1r27QurD8bfCdUW3P9HroiZx+syuKqbnQSd/IWk+JgNKDWJR0SOW1X8vB4tlS9N2tyUhv
 aeM+vnFie2Dn4iM9Jtof2wCw+iD2IIIvIVxFmwe1z7ybRBK9tFm1m7MORfUlbCTEWjrHno
 y7xVX+v/OlgVxM/pCrPxA/JiSrWcnk0=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/8] dt-bindings: intc: Convert ingenic,intc.txt to YAML
Date: Sun, 26 Apr 2020 20:58:50 +0200
Message-Id: <20200426185856.38826-2-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_115918_704790_18988A54 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Convert the ingenic,intc.txt doc file to ingenic,intc.yaml.

Some compatible strings now require a fallback, as the controller
generally works the same across the SoCs families.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../interrupt-controller/ingenic,intc.txt     | 28 ---------
 .../interrupt-controller/ingenic,intc.yaml    | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
deleted file mode 100644
index d4373d0f7121..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Ingenic SoC Interrupt Controller
-
-Required properties:
-
-- compatible : should be "ingenic,<socname>-intc". Valid strings are:
-    ingenic,jz4740-intc
-    ingenic,jz4725b-intc
-    ingenic,jz4770-intc
-    ingenic,jz4775-intc
-    ingenic,jz4780-intc
-- reg : Specifies base physical address and size of the registers.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-- interrupts : Specifies the CPU interrupt the controller is connected to.
-
-Example:
-
-intc: interrupt-controller@10001000 {
-	compatible = "ingenic,jz4740-intc";
-	reg = <0x10001000 0x14>;
-
-	interrupt-controller;
-	#interrupt-cells = <1>;
-
-	interrupt-parent = <&cpuintc>;
-	interrupts = <2>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
new file mode 100644
index 000000000000..28b27e1a6e9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs interrupt controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: "^interrupt-controller@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-intc
+        - ingenic,jz4760-intc
+        - ingenic,jz4780-intc
+      - items:
+        - enum:
+          - ingenic,jz4775-intc
+          - ingenic,jz4770-intc
+        - const: ingenic,jz4760-intc
+      - items:
+        - const: ingenic,x1000-intc
+        - const: ingenic,jz4780-intc
+      - items:
+        - const: ingenic,jz4725b-intc
+        - const: ingenic,jz4740-intc
+
+  "#interrupt-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - interrupt-controller
+
+examples:
+  - |
+    intc: interrupt-controller@10001000 {
+      compatible = "ingenic,jz4770-intc", "ingenic,jz4760-intc";
+      reg = <0x10001000 0x40>;
+
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      interrupt-parent = <&cpuintc>;
+      interrupts = <2>;
+    };
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
