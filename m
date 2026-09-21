Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0268CC982DA
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 01:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JnK7COJ+9rSLBCqbknjlXgxyue5iSQFw4Rdsx3Qqx5A=; b=vcR7tTr31WE244
	MqbHs1msyWN1SAJtZI3g+07RwigZG1BB9s7b+EumOJXek8LAbLS6jwMbR9TlFhFfkZfyZHgyCjifF
	Dm57XtFAoizhAnWeplkGnLVSUDxyVfwMhuAhMEDGD2DKYR97JRBMwfoVIE4QXhK0PlBnRO1QwJ7jD
	xMkhkRjMx8x1Ba2H/2BJkmKF4tuUyfJ+x0+I70v9PjONKl4QjP4QhEhqZZDSdlOYmrw538Z6ZB8De
	dWgvx/k4MxUSjJX2Nxj3+EaX+9c2Eq1cTnpJnR0umqWsG66uaNL5JwLJnc1VGHR5nHlDFb7yYKJQ1
	l0Y/dZFGrXRidpZWXSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8THZ-00000000hl6-3dEq;
	Mon, 21 Sep 2026 01:57:25 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8THW-00000000hkc-2x6F
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 01:57:23 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccafb752so2021833a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2026 18:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789955842; x=1790560642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqPPHQuisFYTUn7TmLcY7RMbMtgC/j1ZvNyK2Z7ksw0=;
        b=REZUu0hAuVU1yyuQxtJj/zAQMktep0qoy34SPvqUri7k2NcH/MNM2SAd9Z1NlCvn76
         cNnJ7e3+u2Ca65bWFRx12WxyiVzgCkWUwc6+/bgBLaE2ZZ/IYNsNZ1FrAzzhzhIJQ8BM
         jYMOmv/28osQUmJHNBNZ7BKKUdcjisMVBtJCeLizoc8LAsUlNu4tQYqmvzsc3xYB+UXE
         rm4PHU37KKkH4pNezsxW9zXaFjXmdbKEelMXUv/2QecqNscDH9IHOgPnsmOeYfbSN7SE
         4B5CAzzgX1D+Jy88gNsxE4cV/nKj57zt5CK8AXgZCYIz6Vb4Gbei22e16w1HddmpwnmO
         UPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789955842; x=1790560642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqPPHQuisFYTUn7TmLcY7RMbMtgC/j1ZvNyK2Z7ksw0=;
        b=fEcc5FEmkwUAwCr43AsR03yOChvCBNNPe7g/VCMT1dJYAmaX6bUUEL0DJx1omE6tCn
         hnKb8cOR9ssS2OhTOqf9/ETi/4oAm6l/8ef6NJREikvVL7VI4rG49vVzNeOZDIkN8hhK
         +fI/tYZ40GAX4DNlbPTggXaoZ5JZ3/5kwJV0N5iCQW1w1Sm4gyJbz6ps/+DAvontpgc7
         DWo1VGuj4KdXufyCxaZ5raduF3GL6l0I+46Nxxz9ew/nT1X79zCmT5kgPH6VNpUEFL87
         5gqhZj5C/uPJWNuApKG4Js/d4GhUMqSdGQLaTh3s+m9NfkC6GLzk/TKShuzoI5Iafcwz
         dIBw==
X-Forwarded-Encrypted: i=1; AKwUvBwfL8qcz4c7tRokgovBdkOqy3CGEcagy70LjfeZOmc00e6mBWokAtxpRLKuRkEwVtYxFhqWdBTwTMI=@lists.infradead.org
X-Gm-Message-State: AFuF++mENePxRJY2piwpLtMKDxEALA4lGsnpzuAMdmwToTaA+0l7XCv0
	CnBzc/DGGzDMQSfUa1n62uVOJ7xHowOoIkcrICYEfSPpBc4yzXGnYNeu
X-Gm-Gg: AYBFou1et7mcZOndZ6OXUtZhLAyhD7KZxViw4DMmgQgm0lg3+ywlAJ0nO1PBNHoS2T/
	Fkyw6zBjcIMccDgIGfcPMGngMd67QrOTdi2krm7lpWIilHCFVPYNIfpc51fhOL2f8smOghp71Kr
	Fa95t17pZue4hrNNrbX1ObVikPz3Xrd4dW+SMN2InKboPn4OOL/nwXhSo26TrT5914VKamg/alL
	L8bQTAcknukDFHPKTXCBbk4/K3JoaN8aeAhA5Msh7F5nazsurzMd8u6ROFlRMEjMKK5HfL+N7pN
	7MYo5DxEWnGAdua40v2Go1tH0IDd8fhplXZ4dGH79q5N3iMewNx+KLMIvCLK8bMri2NRmvBfUAZ
	Z4/94t52hCDMQ/krQiJcMnIf8rGG9yfiib+KmKHo+FEa7sJKcfF8OFpbAykx6gJiAlVHYvpcdI/
	wvrmKZP5BCFYcywDPElGsm47/actMW2w+85ogWcGtESG05/chhyvT4JfS7258DJKHVD59A6fDkA
	ET45Fa4HWTo5lzqMyS+R0RoBypzgANvyUIzygG+7VKnJ/4vO8VZoxWUlLNNyqJGVCyHHhewZWtN
	kEOs67SviHktTxBPiWQPcY70dSalfSQ3gpBn59cBsoY9xhtXl6Ba8pyZ+0Y=
X-Received: by 2002:a17:90b:440e:b0:39e:6c69:7777 with SMTP id 98e67ed59e1d1-39e6c697978mr8690113a91.32.1789955841685;
        Sun, 20 Sep 2026 18:57:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a027ce61cfsm9765295a91.8.2026.09.20.18.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:57:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Sun, 20 Sep 2026 18:57:19 -0700
Message-ID: <20260921015719.1045365-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_185722_750800_30D9DE11 
X-CRM114-Status: GOOD (  16.25  )
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

The NDFC NAND flash controller was only described in a legacy text file,
so dtbs_check reported "failed to match any schema with compatible:
['ibm,ndfc']" for the ndfc nodes of the bluestone, canyonlands, eiger,
glacier, sequoia and warp device trees.

Convert the binding to the YAML format so those nodes match the generic
nand-controller-legacy schema.  Describe the node's reg, ccr and
bank-settings properties, along with its "nand" chip node which carries
the legacy partition layout.

eiger's ndfc node omits reg (supplied by U-Boot), so add a placeholder
there to satisfy the newly required property, matching the flash@0,0
node in the same file.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../devicetree/bindings/mtd/ibm,ndfc.txt      | 39 --------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt b/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
deleted file mode 100644
index 869f0b5f16e8..000000000000
--- a/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-AMCC NDFC (NanD Flash Controller)
-
-Required properties:
-- compatible : "ibm,ndfc".
-- reg : should specify chip select and size used for the chip (0x2000).
-
-Optional properties:
-- ccr : NDFC config and control register value (default 0).
-- bank-settings : NDFC bank configuration register value (default 0).
-
-Notes:
-- partition(s) - follows the OF MTD standard for partitions
-
-Example:
-
-ndfc@1,0 {
-	compatible = "ibm,ndfc";
-	reg = <0x00000001 0x00000000 0x00002000>;
-	ccr = <0x00001000>;
-	bank-settings = <0x80002222>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	nand {
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		partition@0 {
-			label = "kernel";
-			reg = <0x00000000 0x00200000>;
-		};
-		partition@200000 {
-			label = "root";
-			reg = <0x00200000 0x03E00000>;
-		};
-	};
-};
-
-
diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
new file mode 100644
index 000000000000..96e25771a8fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ibm,ndfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM/AMCC NDFC (NAND Flash Controller)
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description: |
+  The NDFC is the NAND flash controller integrated into the IBM/AMCC
+  PowerPC 44x SoCs.
+
+allOf:
+  - $ref: nand-controller-legacy.yaml#
+
+properties:
+  compatible:
+    const: ibm,ndfc
+
+  reg:
+    description: Chip select and size used for the chip.
+    maxItems: 1
+
+  ccr:
+    description: NDFC config and control register value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  bank-settings:
+    description: NDFC bank configuration register value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nand:
+    type: object
+    description: NAND chip attached to the controller.
+
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 1
+
+    patternProperties:
+      "(^partition)?@[0-9a-f]+$":
+        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
+        deprecated: true
+        unevaluatedProperties: false
+
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ebc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        ndfc@1,0 {
+            compatible = "ibm,ndfc";
+            reg = <0x00000001 0x00000000 0x00002000>;
+            ccr = <0x00001000>;
+            bank-settings = <0x80002222>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            nand {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "kernel";
+                    reg = <0x00000000 0x00200000>;
+                };
+                partition@200000 {
+                    label = "root";
+                    reg = <0x00000000 0x03e00000>;
+                };
+            };
+        };
+    };
+...
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
