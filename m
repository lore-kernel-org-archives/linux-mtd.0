Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761DEEB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IE4YK/2A85x/FywVAnCuXkEAgzg+/3owoJcwRxYpPA=; b=tSCPSJqhMOU6j4
	e2wbdeB7QSW7nqheqF0o5W2sS1zUguLeDIvZ9s2+DvU2z2nX+gXP81eBjh4FEF8ARHU3zw5xxsYOU
	+kZk9QPuLvTFW8mK/uM+albJo7vErr78iY1HiExSGd1HIHxQRBjV2kJfeFEKBFfk0kgtGO7Ne28QF
	zznUdup1LYVCOt0ZY730C++Odi7M2hmvUptIn/JNqbjvofH2nNfTTbNkJ1m+kQxASr24nsGBRiCz0
	ia9ubpDBa5Id2dUrkJRZPTO4KTVYrzA4QhMKxRvvfu3Hj5Q7mhcfN6yTWC2wZ6yotltvvFJnMAJHG
	Crkn7k8t6MT4dABFdT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCk-0080iI-0Y;
	Mon, 19 Jun 2023 09:29:46 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCZ-0080Vi-0r
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:36 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysOz0mZvazI92RKhh4J+2eW3anNjKtOdPFA10AGw6cA=;
	b=bBF+XbkXK8wcfl0xDnT09GzHhyYuO9FsYkMCQEuRQM5uOrLutG7UTpHvW08rOLx66xW/8p
	HKU7sHanxB8/Gmr8UTc0XAsakKOzx22xD51x2rOH6k9cWGwfwmDugMH1p2ZTp4yDdK5opm
	5mIoKV48FhuB5k7n5QJtYb5Zk4gJvdrI1738RED4g+XlySI7pdOXPP7iPmBoOgt3FT66OD
	qqstmcNc2NfHjdBoHZARY2XY8uBudS5A2GwrwmAx16GYSyK1mjjLyeCEKxjZEp8GaIezSh
	LPw8N98HPSp2LmCEvmmJTI4ZXdnolMDSyX5ooB1gkynugPCmv6gVKugfSeU+3A==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 620621BF218;
	Mon, 19 Jun 2023 09:29:32 +0000 (UTC)
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
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 08/17] dt-bindings: mtd: sunxi: Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:29:07 +0200
Message-Id: <20230619092916.3028470-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022935_609194_06F95C68 
X-CRM114-Status: GOOD (  10.69  )
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

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9a88870cd865..054b6b8bf9b9 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -49,13 +49,12 @@ properties:
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
       reg:
         minimum: 0
         maximum: 7
 
-      nand-ecc-mode: true
-
       nand-ecc-algo:
         const: bch
 
@@ -75,7 +74,7 @@ patternProperties:
           minimum: 0
           maximum: 1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
