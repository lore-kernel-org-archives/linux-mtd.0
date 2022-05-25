Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C7CC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 21:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JP+ghPqzt9TX97jbLJL8jRhoyoEjnSOwXIQ9x4CZOtc=; b=pH+6L8dwZeWZ0g
	CT5uU+hB3W5tfSlzCTXOWKSNfTSR54jzSAwswUtdFYHaVzWCFTWU5VAHPswAwEDoyQ+HwBkPnNL4j
	ATb45jYeHa00TlmndL0vWztIKxPZIVweNh1O5aO3+riN5a4BdTkvMKRG1Sjx8PiciUk1FuBGuOfb4
	OTOw/P+6i3HHULs8w0tRC8xlBqlhEp4w6plJrbWCs2AAUAyH/O+qS/nVy+cMTsv2TVFQHXjRHTBLK
	o6zJAzEJnsOPMn2FefraEqJJlWDrzv/gxAmYnaUzdYvGQgUPbmXXe0V+EgPbI4DRmrdwDEuT1lxHE
	0jd/QruewEBR86wl7cag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nty8m-00CiVE-1q; Wed, 25 May 2022 21:02:00 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nty8i-00CiU1-KQ
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 21:01:58 +0000
Received: by mail-oi1-f173.google.com with SMTP id m125so3427706oia.6
        for <linux-mtd@lists.infradead.org>; Wed, 25 May 2022 14:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eV5yBS00qx48PlZZxn5CpCblfq4K2A5juZQWoz0DTyQ=;
        b=gmXYz4Nv58NseSMEQBkPclFvkoOOv2eNoiqK1hJ5rYcNotAQhNw3NNLAsRfLVrCMX1
         RtD+6Pmmz6OvuuJq5qSHrMXqBe2sMZAtCIdhVKBBgahRE+5SCd6F8ohOc6beW6DbEHGP
         +F2bDrE0CtOLWBzAtV0+zkNbRdgkZp1Uiz1d6L2uvTuYRYlQGpIFTwFjwvn65nSmJnxG
         /HxqGn76M/4o0rFm1w4qrOBaLtgiB6H6w9b87Tr9+O/eBatLNOHA/BK3nKOJr+TI2LEy
         OsbiNzxk8UXptIwYLr4aPpVKucksFoj4DOVgPlb00d5WIWrTQETpW9uCxIyYT4p/Fa2Y
         6v2w==
X-Gm-Message-State: AOAM533LBTrY0NuPR11cCSZRphnJ/HMJuc9CHH/2Xya/yU+yrjHFIORR
	EuXZjbVCd2CI9jZqwj8XHA==
X-Google-Smtp-Source: ABdhPJw5CRPGykueFSEUBPahgULvafvqctVKF09HWJ0vw1MdPECO0kDWuHEbnvLjKh6QNPWctp7Eqg==
X-Received: by 2002:a05:6808:16a1:b0:2f9:bfea:e5f3 with SMTP id bb33-20020a05680816a100b002f9bfeae5f3mr6603644oib.28.1653512515113;
        Wed, 25 May 2022 14:01:55 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id w19-20020a056870431300b000f26a4e2cdfsm3723564oah.18.2022.05.25.14.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 14:01:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Paul Cercueil <paul@crapouillou.net>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] dt-bindings: memory-controllers: ingenic: Split out child node properties
Date: Wed, 25 May 2022 16:01:40 -0500
Message-Id: <20220525210140.2489866-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_140156_710162_67569D9B 
X-CRM114-Status: GOOD (  12.84  )
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

Binding schemas which define child node properties such as memory
controllers with timing properties need a separate schema which can be
referenced from child device schemas. This is necessary for
unevaluatedProperties checks to work properly.

Move the ingenic,nemc child properties to its own file and reference
from ingenic,nand.yaml which describes a child NAND controller.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../ingenic,nemc-peripherals.yaml             | 46 +++++++++++++++++++
 .../memory-controllers/ingenic,nemc.yaml      | 32 -------------
 .../devicetree/bindings/mtd/ingenic,nand.yaml |  1 +
 3 files changed, 47 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-peripherals.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-peripherals.yaml b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-peripherals.yaml
new file mode 100644
index 000000000000..b8ed52a44d57
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-peripherals.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc-peripherals.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs NAND / External Memory Controller (NEMC) devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  reg:
+    minItems: 1
+    maxItems: 255
+
+  ingenic,nemc-bus-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16]
+    description: Specifies the bus width in bits.
+
+  ingenic,nemc-tAS:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Address setup time in nanoseconds.
+
+  ingenic,nemc-tAH:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Address hold time in nanoseconds.
+
+  ingenic,nemc-tBP:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Burst pitch time in nanoseconds.
+
+  ingenic,nemc-tAW:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Address wait time in nanoseconds.
+
+  ingenic,nemc-tSTRV:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Static memory recovery time in nanoseconds.
+
+required:
+  - reg
+
+additionalProperties: true
+...
diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
index 24f9e1982028..dd13a5106d6c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
@@ -39,38 +39,6 @@ properties:
 patternProperties:
   ".*@[0-9]+$":
     type: object
-    properties:
-      reg:
-        minItems: 1
-        maxItems: 255
-
-      ingenic,nemc-bus-width:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [8, 16]
-        description: Specifies the bus width in bits.
-
-      ingenic,nemc-tAS:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: Address setup time in nanoseconds.
-
-      ingenic,nemc-tAH:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: Address hold time in nanoseconds.
-
-      ingenic,nemc-tBP:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: Burst pitch time in nanoseconds.
-
-      ingenic,nemc-tAW:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: Address wait time in nanoseconds.
-
-      ingenic,nemc-tSTRV:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: Static memory recovery time in nanoseconds.
-
-    required:
-      - reg
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index 9de8ef6e59ca..8c272c842bfd 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: nand-controller.yaml#
+  - $ref: /schemas/memory-controllers/ingenic,nemc-peripherals.yaml#
 
 properties:
   compatible:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
