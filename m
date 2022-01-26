Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6399C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBdPMCEkxPL1tgrg/vfZZIOjDmkvZbMHyI6cGMWu/oM=; b=3ysrVTOxQT1Qle
	AKM4hcKUi5rUwoAFTKCvaeBoHoQcL4yONVIAV8MRAeEzVv2RT6FcDhuik9w7OtgyncLg19fhIEEXL
	5a1Tnb5rGH1MPcDamw26UqYGupmj+38OPWK/EDG47y0itKGRGuWnGiBMU8ewWVecVwLbWu+/HteO9
	GjPTU4OaVrX3MI3pOkXSZpWvHrR82VGonJdyvo/8w5kVMnvFPG7hEIHIEvK8o/qvAyi2iZKaOK6Cx
	/sqScTg8TedFRPr2efiZSTF8cHoahxIR9sJOSZGSB9Ta+S35hvqJq6Jq1pFcNUbXAF6MSBEA8VfE3
	mc3UWOFkppwvWrTs/i3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgX0-00BUga-B9; Wed, 26 Jan 2022 11:32:06 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgRL-00BTKm-Dt
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 11:26:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8A6E46000E;
 Wed, 26 Jan 2022 11:26:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 2/3] spi: dt-bindings: Describe stacked/parallel memories
 modes
Date: Wed, 26 Jan 2022 12:26:06 +0100
Message-Id: <20220126112608.955728-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220126112608.955728-1-miquel.raynal@bootlin.com>
References: <20220126112608.955728-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_032615_651309_EA3F56F6 
X-CRM114-Status: GOOD (  11.78  )
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
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
 .../bindings/spi/spi-peripheral-props.yaml    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 5dd209206e88..fedb7ae98ff6 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -82,6 +82,31 @@ properties:
     description:
       Delay, in microseconds, after a write transfer.
 
+  stacked-memories:
+    description: Several SPI memories can be wired in stacked mode.
+      This basically means that either a device features several chip
+      selects, or that different devices must be seen as a single
+      bigger chip. This basically doubles (or more) the total address
+      space with only a single additional wire, while still needing
+      to repeat the commands when crossing a chip boundary. The size of
+      each chip should be provided as members of the array.
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    minItems: 2
+    maxItems: 4
+
+  parallel-memories:
+    description: Several SPI memories can be wired in parallel mode.
+      The devices are physically on a different buses but will always
+      act synchronously as each data word is spread across the
+      different memories (eg. even bits are stored in one memory, odd
+      bits in the other). This basically doubles the address space and
+      the throughput while greatly complexifying the wiring because as
+      many busses as devices must be wired. The size of each chip should
+      be provided as members of the array.
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    minItems: 2
+    maxItems: 4
+
 # The controller specific properties go here.
 allOf:
   - $ref: cdns,qspi-nor-peripheral-props.yaml#
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
