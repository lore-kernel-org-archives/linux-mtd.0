Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CC1C4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 16:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A23DD206BA
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 16:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQZeDLF8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A23DD206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BF3/SOr04ciiuycgwg9WCmsqDFMi51Je1UpLSzcd6rE=; b=XQZeDLF8DP43WK
	D3QsLgQ2D9Nm9ts6hDYuXPNK+45f9bW4BRWxNx1g6TTuUJuJXveQFAbjHHDGQpnaTW9mYSIwL6iNt
	bNWqCskfc6NuIfbxp7k+JnJTKep3k5JBJQjnO/OiUfyJ6t0wq41muBNFIEtwm8tcU2IqpIXujs7U9
	FiV2XqVs2brhu7PAAw1loy6HQLOF6CEl2p0r6KYvVeCZRTEjf4QEkwF0MO0EC8qIkIWtdlBpii3e5
	mT3dy2DopA1IHo36x9mYTWzvd4AcyCBenbCL6sU96MFUlU3mAIhtiYXep4uoj5wE4N/0nYgYWViev
	wz3Qgv8WvccgCajw7PEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC57o-0004oU-99; Thu, 04 Apr 2019 16:22:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC57J-00047T-0o; Thu, 04 Apr 2019 16:21:30 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost.localdomain
 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 60F331C0075;
 Thu,  4 Apr 2019 16:21:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/3] dt-bindings: mtd: sunxi: Add new compatible
Date: Thu,  4 Apr 2019 18:21:09 +0200
Message-Id: <20190404162111.22618-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190404162111.22618-1-miquel.raynal@bootlin.com>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_092129_276952_12A0C6C0 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The A33 NAND controller is slightly different than the A10+ ones,
eg. DMA handling is a bit different and a few register offsets
changed.

Introduce a new compatible to represent this version of the IP.

Also append '-controller' to the new compatible (which is required for
new compatibles) as this is describing a NAND controller and not a
NAND chip.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index dcd5a5d80dc0..6128d41d8c59 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -1,7 +1,12 @@
 Allwinner NAND Flash Controller (NFC)
 
 Required properties:
-- compatible : "allwinner,sun4i-a10-nand".
+- compatible : Must be one of:
+	       - "allwinner,sun4i-a10-nand"
+	       - "allwinner,sun8i-a33-nand-controller"
+	       The former may be used by all IPs, however sun8i family
+	       will need the second one in order to make use of the
+	       internal DMA capabilities.
 - reg : shall contain registers location and length for data and reg.
 - interrupts : shall define the nand controller interrupt.
 - #address-cells: shall be set to 1. Encode the nand CS.
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
