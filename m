Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92089EB64DB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9D4fjcygalFgZWpy8Ew4LVyfW+Bs54IgmZ2tvYpnM0=; b=qx4latgBEQz1Fg
	3HeY3E+mUvmBLBoy4PvQfnKoVjE4b/Pr8t8OxMsl1Ndu2hydNECo2B4kbHTCw2kEm30VcOLzYacDH
	YEl26T//qbDn2AQCmluqWDo7bax5ZOalNkQOFG3y+QxyzPQt7XV2Dvh6e5h6k9UI1xwIharvwuDfq
	4QRFrE+YHkaU6T/qTbcW5TKQ5raFMLe/16NPrM3odl0gA4+Stnzi7ENRw1v0BM4k6AM90FkNBvOSv
	vfZYja022q+TeZHT8UrCT9HUBL0V1uIT0WZB6Vv3y5DRAJIfF9zdKbDs0LCmZu2awVqDUIAil1pDp
	juC/yK5dWdkHoQ7LNG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCa-0080YK-25;
	Mon, 19 Jun 2023 09:29:36 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCU-0080Ru-2o
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:32 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFNn7R3CCLELog5sCLD8kgMqopmVWyHvy7AjleYx/tM=;
	b=QpznXL/FJ88qPbjryvLymATBxEG0I4hZwAPb5p7zFyvJ0BpnLKcX+NUA9h5ucAqaz1Mxui
	8sgRATFZ7t8krSU/ZLzuo9tTT9BUQOX2PxMtcRDJlzWloLwygxFoULtC8eZbVk+oSCr5QU
	Xv2kPbjnsk4NTW6B/AqO03cSeXMncQuxd2LRz7sqGbZA4FW6hGKEYcx1DPCCTUFnDjkyAV
	csFN/kINKf41uicg1bkr7vGAM+l9q9k8Oq+JYXjSox0l7CiqVZ5NoCDzJ17l9UNcJSbw4I
	aGHjh8ug4IYhAmah9qsBSbnHjs2EmLRuLmW/TZ4RjyUk97yDEFR0rg8nbst9LQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 092A31BF213;
	Mon, 19 Jun 2023 09:29:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 05/17] dt-bindings: mtd: qcom: Fix a property position
Date: Mon, 19 Jun 2023 11:29:04 +0200
Message-Id: <20230619092916.3028470-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022931_173439_BE6BF2B1 
X-CRM114-Status: GOOD (  12.20  )
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

qcom,boot-partitions is a NAND chip property, not a NAND controller
property. Move the description of the property into the NAND chip
section and just enable the property in the if/else block.

Fixes: 5278cc93a97f ("dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding")
Cc: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 41 +++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 00c991ffa6c4..3d77922dfaef 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -45,6 +45,22 @@ patternProperties:
         enum:
           - 512
 
+      qcom,boot-partitions:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description: offset
+            - description: size
+        description:
+          Boot partition use a different layout where the 4 bytes of spare
+          data are not protected by ECC. Use this to declare these special
+          partitions by defining first the offset and then the size.
+
+          It's in the form of <offset1 size1 offset2 size2 offset3 ...>
+          and should be declared in ascending order.
+
+          Refer to the ipq8064 example on how to use this special binding.
+
 allOf:
   - $ref: nand-controller.yaml#
 
@@ -107,22 +123,15 @@ allOf:
               - qcom,ipq806x-nand
 
     then:
-      properties:
-        qcom,boot-partitions:
-          $ref: /schemas/types.yaml#/definitions/uint32-matrix
-          items:
-            items:
-              - description: offset
-              - description: size
-          description:
-            Boot partition use a different layout where the 4 bytes of spare
-            data are not protected by ECC. Use this to declare these special
-            partitions by defining first the offset and then the size.
-
-            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
-            and should be declared in ascending order.
-
-            Refer to the ipq8064 example on how to use this special binding.
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          properties:
+            qcom,boot-partitions: true
+    else:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          properties:
+            qcom,boot-partitions: false
 
 required:
   - compatible
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
