Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30825606A33A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wFrFuOrM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s+YXv5HL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=edksutVFVzpIpHvT1yBhfZRXpkEVcl804u3G8IgpeRA=; b=wFrFuOrMYB4tia6v+r6PvkAPR3
	RMbEXNFO3n7K7/SiAQETx957gM+PCxsrG/i+CDrFul+U9G7OtxHScbBNO9fPMsXdMRbuueqzyNZI8
	6hPIey01581sulRSJo2LsOtNYBlaEZglK/dTfkfHsXGPkMQ2+ImBfiv4+ytOWAoBpEhC49f7GZeHF
	bjx/00SFWtrn8gQpPPJflT7WWbGNCj2rwbRITYfqP66D9k+rc+JoyoPFfpeni03zRpa77jUQBdz9J
	qr8mhN90tjV0uTaHf/79cEFLIyAWizNmHoOYr/CT90rRo3Ie2GNpOunt90ox/+5GZSTNPUrcECrc5
	OK57G4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHA3-0000000AnYH-3cWN;
	Wed, 25 Nov 2026 17:52:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH9h-0000000AnFC-1yaj;
	Wed, 25 Nov 2026 17:51:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C801C2BB3E;
	Wed, 25 Nov 2026 17:51:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66A02604C0;
	Wed, 25 Nov 2026 17:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49AC111E6B0D1;
	Wed, 25 Nov 2026 18:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=aFwYFKGqCOCePbWnEjq67+DK4TXuYhQVEXTdJQLf+dg=;
	b=s+YXv5HLLLcg9wRN3RZSE2E3K2VPZcmJCuP5YCVc5K/JXDvxhiy9/Y7HvqWzuF2mS3mSGz
	EBsMFXxV27a0gsWZXX+PU70FO+Yb5eXNjkSTL7cQo5ixmjuN2w1SJ/fB2XYsyTTImI7RHU
	7wBk7Iq2cXZRU4H7R0JS1tmjkbC3w0RUxoUqnh78Xrgq8jmFsAIAzYF+4sGLGHcPbKBidL
	V/VLOoJP4sh7EttvnHH+Bw2WYDwmyFs9noXGMyR1Y3/16ze2ZfHIdnxYqvKlQz9KcMuMZe
	i5lIPPm7ETcuGEBHi4YtcSE36JnJ14LdoFDGQwQgs3NkxoK9LQ5e3eO97r8MOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
Date: Wed, 25 Nov 2026 18:51:14 +0100
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7RhaUAxbEw/g1rCodcBJbMEZM
 BjC3W3U5fs/eW8BJWFSqLMFhF6s3McEZpOBv7vYEfItMdjc7o2xOwzOSx95xmnQUcgFjh3qwBg
 ooH/7BymavLBVWeWHljwk0yDU8vytXOB8OkLzG4WeUyqO/+fqlND3IfBYZ69qW6L4App1/QC9x
 yy9pgAAAA==
X-Change-ID: 20261125-macronix-upstreaming-spi-mem-cycles-103274708fec
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095141_803352_D188BE91 
X-CRM114-Status: GOOD (  11.20  )
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

SPI NOR SFDP data gives dummy cycles. SPI NAND devices express the dummy
phase using cycles as well. Those numbers are converted to bytes, then
passed to the spi and spi-mem controller drivers. A non neglictible
amount of those controller drivers convert bytes into cycles before
programming the registers.

When the conversions are lossless, it is not a big deal, just time
spent. However these silent conversions sometimes hide bugs and
sometimes also prevent using certain chips/configurations, as recently
reported on Macronix 1-1-8 chips requiring 20 cycles. Not all
controllers can do that, but the ones that can, would anyway reject
those chips.

Convert spi-mem, all the trivial spi-mem controller drivers and then
SPI NOR to use dummy cycles instead of dummy bytes. SPI NAND may come
later.

This is only build tested for the moment and sent as an RFC because this
topic has raised a lot of questions, there may be things I have
forgotten about, so I would like all parties to agree on the direction
before I commit into something cleaner. I bet Sashiko will also have
interesting feedback to make...

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (16):
      spi: spi-mem: Handle a corner case while sanitizing ops
      spi: spi-mem: Stop checking the dummy buswidth against board wiring
      spi: spi-mem: Add support for dummy cycles
      spi: amlogic-spifc-a1: Consume dummy cycles directly
      spi: amlogic-spifc-a1: Fix a typo in a macro
      spi: amlogic: spifc-a4: Consume dummy cycles directly
      spi: cadence-qspi: Consume dummy cycles directly
      spi: fsl-qspi: Consume dummy cycles directly
      spi: microchip-core-qspi: Consume dummy cycles directly
      spi: nxp-xspi: Consume dummy cycles directly
      spi: nxp-xspi: Fix a comment
      spi: rtk-nor: Consume dummy cycles directly
      spi: sn-f-ospi: Consume dummy cycles directly
      spi: stm32-ospi: Consume dummy cycles directly
      spi: stm32-qspi: Consume dummy cycles directly
      mtd: spi-nor: Express the dummy phase in cycles

 drivers/mtd/spi-nor/core.c            |  36 ++----
 drivers/mtd/spi-nor/core.h            |   8 +-
 drivers/mtd/spi-nor/micron-st.c       |   2 +-
 drivers/mtd/spi-nor/spansion.c        |   6 +-
 drivers/spi/spi-amlogic-spifc-a1.c    |   9 +-
 drivers/spi/spi-amlogic-spifc-a4.c    |  12 +-
 drivers/spi/spi-cadence-quadspi.c     |  35 ++----
 drivers/spi/spi-fsl-qspi.c            |  12 +-
 drivers/spi/spi-mem.c                 | 216 ++++++++++++++++++++++++++++++----
 drivers/spi/spi-microchip-core-qspi.c |   8 +-
 drivers/spi/spi-nxp-xspi.c            |  14 +--
 drivers/spi/spi-rtk-nor.c             |  28 ++---
 drivers/spi/spi-sn-f-ospi.c           |  13 +-
 drivers/spi/spi-stm32-ospi.c          |  14 ++-
 drivers/spi/spi-stm32-qspi.c          |  12 +-
 include/linux/spi/spi-mem.h           |  36 +++++-
 16 files changed, 303 insertions(+), 158 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20261125-macronix-upstreaming-spi-mem-cycles-103274708fec

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
