Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913ADEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLA4l2h/rwF87Q0U+qQvIF+iZealatAr/MOMZbIf098=; b=ZtoYbtCBBYomX9
	qgC0rhOcb3lVCFwCT+CCyZ23oD+iSrJv5ZH99e/MG11YMThHXIsUd9pIWrciMbgaj1xN+7mI7F2fH
	6w12k2XXPxPZSd1R3uHAfAfj3HY/TPleIYka6TojhXEjeDWQZTrnpPdBS4rGNRnRjyxJDPhM6QS6A
	KPHnumMFme7l5yxXYkY3tOdkYh1pi+vJ0MTJ/nCPZhKM7kDnHjL4L5Y2eavAIT6ngfZP5ve5G366p
	Mw6FqzOhUxZtvvAPvKS1S6gmF9pkPmBCL7omr21PTqkcei9B7VFJaR29LqwOodMkpr7DOPu+m0TD0
	JVBFweI68Q3J/IGMgv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCX-0080Ub-06;
	Mon, 19 Jun 2023 09:29:33 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCT-0080QP-0T
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:30 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yN5s37mcAvDysIIW+UFRybg3HA/s8awhFr1IrZ93t8Y=;
	b=KGfLYX6xOzTXPteqN0j+uifhAsUXoYaxVVkJ3EYydI72A9Fvwrpm64fMEKaV6EypgC6+4V
	fJcZ+DaS18iEl9xPY9WXQXv4xzJ4cnRRo4kW9PWVM86ZCP51eYvO7WuIhH1IRVMUFxQvfB
	ql0MHrxSVh7N03WCvmGyVz+MWMmmv8JEiEKugpb0SRu97v/0y5rwxxZGGQIfSGpMIluPpH
	TnvC8E9eONwbwlgpu4BZlRwDTyDN1VtKd2MJ3LBfWWLen/E5ApbBLukIAdZ94Se4Er7OwO
	j/4O2CFZE+LOH5AAiSFCNQkg05w/G4PvNPUoGxKabny9z7sgrduLrIxPiUCKVA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BAC11BF208;
	Mon, 19 Jun 2023 09:29:26 +0000 (UTC)
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
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/17] dt-bindings: mtd: Describe nand-ecc-mode
Date: Mon, 19 Jun 2023 11:29:03 +0200
Message-Id: <20230619092916.3028470-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022929_318536_5E705E41 
X-CRM114-Status: UNSURE (   7.55  )
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

This property has been extensively used for almost two decades already,
a lot of device trees use it, this is not the preferred way to configure
the ECC engines but we cannot just ignore it. Describe the property,
list the exact strings which have once been supported and mark it
deprecated.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
index a0488bf60971..cd9ac60b048b 100644
--- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
@@ -41,6 +41,14 @@ properties:
     enum: [ oob, interleaved ]
     deprecated: true
 
+  nand-ecc-mode:
+    description:
+      Legacy ECC configuration mixing the ECC engine choice and
+      configuration.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [none, soft, soft_bch, hw, hw_syndrome, on-die]
+    deprecated: true
+
   nand-bus-width:
     description:
       Bus width to the NAND chip
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
