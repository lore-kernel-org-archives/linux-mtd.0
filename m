Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ED6EE57F7
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Dec 2025 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GNarL8TS2ISVhN6tf8HeFA4KxUI3U6kV8u9ZAckS8+g=; b=q9ty/Uxw2E2N+B
	pEzRb8ziVKFaTFMWMWU2CXrCXKE3wuFh4KW9Np+DJwGf7FWzf8HiNQqOLlqgyqkjAZOh0/cBFIue5
	8jtZl3UNWikNWjIcm2Pvfr+RlX+kqYwf7tFL6lvG/Qsbue6IPh7mzCfkyjn+iqcnPk9EXe2YJ96/x
	30lNuTz/FVJDfXHC0aGZFmxKhqL/diOlohBQWhZ7lZ09Y9XFo7qwGDk7bG0nxej5WWQoqUuMvtifb
	/WjD7z+Bw9oBLlT+HFM+BgetiMesULiBVw8XzP60tMzrv1kGPqKlc2D1u+C6ERHU3lJntbon17XMZ
	6JO2HJzB/MZlgmGoZTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vasWU-00000005oyE-1dSq;
	Wed, 31 Dec 2025 09:29:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vasWS-00000005oxr-0ODz
	for linux-mtd@lists.infradead.org;
	Wed, 31 Dec 2025 09:29:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so6556037b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 31 Dec 2025 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767173379; x=1767778179; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XlUkiQe3shGzaepuEQZNl8iLgTbjOz9KQR01AkzdzDQ=;
        b=UdvX2AYLuwewcZG63QTIwFkI39GVp4cpi4zDMG+1ldS0WISOTVxJH4law/k+IWmDoY
         KGE2LHGTigeo9GpUAl2EgP/hWFBS8pcotMDCUrLMHe5o6f2nkSIqq6spf+JkhUjBXgnz
         oT4q2vWd4+fG/AYnNJQ79ejpt6uJy6SLN3hgNO5UsancZbe90tuelktUThlIATMZ9k2t
         vTRkdGSiatoFh/uGVhXfqgw28kJshFd9b7K/r0M5NEB+DOIwKsgrFMTE641K5VZSHUxW
         Mu2WL7lr/Dq06saAyzdb3YtP4ETSMSwpVjyXIdGIgN4Jv0ae3em/VKyBhou1ELCAPXe4
         QKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767173379; x=1767778179;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlUkiQe3shGzaepuEQZNl8iLgTbjOz9KQR01AkzdzDQ=;
        b=G+07lR3HZGN3YYaMuftY93nTIQG7MpYbXzg5+duWzy6lGl7WyKDo+ZoA3pWKLpnrsU
         lwgkOfRfN1q/ZMg5TTCvXJoIyBRwso3Kn4UIpgGJFdddoQKxM47mrK16sGsryNT6t9V2
         Ztubut9WwUU+O+cdhW9VmDvRC3qGVRGuCHOhgQKTjFtRQv2FrPvX1Cp5rAbTeerV1p2R
         0IzFciZq4q2EhtkNiPOSqdf+HcqteJ8BLgn/6g74S207Fvk674DtkppIZ9otKha9W5zA
         kQHM6chO/ijI64tvILClYeYkvPzeDiUxkC4fOUheYQv6A9tnQLp/pCkh3KXqvoLCbav3
         AtlA==
X-Gm-Message-State: AOJu0Yz5ZGFOOmnWYeXDi/pt0Sb+w45T3y11umvHzJATPJ/W3QPCVNso
	FyIrNrcitHjxDqNYLiSYAO1893mVoiowb9lFQF6RKcQz3druElf6MQ8GOcTeaQ==
X-Gm-Gg: AY/fxX6zHPhvEgtWhxA6mFe9DN/drdwWcTfoxLgdv95rm/SI3WHJZsicDHLgPo3oWcr
	8Ns5TkdfCV87g3C6wZh1UyoHqvKI3bipNCdBiEBq+4TPVLJL8RdzCBtFigBumrzJA6eGxDDKbuR
	QvdsK2Rwuu161qRsZ5vdCmF7u1rfPngumbpsvmRNAx4a4PUizY+m2uguy1TB6syRYXQCfoVH1oe
	dp0+yAgd2p3Zyg3x7NtBFQZFaWQ1WS97MZrHuiwwiUvxio73lZP17KP+yG2IB//7oyXicMqNBEO
	DZlSK25C7g1zdQUn/UBiqw39RTZMgvJcFNd0crC7SqIrVcXg9179TRTR6HdMcVwwnP1y8ZneMb5
	z7VF2/AGmGWZDaGURfa/NczvAmamC0afU/wuN+xkwRYL0z+nuqAEEYXuaImW1UMOZsNylbeWOp9
	AvTNNIkg1mEMpqW81oHpu9VnN+LczDxAugeWo=
X-Google-Smtp-Source: AGHT+IEM19+eKNuqVecjwUqc/sRWedNv4BdcwYLzC9ecNUMeqdSw3+habfFBNKgjfULtZcfn5hMkqw==
X-Received: by 2002:a05:6a20:3c8d:b0:35d:5d40:6d77 with SMTP id adf61e73a8af0-376a7cecaedmr35366526637.31.1767173378624;
        Wed, 31 Dec 2025 01:29:38 -0800 (PST)
Received: from Black-Pearl.localdomain ([122.162.204.179])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm29842795a12.2.2025.12.31.01.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 01:29:38 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Wed, 31 Dec 2025 09:29:32 +0000
Subject: [PATCH v3] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
MIME-Version: 1.0
Message-Id: <20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPvsVGkC/1XMSwrCMBSF4a1IxkZyb2PTOnIf4iAv2ws2lUSCU
 rp30yJoh+fA/00s+Ug+sdNuYtFnSjSGMqr9jtleh85zcmUzFHgEAcBDJkeaBx0cFyitVdo3Rmh
 Wikf0N3qt2uVadk/pOcb3imdY3q9TiY2TgQNXNUgPEhts8dwNmu4HOw5scTL+WsR222JpTd0q1
 yqURpj/dp7nD1ymRAziAAAA
X-Change-ID: 20251011-nvidia-nand-024cc7ae8b0a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_012940_190710_8D94920D 
X-CRM114-Status: GOOD (  19.35  )
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

Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
Changes during Conversion:
- Define new properties `power-domains` and `operating-points-v2`
  because the existing in tree DTS uses them.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v3:
- Removed pattern properties for partition.
- Used single quotes for nand string in pattern properties.
- Modified maxItems value and added minItems to reg property under nand child node.
- Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com

Changes in v2:
- Edited the commit description to match the updated changes.
- Modified the description for the YAML.
- Removed all the duplicated properties, defined a proper ref for both parent
  and child nodes.
- Removed unnecessary properties from the required following the old
  text binding.
- Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
---
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 103 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
 2 files changed, 103 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
new file mode 100644
index 000000000000..632cfd7dc5e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nvidia,tegra20-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra NAND Flash Controller
+
+maintainers:
+  - Jonathan Hunter <jonathanh@nvidia.com>
+
+allOf:
+  - $ref: nand-controller.yaml
+
+description:
+  The NVIDIA NAND controller provides an interface between NVIDIA SoCs
+  and raw NAND flash devices. It supports standard NAND operations,
+  hardware-assisted ECC, OOB data access, and DMA transfers, and
+  integrates with the Linux MTD NAND subsystem for reliable flash management.
+
+properties:
+  compatible:
+    const: nvidia,tegra20-nand
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
+  clock-names:
+    items:
+      - const: nand
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: nand
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2:
+    maxItems: 1
+
+patternProperties:
+  '^nand@':
+    type: object
+    description: Individual NAND chip connected to the NAND controller
+    $ref: raw-nand-chip.yaml#
+
+    properties:
+      reg:
+        minItems: 1
+        maxItems: 5
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+
+    nand-controller@70008000 {
+        compatible = "nvidia,tegra20-nand";
+        reg = <0x70008000 0x100>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
+        clock-names = "nand";
+        resets = <&tegra_car 13>;
+        reset-names = "nand";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            nand-bus-width = <8>;
+            nand-on-flash-bbt;
+            nand-ecc-algo = "bch";
+            nand-ecc-strength = <8>;
+            wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
deleted file mode 100644
index 4a00ec2b2540..000000000000
--- a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-NVIDIA Tegra NAND Flash controller
-
-Required properties:
-- compatible: Must be one of:
-  - "nvidia,tegra20-nand"
-- reg: MMIO address range
-- interrupts: interrupt output of the NFC controller
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - nand
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - nand
-
-Optional children nodes:
-Individual NAND chips are children of the NAND controller node. Currently
-only one NAND chip supported.
-
-Required children node properties:
-- reg: An integer ranging from 1 to 6 representing the CS line to use.
-
-Optional children node properties:
-- nand-ecc-mode: String, operation mode of the NAND ecc mode. Currently only
-		 "hw" is supported.
-- nand-ecc-algo: string, algorithm of NAND ECC.
-		 Supported values with "hw" ECC mode are: "rs", "bch".
-- nand-bus-width : See nand-controller.yaml
-- nand-on-flash-bbt: See nand-controller.yaml
-- nand-ecc-strength: integer representing the number of bits to correct
-		     per ECC step (always 512). Supported strength using HW ECC
-		     modes are:
-		     - RS: 4, 6, 8
-		     - BCH: 4, 8, 14, 16
-- nand-ecc-maximize: See nand-controller.yaml
-- nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
-		       are chosen.
-- wp-gpios: GPIO specifier for the write protect pin.
-
-Optional child node of NAND chip nodes:
-Partitions: see mtd.yaml
-
-  Example:
-	nand-controller@70008000 {
-		compatible = "nvidia,tegra20-nand";
-		reg = <0x70008000 0x100>;
-		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
-		clock-names = "nand";
-		resets = <&tegra_car 13>;
-		reset-names = "nand";
-
-		nand@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			nand-bus-width = <8>;
-			nand-on-flash-bbt;
-			nand-ecc-algo = "bch";
-			nand-ecc-strength = <8>;
-			wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
-		};
-	};

---
base-commit: 43edce71d70c603d3f3f1b1c886f65cd02d80c24
change-id: 20251011-nvidia-nand-024cc7ae8b0a

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
