Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54608C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSCB+1jY+5jQz8oqIBtfo9QvjiafXu8EpOZGUPb2DLg=; b=2ksqgNV1KIzrxH
	mshJAQs0r+8qWZ+PtIrueUG+7LR69/eolXABjx3Y2B45Gsuq2CMcIqo7mIPpqz8lcPXqOP1pK1Z46
	9Jk8wRgfGJCoe4triHuBANvXqcu0geJqIYEaFibD8pk6iamYyZ5VawhsNx5iqQFIXJUbc2RE5olx0
	z9dFbZJZv9YA/adeRWvR2g+bepsC6ZfqZ7pLbWTTMnT3hfGEf/FVK8JVrIsLqmkF7+zbDJZnvznQi
	LHbmyGHutKn9vfM/lKYwEGTf8n/ZCCoCWN1Xv2tWBx77C4+OsUGqniEhpKuFkoV4VYI/63R8sqMXv
	t5YN5w7CBxZd7NCoxsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqeCd-00B9UH-Fi; Fri, 26 Nov 2021 16:35:59 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqeC4-00B9Ib-Tw
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 16:35:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 38CBBE0010;
 Fri, 26 Nov 2021 16:35:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 4/5] spi: dt-bindings: Describe stacked/parallel memories
 modes
Date: Fri, 26 Nov 2021 17:34:49 +0100
Message-Id: <20211126163450.394861-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211126163450.394861-1-miquel.raynal@bootlin.com>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_083525_124437_5663BC77 
X-CRM114-Status: GOOD (  11.19  )
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
 .../bindings/spi/spi-controller.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 556c5ddc39d2..1ceba6c7430d 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -162,6 +162,27 @@ patternProperties:
         description:
           Delay, in microseconds, after a write transfer.
 
+      stacked-memories:
+        type: boolean
+        description: Several SPI memories can be wired in stacked mode.
+          This basically means that either a device features several chip
+          selects, or that different devices must be seen as a single
+          bigger chip. This basically doubles (or more) the total address
+          space with only a single additional wire, while still needing
+          to repeat the commands when crossing a chip boundary. XIP is
+          usually not supported in this mode.
+
+      parallel-memories:
+        type: boolean
+        description: Several SPI memories can be wired in parallel mode.
+          The devices are physically on a different buses but will always
+          act synchronously as each data word is spread across the
+          different memories (eg. even bits are stored in one memory, odd
+          bits in the other). This basically doubles the address space and
+          the throughput while greatly complexifying the wiring because as
+          many busses as devices must be wired. XIP is usually not
+          supported in this mode.
+
     required:
       - compatible
       - reg
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
