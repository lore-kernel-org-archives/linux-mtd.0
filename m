Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B633BD3F080
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ASqtvGXFrZNsLlxFZ3b0vRv85Gv1yZEvPPP0Lh7d26k=; b=FZyTrx0NJZGnkn
	6j0CMN7kGuK5T4lQ8u8V4TmeWi0pfjZSh64fTcHT4aSrfS23PJeWbhWSrDYdJJWfBLcUMiYA5YlCg
	KgMlbWLK6A6a5O+GtMMqtYi776F3BlTQnxfS5r0NfMVteQiuXPpTt8uFU8TLU/8SBkBSO2VS1Ffmi
	Y4HUPs1rNx8pWz+nj/PBIL2WyP3q3GQeUfcP9XY1ALZS6J0ARYZfkNzmGBmOO1XLgO/QAfqa7YGNb
	+ShxJi73+jE8EHkTIvNE2ef3xr9Tug+aacK6O1gsloKydK7xjhTjyzDaUpo58pUtAVQdFZeCMpvj2
	Iw9OJIhHaVLklpIHcQXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7ah-0000000GISO-36M4;
	Wed, 28 Jan 2026 15:36:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7af-0000000GIRz-04js
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 15:36:22 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-352e2156450so3250847a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769614580; x=1770219380; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nuofcrz98MXCzhxYxay1gJcoLhghs/UDg58+L67iybc=;
        b=BxcevgGRyGlJn+2L9oDPfgztO5p4BLVLIEtFgKnzvhQYqTBJU3ADSQ3MjIrEA/NcK0
         Y1/AH5ZlSJMH++vnPy4h2ZAAyDhDfDvqQZSCLCnlaX5IawmlY+Z+LIy4gtp9l8Z/ELlq
         jfGFpMWfFBam/8LMhXF3YR6EwLQoS+Ip8sqi1yTIKQCiHc6cQ6KPmst58O3EL4Dl4nxA
         ccCcb4t2xirBNh91t69F1tz0fVYXMCnRgxNLThqi+xdP9GhoVz2R1TaXwQXFCvSiYryy
         /d+QUvgMREVyS2agkDvKbiaRp6oi4m4EDPMurDA7xANAG6JsgnQSKiAHVLTlzvr5MQYL
         7nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614580; x=1770219380;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuofcrz98MXCzhxYxay1gJcoLhghs/UDg58+L67iybc=;
        b=TzbWN6NzhK8pytm0KAee3szUDbkV28EdIQcbqNpaBWljnwxU30FEwUndbF3dKlhDh3
         5R1DgZnHn7ayjI2lkt0wmc4n8+CCs+A+14Y0KNwzglAA2PfPOHpNqvSMxjyg3ZPMWo0R
         lDHgVTl/Tyy94wLpH+OJ98R/0WbJGReYGm8sT5U/i6YkGmAlVTXS+zT5b15nTVNNi8pB
         8hwsbVz+Lqd3U8y6slCgkUkz9lsj1jOAmGQYNVkiDsJPqUr4oNWcttSGJqneahcI9FRP
         L9AMisGHp9nC8q0CbJv7V/7N+YBXLjOCaR7eTWWVTbi2vT/fY6SPg6z2QpNPQUMh0Kk7
         nsGg==
X-Gm-Message-State: AOJu0YwD4QbvunKoQ3Y9QxLi0ReObeRuHwMIJGLKZIC6OI5NOUxAETqT
	gW5mC8HQ84fcJ1v9EiHbwsQBNltre05x3N+orXc6UT/AmXUVJ60NWeCS
X-Gm-Gg: AZuq6aIqnNmw05uqPadAm9YvD8Y2LYHP769fy+i7OoW9/q2kv9CiBzP8AOeWd9t7YYO
	qtiMXUh20gI7rm+wmABIiM7WJ5aa8UUnAIS6xGC2Ck/svt7+4Cg3JmB+DtakfPTORXXxYFOymtk
	tlUSRZzYxoEt9DhdA/kOMelYlfIYAabOk4AEz4M5lCqkHyV0odrXc8GIfZuO9bai0zHFTU+UpTW
	G2KelenknLdZqBFsauil7RmKTI1PW0UMiDz/0JU/Xl7jpQWCDaOZhFwdMXc0sDXjoPE1qS45MGH
	cuW1GygpCy8Af8zOmsKwf0ZMZ6d6igwTFtoY0pFdptbEoynLsjYwjWIVLfS6sF7W1kr2VYCav0u
	M92fN9PWGv1zuPFpORFtqZPEbHGQlhz1bn3MJ3oKsDzfJtDps0u5my/NBBWY+QdogXDmXRoCBCd
	KCXU/tTronzxdkaRdGTSjJ1s1ErgeCzmuGnV+7mjMIJhX0oaM=
X-Received: by 2002:a17:90b:56c3:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-353fecec28emr5232327a91.15.1769614579618;
        Wed, 28 Jan 2026 07:36:19 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.69.144])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-35410ee55d1sm167976a91.3.2026.01.28.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:36:19 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Wed, 28 Jan 2026 15:36:12 +0000
Subject: [PATCH v3] dt-bindings: mtd: mxic,multi-itfc-v009-nand-controller:
 convert to DT schema
MIME-Version: 1.0
Message-Id: <20260128-mxic-nand-v3-1-c61764e85f60@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOssemkC/1WMywrCMBBFf6XM2kgyferK/xAXIcm0AzaVREKl9
 N9NC0Jdnss9Z4HoArsI12KB4BJHnnyG8lSAGbTvnWCbGVBiIxWiGGc2wmtvRVuh6kqFtZMl5P8
 rOOJ5b90fmQeO7yl89nRS2/qrNIdKUkKJum4tVVpa0u2tHzU/z2YaYaskPJrd0cRsNiQNXSpCs
 n/muq5fuG9HKdwAAAA=
X-Change-ID: 20260122-mxic-nand-742183125e03
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mason Yang <masonccyang@mxic.com.tw>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_073621_095218_BEAD19C1 
X-CRM114-Status: GOOD (  15.68  )
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

Convert Macronix Raw NAND Controller Device Tree binding to DT Schema.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
Changes in v3:
- Fix errors detected by dt check.
- Link to v2: https://lore.kernel.org/r/20260128-mxic-nand-v2-1-6f0cf94f2fd7@gmail.com

Changes in v2:
- Add "Mason Yang" as maintainer.
- Link to v1: https://lore.kernel.org/r/20260126-mxic-nand-v1-1-557df4a0dfa7@gmail.com
---
 .../mtd/mxic,multi-itfc-v009-nand-controller.yaml  | 78 ++++++++++++++++++++++
 .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ----------
 2 files changed, 78 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
new file mode 100644
index 000000000000..81c041aa2610
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mxic,multi-itfc-v009-nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Macronix Raw NAND Controller
+
+maintainers:
+  - Mason Yang <masonccyang@mxic.com.tw>
+
+description:
+  The Macronix Multi-Interface Raw NAND Controller is a versatile flash
+  memory controller for embedding in SoCs, capable of interfacing with
+  various NAND devices. It requires dedicated clock inputs for core, data
+  transmit, and delayed transmit paths along with register space and an
+  interrupt line for operation.
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    const: mxic,multi-itfc-v009-nand-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ps
+      - const: send
+      - const: send_dly
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    nand-controller@43c30000 {
+        compatible = "mxic,multi-itfc-v009-nand-controller";
+        reg = <0x43c30000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 0x1d IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+        clock-names = "ps", "send", "send_dly";
+
+        nand@0 {
+            reg = <0>;
+            nand-ecc-mode = "soft";
+            nand-ecc-algo = "bch";
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
deleted file mode 100644
index 46c55295a3e6..000000000000
--- a/Documentation/devicetree/bindings/mtd/mxic-nand.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Macronix Raw NAND Controller Device Tree Bindings
--------------------------------------------------
-
-Required properties:
-- compatible: should be "mxic,multi-itfc-v009-nand-controller"
-- reg: should contain 1 entry for the registers
-- #address-cells: should be set to 1
-- #size-cells: should be set to 0
-- interrupts: interrupt line connected to this raw NAND controller
-- clock-names: should contain "ps", "send" and "send_dly"
-- clocks: should contain 3 phandles for the "ps", "send" and
-	 "send_dly" clocks
-
-Children nodes:
-- children nodes represent the available NAND chips.
-
-See Documentation/devicetree/bindings/mtd/nand-controller.yaml
-for more details on generic bindings.
-
-Example:
-
-	nand: nand-controller@43c30000 {
-		compatible = "mxic,multi-itfc-v009-nand-controller";
-		reg = <0x43c30000 0x10000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		interrupts = <GIC_SPI 0x1d IRQ_TYPE_EDGE_RISING>;
-		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
-		clock-names = "send", "send_dly", "ps";
-
-		nand@0 {
-			reg = <0>;
-			nand-ecc-mode = "soft";
-			nand-ecc-algo = "bch";
-		};
-	};

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260122-mxic-nand-742183125e03

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
