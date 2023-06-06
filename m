Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270B3C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRcE2L8YWJJOk9/sgaJt+IuM6YR/2RiEfVpfIFXP3rY=; b=cR9hm73elxKDRp
	4e9asySLDXUQdznuV1aSE0j/V2ClDLYxqq4V+zb9PTymB4y0ReAB6+EWWo6tK2nyhFW0DgzdxJ/z0
	soVpMUPrGyJSv0UFc9i2OImF8nxhfqu7yawPUaEJaXg1nKaofk0yKrX9/Fm7Y65ZDUhXUkYVjVM4s
	gej/VosDoDI30QrDDYFK5F6dZDFE84vBvIbgutEZo2cp0o36Sk8cLjZLdnKUNMyo57r4orCiQ5vh5
	NFPi7627iy5iuSqjGvEnKJARGS7XtMVeHLlAb24awE3amBeCzOYwgy2/3EPWGGF8BJHd7m6TFEykh
	1G3cNWqIv9nWHL8HIqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Txz-001BUK-1V;
	Tue, 06 Jun 2023 10:31:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Txw-001BS2-2h
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 10:31:06 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686047463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9SZREVVBoJoyxWni6go3L9WEAtm6kUUTLlFeQD9fVg=;
	b=DaLDiww24w9CAiIp1T0bEVRVf4+mCxWNnTaXX3k8uFueigUgGrgOrA8T5AV8jL8jjsFFzO
	2I5MGqX+QHNlnn9+cCNiiz8qxM1OpaAc1i4cP9yO3gTs3qv2p309B+ls9W7/JO+V7b/SlD
	mk4n4NYyDh2qTOSENpq4F+d7NwaIM4bKunI4H8cCww66YMsV8+MOdAJu2qa0kvx+CFkkh9
	fEr5azly7PKGwx3Il/GL31m1dUGm3ebfGNmsQSMFJonvu7MMLyru3s1wV8jt51xm+6NjmG
	z/DC7axgH202X8SXVITWfKq5GWwurKWETrN8gy0jNb2acPXPgzoNnm5FN79jrw==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B7A2FF80E;
	Tue,  6 Jun 2023 10:31:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: mtd: qcom: Fix a property position
Date: Tue,  6 Jun 2023 12:30:55 +0200
Message-Id: <20230606103057.137711-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606103057.137711-1-miquel.raynal@bootlin.com>
References: <20230606103057.137711-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_033105_135405_B6E3DA76 
X-CRM114-Status: GOOD (  12.12  )
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
