Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479DF606A6B3
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OH8vAveH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wJWsrX7h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=muwUjffCAOVgEYxHtXbf+zgJFBHRrDlHQLaQarZMIPI=; b=OH8vAveHHwNIJ4va3JhzWAd3yG
	LX+1Ghip0t7RhOvZ7yGq2TOAHqjmGCrmtwEhqNNBHnyBAM6GL0SWfOg5IJB0ngbMNQRqJzvCHu9Qa
	fuCryzJ+uvojBoGGkGUB078MQksNBoEeNz4qftr3efmgpj1PcBxKZB6XDj9cmBjrDAXVNZ/TDA/gx
	1n/txlx49N5Rr939p5/Jiqro1qHzKcon2f5xN2ZLceckYBaCr+3irV+vGH7XEhmAP6WSKX8gWBOvp
	4JPZ16ND/MTsk5hPcf6p/ffFjaJrql/XN9v+DdjaVK2RDrccP3z2q5AUI76fwNANdYApS0RPXxHtM
	uWl4PPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrkI-00000006nMD-2Et1;
	Tue, 24 Nov 2026 14:43:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrk6-00000006nEv-2J2e
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 14:43:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7AB9C2C65E;
	Tue, 24 Nov 2026 14:43:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3921A601E1;
	Tue, 24 Nov 2026 14:43:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1302E11E6997D;
	Tue, 24 Nov 2026 15:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fw8x4cblT+9CNzcWzbTkTDNh6D8k6L4c3aTx+Ze1EpA=;
	b=wJWsrX7hLYoIhVeQNW+u2YTSGa3kC7oJ9EMLYyBF8MNUkUbycG+td0l48AKNGfZu57Ftan
	D8jSaZVr1L5oaun8qZCsaYrHK36lYznLnJ2lgM3kyE9kTZLlCtJp/TrqtwKkN78S25Z/zG
	uhLILi9rqi6GfYGSOOIAakgLZCQhtGP9oWbWzEoEMhrohH7jqPuHECoHFOatHl6IHZUWUT
	rg9c/jP4u29pH3WTZiIguEVyEO5/OmkrgOcZYza/V8eta46HLUsXKNjbzXt8r9dt17lkdM
	tlzjcg58YXRmp2G/mvAQaoyc+0+szRGC1AUf45+vRyu7DOaq1rQld+GjBvht8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 0/6] mtd/spi-mem: Enable DQS control
Date: Tue, 24 Nov 2026 15:43:01 +0100
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43RwW7DIAwG4FeJOI8KQwhJT3uPaQdCTIO0QguUt
 ar67iOttE3rIbsg/WB9ls2VJIwOE9k2VxKxuOSCr0G+NMTM2u+QuqlmwhnvGGeSfjo/Bj9Rr5c
 Dz5ke5gvNJ+/8jmo9ojUMeiY4qcQhonXnO//2XvPsUg7xcu9WYLn9J1yAMipRTWJQnWUWXscQ8
 ofzGxP2ZKEL/+F6plY4Xjkl5CCxH6YOxTMnfnHAVjhROT0oI3QH2Cn5zLXfHABf49rK9YYDglV
 g2z/D3h6LjXg81e/Kj+2SUSek9X3v8rYpatPSaHgtvn0B5bmCXeMBAAA=
X-Change-ID: 20260205-winbond-nand-next-phy-tuning-aabefc018032
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
X-CRM114-CacheID: sfid-20261124_064334_739371_008F9C01 
X-CRM114-Status: GOOD (  17.32  )
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

For his PHY tuning series on the Cadence QSPI controller embedded in TI
SoCs, Santhosh initially needed to access the availability of the DQS
(data strobe) signal. This is a chip dependent capability, which may
sometimes be enabled.

The SPI memory flag already exist but is too vague for it. Let the SPI
NAND core and SPI NOR core set this flag when relevant (per-chip for SPI
NAND, always for SPI NOR until we can do better). SPI controllers now
feature a DQS capability that they need to fill. Manufacturer drivers
and SPI controllers can now query the usability of the feature to use
it/enable it.

I contributed the spi-mem bit in the previous cycle but my changes were
too simple, and a more complex approach was actually needed.

As opposed to v4, this series applies directly on top of v7.4-rc2.

More changes will come on top, especially on the NOR and NAND sides,
plus more Cadence QSPI changes on top of Santhosh's series.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v5:
- Drop the dependency on Santhosh's series to make sure the spi-mem
  changes can get in independently. The only conflict there is the fact
  that both of us add a property to the the same binding.
- Kept only the SPI/spi-mem patches.
- Fix my understanding of the Winbond I/O configuration (not sent in this iteration)
- Also fix the location where SPI NAND sets the DQS flag (also not sent in this iteration)
- Link to v4: https://lore.kernel.org/r/20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com

Changes in v4:
- Added a spi-dqs-not-wired DT property to describe boards where the DQS
  line is not routed.
- Parsed the property in spi-mem.
- Renamed several helpers to explain what they do more obviously.
- Added a controller DQS capability;
- Expose that DQS is usable only when the memory supports it, the line
  is wired and the controller supports it as well.
- Advertised the DQS capability in the Cadence QSPI driver.
- Advertised the DQS capability before the SSDR/ODTR variants are
  negotiated.
- Only enabled the Winbond DQS output when spi_mem_dqs_is_usable() reports
  it as usable, to avoid useless power consumption.
- Enabled DQS in SPI NOR (always).
- Dropped the already merged spi-mem capability patch from the series.
- Rebased on v7.4-rc2.
- Link to v3: https://lore.kernel.org/r/20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com

Changes in v3:
- Rebased on top of linux-spi/for-7.3 and dopped all existing
  dependencies on the MTD bits.
- Link to v2: https://lore.kernel.org/r/20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com

Changes in v2:
- Dropped the RFC prefix.
- Rebased on top of v7.2-rc1.
- Dropped the spi patch for now, just allowing to use DQS on a few
  Winbond SPI NANDs (can be improved later).
- Link to v1: https://lore.kernel.org/r/20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com

---
Miquel Raynal (6):
      spi: spi-mem: Rename the DQS setter and pin field
      spi: spi-mem: Clarify the conditions upon which DQS is usable
      dt-bindings: spi: Document the spi-dqs-not-wired property
      spi: spi-mem: Take the DQS wiring into account
      spi: spi-mem: Take the controller DQS support into account
      spi: cadence-quadspi: Advertise DQS support

 .../bindings/spi/spi-peripheral-props.yaml         | 10 ++++++++
 drivers/spi/spi-cadence-quadspi.c                  |  2 ++
 drivers/spi/spi-mem.c                              | 29 ++++++++++++++--------
 include/linux/spi/spi-mem.h                        | 12 ++++++---
 4 files changed, 38 insertions(+), 15 deletions(-)
---
base-commit: fd9230005e85472b81c1c7c16afe93dd878996b1
change-id: 20260205-winbond-nand-next-phy-tuning-aabefc018032

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
