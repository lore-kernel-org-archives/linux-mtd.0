Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E43DD35688
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=phONo49lHzzGNF89zJ5ds1gk7tyQvuU9v2MY+aPge5g=; b=U4/kdyXCa0e1kJ
	wh6uk+sBWj1mzWGI6efABOePCbbavR4K2P6oX+Tzx/Qz/DpKG+E3q+Fs3Vd0rQjmXFkaRxso4CV/V
	BOrErjeLCZKuDvE7xmfzgT8Iblva+EeMtw8WXsrZqBgt8ZVUw2c1keWSxLfiepF9liQbvVB3UcOpR
	yZQx61abaCiCaxjdR2Qc+nCTc0piQs/dLKHp1dJ2FmO8x6kstFUJgCVr67P+it2OIBj+GOsBn/iE8
	CB8nbNJbz5Eqx106GQVZ1a7BQe5WCZSzQHs/OOL3o1A4oY9KhVDruYrUdLZJSnH+aFoJfhsAbHlCs
	WvOMuSYgNOc31yJL91QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0RH-0000000Fcg9-3sUB;
	Wed, 28 Jan 2026 07:58:11 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0RF-0000000Fcfe-1wBl
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 07:58:10 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso3570226a91.3
        for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2026 23:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769587088; x=1770191888; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GaIybHUeWAWPBlqCbml8/y9/Q+UCstHaUvRUJsd/Kic=;
        b=CmmpAV+5NQizB6j67Vkog3QayowooyD+6KO9BLqZy8ilaa7z5ailPQzIRDWnZtgEPZ
         b83EuCFsvela3YbiaLPzwORmwR4C6hiDetiYLFAYys8BrgojLQHMqGlStObYhQpS6YKB
         fZEAwXR+5CdFQ1B1fRJXOrYZgRt/Rk5Xvmts5t4QonCkur5oJVRVBaPK7z4UIahUA9Mg
         J3m0nzG2F60eCFiHmA8514z7E/td5vibCi1019BcCMQUYtzXCjRit8ONGshZOP7tI+1c
         wd23rmeVdp/RZRS2yZ+Kw8SKlP5bSCq5ceeem52+t3iES7qV/fBtD/7Mzrv0xTDqmrxA
         W5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769587088; x=1770191888;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaIybHUeWAWPBlqCbml8/y9/Q+UCstHaUvRUJsd/Kic=;
        b=RIoGfW9z7ZSY0zUtrtp+apkPoH0fRahU2nDvrrd6qh09dnk8tnWE33pZfy/CRnQNqv
         PjZQjZ+8P095uadp0Ga64+vuFluyKHLv+5YhLA/iU8KAjGXIw9gm0UVldf8kmeoV1K6l
         288Anw0vGV+6mqCAhd724UCxw7Anu80fEJFUVpKJIi4sjHrDZ2XjIy926aJtmtO9gaUZ
         nMvJsUNTi7uENbJ2bUnbhqkKQG1czHBdIDjVptLpKd90qrCMpc9b/NIQrt2l+tXgPrUO
         aM25rpBr0xxF3Alp3iQXlw26qCof9HCYHsTbFYwtU0/oifGduDIGuz4PjT0kR+c8HF3o
         puOg==
X-Gm-Message-State: AOJu0YwipkYMuR9JwqyluV45kXVV+rgUoc8FeCglmkpKQ/NgIkVbA7kd
	gl0zkrqmlub6CQGro97iRmfGCC6OgeIoy1m4ykCUynGlEY89665fbt2X
X-Gm-Gg: AZuq6aJArWu4kJJCUPd9kSf41oz0M7+G7KhfwBhxckmSjJ7At/5g34hiV9KH4yUScvB
	iLTQIuFI2suyiQWutzEHh2PB9wJ+0OF5BMlQxJuqfJYkH4cvubXBfvBch7FmcSiC1tUAaSNGrwZ
	dKjwXr6LuN+X3sfd20x+6E/HzxNvIzrZf8rxJgk2M7f1XqCsYlPoAQLEaxn2jaBW/7N4lc3oGC/
	Ggz4HNBI0PylXUMizhH4B9dMzBIqpWOU4/KkPdQfarj8iOD51BPMGVtWuA9QpezFuyvLHFEY3oe
	FVCWHTR0i0XzUKmXMnDH9goQmOmN91l8Y2ned/7F9S3asJo/mijwSWr1o+eRv6/R1a7XdZb0X9g
	f6ZHZZFRik4jJytY/S6Krt9hPMM2n/kU0b5k7TT9Z7zLBr0SF/NTPMHWrJl9oH0TcdIiXpnfbdB
	A7I9qIS2pwF3NGSFmLC0eMURf2A/4d0xjjQOFz
X-Received: by 2002:a17:90b:1d48:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-353fecde7d8mr3872814a91.9.1769587088304;
        Tue, 27 Jan 2026 23:58:08 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.119.57])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-353f61e0230sm4637149a91.11.2026.01.27.23.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:58:08 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Wed, 28 Jan 2026 07:58:00 +0000
Subject: [PATCH v2] dt-bindings: mtd: mxic,multi-itfc-v009-nand-controller:
 convert to DT schema
MIME-Version: 1.0
Message-Id: <20260128-mxic-nand-v2-1-6f0cf94f2fd7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIfBeWkC/03MSwrCMBSF4a2UOzaS3DaNOHIf0kHIo71gUkkkV
 Er2biwIDv/D4dshu0Quw7XbIblCmdbYAk8dmEXH2TGyrQE5jlwgsrCRYVFHy9SA4tILlI730P7
 P5Dxth3WfWi+UX2t6H3QR3/WnjH9KEUwwKZX1g+bWa3Wbg6bH2awBplrrB4bQS+qiAAAA
X-Change-ID: 20260122-mxic-nand-742183125e03
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mason Yang <masonccyang@mxic.com.tw>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_235809_510366_E794E576 
X-CRM114-Status: GOOD (  15.85  )
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
Changes in v2:
- Add "Mason Yang" as maintainer.
- Link to v1: https://lore.kernel.org/r/20260126-mxic-nand-v1-1-557df4a0dfa7@gmail.com
---
 .../mtd/mxic,multi-itfc-v009-nand-controller.yaml  | 78 ++++++++++++++++++++++
 .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ----------
 2 files changed, 78 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
new file mode 100644
index 000000000000..97fe6681cc8c
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
+  -  Mason Yang <masonccyang@mxic.com.tw>
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
