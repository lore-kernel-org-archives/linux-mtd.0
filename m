Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570F1C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 12:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6D061037
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 12:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A6D061037
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvkH9tSUXSnj1i2OrK+sKoDWeTbrPzxJFaP6VTIM460=; b=qjmwteCReIQW/9
	FGf657piiJu6HIbr9jhV8HIJ3/KqgmkZyLvHd9v+sBmLMwsqXbLwj/0Douev6Et6SJVMT4EVYyj5r
	jMAffVhtDB41q8jROCyXC97X6KwnZfgztyDiEJE/kyuahlprN5tZRi7kCR+XkHDof3r14q/wT2nBH
	ecFcuAdLX/ZIssUCxPSXsvJ6HRYwLbAZ/aWfJcbmA8vrWqhJTlpP2d0H5Lo4ijK4gEsPQK67H3SgO
	sVVu2T1QMMD4pUmdPbVj+Gk31mm91n1CpER9y89tX+l8QLyuIdYDGm92/LkGUq/0i9lndwQ9U8FkD
	5zE9sip/FcXb073CUXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4nU-007oY6-LE; Thu, 28 Oct 2021 12:46:20 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4mr-007oKu-8r
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 12:45:42 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19SCjaML096846;
 Thu, 28 Oct 2021 07:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1635425136;
 bh=KYpi63S67jEFLXgUwSqYZm2jT92fcc60hhrJnZCLW8U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YsQ8cmpovfVomGE2A5PzuDhy+SSjMyGjQ8lfBkSOjRDG0D66V/B7UCew5fPSnjmTr
 ul299tnVdfShpRWhcG99CkzjkyD4JEmROcBBHHv43MbzxwXQR8XC7lF3rSUy49hpPv
 LeCqM7HVNShGapLEOyog6kMTXAt/LI7Y/sBA89EA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19SCjam3036663
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Oct 2021 07:45:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Oct 2021 07:45:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Oct 2021 07:45:36 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19SCjJbD115317;
 Thu, 28 Oct 2021 07:45:32 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>, Nishanth
 Menon <nm@ti.com>, Michael Walle <michael@walle.cc>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Tudor
 Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: mtd: spi-nor: Add a reference to
 spi-slave-props.yaml
Date: Thu, 28 Oct 2021 18:15:18 +0530
Message-ID: <20211028124518.17370-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.33.1.835.ge9e5ba39a7
In-Reply-To: <20211028124518.17370-1-p.yadav@ti.com>
References: <20211028124518.17370-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_054541_424555_F28A3159 
X-CRM114-Status: GOOD (  11.95  )
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

The spi-slave-props.yaml schema contains slave-specific properties
for SPI controllers that should be present in the slave node. Add a
reference to that so its constraints are followed.

additionalProperties: false cannot be used since it marks the controller
properties as unknown. Use unevaluatedProperties: false instead. This
has the side effect of allowing extra properties that are not specified
in the schema. The alternative is to list all the controller properties
in this schema but that would mean every slave binding would have to
repeat the same set of properties for each controller.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

(no changes since v1)

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index ed590d7c6e37..e69a8fbb91f1 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: "mtd.yaml#"
+  - $ref: /schemas/spi/spi-slave-props.yaml#
 
 properties:
   compatible:
@@ -88,7 +89,7 @@ patternProperties:
   "^otp(-[0-9]+)?$":
     type: object
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.33.1.835.ge9e5ba39a7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
