Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CC2C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGuBCPAN+wKonGhZO9i5jjgSq33HV2S93uEaZMQVRuk=; b=0LbB1AvssuI+L3
	ScSIYO9Ytv4jTPsXISk+f7+1q8XvE/gmsFmTXZNBkFG1ENDckusEBuUeR7txaWfeV8oPpBuzbprU7
	mai//m2TRP05CCfAoZW4xE3dAKt0pYP9y+43Vq9m39xq0CETyW7dz9pwS3wTFE7FjP3k4jZPe9pRF
	mYGNWg2m7WBT93TIZj6rZcYubo2GKv2UQ1v8xTdCqHAkULdB56tfG8AhFE1Jx9+9JkSQSpzCJyn/O
	qsnxv2MvLrXMRfGh5MfsWF+4LEPmxmOkv0++m1TnFP85bTDo85jRHKsJNHqPHzATWgj7kjlqpy33S
	Mrbj8MxAqFwq1qAv3JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arj-002ef4-0r;
	Tue, 06 Jun 2023 17:53:07 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6are-002ec2-0y
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:05 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSPMoy4cm/1qPew5J6X7w3l170vo398bSDNMHlKkOcA=;
	b=RYZyzQ/3J966+sltkixRVtvXTc4z4o+nG3liJg2QKTxwAMmkEdWimK/Mdxwa4Tt3TlzKrJ
	ynp4jXqc9sNbkJNjIsPFB8aH+wMXw7RbVMyE0xV1wNDrUGeU4vEm/SWejtxLPag4+pVyuA
	F339Yi4kJFw78HDgJMH/vaVdAa13C7KPvO+hKUo6MYt2HwVhbdBIGK+/6lJsRsUJxTh19G
	mfj2sfMAh8KxBNlTjqj5mxD4fQi971MknyEsOhY/qxLVL4w/EE0dQXkdIkr/bOTv5bvtAV
	SUsno2csf87w+kan7O7vMXpr2n7lw2d+4EK1K7sfTpTCu0tvnsZdIbRDNzNwig==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E3C21C000C;
	Tue,  6 Jun 2023 17:52:59 +0000 (UTC)
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
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 04/17] dt-bindings: mtd: Describe nand-ecc-mode
Date: Tue,  6 Jun 2023 19:52:33 +0200
Message-Id: <20230606175246.190465-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105302_485663_D06DF66B 
X-CRM114-Status: UNSURE (   7.38  )
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
---
 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
index 0b220e99450d..1251d3063e45 100644
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
