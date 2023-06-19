Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FF8EB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPWnGu9YrsdUB4er9lEDMSdRofPiiCNyt14i9Rc7JDg=; b=AZiJEoaAuHwD8H
	z1Qe3o+dDoJxdnLZxjFneUAPMuXuDmeZXqK+zqJZIGmO0hksFxGrXxlHAgQ7yQGPrgrYeMT6EQs3O
	l7fuE5XaUexthh8D6XWLLyDN2HoadaTLOFwaD+irJEw/cUw0ixQaO99E0BUJNz6zMDeyQs5lXinfX
	i79+uJLwZ8W9aVQUY6xdKbSVvL2Sy+UIfh9mStmH/fa6VDYQEQ3QOBtY2aBaA+j7G97++pekEvHEZ
	Ezbr619v09GV2qx3+0J2IjspwXiJ4T5DEbnsonwZ2ZydyqU4hwp8u9xaS2ErEcSMxvEdgNAo6EdKQ
	t8dPzU4MP/0Xw8GWxFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCf-0080dq-2W;
	Mon, 19 Jun 2023 09:29:41 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCX-0080U7-1w
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:34 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQ5Zj4T+YQmeGzYu7MbhJ3MeD+33xm3HfrseEs9tbYY=;
	b=PCOuQPoySwQ2Zl4YfeeVMMx/rf7a803XG5ovWw+MqKZ5FmPKVcV1j4+F/VRUA4w2oln2L2
	3WCxyf1J9rDZBC1prw0nXL5bjY9b+VYEiGCgqXzKIvtzEsNaZMV+Av96mNK2kIhw2e2Pbl
	yhA0WxHN7i+jubYt+EYvQ4VyZ9i7mhpaNSdrZ8XRF9bWjErrkX8HeV9q3ImJj7X7EHC6zW
	LNX08n71L4isY9htLlrB1tjSQ95KPvTIkyn2OHmzaoO6pVKwHWCrzwfXyfQsoX++Buv7MH
	yriJRHpadSso96OhLJ4Ngi1dbr8qjCXOA7hVHYOt+viqnCdDsNMXljH0V1S4Hg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 198941BF216;
	Mon, 19 Jun 2023 09:29:31 +0000 (UTC)
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
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 07/17] dt-bindings: mtd: ingenic: Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:29:06 +0200
Message-Id: <20230619092916.3028470-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022933_791349_1BEFF4FD 
X-CRM114-Status: UNSURE (   8.97  )
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

Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index a7bdb5d3675c..b9312ebefeb9 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -39,7 +39,9 @@ properties:
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
+
       rb-gpios:
         description: GPIO specifier for the busy pin.
         maxItems: 1
@@ -48,6 +50,8 @@ patternProperties:
         description: GPIO specifier for the write-protect pin.
         maxItems: 1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
