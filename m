Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ACFC47DDB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLHpa5mmUQFuhId3l+M3IqmVUV1UNQqW190poEZT6XU=; b=gupmwD5EXwvjwd
	OySXps9LUHWqQ98uUC5EVHCw6blFYSCgyUNNOYAoXDv7XXnbvnW3XLIrgL+TUnUUYsUScdpOxGyIq
	D0Nyjj54PlXFkHvh6Cst9WYE7aAx02/QzQQmLukbFuIiZmJqprQgq7OhTPJB30vUHQsc2roCttbRS
	VQdcbrBJnBR902VgeOKU2gTReIHkWavOgk4Pn383SoMtNt05hSBZarNxq5zKHXNeuF4/p3pdsNX/w
	hDygZ/+c1P0KyAzV2MYxkHboq0wBYcYCtBvPvm8tvJpvaxbzv24e+CIn2BSGiGPaoZuvqOyzUf2+l
	6pzQ1l1lvsHzE8b6Sk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTb3-001Fa1-0T;
	Wed, 24 Jan 2024 03:06:37 +0000
Received: from mail-ot1-f99.google.com ([209.85.210.99])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTb0-001FWt-0P
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:35 +0000
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-6e0a64d9449so3236454a34.2
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065532; x=1706670332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfC42mFMxWbt42N2Y8Snh0FkDOtoFt5c5JS3NwC/Elo=;
        b=ARbLkKA59u1wwJu75P3xOzaRSfRm5hgdYD1vcr4e0OSVoVn4IM3aScO9qOkyOqcOeF
         kKMbueXbZCPwr2WZt7Rz6Cz9XCwsN4ypiZPEVgzfz+Myxu7NlaBrzI+dSmecQPk+2xZQ
         8R6yCHEVU8D02JjqUWWA5qxvj5E2G5e0fWF+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065532; x=1706670332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfC42mFMxWbt42N2Y8Snh0FkDOtoFt5c5JS3NwC/Elo=;
        b=NZ6l6Vwzphpa2LYxiBHyTJAqAuFvtJTuBcAk+lZ254WBZ5hzsgtRhVJvlIPI/bDU/o
         DnA0XOd9fV3qWVQuNWS6bfvOfy/3TTYA2W8hJ4gZebga3NO/6LH/3x5Uv+kuN3OtioW/
         rNomITnjm+sM0/NcTVBjskFqTEEd3fqDS5wzw9ciTgzJhg8VA5n0Y4OQjeYf15oZqszM
         57EFhPNKj03bRwNiXdQWtHAY5XQxbs3ITz2ImMQ3gkj/gNPJ5m97VjPiFe0HhqfMz6uf
         2U1ZQ90pCGCIx9tE52zZ9sh3UAssTkRCRrBOJSMGIVYSrCy8pd+85Unw/Lunveu73cdB
         wErQ==
X-Gm-Message-State: AOJu0YxXaPEh6V/7U+hYbFlQ8Lfq1M+Ymeq84Szb2G/1Az3ev8k0/s4d
	Qa5FMMbaTFQZVK5iURNPzjKha5EkC/IYb+zD1TkSEqxUNajbDte2m7uxy7M7kDL91DWQW7/NG1t
	RcY31tuFq2iZwyt3dX8zZ0fl7mzA9mA==
X-Google-Smtp-Source: AGHT+IGkswDyG3Gtz3GqJE+TRieLfMO18ZMJzmD7ROmdRdjJ3ufDF3WoK1jWXcVp3qq/MXq4+F0KEGsc3xvR
X-Received: by 2002:a9d:5e09:0:b0:6e0:f7bc:24f8 with SMTP id d9-20020a9d5e09000000b006e0f7bc24f8mr847296oti.60.1706065532044;
        Tue, 23 Jan 2024 19:05:32 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: David Regan <dregan@broadcom.com>
To: dregan@broadcom.com,
	dregan@mail.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	computersforpeace@gmail.com,
	kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com,
	baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: [PATCH v3 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
Date: Tue, 23 Jan 2024 19:04:49 -0800
Message-Id: <20240124030458.98408-2-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240124030458.98408-1-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190634_172355_F1A4E02E 
X-CRM114-Status: GOOD (  18.86  )
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

From: William Zhang <william.zhang@broadcom.com>

Update the descriptions to reflect different families of broadband SoC and
use the general name bcmbca for ARM based SoC.

Add brcm,nand-use-wp property to have an option for disabling this
feature on broadband board design that does not use write protection.

Add brcm,nand-ecc-use-strap to get ecc setting from board boot strap for
broadband board designs because they do not specify ecc setting in dts
but rather using the strap setting.

Remove the requirement of interrupts property to reflect the driver
code. Also add myself to the list of maintainers.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: David Regan <dregan@broadcom.com>
---
Changes in v3:
- Update brcm,nand-use-wp description
- Revert the description change to BCM63168 SoC-specific NAND controller
---
Changes in v2:
- Revert the new compatible string nand-bcmbca
- Drop the BCM63168 compatible fix to avoid any potential ABI
incompatibility issue
- Simplify the explanation for brcm,nand-use-wp
- Keep the interrupt name requirement when interrupt number is specified
---
 .../bindings/mtd/brcm,brcmnand.yaml           | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index f57e96374e67..752c6ee98a7d 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -9,6 +9,7 @@ title: Broadcom STB NAND Controller
 maintainers:
   - Brian Norris <computersforpeace@gmail.com>
   - Kamal Dasu <kdasu.kdev@gmail.com>
+  - William Zhang <william.zhang@broadcom.com>
 
 description: |
   The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
@@ -18,9 +19,10 @@ description: |
   supports basic PROGRAM and READ functions, among other features.
 
   This controller was originally designed for STB SoCs (BCM7xxx) but is now
-  available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
-  iProc/Cygnus. Its history includes several similar (but not fully register
-  compatible) versions.
+  available on a variety of Broadcom SoCs, including some BCM3xxx, MIPS based
+  Broadband SoC (BCM63xx), ARM based Broadband SoC (BCMBCA) and iProc/Cygnus.
+  Its history includes several similar (but not fully register compatible)
+  versions.
 
   -- Additional SoC-specific NAND controller properties --
 
@@ -53,7 +55,7 @@ properties:
               - brcm,brcmnand-v7.2
               - brcm,brcmnand-v7.3
           - const: brcm,brcmnand
-      - description: BCM63138 SoC-specific NAND controller
+      - description: BCMBCA SoC-specific NAND controller
         items:
           - const: brcm,nand-bcm63138
           - enum:
@@ -111,6 +113,20 @@ properties:
       earlier versions of this core that include WP
     type: boolean
 
+  brcm,nand-use-wp:
+    description:
+      Use this property to indicate if board design uses
+      controller's write protection feature and connects its
+      NAND_WPb pin to nand chip's WP_L pin. By default the driver
+      uses a module parameter with default value set to enable to
+      control this feature for all boards. Use this dts property to
+      override the default behavior and enable/disable this feature
+      through board dts on a per board basis.
+      Set to 0 if WP pins are not connected and feature is not
+      used. Set to 1 if WP pins are connected and feature is used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
@@ -137,6 +153,16 @@ patternProperties:
           layout.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      brcm,nand-ecc-use-strap:
+        description:
+          This flag is used by the driver to get the ecc strength and
+          spare area size from the SoC NAND boot strap setting. This
+          is commonly used by the BCMBCA SoC board design. If ecc
+          strength and spare area size are set by nand-ecc-strength
+          and brcm,nand-oob-sector-size in the dts, these settings
+          have precedence and override this flag.
+        $ref: /schemas/types.yaml#/definitions/flag
+
     unevaluatedProperties: false
 
 allOf:
@@ -177,6 +203,8 @@ allOf:
             - const: iproc-idm
             - const: iproc-ext
   - if:
+      required:
+        - interrupts
       properties:
         interrupts:
           minItems: 2
@@ -189,7 +217,6 @@ unevaluatedProperties: false
 required:
   - reg
   - reg-names
-  - interrupts
 
 examples:
   - |
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
