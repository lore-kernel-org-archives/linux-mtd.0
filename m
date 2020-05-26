Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B391C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 20:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C4A207CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 20:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B9B3B9oj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31C4A207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEbAz7+9Zn3eGkqbWuFuFRRpRSDgqlmguJTQcich1zM=; b=B9B3B9ojZjz6PM
	vd2fBQ38ob2n/sqofly/6Ry1z4EJmpfXvOXpV+w7VeZKhoiQgkEBZ3fRcjSUiDO6bfZKj6NyUEVBs
	Sa0MDOoBfNA1B/2PlyK43NnueJ4FiSWXgLvspB0AoxKRF72QwusW6BOrlqyTHJjitLOaFLMhIOKSX
	cMI6vU4qJfnO4nEciG8WIqDPq1mGuVUjZ4lZu5ikuwYJYEdqaco5WTooPvIs8Cc7Q5xm3x3hOxKU1
	ZbPr1uK7ZSPzC9BgT2fMKGhorvn65jFKYJHh8LyboHCalMbVCW1ay/R9ou6qZeIZH29J5/8xebv6l
	6vU/ORkQPnXYc3BNYmzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdflF-0005Is-6Q; Tue, 26 May 2020 20:01:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdfh2-0007eq-9T
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:56:58 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C6144C000C;
 Tue, 26 May 2020 19:56:53 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [RESEND v5 16/21] dt-bindings: mtd: Deprecate the nand-ecc-mode
 property
Date: Tue, 26 May 2020 21:56:28 +0200
Message-Id: <20200526195633.11543-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-1-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_125656_510620_E624C3B5 
X-CRM114-Status: GOOD (  11.65  )
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

This property does not describe very well its purpose: it describes
the ECC engine type, also called provider. Deprecate it in favor of
nand-ecc-provider. In the mean time, update a bit the description of
the property to make it more accurate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/nand-controller.yaml  | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index a35ff8227427..256080ba50bd 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -46,16 +46,17 @@ patternProperties:
         description:
           Contains the native Ready/Busy IDs.
 
-      nand-ecc-mode:
+      nand-ecc-provider:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
           - enum: [ none, soft, hw, on-die ]
         description:
-          Desired ECC engine, either hardware (most of the time
-          embedded in the NAND controller) or software correction
-          (Linux will handle the calculations). soft_bch is deprecated
-          and should be replaced by soft and nand-ecc-algo.
-	  hw_syndrome is deprecated and should be
+          Desired ECC engine provider, either hardware (most of the time
+          embedded in the NAND controller, but can also be external) or
+          software correction (the OS will handle the calculations).
+          The nand-ecc-mode property is deprecated in favor of this one.
+          soft_bch is deprecated and should be replaced by soft and
+          nand-ecc-algo. hw_syndrome is deprecated and should be
           replaced by hw and nand-ecc-placement.
 
       nand-ecc-placement:
@@ -148,7 +149,7 @@ examples:
 
       nand@0 {
         reg = <0>;
-        nand-ecc-mode = "soft";
+        nand-ecc-provider = "soft";
         nand-ecc-algo = "bch";
 
         /* controller specific properties */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
