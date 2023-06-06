Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356BAC7EE2A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8cy7MtQdVfP2Bsss6/m6Yg1IO3aFkI09HVV2aZrZSio=; b=ggYuy2dfn3RU76
	xrR1EDhCnytGNXPgIHo9pB1fO4ieBxMsweNZuyyt4/DIcbs+bBwvSyylPgFRgojF6yfa4+p16E1uO
	hITDHslK1U73ZsLXoS8YOCLCOBs0j04b6eOXptWKMwkquzPip+1qBo65mciFx/EOKZFIVSW9vXSqu
	GrTJlA/zmcjDVG+YS5YIvYuYanC0BiEEtM2eTJwYpoaniOB4gk3+J7yQnPQOC9EH7fq7OeNOO3PAo
	NCIJQpXlzm3V2rSbvgPbdYxn/vZI1gvYd2a02nRVhAyJwzAZLZOTg+OwNooY1oQNnd8T+/PErGtRS
	vycRCeJWdgRCm0o4ohSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6aru-002emK-0s;
	Tue, 06 Jun 2023 17:53:18 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arp-002ehj-1R
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:14 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPbRugn9fj8Udg/Vifqwq3d+vu56COo6tC0cBSkE5+8=;
	b=Mgn7QeL62P0GZwbzLbrNVkQlWQfa7UPfEmStpIj6qqwpGCka2thE1s5xIadzvDhxkPb95I
	K508TnHleAbDTDZV9FAQBE0hBr3tsiTdqxtJoqM5cHjNMfdlyO23H4ON+mU1QLz1vDwh4S
	m1kHQaHeEPqOggre5WgNjLisJPwlvghL1oaX9z2bshm9KbYqQH0R3IBEsA7QlKR4aAbePu
	1jX4+IKfX3qmalkwMOF91A6xcDt9SGLHXS6AyYb27MiIFwcYu7p2oUz+7jHAHyhJqK+xZy
	0tJk0d2fYj+p5NR/290rCcN1cV32pbLtT8LQt721+ne4xRJQpkI4S7ZiY6tS5Q==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7AA51C0009;
	Tue,  6 Jun 2023 17:53:10 +0000 (UTC)
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
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v2 12/17] dt-bindings: mtd: intel: Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 19:52:41 +0200
Message-Id: <20230606175246.190465-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105313_635670_2E57BEFF 
X-CRM114-Status: UNSURE (   9.20  )
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

nand-ecc-mode is a generic property which may apply to any raw NAND
chip, it does not need to be listed in each controller
description. Instead, let's reference the raw NAND chip description file
which contains the property. The description contained
"additionalProperties: false" which is wrong as other properties such as
partitions might very well be added in the final .dts, and anyway needs
to be converted into "unexpectedProperties: false" to fit the property
change new requirements.

Cc: Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
index 8c62c7d3d0cd..7fa6c659d0d4 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
@@ -42,17 +42,16 @@ properties:
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
       reg:
         minimum: 0
         maximum: 1
 
-      nand-ecc-mode: true
-
       nand-ecc-algo:
         const: hw
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
