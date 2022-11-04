Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E591AC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVNag7clSXu49JtmNB+Q6aJx2YdIbASbM4wP/Jzn4as=; b=BWexPAMSiPgoZB
	M2K8zz4P+4otO9B8SZ6ul4CVQsgkFV5HFO1xmoZy71ROLbuIzFOj6cxKY14TQ+xwK/p55ChPMLSlG
	u4cf7a5PeyRp2sHfa6D/tcW1nOFt06QztVrkK23Xws3v2twszztvBErA/gPJZ3RPQ8F74kZ2R93cq
	eUcnSjiYLZ+f9jdzhpxND/BeublgrTAJFRWpeOv71oJINIU2qGZI8PO1+ZhwIBIGECTVMxxZ2WEMT
	FpiY/kaDeZdFkuzJ9RGyOJ4RJHPj63+CCTQchgkkVK40ah4lMaCaClpbiRuBwWvICu61eivmkL4rk
	xvQkmhkwBLsZwehIZxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzs2-004WiT-0o; Fri, 04 Nov 2022 16:48:42 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqu-004Vut-C9
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0233A4000F;
	Fri,  4 Nov 2022 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMd5yQHc0mg7inpTTSKlKhmW8IystLlC3mwO9N5nbf0=;
	b=FNDTfcPTtyJh2vWCDfbV0YsXKparDkVC09tH0f2e9VUX64GkFKoIlb3KcmAr8i4tiUKQzx
	FfoNQBiPQ0K/qhH6TtXB/c0eF6iHAPB7SljAQwnhn9hbp1xfJmMuZOEKt2ZKmyz/viud38
	TPi+mZ3Psr82zqW/raLhsFY7LudPor9khshmZNfI3f8+0t8TYUs50iaYSFmx9r566JZB+E
	guHkTIi3qTaeFtNUGY42O6OPLE+1gcVVfqhnLqrgK4UObxHYqIW5w/ffb0Fp1Jy5emVlwT
	K3MgEdI+Ma43O4+O/k9m3iKdJKK6T2CDfL82yLnAcNcXTNHjkQaWWEDubWBHpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 09/17] dt-bindings: mtd: spi-nor: Drop common properties
Date: Fri,  4 Nov 2022 17:47:10 +0100
Message-Id: <20221104164718.1290859-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094732_879380_978D754A 
X-CRM114-Status: UNSURE (   7.94  )
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
