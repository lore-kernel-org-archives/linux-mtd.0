Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5269EFD3760
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9PQ7EsI0iBnfbEy3T6D8H8Qyy4oYi6hczGiQWnDk34g=; b=zd9tqnaX3Cnoat
	K+044sGAUGH79r0+jicaoYsfmnY6K3Q37T0x433BNx/uWewX+YYovTz+wN/MCBuh2AkUMfPjvlmbZ
	b7xG5FhvXT4NvJnrMkUrdAqmJA0iD3Wd8kycKAzOFbauExglB015IUAAzzUymRLxohByBH7FL+y3a
	ERfuGkIch8d0nMHpukkb2V5fjmm8RhmjwS9CivmwdHwDVJddgliLzG05CKN/1oELl0HdOn5Tl28Z4
	OYE5a7vv+asV0O1ljQp9O91ehoirbZCcI2jFX908aaCRaT3ycqSAMk9TyFsqsM29KrODYu12uygPK
	0NRHaNcYp9R9XuI0Izbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGPq-00000004F4c-48jm;
	Wed, 25 Feb 2026 15:03:07 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGPn-00000004F40-2TmJ
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 15:03:06 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-824b5f015bcso6539211b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Feb 2026 07:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772031783; x=1772636583; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqP6EGsW9F6euNXh865lM+yV/zkikpG3s/C0DdTEp4s=;
        b=eDy3+E/R/cg881AxjNbeREpL5nt6dAEpakJ2UgdO9GAV7A2AEFXzxOShRLBA85oW0U
         Wv5ODo5AInW6kLApUaiwT+rTHGIYfzfhV+3/bURel1zXL+b0etU8+M0w79u2l897HqB/
         /8muSWNCPGp4M0zRyiEKXH5LcgXvQrv1Ic4zwj4nv0o5JjWuoQWHPcoM2GmFH+eTF7M7
         6UrXJTCbsjBWGXh2jtenVYG06b/8KZ3Q+frdD7JNcxUrDdN2f6T2Rkhb9ULuZVZ4K+Q5
         xoJts7Jh76YY2/zk/DwMXbhfe2L37UlxyJGIHCp2dch51XwrahqYbCESrCaieZTGE6j1
         Ru0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031783; x=1772636583;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqP6EGsW9F6euNXh865lM+yV/zkikpG3s/C0DdTEp4s=;
        b=uCF67wd4Nb5mSGWaz2PEVWJ1dATGLbXbmDm2ideQTNVgbD6KZCX8r0Ct1lD+HkVBG6
         X/4NwHbhQwcx6215zkuAdFufexgE2qETnQU4c/iVdV3F0Z0qjYh2ln2c7lqCTXpBMsoV
         axHYAoXZ1apadF9fSWmOqsdPx2ugvwoA0/aceew433uhHQ/qh/4R2sbaeYCfnkYO3bDf
         F4NdNHA3HpgSesXbl6OHSBJja9wXGmpdQfZSzTreu397uQ35HR00rw2HXURme7Izrhnc
         xXX+73Clgwm/W+CdQCQSwYXKMY4QOr8D1zzPJRGNJVBVcUSbVfX0gOo7c9xF5lGNI5l1
         X7WQ==
X-Gm-Message-State: AOJu0YxVxtKf70LfTVZuyTaihrKu7t7vK//H0yP++wi7kDGO9r0OIZhr
	wak0+I1KseenG3Q1cG62L2PdqdiIK8IuJAZzsevv7ooYYQdH+sLfbMy4
X-Gm-Gg: ATEYQzz+z5TdImKJyoXee8VqV4KOCBqgf5N0VUA5pB/vSnhPY9vIO8F+KALSWlnPB2k
	Pht44VUm7TucaijbNM5+hFGcY6gX/tE2Vk3OqigcdE2fY517KZS6c6+OoQJzrqBr8auPAV/5b0k
	an3q4wVKKoAFDQ7yhIvbNCOH1tSUcc00h/u6rCIGs3CxPC2iDfLkcd41ZzsqnuWzxXWn9eWUMhR
	QJYevFZBAcuSDe+dNpNAwrOZRumc55CExwbtQ7SGALFIqbhahOMBblw1It/lDnAH7qlinW4/4ut
	MjiCH1v/j/4seYP3Qab8YdwyoCMNT+KwshUniQUnpX3FKKzGjZJMTx3LrRmi0r+oUY9BEcLmYJc
	85faWhjtC4JPIny5QsFS/vE+b2kcsFiv9UmhjcjDRsoce4YCWGT9vpG82IXaPwOK8+x7ZYUWNEv
	gl3EOxDdA4RoP1csF+e2oDy5tKh3qMShmm9ffl+ryquSqA01hVhgu+45tuWL4=
X-Received: by 2002:a05:6a00:440f:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-826da8c0f3emr13497351b3a.13.1772031782044;
        Wed, 25 Feb 2026 07:03:02 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.183.54.224])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-826dd86c494sm13799030b3a.30.2026.02.25.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:03:01 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Wed, 25 Feb 2026 15:02:50 +0000
Subject: [PATCH v2] dt-bindings: mtd: st,spear600-smi: convert to DT schema
MIME-Version: 1.0
Message-Id: <20260225-spear-v2-1-021bcb670601@gmail.com>
X-B4-Tracking: v=1; b=H4sIABkPn2kC/13MQQ6DIBCF4auYWZdGpqihK+/RuEAYdZIqBhrSx
 nD3Updd/i8v3wGRAlOEe3VAoMSR/VYCLxXYxWwzCXalAWtsa4ko4k4mCGq0dlZRRzeE8t0DTfw
 +ncdQeuH48uFzskn+1n8hSSHF5JQabadb3Yz9vBp+Xq1fYcg5fwFlDgl2mgAAAA==
X-Change-ID: 20260122-spear-e599dc4e7e32
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_070305_223313_2BC6AFFC 
X-CRM114-Status: GOOD (  17.17  )
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

Convert STMicroelectronics SPEAr600 Serial Memory Interface (SMI)
Controller binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
Changes in v2:
- Removed allOf ref as it is misleading the existing node.
- Defined pattern properties for the child node.
- Link to v1: https://lore.kernel.org/r/20260122-spear-v1-1-fd44bc79695b@gmail.com
---
 .../devicetree/bindings/mtd/spear_smi.txt          | 29 --------
 .../devicetree/bindings/mtd/st,spear600-smi.yaml   | 83 ++++++++++++++++++++++
 2 files changed, 83 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/spear_smi.txt b/Documentation/devicetree/bindings/mtd/spear_smi.txt
deleted file mode 100644
index c41873e92d26..000000000000
--- a/Documentation/devicetree/bindings/mtd/spear_smi.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* SPEAr SMI
-
-Required properties:
-- compatible : "st,spear600-smi"
-- reg : Address range of the mtd chip
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-- interrupts: Should contain the STMMAC interrupts
-- clock-rate : Functional clock rate of SMI in Hz
-
-Optional properties:
-- st,smi-fast-mode : Flash supports read in fast mode
-
-Example:
-
-	smi: flash@fc000000 {
-		compatible = "st,spear600-smi";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0xfc000000 0x1000>;
-		interrupt-parent = <&vic1>;
-		interrupts = <12>;
-		clock-rate = <50000000>;	/* 50MHz */
-
-		flash@f8000000 {
-			st,smi-fast-mode;
-			...
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
new file mode 100644
index 000000000000..189bc111b470
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/st,spear600-smi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics SPEAr600 Serial Memory Interface (SMI) Controller
+
+maintainers:
+  - Richard Weinberger <richard@nod.at>
+
+description:
+  The SPEAr600 Serial Memory Interface (SMI) is a dedicated serial flash
+  controller supporting up to four chip selects for serial NOR flashes
+  connected in parallel. The controller is memory-mapped and the attached
+  flash devices appear in the CPU address space.The driver
+  (drivers/mtd/devices/spear_smi.c) probes the attached flashes
+  dynamically by sending commands (e.g., RDID) to each bank.
+  Flash sub nodes describe the memory range and optional per-flash
+  properties.
+
+properties:
+  compatible:
+    const: st,spear600-smi
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
+    const: 1
+
+  clock-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Functional clock rate of the SMI controller in Hz.
+
+patternProperties:
+  "^flash@[0-9a-f]+$":
+    type: object
+
+    properties:
+      reg:
+        maxItems: 1
+
+      st,smi-fast-mode:
+        type: boolean
+        description:
+          Indicates that the attached flash supports fast read mode.
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clock-rate
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    flash@fc000000 {
+        compatible = "st,spear600-smi";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0xfc000000 0x1000>;
+        interrupt-parent = <&vic1>;
+        interrupts = <12>;
+        clock-rate = <50000000>;  /* 50 MHz */
+
+        flash@f8000000 {
+            reg = <0xf8000000 0x1000>;
+            st,smi-fast-mode;
+        };
+    };
+...

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260122-spear-e599dc4e7e32

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
