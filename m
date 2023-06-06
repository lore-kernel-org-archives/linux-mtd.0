Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA85C7EE2A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wUymWf/CmcsqzaSAd+2dlFY0McNZC09vCp2u7zYX3M=; b=hApGMUK9dOwujI
	MuRXtW+0EO4oZRYUvL7yf3XQpfr7feF5D9P6SKNSX4MY72oj7ffLusawQojH7OOMs2M48lt0ZuE0A
	lpA4gDVGw7mWn3GOHGim9l3Ksp41bBmLf4je6XW3GzMc0ATP11Z/sg+SfvHsXO5mtkaFMPLCxo11a
	BZPgL8xy0Y6PIjLPCJ5Px++ZFgDXftomszeqQwh/fjzjx7Bw8uje3aW2izsT3/QMbBBuJlmpeBTt4
	oXtbfyQawO38k416cnSte91iyIdcSGKYK4qZSuY6yLaucSjh5eKBh7glEx8dR+MpCn+bd3l6aavob
	k2VXzeM+Mlf3i8MWEHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arw-002eoZ-2K;
	Tue, 06 Jun 2023 17:53:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ars-002ejp-07
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:17 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kCRx+Rre3+0oAH8r+gOtAAseC7xhn8HQUFsP2nO4fZo=;
	b=evqVXIZvBKj+zH4O4NVAJsrpg+EYJ5Krh8nM9Jq5ysDevJTG10BNT7o1x3kzRELjW3bi8Q
	K06z1CRU2PSzQEdklBCS6IxHNrGbPVXl1Nibh70rHU6ja06esjvaZOBsm0jBKYo21IdcmF
	Ylc3ep3Tk0qi8aAsm9HDKeIpMF6rkVC6DniIPa38q4PNO7NveWvopzcROjzKNqeznMGGeB
	bQs5JAkWJFIOYKqYBXq/o/u0C5rVxsQpyYOn0ud/lyrCDGI398p2zkCvnzydP2mroPalFy
	6+THJw3whNkXgPNHf1WxYtXUDEG2rqov3FSQd2Ga3Br2dBkHo6BqLOfLLwlZfg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 564B31C0006;
	Tue,  6 Jun 2023 17:53:13 +0000 (UTC)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH v2 14/17] dt-bindings: mtd: stm32: Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 19:52:43 +0200
Message-Id: <20230606175246.190465-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105316_205689_206C6F65 
X-CRM114-Status: UNSURE (   8.96  )
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
---
 Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index 19cf1f18b61c..17011b64d83d 100644
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
   - $ref: "nand-controller.yaml#"
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
