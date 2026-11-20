Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57E60A261F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FKlO70W4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rh7fHRoP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IUfKFxzesJdeQNyxA+hdY3bfF85rtMTVHyn1XqPkAu4=; b=FKlO70W4GKA/+dbztDpgZNDILd
	q4psG26v+gPZ0IvpNnix3Kx6w7szIUqyCMK0629w8O7//X5Qs6Bsz+/E1G171HN+0je34fUn5LrB8
	n7WL6PlzoXfBZ0sPoNRcNiLYjSfTCqKrTTt5xCws/J493ZCY0+dLOiskVp38HJPeQBLyngxmHM7GV
	duODF+dGHvhKUgPxVU7BHv4RSsVbjp8esTJ+OfavWN2LmELRHlOq0neg2yQ92qSU0+AuHG+FVLWOi
	yBHN+OmdzwN5UiWVTBYdd5+3FigVQvzndgyQ71wyFTdvMMTAbPHnoNcYZzUzX1Zm41AZUB19mNVOp
	pFZh82Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCV-0000000Fe6V-35kv;
	Fri, 20 Nov 2026 17:15:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCD-0000000Fdxy-3hTi
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:14:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 76D301A1756;
	Fri, 20 Nov 2026 17:14:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C996601B9;
	Fri, 20 Nov 2026 17:14:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 096CB11BC0500;
	Fri, 20 Nov 2026 18:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194882; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rl3Mk75xyW0zQ2gOEmhmXG4buQVCfu+lnbsiV7xtAg0=;
	b=rh7fHRoP9buRd36qCLgr0gj1TnnftXj5o1ezIclaqqwfDYqp72MJtSgpNVSKf5gV6W10t8
	DsO6tUqkikCDZvziUasD9xlj2fmvdbqMJOKw+Z79LLZZ6bMq2Xaw/HYBPUuzLgAoFBvtF8
	S+j+HQ2sq4NIKwM1ZYUi2DnGU2j8wO0ZWAWc0vsQDeEDwBtBavzMoysnTJFprdEfDgROlY
	lXwjqI63aitBiZb00klmjSt9bIaJzluxoXOtpLQTu8tZWcTcej+I7gC/Zhzs75cXjZ98zo
	KYzArbX5UX7lNfM4rGgkM3yDZ2yBlIzGrXjGgwg16qCI1MVNZF+6K8RRo4yTMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:29 +0100
Subject: [PATCH v4 03/11] dt-bindings: spi: Document the spi-dqs-not-wired
 property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-3-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_091446_192331_9B879A4C 
X-CRM114-Status: GOOD (  13.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DQS line is a data strobe line that is typically driven by flash
memories (NOR and NAND) when the data flows from the peripheral to the
host controller when running at high frequencies in order for the data
bits to be sampled by the host at the right moment. The SPI bus already
features a clock but this clock is driven by the host, which means it is
not accounting for any chip internal delay.

Hardware engineers, if they do not expect the frequency to be configured
above the usual limits (dozens of MHz), may not route the DQS line
between the SPI controller and the peripheral.

Describe this possibility with a new optional property so that the DQS
output can be left disabled on designs where this would be
wasteful. Keeping DQS enabled while it is not routed mostly costs
spectral business and extra power consumption. Hence my proposal to keep
"wired" as a safe default.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/spi/spi-peripheral-props.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index d730442e5255..fed6bf5ce72b 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -138,6 +138,16 @@ properties:
       pattern. Used when the device cannot load the pattern dynamically during
       PHY tuning.
 
+  spi-dqs-not-wired:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The DQS (data strobe) line of the peripheral is not routed to the
+      controller. This is only meaningful for peripherals that have a DQS
+      pin, typically octal DDR SPI memories. Not routing this line is a
+      possible board design choice, for example to save a pin when the
+      memory is used at lower frequencies. If this property is absent,
+      the DQS line, if relevant, is assumed to be wired.
+
   stacked-memories:
     description: Several SPI memories can be wired in stacked mode.
       This basically means that either a device features several chip

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
