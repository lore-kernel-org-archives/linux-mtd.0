Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72724C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MI3I2QFl7xnVl5mqPoquPzozyRf6lFjjWw/0m5XjgVg=; b=hyeLWnNCpE8Gtp
	532MUU7HfedkRk44h/lidLWRNSphW3IjEZc7L3Dvrtok0oTZXBPIyO2jBMqz1PMgQMEujQdiM7k4V
	LQRn9BlZhcG7xKGJRL8Sf6Rfmx4Y5KecpqjuU3Q+BrMIEToZw63cxwHi8q3mJW8XIuK104GWJCy1+
	oO6cctdx+kcaKALSb9SMZ3JoRXNzrTUcYWxbKEi6dac+pfBbH/4K0hNdIkcw0ulxZPiQD9L/NREyI
	SS6hSNYzv2JeqJMuSdGG5U0t65pHx6unGKXI7R2Jc4OT2MHggrZLlVNI1NesbR0Bo9O92NFDemIHA
	V9I7TTXgyRJ/FQuTaF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVOZ-00H2dL-IH; Mon, 14 Nov 2022 09:04:47 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNK-00H1qv-7x
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 081E1FF804;
	Mon, 14 Nov 2022 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27rcuo1g8HrO5e+x9FwYP2uewF5xCWK5frETMU2TyEE=;
	b=TzzKM6ExToWVyxG2AZgulohBJxNh5wN30plZFgJEYXfR+BlurpAnvUEI93kKIsVaDYn9fW
	V3TwwvOPtmPWqLwYkEnqctCY0t6J8X/L7KBuBVLnbwXa9Gvpzzc9ddip+IFZIcjE3EQvkt
	3THGvHvUKmEKmHpsaD18MrOPA1rKLCIY0fzYslD0jw41bdgZ8KDrC5stoU0SN/BXkvRREg
	pte8XBpbldPOKeksDGY1CoXUVPIrjZ0SLV00lIbhcsK9u9QIyXjPLcskj4SkhiQYXinMr3
	c6L5fTjncGK1dD+NREo4TWm4IV8Cs92sPvns2rFsPoK7z3rH+415x7C3ourHQQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 04/17] dt-bindings: mtd: nand: Drop common properties already defined in generic files
Date: Mon, 14 Nov 2022 10:03:02 +0100
Message-Id: <20221114090315.848208-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010330_608070_B422AA1E 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

generic files, so let's drop these properties from the individual NAND
controller bindings when no additional information is provided rather
than the possible presence of the property.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml         |  9 +--------
 .../bindings/mtd/arasan,nand-controller.yaml           |  5 +----
 .../devicetree/bindings/mtd/intel,lgm-ebunand.yaml     | 10 +---------
 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml  |  3 ---
 4 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 4741864da48e..65521924ee1c 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -14,9 +14,6 @@ maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
 properties:
-  "#address-cells": true
-  "#size-cells": true
-
   compatible:
     enum:
       - allwinner,sun4i-a10-nand
@@ -49,11 +46,7 @@ properties:
   dma-names:
     const: rxtx
 
-  pinctrl-names: true
-
 patternProperties:
-  "^pinctrl-[0-9]+$": true
-
   "^nand@[a-f0-9]+$":
     type: object
     properties:
@@ -91,6 +84,6 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 ...
diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
index f013fb976d95..d028269cdbaa 100644
--- a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
@@ -35,9 +35,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  "#address-cells": true
-  "#size-cells": true
-
 required:
   - compatible
   - reg
@@ -45,7 +42,7 @@ required:
   - clock-names
   - interrupts
 
-additionalProperties: true
+unevaluatedProperties: true
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
index 741c66ee06c3..7c83a328845e 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
@@ -39,12 +39,6 @@ properties:
       - const: tx
       - const: rx
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
 patternProperties:
   "^nand@[a-f0-9]+$":
     type: object
@@ -67,10 +61,8 @@ required:
   - clocks
   - dmas
   - dma-names
-  - "#address-cells"
-  - "#size-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 482a2c068740..3cc90c64e974 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -31,9 +31,6 @@ properties:
       - const: core
       - const: aon
 
-  "#address-cells": true
-  "#size-cells": true
-
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
