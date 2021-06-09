Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757B1C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 11:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426F561040
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 11:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426F561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yP+0q+zJJAoYrkkKLCkV3HgR1BB1pcGzkShvDzRPCMk=; b=I4jtO7pGakohuj
	RRka6R/U+jT6yvR4rMOrV+Ij9/SFItcNM+tAyeLuVvKqXAA4E9Vl8SArQOEMCE7B6byrioxBIVybn
	AOC5D8xfjZJh8QHX0dxV8gmOSo3+8C1SYNBYwGQaaXztl8njQFEO7Xre21B5ltAtCtV7tdT7xJNG5
	lwPT3TMWJTyICQAG5qrRibGX99kOCqg0cF5W6Swfo2ZD5VP8H/4sm4IA0uoUx5MCfZwR/nIrCYDhW
	baUbGbhgStoOWUqjlqmqPubGkWTMY9YHIzcLxS8XlCAsyH8pe9NIBa95YB06l37L1I2Ban7Tx3nId
	sZGH3liq1qBr8fFCCL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqwDV-00DGbi-GV; Wed, 09 Jun 2021 11:17:49 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwD6-00DGYv-9Q
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 11:17:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 159BHKOM070200;
 Wed, 9 Jun 2021 06:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623237440;
 bh=k+MYscYK157qqj9O9OVFOcOn5X9nPnm+nv8lFRPh3Fg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=eiO3GUxBoaX4CZoZ8CSZP8nEJ2jbE8OZ1eM759a0fUqHRGwiuA/ZeSdvkuGvtT3pZ
 uKP+CBaQ+lTNVVAgh4hUqKMolYuyKuaNM2BtYU70Ef7jdpV5uK/Lo054u+8RO25oqk
 jopC6PKnT25tx3sMdhpfGPSZ+BWqQDZLLebtAQIU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 159BHKcj085970
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Jun 2021 06:17:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 9 Jun
 2021 06:17:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 9 Jun 2021 06:17:19 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 159BH7uH073420;
 Wed, 9 Jun 2021 06:17:16 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Michael Walle <michael@walle.cc>, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 2/2] dt-bindings: mtd: spi-nor: Add a reference to
 spi-slave-props.yaml
Date: Wed, 9 Jun 2021 16:47:07 +0530
Message-ID: <20210609111707.9555-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210609111707.9555-1-p.yadav@ti.com>
References: <20210609111707.9555-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_041724_432818_F8991E62 
X-CRM114-Status: GOOD (  13.16  )
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
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
