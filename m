Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C12C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ujbf4vT9pPPg3d/3u5+P5jxVQqq1TG2dMtaCnHGgWsY=; b=lrJP6sHYm6/CCO
	FBv8GuImWIrnXoRY47zowxDdNImNzYuHTZ26Ztw6N9YqRghVHTZZB1I5chY+Wp0ITK32JSDBBksdm
	BTqy8Tu5J6iafx40XDfWNL/FpnnpVWhDd5gBsrMzGuUlJJdjMLxfOdpTKPMnBMkUi7by2KBzrRqhm
	fOowgCFW3Xo2xCBwX3r6XGW6TNBfy4M8lxY1aoaD3vYE2MKUqXVJDz7wEEXkqn9Vy0jM6abIkJqd3
	DwEpvtj9q18oC8aFdDaaNjgqXj2eB9exxMLW3PlAXRxkz9ANlCy4ynrXZ5Leo/IktK4xMJ5rqIF1O
	Kf9J7LJgVutoMx+j2BbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzrB-004W4Q-Ez; Fri, 04 Nov 2022 16:47:49 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqn-004Vqm-VF
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 77FA74000D;
	Fri,  4 Nov 2022 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TiQPntzC2ir2r9t3qv3kzKf1NvJ5V3BTdHExODnectk=;
	b=G/ygxGmxnKtQ3TngXx5aoy/hQTBclVESME1UOBdg1JJhAPSb+yPYEKraCOXI+VnAM7axic
	z4kfKTUpF0n3ccGXD2C7whJsL77DyarR0EPLUxybaj3HifBpxIZbbowO2zdcBnrpzhCoTc
	XeKvqV26JRME2feyaNzskFRVSiv/lul0FRmoYJrp9G5D+qMhkiUhgEY2NAgqlQ+P6HktNW
	KeieFzzvrYVHBCIzQZYHCveZvGoH12Qk3Vt1Hk2y/pUa/tFKHU1Q1QArMDz5XmdycgsOsW
	enjYhuSdElXEvh/nOAVP8Tw1gpaS7UBclrnVdfSNXA0/ZTOtpcJe20ThcXSjDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 04/17] dt-bindings: mtd: nand: Drop common properties already defined in generic files
Date: Fri,  4 Nov 2022 17:47:05 +0100
Message-Id: <20221104164718.1290859-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094726_335422_BA95F887 
X-CRM114-Status: UNSURE (   9.45  )
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
