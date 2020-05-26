Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B408DC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:58:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8204A207CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:58:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fJFSb/ou"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8204A207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oGextv5iG3OuzabgXfzVuEilVp1pkie/cCdLlwjmTA=; b=fJFSb/ouwBHVyy
	MIQNjlFnt1nZPASQKmr4DDHtQBDrU0En1ZcmgLmWOzHx7wNsXhiGviNCKGuFiTg813wudtr41lFEK
	Bao/cNt71tHJKtXTWb9vsqGyU2Yq3wIciTF1YpR6x6mxgg5CMp9U2JcDXUCi7upU0gmS3a5aI0/Ks
	2st90HWhYfzRgFq4gXNyktlo3CMJ1fdMsWuL1A5Yhs9WMQ2FFIpcZIvOS4dh4E+sxuPjyCei2oQkZ
	SGnePICec6lkotpTFcCxBZ4CJWdlEeJzphdLL65TG0kbxsy5Wevq2ReCWO6hX+km7fHAKIg8+fXG9
	63Ql9nTo1KliUF6rPQNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdfi7-00008M-6x; Tue, 26 May 2020 19:58:03 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdfgo-0007Qn-3r
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:56:43 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CAC25C0006;
 Tue, 26 May 2020 19:56:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [RESEND v5 04/21] dt-bindings: mtd: Deprecate OOB_FIRST mode
Date: Tue, 26 May 2020 21:56:16 +0200
Message-Id: <20200526195633.11543-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-1-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_125642_302653_38510422 
X-CRM114-Status: GOOD (  12.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This mode has never actually been used, it was introduced for a single
driver and even this driver did not use it in the DT but only in the
code. Now that this mode has been removed, let's trim the bindings
definition to avoid carrying useless properties.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/atmel-nand.txt       | 3 +--
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 3aa297c97ab6..ead1826d0d51 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -143,8 +143,7 @@ Required properties:
 Optional properties:
 - atmel,nand-has-dma : boolean to support dma transfer for nand read/write.
 - nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
-  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
-  "soft_bch".
+  Supported values are: "none", "soft", "hw", "hw_syndrome", "soft_bch".
 - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
   capable of BCH encoding and decoding, on devices where it is present.
 - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d261b7096c69..d529f8587ba6 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -49,7 +49,7 @@ patternProperties:
       nand-ecc-mode:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
-          - enum: [ none, soft, hw, hw_syndrome, hw_oob_first, on-die ]
+          - enum: [ none, soft, hw, hw_syndrome, on-die ]
         description:
           Desired ECC engine, either hardware (most of the time
           embedded in the NAND controller) or software correction
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
