Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB1DC77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnCanjzrdOnR2bgOU+YAppevYXvHFlYyZBdYjUQmFKE=; b=ydHx4EsM2CJuYs
	lXSsdweC65YftehwjUVOzQ3ZB4avR1U3vUDCmruFg0UoGIBH2Lnh2cxYaCmdNiMM7Es7lD2mT9INg
	nHdycfLU6oo+kDzHX635hSQUwEgnzNDLL+wbTdN868V5mqkzi0L1aGiQ/YGHjCFupyaPt63Or10BB
	cDMru9bByHQiDFOkmZSSaTJjl4Fi9jS44Adz/lyUMHXVGUZyHpQsMfaPtZM6GJH8MDDbk++I2acbF
	S6zl+cymAlN/LWvlOLgMe72pj3c6tKCyLhLjgU0zOcefUn2CEW+Wyd+sNfC6mdPGMVbaaOx68PQWt
	ckEEH4W58gIChW5N+ATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6art-002elV-1O;
	Tue, 06 Jun 2023 17:53:17 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6aro-002eh5-0E
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:13 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ycgd0NeFF0Qi01QxdVs9F5FiBcqy4Oj5vlvdXkOnpCU=;
	b=lQtIm6KN46pA/jFPeLBuy4GotM0U1rEKX53gt2EAj2hRkrKq3/EkjSmVv9FCvQyAAzyke3
	PCRFzcMv1Flpif89+NSTnQ5DwBSVYb77adje2J6mqo8LnxCOfgXIz4A/2ysDync48Gdvya
	5nVGSzVSxbIiNPuT1gx5FewLdarhlOdO7ZVVu194yfhn16sTWOLqS7v+znb4YmOVk20Qo3
	hxlFuHrNBCMltDEIxAqzX7csBrg1Vtmc47sTI/9ilka0YiA7q0eR2IxLpa7hon6javzjDN
	fH7EUOMty6/ld3Ufr04qbE7nyt7JOVRYxVpy3blot//796n9ApSvYgSSHhA5ug==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E7B81C0004;
	Tue,  6 Jun 2023 17:53:09 +0000 (UTC)
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
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 11/17] dt-bindings: mtd: denali: Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 19:52:40 +0200
Message-Id: <20230606175246.190465-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105312_276570_B2767421 
X-CRM114-Status: UNSURE (   9.31  )
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

Ensure all raw NAND chip properties are valid by referencing the
relevant schema and set unevaluatedProperties to false in the NAND chip
section to avoid spurious additions of random properties.

Doing this in one location also saves us from dupplicating the
description of the NAND chip object.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/denali,nand.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali,nand.yaml b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
index 0be83ad42970..81f95538d415 100644
--- a/Documentation/devicetree/bindings/mtd/denali,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
@@ -63,6 +63,12 @@ properties:
     minItems: 1
     maxItems: 2
 
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+    unevaluatedProperties: false
+
 allOf:
   - $ref: nand-controller.yaml
 
@@ -74,7 +80,6 @@ allOf:
     then:
       patternProperties:
         "^nand@[a-f0-9]$":
-          type: object
           properties:
             nand-ecc-strength:
               enum:
@@ -92,7 +97,6 @@ allOf:
     then:
       patternProperties:
         "^nand@[a-f0-9]$":
-          type: object
           properties:
             nand-ecc-strength:
               enum:
@@ -111,7 +115,6 @@ allOf:
     then:
       patternProperties:
         "^nand@[a-f0-9]$":
-          type: object
           properties:
             nand-ecc-strength:
               enum:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
