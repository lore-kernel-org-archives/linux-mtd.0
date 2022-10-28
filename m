Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB07DFA3741
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3w9yRaPZtZMUrYzpglCqWMOnEb1Nn3NSj3FNqNBnDc=; b=sw6S5z6pAUwHLi
	dmQEs1DgoeQR9BMsfQm2cqKyA5kasw2LVqdrsydGmyQU98eZDz/xHddQVWbJNEJ9X67cynBwOTwyo
	JgFlrzHUicziZmSXvzEDzncdkcAPlS7RWXKq6kw/XtA4AErZyHYgGe05rGqDJ0ETWPnZcuiqk2JJx
	0MdWtqWy1hm2926OknYhUljC1LXlFE23C4Pv8m2hlvOjP+reNSyStGj+TIXJcmyBCl02UyHJDsQPB
	6nZXUGI+gOBMxYvPt3E5Feg/4tHbB8Xw0YczK8crmhMFilL1Uz7iVF98LvKZJxQuWIdY21X0iYRsy
	cyXhRWLdKS8pmt4QH4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZJk-003LUH-38; Sat, 29 Oct 2022 00:03:16 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGR-003Jkf-H6; Fri, 28 Oct 2022 23:59:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 24CC6FF80B;
	Fri, 28 Oct 2022 23:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bz4zDKYgqJdZhYLHEX7GncYrFGDFdsFKAB8BkHTpDKM=;
	b=T0r3/PgyzsG0lHiPcrvcuUZx3iWrRcCptXDsX8GClrEiM4LdppW0igoRTsbDkKSVULqpfZ
	+UeaY20/PazolRhLJwgrP3ie/IlhG4ue+Up7fiCXIc5OQVjytjiKnJScMlE3Tev9O30eul
	TKNVOepdK5QiXH6gANvPK9S19B+M7WHEk1CZJ93IUy8KQ8CNV2lUxsee/Lam4yewOmd2BO
	7PXpK+jZWVZ5SLBn0cZAijB/CZx3voaaaTiAtQcNgcIlrSgLVZ0BZ14g2otuRf67fNxF9Q
	e6ShfuyCfotc63jhNult3DP1mnZQnsOui0Hl85nOO0G5PqedP+0fXJifryStCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 07/12] dt-bindings: mtd: Drop common properties from NAND controllers
Date: Sat, 29 Oct 2022 01:59:28 +0200
Message-Id: <20221028235933.934850-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165951_900100_047C0738 
X-CRM114-Status: UNSURE (   9.44  )
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

When redefining common properties does not bring any additional
information, just drop them from the controller bindings because these
properties already are definied in nand-controller.yaml.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml       |  3 ---
 .../bindings/mtd/arasan,nand-controller.yaml         |  3 ---
 .../devicetree/bindings/mtd/ingenic,nand.yaml        | 12 ------------
 .../devicetree/bindings/mtd/intel,lgm-ebunand.yaml   | 10 +---------
 .../devicetree/bindings/mtd/qcom,nandc.yaml          |  3 ---
 5 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 4741864da48e..140594cc2215 100644
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
diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
index f013fb976d95..ae0fc4546737 100644
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
diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index 484280dd35ab..28a08a6d1385 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -37,18 +37,6 @@ properties:
       Node containing description of fixed partitions.
       See Documentation/devicetree/bindings/mtd/partition.txt
 
-patternProperties:
-  "^nand@[a-f0-9]$":
-    type: object
-    properties:
-      rb-gpios:
-        description: GPIO specifier for the busy pin.
-        maxItems: 1
-
-      wp-gpios:
-        description: GPIO specifier for the write-protect pin.
-        maxItems: 1
-
 required:
   - compatible
   - reg
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
