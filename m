Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF59C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 19:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661142082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 19:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jvG3YVyh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="A79eYutd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661142082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iHQg57y9LUdd180YQflLSMRQCoO1uVHnQJZlbpo/mbw=; b=jvG3YVyh493OJIN3vs/aJWeRat
	NoFYVtNHKLP43UB7avAgpl3pUbrg7ok7jQmoYBQjdrfPaK7t3x96Ji2of3yweyPVqnLi+z07sTc5T
	C9CAWPWcYvij9D0WviDutME3MvUa1idlp2lqTm4sIx/6NZQ8MsNJkBc88CIF3xSR1b3qps6NAAvsM
	U+1PMTkijjBLgkW8xEyfIQnd3rlFMkQspFy5SEFoH0XSLiRX3+DlwOPRdlMYeSCcJx/5Vmhi3Oqyr
	16g3a+YmqOhuumX47d+uXJUOmYavCFyU37iculLDpWo/37Jjpq5CkRV62qSonS+Wuqn4Sf0j0TROe
	xpfasYQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqjY4-0004UY-HW; Mon, 04 Feb 2019 19:04:52 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqjY1-0004T5-0g
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 19:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549307085; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=gdcK3j1z1oHKj0LEVgQRxIiDJQ4SoJ4iOcf/kIZq1Ks=;
 b=A79eYutdddju4W9QjwgVobOULMflFSw5aJ8Ji2LCRItH9We9NnrbPZPkkOpPWs/rossWoo
 ilDU3fYIPYqOQoAx4iDmtnj2QJytG3yKup1M3kqipM0T6k3ytY67m8mGzwSV8z5HUvX8iD
 mHOAe/sNWihZXPLzsSUfruVhA3/3oQY=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v3 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC' in
 documentation
Date: Mon,  4 Feb 2019 16:04:19 -0300
Message-Id: <20190204190426.11618-2-paul@crapouillou.net>
In-Reply-To: <20190204190426.11618-1-paul@crapouillou.net>
References: <20190204190426.11618-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_110449_242327_0C1747B5 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: Mathieu Malaterre <malat@debian.org>, devicetree@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The JZ4740 ECC hardware is not BCH but Reed-Solomon, so it makes more
sense to use the more generic ECC term.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v3: New patch

 .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
index a5b940f18bf6..5a45cc54f46d 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -1,4 +1,4 @@
-* Ingenic JZ4780 NAND/BCH
+* Ingenic JZ4780 NAND/ECC
 
 This file documents the device tree bindings for NAND flash devices on the
 JZ4780. NAND devices are connected to the NEMC controller (described in
@@ -14,10 +14,10 @@ Required NAND controller device properties:
   an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
 
 Optional NAND controller device properties:
-- ingenic,bch-controller: To make use of the hardware BCH controller, this
-  property must contain a phandle for the BCH controller node. The required
+- ingenic,bch-controller: To make use of the hardware ECC controller, this
+  property must contain a phandle for the ECC controller node. The required
   properties for this node are described below. If this is not specified,
-  software BCH will be used instead.
+  software ECC will be used instead.
 
 Optional children nodes:
 - Individual NAND chips are children of the NAND controller node.
@@ -70,17 +70,17 @@ nemc: nemc@13410000 {
 	};
 };
 
-The BCH controller is a separate SoC component used for error correction on
+The ECC controller is a separate SoC component used for error correction on
 NAND devices. The following is a description of the device properties for a
-BCH controller.
+ECC controller.
 
-Required BCH properties:
+Required ECC properties:
 - compatible: Should be one of:
   * ingenic,jz4740-ecc
   * ingenic,jz4725b-bch
   * ingenic,jz4780-bch
-- reg: Should specify the BCH controller registers location and length.
-- clocks: Clock for the BCH controller.
+- reg: Should specify the ECC controller registers location and length.
+- clocks: Clock for the ECC controller.
 
 Example:
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
