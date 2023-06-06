Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1323C7EE2C
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GM7uI6gKLkWrd1mb0k/cNqzBCvf9RJUKLH2pz8fieDk=; b=08XOz4sYyhAzQE
	/2DAJrZnd+su+G6OjQu2ks8w/1NNpIApBeD+AWl9/v0n8qUQDdQriw/G1OvE+fmuBCelFX+IPnYnk
	VcPE0YS503789jUaKZ/DsOYrwlY6P/7CWdK4MoQN9U07IeCgQgBN6B3mbm+aNUmpyJOTS/85565ie
	nSdKmTa/puk7QEYGqDTo31UaNVh7+1iWY20IOn8ugx9HCmhdHe8GbGzjSE0bo8jcHeJt2tvGFGnGh
	wqlCk/Oo7J8gfAV0nHU0tlaqfX1sEVDCuZu29RzFaO1DYtOBwERSxdM6cQVTRxGKzNlOrC7QU1YfN
	tYYHID+QogmUZXxlP/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arp-002eia-1r;
	Tue, 06 Jun 2023 17:53:13 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arl-002efb-0d
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:10 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C6EJzVOZe63W7NYiDkawHzrYNIvAcHq5gU/Vn9AKthU=;
	b=cJF72/zXPaZX6glBGXsAWASn7NYCkj5bKaM53eYwNCXUfv7rLed0afrpmUrtPhNpYL5rDU
	g2YsS2DO3cYVblHbi+6S6n4gETmv8OP+sOqzidJ30E4agoq/YNp/Orin1cypYjaI+ZJR6l
	LquZEV2Sx4QOE+vGzr7cmcbgiuEEzdzZHM3E43jj9OzetPkmTE3SJbRd4Jm3uQ3Wo4CGTI
	+OmntTJrrsR9RXRxyEFsPSBD/eHceKlVXxhBxIeOc6ZfA58vN/k/kfGQPZacXcRJt2FrPS
	nOuc1xHkm+/ATd+35Ls+DwVo3jKWGTE63U1VpgwA7Mt8jfmuefaHTF7IdnIHHA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id B796E1C0005;
	Tue,  6 Jun 2023 17:53:06 +0000 (UTC)
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
	Liang Yang <liang.yang@amlogic.com>
Subject: [PATCH v2 09/17] dt-bindings: mtd: meson: Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 19:52:38 +0200
Message-Id: <20230606175246.190465-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105309_385660_65536179 
X-CRM114-Status: UNSURE (   8.24  )
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

Cc: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 28fb9a7dd70f..00810b04dcde 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -40,6 +40,7 @@ properties:
 patternProperties:
   "^nand@[0-7]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
       reg:
         minimum: 0
@@ -58,6 +59,8 @@ patternProperties:
             meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
             meson-axg-nfc 8
 
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
