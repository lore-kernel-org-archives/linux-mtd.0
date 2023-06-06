Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B6EC77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LitmUHbEhnvKrO1TvXi/8nwoiSeZvyzMfmLrEzUhjq4=; b=vNHftj2hc9Pr/R
	ISOTvz0TqL/vrpOmdzyaOg3rmd275xXQzqAXdgBicNWXHG0CcladQsBBjifpDpaO0TjTMgjBratup
	t8KSzbOhSj2f6y8KmYaYo8QnpT0hEk7jrcbmc4iitVjtL+QD0mSTMW/jWlcYgDAuYRuruTT3B/1UX
	KxpBCslzOUsC6K/dVhNOakJbKqkOr0pNwEtIw7JVv970xqe4YRKDkXdS0zTG+hXDJsJpci5RvN0qr
	smZjzNBLdWQU75JnZEBMwV+taJK7WFs19LNqEfxX2kEJ6OhxrXlVAS0E6rRiNk/Df+/JAXRYtXeqV
	RcY3JQRQFU2ksTgbHTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arl-002egP-0h;
	Tue, 06 Jun 2023 17:53:09 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arf-002edC-2b
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:06 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2WXjbjVNd/K/fgESMK8wGD8/6eIGXuiIdn+PWMMAck=;
	b=ibU7Hajui0BMQ/ELN3+MoaTrZrL2nA1eC5+bcuWrXzGXYKRSst3Dwg73U4PpHEwieomy54
	m2sju7kj1BdA9oC0evB2TN/gLz8JAHwwmr2tPl2AdQFwbkfu/MFpVWNzWvvJUTLi7qA0fl
	N9BvO1mS9KRIcpP3Zdx2bzROaNJlNn5ugrdK9e2cvVJop9IMGhmSLTT3IrL80humpo6DOm
	YA9ZrATBitEaU1VdB9PnwTRyA4NaxmrHCB4lFjrZ9ufjdVRICvS4xBFF2YEqn2uJMoe1e0
	OenVo8x8Xc29x3qxAph4aIV4uJ6oArqM9GC2fUtlmAL7AbFDEQppIWpJ7BYp4Q==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA9871C0004;
	Tue,  6 Jun 2023 17:53:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 05/17] dt-bindings: mtd: qcom: Fix a property position
Date: Tue,  6 Jun 2023 19:52:34 +0200
Message-Id: <20230606175246.190465-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105304_181244_ACEEB54E 
X-CRM114-Status: GOOD (  12.04  )
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
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 41 +++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 07024ee45951..7217d8a64d14 100644
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
   - $ref: "nand-controller.yaml#"
 
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
