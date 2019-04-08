Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3032C282CE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 07:43:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C530A20880
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 07:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AiL26f0m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C530A20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xkXjcpH2FL/AL3rnJd/QiXJvckTgxDmocdQJTllj/Jo=; b=AiL26f0mRusnKy
	7CcJTRDQr2kt2KhMV/bBorTQF9BLdUzZbXWDBWfE2ze78toYXK8itlEb6J0Ed3Tf8MgCJmxFPtPgZ
	1cg6vSYUjKycVmObt7SrCFoy4BxWtJ/l8p9JGUznki7ok9fEN/eDrm78ZxZEStlmdxY8blJU8JS5C
	RP7wSQxusMEb5Qrr1VsJcFc3DQxIidugJjUOkOI2afB4HF8HghEsEidQ1JDBA05QKCLDMeihwPb3F
	eeWFiI8tXO9fuWuAoAu+t5sypE8ue0i6hxkKqmfpn4iFBligFHHi99oc/bX7fmfjs2LCI5uXiEBd/
	RzNS0PiO5ZnrJHjaSZdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDOvh-0002eR-5v; Mon, 08 Apr 2019 07:42:57 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDOuh-0001JO-AD; Mon, 08 Apr 2019 07:42:22 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost.localdomain
 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B15A81C000A;
 Mon,  8 Apr 2019 07:41:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: mtd: sunxi: Add new compatible
Date: Mon,  8 Apr 2019 09:41:44 +0200
Message-Id: <20190408074147.26797-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_004156_141444_EC62F1E1 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
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

Changes in v2:
* Removed the statement introduced with the new compatible.

 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index dcd5a5d80dc0..3f8d81b8d63d 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -1,7 +1,9 @@
 Allwinner NAND Flash Controller (NFC)
 
 Required properties:
-- compatible : "allwinner,sun4i-a10-nand".
+- compatible : Must be one of:
+	       - "allwinner,sun4i-a10-nand"
+	       - "allwinner,sun8i-a33-nand-controller"
 - reg : shall contain registers location and length for data and reg.
 - interrupts : shall define the nand controller interrupt.
 - #address-cells: shall be set to 1. Encode the nand CS.
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
