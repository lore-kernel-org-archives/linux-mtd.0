Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DCAEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIJfd+zdLHYr1ey+5dl8j1QIXQCIvYHfGOK3+1iY1IU=; b=AWpem7GQKYHjlM
	ZW4a8Imo3laThGjL8xM5Dqr5Jx4NHP/R2LoFhFZn89W0OsWGGaC+DkGCHpfaE5TOZDlIVzDfvw5q1
	xJqP4LHqeG57690F/0OUVaWTFl6kvU3GkTyZHdjOQCDOpcSmiisy3rfv07zJDtsVDqW3aMqO9ZYIq
	EOn3qgERjOhBz97VAXGZCC7khvlKwTbBEWLK5uPOe/so3+B4miZPBrZTZubkIF667k92uiLeyRfp8
	FIgeBo0rYXat52vQT48Zb4A8ADsrbLWZHOhS3W1ZaKpPaMMJqU/Mag4NnO1j291xBxZe8njnPlSJQ
	/fHPIo5tHokL9UbjNLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCp-0080oG-2i;
	Mon, 19 Jun 2023 09:29:51 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCd-0080aB-1g
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:42 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RFmCslVFz2CsswADyIjnNQmF72pKXiw6o6n+ThVMj7A=;
	b=Xmn+KDShpLYN5LuORmG5+hp+80pxOYwTikAP/2in2yKo4E3FU5zBhN3q3/E2zy5EpAjL6C
	iZLXftq+/uIXEVOzkaUGuGR0331MbV+15dk1B3foaceUJzlJ0arHh7NIPwQ2ecAIk/1kg9
	bH6/HkhjUflEWkwRI9VuW+AYoYuw+BszHYFv5Qphu10j7uRTGToh03I46HWXWpn2brF1nP
	Enw2TqSW8FDSlW6s9lWDU//xVxbATo3eeGcxox495i7tk/PQKJzJb8zXoAHtxJOTOVDUig
	FOaJ7waX1O3s2gUkdCPWHcxsBlTCdm1dhGwPkdiTQiIhdXfLAWcEYWHt5dpMxw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id C566B1BF204;
	Mon, 19 Jun 2023 09:29:36 +0000 (UTC)
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
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 11/17] dt-bindings: mtd: denali: Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:29:10 +0200
Message-Id: <20230619092916.3028470-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022939_848875_59E6BF19 
X-CRM114-Status: UNSURE (   9.28  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
