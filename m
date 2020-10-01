Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8C7C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:21:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 846B320848
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mKPhpqg9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 846B320848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YE/nYuWV6p/eenZgH43aYnBRGqIVGCWVd3+mcsGR1ao=; b=mKPhpqg9oMybpgiBS1WSKW+Og
	3+bARl+gmjlfqUP6BA5TxGnmJ0P6ZgxjUDOy0hy1lnJ/goLiuZmfncYjBmFQCx9YqqexxfaeufeYG
	iV5JT3B9YB9tK/jldihkAp/FT6MFn+NoCyppWPlVdp2l4vHTspCCMRodZH6uu2ot9ensQVwKWc43y
	1bmfuJ0ioHycqwB8sR6Rk7toJcFHITvMnSS+/1VpLD4yB7lisWUcqARWtq2VfnnNnm1XiNAmenvtc
	8oh8+3FRE1qvMZcuHTSQW2t4xt5thdyamLTKq//MJdFXbI1kHHPQ6wCgPaSNq9zNSuvnPe5cv1SQw
	A+2tgMOeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNvhN-0002gl-9E; Thu, 01 Oct 2020 10:20:29 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNvhF-0002e7-Je
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 10:20:26 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 30F8724001A;
 Thu,  1 Oct 2020 10:20:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/6] dt-bindings: mtd: Deprecate nand-ecc-mode
Date: Thu,  1 Oct 2020 12:20:10 +0200
Message-Id: <20201001102014.20100-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001102014.20100-1-miquel.raynal@bootlin.com>
References: <20201001102014.20100-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_062021_740741_023A99F5 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This property does not describe very well its purpose: it describes
the ECC engine type. Deprecate it in favor of nand-ecc-engine which
points to either the NAND part itself in case of on-die ECC, or to the
parent node in case of an integrated ECC engine in the NAND controller
(previously referred as "hardware") or to another node in case of an
external controller. Other "modes" (none/software) are achieved with
the new nand-use-soft-ecc-engine and nand-no-ecc-engine properties.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/nand-controller.yaml      | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index e79bb6d2c108..6f32c540fcc0 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -46,15 +46,6 @@ patternProperties:
         description:
           Contains the native Ready/Busy IDs.
 
-      nand-ecc-mode:
-        description:
-          Desired ECC engine, either hardware (most of the time
-          embedded in the NAND controller) or software correction
-          (Linux will handle the calculations). soft_bch is deprecated
-          and should be replaced by soft and nand-ecc-algo.
-        $ref: /schemas/types.yaml#/definitions/string
-        enum: [none, soft, hw, hw_syndrome, hw_oob_first, on-die]
-
       nand-ecc-engine:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/phandle
@@ -169,7 +160,7 @@ examples:
 
       nand@0 {
         reg = <0>;
-        nand-ecc-mode = "soft";
+        nand-use-soft-ecc-engine;
         nand-ecc-algo = "bch";
 
         /* controller specific properties */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
