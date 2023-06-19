Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294DFEB64DB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IM5BQ7uOF3dGFrplSJ47UKjlXEGsHGSWFWDRri4/hvU=; b=uu+Zlhm/7quTR9
	d4TeFPLY5SZJH63XPCEki/sErvCXkErX+FKr3H6b7CpJV/2U/LxqZGrZ4hD7awGzVxL0AHyrDuB8f
	cQ2olDmLlfy+782YWw1t64AoaB4U7PRtfzoyWJ8DqE4FyL9anWjV/j0xHNOnlXqmsO/p7Etabx4Dj
	8W0p9AT723iOniwT2caoMS3pZUWiValwEIhbbC9fD8RwRSJNkjC6eb2UYVrIGVMXi7Gz6Bm6xEGb0
	mwADDgOBA6uQTf6gaAVlTaQnDIMQVBaExVypVRNecZdEL/K6MSAVeHrAdYiIe6eqBxwybYa4oeOly
	4wrpVA9Km31gVIs1yBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBD8-00815T-1A;
	Mon, 19 Jun 2023 09:30:10 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCj-0080h8-0A
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:57 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cL+Fg1Qce9Oz6gSCncCbxOyVxxd178F0p37IQn0cMX8=;
	b=ivBjWF0uBkDjUlhv7hBCeVOVLgc3AkAOJbHwzrFnXlW9ZubEOicT3YIx5Dd1d687EwmhXy
	z4LfO2Yu3mvBFlqEuGX3SI/L8gBj824645E/RAMW5573Cyd4yfuJYNY2vt5WkUsl4j9xWR
	Y/u62es6rTR1HXRtGEiBDmNfDJjYedG3P2zUrSOQx1e5hJr0Rqo05Z7ioiTYXaYCT1dv9d
	P/aFhDxloWIVGzpHYhuqqWPf6QVGnI5/farql/ZatQ5DIR1ZSr8sUsZ3elUkuWS0zkT812
	+3sJjwHDsJ2KAxkEp4w0DMsi75cfdf7ZjIPevUVOJ0w2f0bk9Es2tJOBag8j+g==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00BA21BF221;
	Mon, 19 Jun 2023 09:29:41 +0000 (UTC)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 14/17] dt-bindings: mtd: stm32: Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:29:13 +0200
Message-Id: <20230619092916.3028470-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022945_251033_ECC12376 
X-CRM114-Status: UNSURE (   9.13  )
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

List all the possible properties in the NAND chip as per the example and
set unevaluatedProperties to false in the NAND chip section.

Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index 986e85ccebc7..e72cb5bacaf0 100644
--- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -37,6 +37,7 @@ properties:
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
       nand-ecc-step-size:
         const: 512
@@ -44,6 +45,8 @@ patternProperties:
       nand-ecc-strength:
         enum: [1, 4, 8]
 
+    unevaluatedProperties: false
+
 allOf:
   - $ref: nand-controller.yaml#
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
