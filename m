Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE41C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 18:20:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2086D6113D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 18:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2086D6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aly3nsB1cQEI6R+BLBfjaY+st3432lzDGwacE6+KTz8=; b=TMP/gKg2/vJlYi
	lHlICQsFLNgZhsU/39+F8XQqR43wljMAT3BFNvrvHKC+eqTuki+YKo99S2on00RPJZGF6o4uvQhKm
	tmMovYdqdYaV3JrJu3Onxz+9RiyWjJNCzuI9EOyeSdXvd1w5eJUwb7de/kSHEd0SW/Fvfp5duBdrT
	ARnwWQ4gPwjicjMDOl+RmyrqlyRyEc6QPZVj+5yYc4mMGViMS7AkJZMQbaI8yr+HwEGBkYLb37LfR
	1ouLUFVvQQ3boaFjFuyY9u1T0EtXfEtYlPizOPUuNPjX+pSyJNdQA2+XzklYjDlqQCOOll6Vh/S6i
	6gSnWMM06UA7U8zox54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkVj4-002yW8-JO; Tue, 09 Nov 2021 18:20:06 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkViX-002yMy-7l
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 18:19:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A9IJStP123394;
 Tue, 9 Nov 2021 12:19:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1636481968;
 bh=bNgxSpWcyBtnq7XC0L3A6Ob6weYYVTcirUbh0b7kL2s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=aXRzuFpPka5DkvMwFrWfN2lhqsuPCucq9O5cNfbfOL4/vGV3GUZNehy8mafVz8IkM
 AVJ3ltpRUtweFMUimcQjnMo3ViWp1VEaSqxTrHQ1MdOjjEQmzhVckIAzBGRum+uqun
 chUKHzlp1LhKI5GKWNrDx+wj7PUouPSYW7WNDziA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A9IJSr5103683
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Nov 2021 12:19:28 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 9
 Nov 2021 12:19:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 9 Nov 2021 12:19:28 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A9IJC54017044;
 Tue, 9 Nov 2021 12:19:25 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>, Nishanth
 Menon <nm@ti.com>, Michael Walle <michael@walle.cc>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Tudor
 Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: [PATCH v3 3/3] dt-bindings: mtd: spi-nor: Add a reference to
 spi-peripheral-props.yaml
Date: Tue, 9 Nov 2021 23:49:11 +0530
Message-ID: <20211109181911.2251-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.33.1.835.ge9e5ba39a7
In-Reply-To: <20211109181911.2251-1-p.yadav@ti.com>
References: <20211109181911.2251-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_101933_379194_6EBD34A6 
X-CRM114-Status: GOOD (  12.73  )
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

The spi-peripheral-props.yaml schema contains peripheral-specific
properties for SPI controllers that should be present in the peripheral
node. Add a reference to that so its constraints are followed.

additionalProperties: false cannot be used since it marks the controller
properties as unknown. Use unevaluatedProperties: false instead. This
has the side effect of allowing extra properties that are not specified
in the schema. The alternative is to list all the controller properties
in this schema but that would mean every peripheral binding would have
to repeat the same set of properties for each controller.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

Changes in v3:
- s/slave/peripheral/g

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index ed590d7c6e37..39421f7233e4 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: "mtd.yaml#"
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
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
