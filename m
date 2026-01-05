Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B942AC79F9E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=826zW+6vdOJuYZOFMhMTo2ChazH7xb/PtZjySJhyGy0=; b=yQmjNETpEXs/3t
	z8Lk8ckdWvSggv55TBcpjdIv3L67GGFov4s7cNQV5UEFs2ScVRMC8MpGcSstHzcZKoSmjmglfPSZN
	goJ9afbdvyErNFRDQB1WQhnH9Wm51A1X8DexCzSA2bnBcDRm5pTa19D2/Qy7oiQ/SmcrDZpqQ8gxg
	+9Z0aZAkLhmg7Uz9oMlNeiFG/5AZdeONcKMXga611gtDhc4i+aoF3VhAeKAdHheoDjMgDin3grDrO
	vWuJlZGAJqp+SuRLciozsjM9+Z3NEydfQzTQECxJOY++IVrgU3cyupZoTh7NQluUKQ6ws+DkD/UyD
	kqNFC5JCNB4zshG+coOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmBq-0000000Bac7-13PO;
	Mon, 05 Jan 2026 15:08:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmBk-0000000Bab4-3xls
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jan 2026 15:08:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0d6f647e2so229658915ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2026 07:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625688; x=1768230488; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1jKy4PLpiDv5jQtyPtMkgdBDMPguDaYeUut8IL2qu0=;
        b=fJzSLuxnG/J9RGnxl5ptD2gQ0PECrMiYn9lbYXJmdY7znvlUA+kWzYE4AMCsjfTGVT
         Xnz9YmKrczXS9Y+/k4gYBHELoVX2KyJI7V93pvVEwlCwkQQNwuCgL1GCrcGWeyyqsluH
         qiUMf5Q0EQoXWKpfDJUSJaz8fgRWS4SsraaMRb9hT66hHrQFpcK9p6DmscPWen9YSK9G
         +A8GiBJBWEscpUx6NPMLq4KEyENUq+C10iOC9W1zaw05oNo+5djwjl/X1u6WjHHp6TVC
         kOdHHPtCYXsH3AK0E/v39mP/mupQWbiM4tj8hFX6GwV5jKoE8K8R+0lpKltqv7mBUDdY
         kTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625688; x=1768230488;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1jKy4PLpiDv5jQtyPtMkgdBDMPguDaYeUut8IL2qu0=;
        b=HazkchTd/1YI+hpNNw3S7FjobfFLxWFqv3XIcVqzvD7ORJGRLKHkJ/Yi/Vif8D0atG
         06V5NB4Fx2xB0rQ49oP068dxg8dUZiftPlf3agbgVnM6qN7dZRxDNm/apwaAFb3tOoHF
         kISaDrMRe4rQMsC5NPC71+KuUz/Zji7UGis49DSF8u98SCdmdcfd2GiJPjp5mT74eUdY
         tTxuZlaEctyYZYrszrVkSyjndpdhA1SnGEWHJuaIhb1p5xp3NAAcMcNEjV388/FFGllh
         XM/N3jvTdHISDZ9z3VtYm3eDyUhzcYqIknhxzOBQugxzf31HpwW+XYYepX+JzkylYvyq
         FTEA==
X-Gm-Message-State: AOJu0YypkEiBwJvErIG7DNpctaqwHSoD+6v0Zo7/+f2cgyZm9dYX9ul7
	guWfBczkOU6tCnIzAqRgWonrKji7qpBTtMyJFOyFTbZORHjaKxue2nvF
X-Gm-Gg: AY/fxX5qEkxkRbYorzeZaoJOEBR/Z8Cf8RMhIsvaWAk0+XCD3JJ2KjGKDSjlTioSYLM
	3NKeCi58BMCsFN6UmnApX63liew8gjYfxR8oBSWeJzieecCTI8MpoNKDYBC27OpsodqHonV3WJ7
	die4mXnDh58c48wFo2Q0AF2txsxPjjR/SFfpBWmYy+V0NbS8J/uAhHbZRRSxnfZSXitQhl7fQli
	WM+YdFjtwNPa8egtY/MgoAyx3L8T4qry9QtawajwzIm6KEpGGdde9l9vd977TN5AETtDxj6JdCf
	xKn5a+3DfvzZx5e3IDKnzWm6U5NtKE6L5bX0PLFFJ3Mxtt6jrZuXDhlh17/eqKp8W4EpE2D5r7g
	xRg/cGct/rkA+WUD3oRArqsJMaYXTYdwuTe5+lNi5jdhn9uhvsLpAiVZv6rCPPx3cyADr/BdeXE
	srKJfFWnknzLIlFEFZ7LRNFAwz7IJIw7/qauYRSg==
X-Google-Smtp-Source: AGHT+IGhkCdU2DgtXw80a0qwTPN/B41vQB1JkqB9e8jnObox0EpIMbkYAzguoHeMXBySPLMGasdaPQ==
X-Received: by 2002:a17:902:ea07:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a3e2e1e31fmr105955ad.54.1767625687767;
        Mon, 05 Jan 2026 07:08:07 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.104.101])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a3e2ab1a0esm1174215ad.16.2026.01.05.07.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:08:07 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Mon, 05 Jan 2026 15:08:00 +0000
Subject: [PATCH v3] dt-bindings: mtd: microchip,mchp23k256: convert to DT
 schema
MIME-Version: 1.0
Message-Id: <20260105-nxp-v3-1-05af634831ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAM/TW2kC/1XMTQrCMBCG4auUWRtJxqY2rryHuAjNpB2wPyQSK
 qV3N60IunyHeb4FIgWmCJdigUCJI49DjtOhgKazQ0uCXW5AiVohGjHMk9BYERpnjUcD+XMK5Hn
 eV2733B3H5xhe+2hS2/XfJyWUsKXSnqSspa2vbW/5cWzGHjaf8GsqqSR+DGYjtdfOmfJcavNr1
 nV9A+DUilDKAAAA
X-Change-ID: 20251229-nxp-526e29da9f29
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_070808_995002_5202AB31 
X-CRM114-Status: GOOD (  16.28  )
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

Convert Microchip 23K256 SPI SRAM MTD binding to YAML format.
Changes during conversion:
- Remove "address-cells" and "size-cells" from properties and
  required sections as there is no child node for sram.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
Changes in v3:
- Changed commit description to document changes during yaml conversion.
- Corrected indentation for example.
- Link to v2: https://lore.kernel.org/r/20260102-nxp-v2-1-05f5dd947459@gmail.com

Changes in v2:
- Removed "#address-cells" and "#size-cells" from the required, properties
  and example. 
- Changed description and title for yaml.
- Link to v1: https://lore.kernel.org/r/20251229-nxp-v1-1-a415fe0080a8@gmail.com
---
 .../bindings/mtd/microchip,mchp23k256.txt          | 18 --------
 .../bindings/mtd/microchip,mchp23k256.yaml         | 49 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
deleted file mode 100644
index 7328eb92a03c..000000000000
--- a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* MTD SPI driver for Microchip 23K256 (and similar) serial SRAM
-
-Required properties:
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-- compatible : Must be one of "microchip,mchp23k256" or "microchip,mchp23lcv1024"
-- reg : Chip-Select number
-- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
-
-Example:
-
-	spi-sram@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "microchip,mchp23k256";
-		reg = <0>;
-		spi-max-frequency = <20000000>;
-	};
diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml
new file mode 100644
index 000000000000..32e9124594ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/microchip,mchp23k256.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip 23K256 SPI SRAM
+
+maintainers:
+  - Richard Weinberger <richard@nod.at>
+
+description:
+  The Microchip 23K256 is a 256 Kbit (32 Kbyte) serial SRAM with an
+  SPI interface,supporting clock frequencies up to 20 MHz. It features
+  a 32-byte page size for writes and supports byte, page, and
+  sequential access modes.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mchp23k256
+      - microchip,mchp23lcv1024
+
+  reg:
+    maxItems: 1
+
+required:
+  - reg
+  - compatible
+  - spi-max-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sram@0 {
+            compatible = "microchip,mchp23k256";
+            reg = <0>;
+            spi-max-frequency = <20000000>;
+        };
+    };
+...

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251229-nxp-526e29da9f29

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
