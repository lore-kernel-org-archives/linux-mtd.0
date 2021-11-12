Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29902C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:27:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC40D60EC0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC40D60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmh9m61o8ONa8B1E5H3AF7odKFA1cbuQwd8JE9fHER0=; b=TNQxG04ckyBBGB
	SVPTF2TEnPizwtHOdW4qMiWLlEB2p10e9PM6RqR3lBAL/YqjfhsG1gr+JQ/qZigpI3b1hFWjzpKi5
	V4RES81HwP8VgSDqhzT3WdScUBVZDHZLhzlSjFZNFur+FQFkaHWqVRqAsywApr7dq3ycnnEX1me4T
	Vi8mt98lDjxVPKbPqbRSTmJtyDhImYWX13B5OzmlN2n9DbQgUUZe2OtaTwTdx08PI4CQaWgyShir9
	WVzDx3jpAu2qVWYuDI5NbfGhKN1KnFDyBWOVXdu+g+xh59TgI2gMKXLH/KfRme+me+eOIWdp7IoVY
	9G+4CuTcoKHyFJt9iypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlYS8-00B4Xj-2A; Fri, 12 Nov 2021 15:26:56 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlYPb-00B3vF-Ji
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 15:24:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7410024000B;
 Fri, 12 Nov 2021 15:24:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 2/3] dt-binding: mtd: spi-nor: Allow two CS per device
Date: Fri, 12 Nov 2021 16:24:10 +0100
Message-Id: <20211112152411.818321-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211112152411.818321-1-miquel.raynal@bootlin.com>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_072419_875161_2367C5B6 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

This will be needed in order to be able to describe Xilinx QSPI
controller stacked and parallel modes.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index ed590d7c6e37..dc99629e40db 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -46,7 +46,7 @@ properties:
       identified by the JEDEC READ ID opcode (0x9F).
 
   reg:
-    maxItems: 1
+    maxItems: 2
 
   spi-max-frequency: true
   spi-rx-bus-width: true
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
