Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C2C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0APXw5M2+SbLvFTe6xLxhvdSFOIfvqpuff2o0u6yaTs=; b=IdMSq2eZELqaQl
	0LiENOg9/9zLAQMIXlBE/UgA2zxGyTfRAaMh/ln0pRyZNiwccKWO9qSIx+NLv+nN0G1CduABFlhcj
	nQ/iTFY/+Q4JFQ1hSqWs0apCkVaonP0EXjwMV/apfbgdWI98TAf89mfmeYnukfaSd8+rJD0KTspHi
	xOpFouFIMLi0ep5q7n+vSZ/Lp7Iiv8j8oiVGABjlLGMXONeMrMh0RysfIu1JO0rQLLsUvKRGoxjsH
	XtOlvVJ/58oDNF8m5Yzgidb7eUq6H4Q1wkx6+ASyQ+nkSSihDuL9Fe4u94mFpKjlXoy9Bq72+O3EM
	uvjEFMR1Ug9l9scCb5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ty4-001BYK-1o;
	Tue, 06 Jun 2023 10:31:12 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ty1-001BTF-0K
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 10:31:10 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686047465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJYAGRC0i2DcEfYnTuv+aEbkwNG3Py62w5DWqr2b1PY=;
	b=Ut0BPSLoFkfn7kh6B0i38YdDHY3jrzMsr7yBWB+XS0QPloSrPO9eRfSOt6QN4CxXJ9WmWV
	Y/KHNkUjJSmRkgAeV0DA9t6TCvT6U1KYxdtqCpFGa6XdZiTN81K4Iw99wjyKtTgd+Rjfda
	aZvQu0nuPSFRle/zt2mp5e1sfJui7bNRFXsgaa1YufCN2JJJL1xPEd1B8nxrR4p8n8ISxR
	SjiA01qXVutt9MbFsWScQV04qS/WxnskTRHmjY3S7bZweS8Pr88u79Prjjl90lYAv/E8FL
	1pwVK6C4AALM7+XQO46dOzFJhoMHf9bri1V8H5KRoAoxXK1LDly/i3ci2NIuqQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44F20FF80D;
	Tue,  6 Jun 2023 10:31:03 +0000 (UTC)
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
Subject: [PATCH 2/3] dt-bindings: mtd: qcom: Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 12:30:56 +0200
Message-Id: <20230606103057.137711-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606103057.137711-1-miquel.raynal@bootlin.com>
References: <20230606103057.137711-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_033109_298158_0E8A2AA4 
X-CRM114-Status: UNSURE (   9.19  )
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 7217d8a64d14..4ed14cd97cb8 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -35,6 +35,8 @@ patternProperties:
   "^nand@[a-f0-9]$":
     type: object
     properties:
+      reg: true
+
       nand-bus-width:
         const: 8
 
@@ -61,6 +63,10 @@ patternProperties:
 
           Refer to the ipq8064 example on how to use this special binding.
 
+      partitions: true
+
+    unevaluatedProperties: false
+
 allOf:
   - $ref: "nand-controller.yaml#"
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
