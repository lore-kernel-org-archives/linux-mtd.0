Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A2FEB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivXYnKUkcFAHSoU1o38Yd8w9r//gplI3KcAuD9PzWs4=; b=KZChfGakTykKvu
	jLEDIW5+SrXoYKjbogQsDu9p+RNiFuGCahIwWGoYjCF2B/P2m25GDdqeU5oS1dDHbMZkX5iNKCaef
	zwY9z1k/FS+rX80TgTnYyRcCg9+O6f3ck/5gpxiVJOfhPu70/icO5wtXsvhvrQXnWeYOceawjN3vr
	SW9DEb+ltmvaOU3g1eeTpGuQB5ciV0MV6tJ+K0oiFNVLGLzVBFwozimJxZd3DF75rJg+74SjXJMUo
	k9xD+9lFJ3uo2x7Y7fgZZcEXpipx0IZhasGUV08MuwaXWYn3QFxdk7Nu+PVceECvKul7sk7Erb4mg
	3xQ/lYmrXOw4qR3IAVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBC9K-008A3t-36;
	Mon, 19 Jun 2023 10:30:18 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCc-0080Yo-0H
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:39 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dYMRlHxnz+HdpGAOPFJZdMwnAHVGWfzgniQNg9LVI2I=;
	b=QsuhCl4htusw8K83XZCAptTtlUfgY39+umBWanzAoSqMxluEBQj0kJ8d2UpFrP9SWADWER
	cnMLkcUXK+WwZzvGQ8SOwEscufFlOcMT3QBfSG/JKxtzXLQuWx67LPkpcmDBPVuePsVos9
	wMvLtM84B6TX2oExaTbHVUdEdZyIYHUfJRJsNf2RHcaQIEHEDp0XBelIznK+PtsSGdX8hj
	qRhbKrxkGfc0CK9/GgfAwtl8cGcwoCfRFrKmkCs5OrTLuZqO2YoudfwWRvhEMxfKcfY2Hf
	axfjkzDr+/mre8zMDW4gj7Gw3/yisdtDKBckSRTQLnvFVPAmpqAqf5mDMOaWnQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 532141BF215;
	Mon, 19 Jun 2023 09:29:35 +0000 (UTC)
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
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 10/17] dt-bindings: mtd: brcmnand: Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:29:09 +0200
Message-Id: <20230619092916.3028470-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022938_305726_B488923C 
X-CRM114-Status: UNSURE (   8.54  )
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

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index 1571024aa119..f57e96374e67 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -114,6 +114,7 @@ properties:
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
       compatible:
         const: brcm,nandcs
@@ -136,6 +137,8 @@ patternProperties:
           layout.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+    unevaluatedProperties: false
+
 allOf:
   - $ref: nand-controller.yaml#
   - if:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
