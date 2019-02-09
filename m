Return-Path: <SRS0=3nsT=QQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6ABC282C4
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 19:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B1A7217D8
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 19:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ecGZGxu6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ffFRBbhx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B1A7217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=W0clEnlwbhToPtIDgnlWxaC8BO8jGJ9YkQ1eYL6vfiw=; b=ecG
	ZGxu606b4SxgYfHL41lhoJApyZZgrYnmYf/gFt5UqMCOcSiV3nJGNEXsf4R6itjOkNM25AawbFWqn
	Sd+3AJxjqyqfsxRl3KfmMZf5eju6PDikxn2r8YN0uGNcLOy5J+n9V+kIDHeboW0nE/pSrdGoU2e1f
	FNdluN7ew5fse9MWyIfFxPXU0OEFpnkUxMX3tQGFxbdVs6o/vuGQh2zAzj7WCDn2LzSHWi6wlQAXS
	i9r2UxuA6FcLsPPTQoRKWSUNepW8KeG7qP9rmM80UJUarQUQ8vFiWjjQPTBp/E2pwC1RtplOOgO4w
	SKW2vFVitmVJullaRI2Jla+3jURs88w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsYDt-0002yh-Di; Sat, 09 Feb 2019 19:23:33 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsYDq-0002wr-6A
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2019 19:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549740201; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=S1Pa9hHYN53VO9TRcP0oLj8m47PH1PYHNlFXTlSRajQ=;
 b=ffFRBbhxBzQFr9Kkvi1IBwcz7gcoirxshh8RORPzjx0dJ5c0ZAD/ToRboD8w+H2G/3kh5f
 zdvdtrB/TYPEOhFvbIE8llhuHo7CvSNCWchcn27b7JwjXbK/o+rAtPzec5PGb3fnsfElM+
 7jXpXFVT0HMwmkEtmVpZsjbVXouvYzc=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible strings for
 JZ4740 and JZ4725B
Date: Sat,  9 Feb 2019 16:22:57 -0300
Message-Id: <20190209192305.4434-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190209_112330_453164_170FA414 
X-CRM114-Status: GOOD (  12.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add compatible strings to probe the jz4780-nand and jz4780-bch drivers
from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v2: - Change 'ingenic,jz4725b-nand' compatible string to
      'ingenic,jz4740-nand' to reflect driver change
    - Add 'ingenic,jz4740-bch' compatible string
    - Document 'ingenic,oob-layout' property

v3: - Removed 'ingenic,oob-layout' property
    - Update compatible strings to what the driver supports

v4: No change

 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
index 29ea5853ca91..a5b940f18bf6 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -6,7 +6,10 @@ memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
 be children of the NEMC node.
 
 Required NAND controller device properties:
-- compatible: Should be set to "ingenic,jz4780-nand".
+- compatible: Should be one of:
+  * ingenic,jz4740-nand
+  * ingenic,jz4725b-nand
+  * ingenic,jz4780-nand
 - reg: For each bank with a NAND chip attached, should specify a bank number,
   an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
 
@@ -72,7 +75,10 @@ NAND devices. The following is a description of the device properties for a
 BCH controller.
 
 Required BCH properties:
-- compatible: Should be set to "ingenic,jz4780-bch".
+- compatible: Should be one of:
+  * ingenic,jz4740-ecc
+  * ingenic,jz4725b-bch
+  * ingenic,jz4780-bch
 - reg: Should specify the BCH controller registers location and length.
 - clocks: Clock for the BCH controller.
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
