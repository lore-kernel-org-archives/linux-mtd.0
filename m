Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13184C47DD7
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jan 2024 19:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/p4EQMbGbq9WkbQ+vwNKpOfS3H84oJf/vH9LQ6XXZX0=; b=ePCgJfctWuEAah
	0ubM7n5413GGdHc9gtwEeCoZ0XiK0wUPs9hLzLk1rTwREmGb9aTtkBSK1UP6y73JbTeSno+ZCFPfu
	TGxLi2D1vhsc7H+UVNW7rR/c9ZAq9rmNj0zkb2jA+2Ms2jmRyRdsXdlOhq7QOQN6LyrIfgDQ9yTK2
	TSEV5PevCQAocgCh4merluEfcp3OBORUqSDARhmpWgHLRSHlVRvBJQsZY898/YXFmJrnlp/v49pTZ
	JpvxLJi/nsH7TvbajPgUZ9nwnN0tonSifxVxfrIJaDRAMYlknbOe4mO39hKhizmfJjtLbePSBoJhD
	KHpIjmH8gOw3uT7OAnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYTC-003gJj-27;
	Thu, 18 Jan 2024 19:54:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYT6-003gEw-1F
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jan 2024 19:54:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2902b142211so67429a91.3
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 11:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705607664; x=1706212464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+1SWW+Ig8UbJFSMxb59hrypayblGZkJ0hxIP2opRhk=;
        b=cpDtiElEKOBWzRJZ5G6Av8ik5Tk2PyIIomhq1xN45e9B+GXTQxvy822ceUJ9HfszD7
         EsCuOIwYP1P3sWEJZyXk0qTirhD+mm6KCh/0SgY2YsjimgcLxs6PAC2aeL7psB2A2yT8
         hbi1bN8fqmiuvdT2MZzxMtleexKGTnH8RF87c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607664; x=1706212464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+1SWW+Ig8UbJFSMxb59hrypayblGZkJ0hxIP2opRhk=;
        b=rrYGWhN4C84/tZFikp3PNHTbxp5iq0QUIcG3YBHkkHyHQfE7T1T02btYuLzeJzX7Zd
         3urSO0yCP4KqE5bN5fa0vISTslZ4r7JF8l1uBFMbHJFFF8iXU+UynUm3H9IM4yIjZmL2
         ph6Tt+fxKAE3N9xvilPwL2Oev9rRUFoiJ9n68TBfcFljJPjHp2paSjxCcq+XJHQREw8p
         pGw8AE7mzZm1cHj7eEllqUAbwwe1obDnbPCkXvTCL/4tihiTAEBUpOFtRYbgRNStxY5c
         Hu9/K10HjK9alZVR1yrJunUxxkgZ4AJo0HaD8d6jHTCDpW8zf625hfIoE5OMoLR8x/8n
         ttRQ==
X-Gm-Message-State: AOJu0YyEFnHKbi1KM82UFEw8adhEoRn3lQLhD7UM35jHPe3uslGrkmKl
	LISA59F4dFMgfHS6W3PD3i72dwqJHWsCgh1VRPOrpb1CXTiVE5Kgv31wK8KSyQ==
X-Google-Smtp-Source: AGHT+IFJN5qdqCj4U1EPyvoOMfY4T24rq4BxUvtFH94/vWLwCV5OWIm6tnON7+tYz1c8hDwFg68IcQ==
X-Received: by 2002:a17:90a:9a94:b0:290:4a:bfc0 with SMTP id e20-20020a17090a9a9400b00290004abfc0mr1068043pjp.4.1705607664535;
        Thu, 18 Jan 2024 11:54:24 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id rr12-20020a17090b2b4c00b0028d9b5d41edsm2263805pjb.38.2024.01.18.11.54.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jan 2024 11:54:24 -0800 (PST)
From: dregan@broadcom.com
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
Subject: [PATCH v2 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
Date: Thu, 18 Jan 2024 11:53:47 -0800
Message-Id: <20240118195356.133391-2-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240118195356.133391-1-dregan@broadcom.com>
References: <20240118195356.133391-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_115428_425353_C4C56886 
X-CRM114-Status: GOOD (  17.19  )
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
Changes in v2:
- Revert the new compatible string nand-bcmbca
- Drop the BCM63168 compatible fix to avoid any potential ABI
incompatibility issue
- Simplify the explanation for brcm,nand-use-wp
- Keep the interrupt name requirement when interrupt number is specified
---
 .../bindings/mtd/brcm,brcmnand.yaml           | 36 +++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index f57e96374e67..56176ec1a992 100644
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
@@ -65,7 +67,7 @@ properties:
           - const: brcm,nand-iproc
           - const: brcm,brcmnand-v6.1
           - const: brcm,brcmnand
-      - description: BCM63168 SoC-specific NAND controller
+      - description: BCM63xx SoC-specific NAND controller
         items:
           - const: brcm,nand-bcm63168
           - const: brcm,nand-bcm6368
@@ -111,6 +113,17 @@ properties:
       earlier versions of this core that include WP
     type: boolean
 
+  brcm,nand-use-wp:
+    description:
+      Use this property to indicate if board design uses
+      controller's write protection feature and connects its
+      NAND_WPb pin to nand chip's WP_L pin. Driver defaults to
+      use this feature when this property does not exist.
+      Set to 0 if WP pins are not connected and feature is not
+      used. Set to 1 if WP pins are connected and feature is used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
@@ -137,6 +150,16 @@ patternProperties:
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
@@ -177,6 +200,8 @@ allOf:
             - const: iproc-idm
             - const: iproc-ext
   - if:
+      required:
+        - interrupts
       properties:
         interrupts:
           minItems: 2
@@ -189,7 +214,6 @@ unevaluatedProperties: false
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
