Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78795C43217
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVNag7clSXu49JtmNB+Q6aJx2YdIbASbM4wP/Jzn4as=; b=sL8NEXPjhOnjAv
	WbOYsPC1AVF+FNiKF790reRz2jZVItud8eYDjfN4skTnDdpSW2b/9C1bnxaXyHkqvK03pOFowhc+E
	P+vnQ58JfX76dYmd+r0GxR37ZTMS3KYClNPoQPwGoHXHkmY/E46qbbMRRwlq6txuoBUmFx/doXE8J
	we0ZC/83co+D1Ir3H3bIZG5bMf62UT7n19MnLAPVd8htidV0Or0c/RAGzLBbBoOFrd8uvrxBvpVwV
	zXKtQOpObj6nULZ55rLI/3zf8GqB4uFIQBwcRqofx9+p3HguSMvymhmp83pREqsZTgzT3eqi0ur7x
	3UH4Rp5H01lJUD6+c9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPa-00H3Qn-0a; Mon, 14 Nov 2022 09:05:50 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNY-00H1z8-W8
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B2FD0FF805;
	Mon, 14 Nov 2022 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMd5yQHc0mg7inpTTSKlKhmW8IystLlC3mwO9N5nbf0=;
	b=ZUOFFzlahY/6zR8pZGIcGDlVQIV1XA+HsAoAWglps0ariGqxA2mYrg+w6at9ptJfOTq7gZ
	fXMmPHOnKlr+DZVvtUjbOv/X5i9aSRVwkTpaGjl2Z1bUrCgY/q/5wY3IukIxKFz5H7MViQ
	CupDkGaueHDRxqSLJM7bTIO35KfeRmSqJNBI7SBnmM4dETRj9ZAhdOEDnGbIP+wNnvRNWd
	16qXoCZdH3PS9MU2jBBe175a7e/HfFvU6VlquHcrZor6HSLfs2cajaqSm3Y5pAFY4Ixxf3
	gmrVWp5KjjG/GW2q5VGS9SAdYxirwmErogfunhcOLHlTQC7qZqlZYNcDmyk7og==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 09/17] dt-bindings: mtd: spi-nor: Drop common properties
Date: Mon, 14 Nov 2022 10:03:07 +0100
Message-Id: <20221114090315.848208-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010345_206687_E61F3663 
X-CRM114-Status: UNSURE (   7.63  )
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

When redefining common properties does not bring any additional
information, just drop them from the SPI-NOR bindings because these
properties already are definied in mtd.yaml.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.yaml     | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 7149784a36ac..6cc491083650 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -70,20 +70,6 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
-  partitions:
-    type: object
-
-  '#address-cells': true
-  '#size-cells': true
-
-patternProperties:
-  # Note: use 'partitions' node for new users
-  '^partition@':
-    type: object
-
-  "^otp(-[0-9]+)?$":
-    type: object
-
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
