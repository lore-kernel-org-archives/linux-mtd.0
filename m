Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ECCCCF9F0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Oct 2025 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X0Ae3ljQrb3kusLUc2UzUvUryKjxwjImPkSps1iJz/Y=; b=pr/QTMp5Jxotdl
	mFVbpfKGesVO7T95Z4SpKnvVDsdT9PApxVa1AVIv/TpmBROjajBcykuBHTNbB7tQeLeQ89+XVY8Qr
	R9yIV+RWwQ4roifErDPJLe+bosilJPmNbc5WpKG0JwxGVA2SUwVT/zHp64YrIU1G+rtKTvUPtIEYL
	5WLDqfceSE8wSlSAr6IGWHNqFZyY03hWBhLAKaGrHQ68V1VWJRkEaVu+xqoWX+ysQ4BfbE8klC5Bx
	roSBbDEXbzp2heQZO1wDInJ39QFMexfAMWaGoxydw/4mLuKjd447HkAzcYO1B3hmYLC7PZSn5I2Wt
	UWTbWKRKo8fX8hz+cFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXjA-00000004d65-1P4b;
	Thu, 30 Oct 2025 18:50:28 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXj3-00000004d5j-3fI4
	for linux-mtd@lists.infradead.org;
	Thu, 30 Oct 2025 18:50:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso1413036b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2025 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761850220; x=1762455020; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YZE8z4se1dfGoS2Gifk7KhMEMh0JHmONhySpSjiVPL8=;
        b=Dswux2QUEGAwqvW0BZAZYoTUooxRsPq3mtRlDuGAdKBut6NXDwLH4QhvcyMOgDbpxy
         Pw4IWIM7T7fTvZBGrI7Kg8JeRms2IVE0acT5BjQD6lIQMgpYqsUhHbCvJq6WeujBcAPQ
         K8uzuPOH7wsZLpJefphLde9PFdLmyW1xG1OapVHsUoVhJylbcac39ZeV/dBMYMJFNDEO
         O7e0ZY1MFnS8RP0AO1AfU5Tu6BwTNjeHGzTQWstU6W8U9eFEICy0Q8p/EvR/GwY9Rwwo
         CctztnDdGvFymKPRXUkN/XdpR3telcpnjyWi8py3ELoUTlxXYCTucwHGllnKTecyWQEa
         o7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761850220; x=1762455020;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZE8z4se1dfGoS2Gifk7KhMEMh0JHmONhySpSjiVPL8=;
        b=TVv25qq2dDAim9jeKLNvqq7k0PvzfQEha6AcKS+DVs8sFfC1vlOI+MspE7ebOF+MTl
         hze6t5a0hlPny1sbXcJiyZ6TcBHARlPneRHZJm55Yrk/jqpU0DuCRSwPWXhiRonLNc3Y
         pAQLZzix1nqVQ/xl/ORF9+2vLVw/fbsOUv3kW3jDUiwwuvtzSYtBFTrTgMgF9h8zUXDr
         RS2HrvklQNm+Od+L6PT8qrGRoO0ZmFyHUvPFYR+fWXZTM8L10dNpJd37Bp1rpSkEoSFQ
         OQBtMsXjbCexIMoOD7GLhMYYD0ROE0BNDa7CGMCFS7+NlWWuzc2c9vN8TQrR4W938ebQ
         JLwA==
X-Gm-Message-State: AOJu0YzRa4fkCiwb8GXzmq4J/1V7NCu8GIH5AwJK0lGv3D43/P3wn4R/
	MDbjcbTFnngNtrNowPNtWTxWkLoMN3hONW5yMFNuXbfBI1UKaBSF1kUgV+42hw==
X-Gm-Gg: ASbGncvd4REAbAQYy8SMsrZOfrrDp1Nrwm+yXoody0h4rqhBwIfK3z/uwXnoc1oM1pI
	0n3UY5jIEr0vMJZAQocwBQxb4U0/hP84qthDiDccgvANSu6Q4Z1jYC2ZzUr2zCbHAd4vbjFpbH/
	gWKw3epxoprhwC3REn53jhsgZAJd1GcskIdzXPd7mK2xGtqiqvXG98G/qPvYgAiLns1XnCfI0Ej
	ryr7IIgRIkUBPSAoVdGUNJ2U+tdL2mJZgIgEV74mATPIllfmDGsk6zjWm5HJOLe96bB1lz607cq
	8WvjgEwUtMxfWGM6J2I4YLeARndaLS4GWAUi9OBbkc6Has56jcmh78pFF3Cd9TMRJ3o5TwZBfs/
	n7Eh+NRffarAVj7j4w1Bv6jIStcHkqiS463tH8ywhX+uCDw0NnKUIWp9q+JQaVFsgvDv02fuTyG
	DcljlvZ+nkR/EMSIOGtT5mGx9UJB/r9jQrLRk7tUr6lQ==
X-Google-Smtp-Source: AGHT+IGLHgpq4Cr2uIwiEeob78bCrM6Q5yWeru6WGvDIt4+WcDBZb5URMD5GYG3DxNAGT5rjuDn0DQ==
X-Received: by 2002:a17:90b:388d:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-3408308b279mr1006781a91.26.1761850220056;
        Thu, 30 Oct 2025 11:50:20 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.191.116])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-340509a3001sm3386203a91.10.2025.10.30.11.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:50:19 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Thu, 30 Oct 2025 18:47:25 +0000
Subject: [PATCH] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
MIME-Version: 1.0
Message-Id: <20251030-nvidia-nand-v1-1-7614e1428292@gmail.com>
X-B4-Tracking: v=1; b=H4sIALyyA2kC/x3MMQqAMAxA0auUzAbaoiheRRxiGzVLlBaKULy7x
 fEN/1fInIQzzKZC4iJZLm1wnYFwkh6MEpvBWz846xxqkSiEShrR+j6EkXjaLEEr7sS7PP9tWd/
 3A73CBlpdAAAA
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
X-CRM114-CacheID: sfid-20251030_115021_950252_184D58FF 
X-CRM114-Status: GOOD (  20.25  )
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
  to resolve errors generated by `dtb_check`.
- Add the `#address-cells` and `#size-cells` properties to the parent
  node to fix errors reported by `dt_check`, and include these properties
  in the `required` section, as they are not mentioned in the text binding.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 157 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ---------
 2 files changed, 157 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
new file mode 100644
index 000000000000..67b3c45566db
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
@@ -0,0 +1,157 @@
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
+description:
+  Device tree bindings for the NVIDIA Tegra NAND Flash Controller (NFC).
+  The controller supports a single NAND chip with specific properties.
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[0-5]$":
+    type: object
+    description: Individual NAND chip connected to the NAND controller
+    properties:
+      reg:
+        maxItems: 1
+
+      nand-ecc-mode:
+        description:
+          Operation mode of the NAND ECC, currently only hardware
+          mode supported
+        const: hw
+
+      nand-ecc-algo:
+        description: Algorithm for NAND ECC when using hw ECC mode
+        enum:
+          - rs
+          - bch
+
+      nand-bus-width:
+        description: Width of the NAND flash bus in bits
+        enum: [8, 16]
+        default: 8
+
+      nand-on-flash-bbt:
+        description: Use an on-flash bad block table to track bad blocks
+        type: boolean
+
+      nand-ecc-maximize:
+        description:
+          Maximize ECC strength for the NAND chip, overriding
+          default strength selection
+        type: boolean
+
+      nand-ecc-strength:
+        description: Number of bits to correct per ECC step (512 bytes)
+        enum: [4, 6, 8, 14, 16]
+
+      nand-is-boot-medium:
+        description: Ensures ECC strengths are compatible with the boot ROM
+        type: boolean
+
+      wp-gpios:
+        description: GPIO specifier for the write protect pin
+        maxItems: 1
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 1
+
+    patternProperties:
+      "^partition@[0-9a-f]+$":
+        $ref: /schemas/mtd/mtd.yaml#
+        description:
+          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
+
+    required:
+      - reg
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
+  - '#address-cells'
+  - '#size-cells'
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
