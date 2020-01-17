Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D685C33C9E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 21:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A492082F
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 21:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lLoa/woq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A492082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgC0ZX8IaQrydiDL1zyu5WCSsNpdVmdIvCaUtvLveXA=; b=lLoa/woqqzEM+E
	fotpMKcdda6JLeF2+Xp6pZBk1vPkkTbDKsO8gq3aPSO8ysG2v4PekpL+9I0BILYuFbuIgJ2yKzD0b
	gStE0NZVlWm5mIGmKmBB4BAkFknY63OxGX2LGJuRGkdyfdh17n5Dm254oqBTnbmiZy1BPJPGpZGkq
	5lxTCYbg99Fg2/WS5vdIx30XXvUMKJHYj4vyYd9FuHPIFCt4wWWS3PNAuHXMdRZSWjcEqgjKs8o8q
	pG2JdMQLV+BOwH9QtyVspczzBr6c3DPyX7/yh7fcyfUeqMZYnUjZHVvoG8wVgttfPtut9lKVvHxIB
	y2QxcaQNsmobloOF1NZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isZRE-0005K5-Qq; Fri, 17 Jan 2020 21:45:56 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isZNr-0000sq-Vq
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 21:42:30 +0000
Received: from xps13.lan (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3928324000A;
 Fri, 17 Jan 2020 21:42:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 14/21] dt-bindings: mtd: Add the nand-ecc-placement property
Date: Fri, 17 Jan 2020 22:41:44 +0100
Message-Id: <20200117214151.20767-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117214151.20767-1-miquel.raynal@bootlin.com>
References: <20200117214151.20767-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_134228_198000_5D191EE8 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
Cc: Julien Su <juliensu@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mason Yang <masonccyang@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Placement is where the ECC bytes are expected.
No value means the controller can do whatever it desires (default is
to put ECC bytes at the end of the OOB area). Alternative placement is
"interleaved" (also sometimes referred as "syndrome") where data and
OOB are mixed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/nand-controller.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d529f8587ba6..35512f2c66fa 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -56,6 +56,16 @@ patternProperties:
           (Linux will handle the calculations). soft_bch is deprecated
           and should be replaced by soft and nand-ecc-algo.
 
+      nand-ecc-placement:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/string
+          - enum: [ free, interleaved ]
+        description:
+          Location for the ECC bytes. Free is the default and means the
+	  controller in charge is free to put them where it wants.
+	  Default state is to put ECC bytes at the end of the OOB area.
+	  Otherwise, ECC bytes may be interleaved with data.
+
       nand-ecc-algo:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
