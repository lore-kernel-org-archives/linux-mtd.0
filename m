Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DAAC7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnxENvWiVIEyQ5a8An3MjMmIPEASbm838ypfraza5xk=; b=alhrx0MjfGId1q
	E0lgmbdXyVr32NwTWXsZ71FE86yqdeXOjDCDjaKS/ONoCvUown/xp1MHsOn7v1zn1I2MwL4ugrE1H
	NckG9gmZ0YgdX5NY9IuSf6HhwpZR4MGdDSFh32WVZEzrESNGgsE0XMHU7V//ZR+KPOY9Kr8Gy9gH+
	WAbQENQlDX53Z3moyPff7DZwVaK86Y5fBVgW/+BoF8pKJNDJXXsv8KHQYAZZO3+dh0IGB3bTK61KR
	omNhXMdnzIEYwZ5jPk+fhbKKJpeIPIl6AJ3EZuLlXKIdRKHLzL1CfBJRsVWo2CzOCt3BFOS8FftD7
	BwCHJF3W3InPJWQ+zzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dL0-00DJ9L-09;
	Fri, 09 Jun 2023 14:43:38 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dKv-00DJ7O-2c
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 14:43:35 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686321809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XzF0THuG8cJYy8mcdNCIGXc+CKRZs8ZO+k9vaRCCVpU=;
	b=eDUZ3b9b2XhM8CXpmY4WgM2kifLxF1pJ/ARQxrNkZawyvpisOINcmoDk3tTl0sg/I08PZl
	QM20Y5FN8SW1as1TciXNPfeADRJfEP/H9VDOuFOIKwBXyH7msxzjwfqJzM1rkPf4yJH54E
	wXuJ1qzLL07Xv8K2LzNbucBupyrcw3oVAU7O1VKwKHg+YFqyElH3jfe/euGxCjVUyvnARQ
	bthKxDxbJvWH7u+IwdUoqbKXE2IekvJwGrihgTUM2t7hYtbZAFacKqGYGZ8mDNdaZc5jg6
	QmbpzI24BV57dUDSH+LEW+6Firhp7ovXFF/jtDccSf6/y1ZIzqSIKgEBzdojgw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F8A2FF80E;
	Fri,  9 Jun 2023 14:43:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: mtd: spi-nor: Document sst26vf0xxb flash series
Date: Fri,  9 Jun 2023 16:43:23 +0200
Message-Id: <20230609144324.850617-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609144324.850617-1-miquel.raynal@bootlin.com>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_074334_005213_D38D12CB 
X-CRM114-Status: UNSURE (   9.41  )
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

Add compatibles for the sst26vf0{40,80,16,32,64}b flash devices.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 7149784a36ac..5a788a429b0d 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -25,7 +25,7 @@ properties:
               (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|\
               (mxicy|macronix),mx25u(4033|4035)|\
               (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
-              (sst|microchip),sst25vf(016b|032b|040b)|\
+              (sst|microchip),sst(25|26)vf(008|016|032|040|064)b|\
               (sst,)?sst26wf016b|\
               (sst,)?sst25wf(040b|080)|\
               winbond,w25x(80|32)|\
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
