Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8A7C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 23:25:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D31920825
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 23:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fybk/YHs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D31920825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHfLnrBTStdgVZa27n1tefzav26ufH4p32coq308oZs=; b=Fybk/YHsw+IQZN
	ptgKnifCxSC+4//jGOFJd+onOGb007cU2R5glhOjKOE+VyVkm0nHIITPE1N37fO+ffvHCbdao0oLn
	fR4SPTyJuRZ22boyGVwKAJN7IqdTSGl4w6eLNOISWIQzav0MX9zr4w9KueEt07yMkJIueLQVl1/HF
	JEKNbA5h427t3PktGtfgjyXiE4ZPyNtLaF/vR6Ys+tI73Wk+S91hi+ZoAV5Hue5JbuP0T8MM9syR3
	Lz2SMD/q68jvqS5hPsXT9jkh3H2E4XVzBEymYywUzQmlzI3Fe6zwfvhN73TDM2ojcTg6zr/iIivfV
	kLMn2NwXzeGgOhVSl1ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbBbt-0005xB-Fa; Tue, 19 May 2020 23:25:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbBba-0003OG-JZ
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 23:25:04 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C5ABC2A26C9;
 Wed, 20 May 2020 00:25:00 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/4] dt-bindings: mtd: nand: Document the generic rb-gpios
 property
Date: Wed, 20 May 2020 01:24:52 +0200
Message-Id: <20200519232454.374081-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200519232454.374081-1-boris.brezillon@collabora.com>
References: <20200519232454.374081-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_162502_805237_1C490E1C 
X-CRM114-Status: GOOD (  11.01  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A few drivers use this property to describe GPIO pins used to sample
the NAND Ready/Busy state. Let's make it part of the generic binding
doc.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v2:
* New patch
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d261b7096c69..17f4dc8f8cab 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -119,6 +119,13 @@ patternProperties:
         description:
           Contains the native Ready/Busy IDs.
 
+      rb-gpios:
+        description:
+          Contains one or more GPIO descriptor (the numper of descriptor
+          depends on the number of R/B pins exposed by the flash) for the
+          Ready/Busy pins. Active state refers to the NAND ready state and
+          should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
+
     required:
       - reg
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
