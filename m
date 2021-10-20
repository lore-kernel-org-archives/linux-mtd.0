Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5667CC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 14:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F18F6136F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 14:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F18F6136F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5U9DvyB2srTZijnJn2JY3u65uR0w6n//CZhCtjVElI=; b=PQhqYMg39r3Edn
	b95LrNI3RSOuCiBCBZ6yD6Xz2GHysaXhqxtS7gdIr0cqvn2iCCVisLSs/SA6VytFcM6ozsHtsupZv
	XHKXnGRIfNnodqz/FBfnl20larcR/HvHpOg4S03haRF5qFeh1u7OjMZRY984y3em8S6gyV1xpzwMZ
	e9kg8k8WYpenoPDQtNuBN3hCK9lSRlFlrpmvu2VN4Ltefa1pMZDvgdqCcR0anY56B/7ONEg85gPXn
	nNZjJLrU+laqZnrXhsItZiO0ABR3fHVdrfXO/evjQFvxselyS3vWuJyy9pFNxWxoFJAknLe9rhime
	/FBEGDO0mpHK+AfWxIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdCbk-004lSD-88; Wed, 20 Oct 2021 14:30:20 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCZp-004kg5-NX
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 14:28:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 46A0920007;
 Wed, 20 Oct 2021 14:28:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 06/18] dt-bindings: spi: mxic: The interrupt property is not
 mandatory
Date: Wed, 20 Oct 2021 16:27:57 +0200
Message-Id: <20211020142809.349347-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020142809.349347-1-miquel.raynal@bootlin.com>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_072821_921048_A0F2EBFF 
X-CRM114-Status: GOOD (  11.45  )
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

The interrupt property is not mandatory at all, this property should not
be part of the required properties list, so move it into the optional
properties list.

Fixes: 326e5c8d4a87 ("dt-binding: spi: Document Macronix controller bindings")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/spi/spi-mxic.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-mxic.txt b/Documentation/devicetree/bindings/spi/spi-mxic.txt
index 529f2dab2648..7bcbb229b78b 100644
--- a/Documentation/devicetree/bindings/spi/spi-mxic.txt
+++ b/Documentation/devicetree/bindings/spi/spi-mxic.txt
@@ -8,11 +8,13 @@ Required properties:
 - reg: should contain 2 entries, one for the registers and one for the direct
        mapping area
 - reg-names: should contain "regs" and "dirmap"
-- interrupts: interrupt line connected to the SPI controller
 - clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
 - clocks: should contain 3 entries for the "ps_clk", "send_clk" and
 	  "send_dly_clk" clocks
 
+Optional properties:
+- interrupts: interrupt line connected to the SPI controller
+
 Example:
 
 	spi@43c30000 {
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
