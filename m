Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2987AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfBUrlDzPI+oCQUfPHxYq0nARy+OSMs3zOBMK/WMqvo=; b=yRu+Jc4kbWFwUr
	//wK74F8ppThHwHU8rMX0+/ODXityh1e69+8DeUNpn5F33Zup8Zb82dETkzWfHHZqKLN1L8HhKuV7
	Fh5BIOAN+iyU7cj5TGT70cpYIWCGVZbCEUiS91Sj/KuFqV4fai/JBaniXx0XtuvWWMs6ME0gG8/du
	vF1ViYv4kHyo27/iCtjddVVhChjV340ei5Wj4Jl5LUnNUS86q/USkA81D9UVih9qrX7yIFCpUNwGX
	r6Qh2YEss+IYJvC58KGWPHwNNvrpQ67OdgGJpBrJwOO3QkP2d1FM8UnnWkc/HY2XPTfr9Rb7eeeTf
	9ZnJo7qOfGWG7QG3YDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxoyo-005Cea-S4; Thu, 16 Dec 2021 11:31:23 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxoky-0056mh-0M
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 11:17:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0E6EBE0013;
 Thu, 16 Dec 2021 11:17:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 03/28] dt-bindings: mtd: nand-controller: Harmonize the
 property types
Date: Thu, 16 Dec 2021 12:16:29 +0100
Message-Id: <20211216111654.238086-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211216111654.238086-1-miquel.raynal@bootlin.com>
References: <20211216111654.238086-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_031704_370968_045D8F9B 
X-CRM114-Status: GOOD (  14.89  )
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

Harmonize the different properties in this file by:
* dropping the non-necessary allOf's
* always defining the keywords in the following order:
    - first the "description" (when relevant),
    - then the "type"/"$ref" and the other generic keywords ("enum",
      "default", etc).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/mtd/nand-controller.yaml         | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 5cd144a9ec99..a4fa65e872a5 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -39,8 +39,6 @@ properties:
   ranges: true
 
   cs-gpios:
-    minItems: 1
-    maxItems: 8
     description:
       Array of chip-select available to the controller. The first
       entries are a 1:1 mapping of the available chip-select on the
@@ -48,6 +46,8 @@ properties:
       chip-select as needed may follow and should be phandles of GPIO
       lines. 'reg' entries of the NAND chip subnodes become indexes of
       this array when this property is present.
+    minItems: 1
+    maxItems: 8
 
 patternProperties:
   "^nand@[a-f0-9]$":
@@ -58,8 +58,6 @@ patternProperties:
           Contains the chip-select IDs.
 
       nand-ecc-engine:
-        allOf:
-          - $ref: /schemas/types.yaml#/definitions/phandle
         description: |
           A phandle on the hardware ECC engine if any. There are
           basically three possibilities:
@@ -69,24 +67,24 @@ patternProperties:
           case the phandle should reference the node itself.
           3/ The ECC engine is external, in this case the phandle should
           reference the specific ECC engine node.
+        $ref: /schemas/types.yaml#/definitions/phandle
 
       nand-use-soft-ecc-engine:
-        type: boolean
         description: Use a software ECC engine.
+        type: boolean
 
       nand-no-ecc-engine:
-        type: boolean
         description: Do not use any ECC correction.
+        type: boolean
 
       nand-ecc-placement:
-        allOf:
-          - $ref: /schemas/types.yaml#/definitions/string
-          - enum: [ oob, interleaved ]
         description:
           Location of the ECC bytes. This location is unknown by default
           but can be explicitly set to "oob", if all ECC bytes are
           known to be stored in the OOB area, or "interleaved" if ECC
           bytes will be interleaved with regular data in the main area.
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [ oob, interleaved ]
 
       nand-ecc-algo:
         description:
@@ -102,7 +100,6 @@ patternProperties:
         default: 8
 
       nand-on-flash-bbt:
-        $ref: /schemas/types.yaml#/definitions/flag
         description:
           With this property, the OS will search the device for a Bad
           Block Table (BBT). If not found, it will create one, reserve
@@ -111,6 +108,7 @@ patternProperties:
           few pages of all the blocks will be scanned at boot time to
           find Bad Block Markers (BBM). These markers will help to
           build a volatile BBT in RAM.
+        $ref: /schemas/types.yaml#/definitions/flag
 
       nand-ecc-strength:
         description:
@@ -125,7 +123,6 @@ patternProperties:
         minimum: 1
 
       nand-ecc-maximize:
-        $ref: /schemas/types.yaml#/definitions/flag
         description:
           Whether or not the ECC strength should be maximized. The
           maximum ECC strength is both controller and chip
@@ -134,18 +131,19 @@ patternProperties:
           constraint into account. This is particularly useful when
           only the in-band area is used by the upper layers, and you
           want to make your NAND as reliable as possible.
+        $ref: /schemas/types.yaml#/definitions/flag
 
       nand-is-boot-medium:
-        $ref: /schemas/types.yaml#/definitions/flag
         description:
           Whether or not the NAND chip is a boot medium. Drivers might
           use this information to select ECC algorithms supported by
           the boot ROM or similar restrictions.
+        $ref: /schemas/types.yaml#/definitions/flag
 
       nand-rb:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
         description:
           Contains the native Ready/Busy IDs.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
 
       rb-gpios:
         description:
@@ -155,11 +153,11 @@ patternProperties:
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
       secure-regions:
-        $ref: /schemas/types.yaml#/definitions/uint64-matrix
         description:
           Regions in the NAND chip which are protected using a secure element
           like Trustzone. This property contains the start address and size of
           the secure regions present.
+        $ref: /schemas/types.yaml#/definitions/uint64-matrix
 
     required:
       - reg
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
