Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3C4EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYsut7XlEugBBTM0wVFRu34kusUCiIogkEehf1pj8S4=; b=GOoYysODl4f4QN
	8S2oNY/GuStpHC8D2Rcxw9v/R4IJwgcTfqJUDwSVvUx3EFE8onptlM0PLWAO3FmSFKrbgWMIXYbAe
	HfU7viAd1n7HH3CMxAa+Bq00ZachCl7Ibz66L/5FcxvHdiZAwleW8Q7X8fJTSLY2bUnM6+4A6Ix0v
	jP7LSxoGZUAte0qTOMVDOD+PUJfpupIjzWNTZ+Dp2CTHkwBQyvSNHa6Tp5FpNiv1q9+1akFyvwM+g
	86tGXKJnwA/i8PCxlvKmPn8a3O7ykXBkIomklz3z8E+GEOv507y1rE8lFAopNMgbgJFD7ydDea2tb
	0f0QCnA1FDSSS8HGHMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBD3-00810d-33;
	Mon, 19 Jun 2023 09:30:05 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCh-0080f3-2C
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:55 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paHx31E8jcNJg0VSKOZjmKvwKnVepcca3eu++LDKBlM=;
	b=TEHQ2u7CjOWV9DaQ3M3i///G0L+ft2bYURxUry/dst6PBl1yCJswvt/lWPPI9GEc1iKnrc
	xGiQEgdBw2jePsPKgh8mAg9R3wkDun8ilFwxSEhOshMvj6eEXjqCknn9o1alnBxDO/jtdu
	zX1E8TRIOhY5Ggy5FgnJdNsICpURfr/nwXi2cJ1Zj6MJpzcrNvNZZiZPqiDg6nB0fdU1es
	8FJJj1Xpxdz2uKZc3Jo4TCzg/cGBDHNU3iCaxXQZnxnIMt2phHX5UcS55TiCDuGX8JYMfU
	UW46C+/Ilds48vj7KLz54UwjqyOJHPcEWDe6OhGweZf4mTSaPpTZNVCcIjRpnw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1E471BF205;
	Mon, 19 Jun 2023 09:29:39 +0000 (UTC)
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
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 13/17] dt-bindings: mtd: rockchip: Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:29:12 +0200
Message-Id: <20230619092916.3028470-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022943_900031_9470B2CA 
X-CRM114-Status: UNSURE (   9.15  )
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

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/rockchip,nand-controller.yaml      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
index 7eb1d0a38565..ee53715ffdca 100644
--- a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
@@ -57,6 +57,7 @@ properties:
 patternProperties:
   "^nand@[0-7]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
       reg:
         minimum: 0
@@ -116,6 +117,8 @@ patternProperties:
 
           Only used in combination with 'nand-is-boot-medium'.
 
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
