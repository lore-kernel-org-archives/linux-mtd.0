Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E6BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHCaNDIluX+SgUAV3Idmw4mrtSgP1cw+AF4VeijekDM=; b=ysSmBfybdir1Ad
	MMLheJ1tqqOmCVZyZf3jzvfdilEdlmK/VgSKca4j1N9CVTW9F7lEPxZykpXTIIOdbu3fBNKD1NPYR
	RMVBwKTLkLZpSAOZ2OCjgthQUEHW+lYkG/6+q5ohHUAXuHqVO/47LNytapYHos+NkHuH9CCf7sBQl
	RHbj8igKMKe/+eswaW5xrkgl9EIecRX7cuHFDIfSlscphUZd5alpWgbygCDrouuY4Xtn71n1zXkZN
	E6whBEKy4aJVL7VBPKeR3Jqg727XWsbs44VAMvdPBgtrLHMC1b+PD1VtuAu7uKl4VZaEm4AKcwJfp
	Td/0W6Yccd/IUrF+3i4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muAmu-003Eik-Av; Mon, 06 Dec 2021 10:00:00 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muAmQ-003EaC-5y
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 09:59:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B73FB24001E;
 Mon,  6 Dec 2021 09:59:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel memories
 modes
Date: Mon,  6 Dec 2021 10:59:20 +0100
Message-Id: <20211206095921.33302-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211206095921.33302-1-miquel.raynal@bootlin.com>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_015930_399448_655483DF 
X-CRM114-Status: GOOD (  10.70  )
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

Describe two new memories modes:
- A stacked mode when the bus is common but the address space extended
  with an additinals wires.
- A parallel mode with parallel busses accessing parallel flashes where
  the data is spread.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/spi/spi-peripheral-props.yaml    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 5dd209206e88..13aa6a2374c9 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -82,6 +82,27 @@ properties:
     description:
       Delay, in microseconds, after a write transfer.
 
+  stacked-memories:
+    type: boolean
+    description: Several SPI memories can be wired in stacked mode.
+      This basically means that either a device features several chip
+      selects, or that different devices must be seen as a single
+      bigger chip. This basically doubles (or more) the total address
+      space with only a single additional wire, while still needing
+      to repeat the commands when crossing a chip boundary. XIP is
+      usually not supported in this mode.
+
+  parallel-memories:
+    type: boolean
+    description: Several SPI memories can be wired in parallel mode.
+      The devices are physically on a different buses but will always
+      act synchronously as each data word is spread across the
+      different memories (eg. even bits are stored in one memory, odd
+      bits in the other). This basically doubles the address space and
+      the throughput while greatly complexifying the wiring because as
+      many busses as devices must be wired. XIP is usually not
+      supported in this mode.
+
 # The controller specific properties go here.
 allOf:
   - $ref: cdns,qspi-nor-peripheral-props.yaml#
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
