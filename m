Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA17606A332
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RmJehCzj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eYvkNVD9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mC82xU47WImc1sWbYEM4LMpur29hwvk5jHsIVeI3C+0=; b=RmJehCzjJ7W/lRqjs5h3EBTCFk
	oGzU4npfR4bjBCWsusUAnhU05YuCvxS9r6jVpulf8OOxudl81VCT4VM6baVIRI4p6xpnaQMlo6CdA
	HVxkKmtn8E0raAm1wKTztOxSbryqnPmgFLP0lUx1tutu0p1RKmZQI6vGdANLqycHoPEywhAEJPuYc
	HlCac0nycjsWOX/GigCEcQbko3cNmn6xZEGeJy6zq33FLsym82h836IFkn0ZukK5fh1CqFHLqFcvf
	Yz/irhXugfJau0cljr3ZI0xzumO0k8un8AKGeHGgnrJF8cd21JYZXe4Z8GnqVZvNrTXzBMs05RNmB
	dI4Qu1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwr9-0000000GMc6-3RbL;
	Fri, 27 Nov 2026 14:23:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwr6-0000000GMaj-2Q1p;
	Fri, 27 Nov 2026 14:23:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 88BFD4E417C8;
	Fri, 27 Nov 2026 14:23:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A1126049C;
	Fri, 27 Nov 2026 14:23:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B385411E68FDF;
	Fri, 27 Nov 2026 15:22:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nWNmoo5X8Cbiui7JsHWvBd0DmI9ElE6Coz8fMgnKz3Y=;
	b=eYvkNVD9ibOwzR3jSz45y1QP0jTLhR/g35hR35UKGohQvsmRXUquMb8JxFNh2gUAOzSyG7
	fA6ZjGOlmj0vG0gFf1t/WLCCKnqz61bAAKNgrGmbTJCuyCJ2f6Xd4+GsQFhDkcSEVnMkY2
	z1Oih0WZUxa29fMByWmvF6WIT/IIiDpXsfJM3y6TwbFcoUZUnX7PqXJjRUowhOGE3rGmRh
	QGf8WLOlK+B41nAQB8rmHgIAfxTaJvtqqEHpLwonKQy02n2+VGSWIxvLEWxAdvtMaBL6Dg
	8pBNU4784T9zEUg3OzZCiPL+WggC3DR8jJuPu6VNOBdQnx2WUdJrSSyXI74l/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH RFC v2 00/35] spi: spi-mem: Express the dummy phase using
 cycles when relevant
Date: Fri, 27 Nov 2026 15:22:22 +0100
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQwWrDMAyGXyX4PBXbyZIulDEY7AF2HT04jtIKa
 juT3dBS8u7zvB522WHHT4L/+6WbiMiEUfTVTTAuFCn4DPqhEvZo/AGBxsxCS90qpR/BGcvB0wX
 Oc0yMxpE/QJwJHDqwV3vCCErWums6uZ3Qipw0M050KZYP8f72KvY/Q8bPczam+8ZhjKYY+2p3F
 7Z/C0emBRlKMiwKJFizxSfdWGvU8DKEkE7kNza45+8Sg4kIGRylvlq6TQNs69LkSDEFvpYfLKp
 U+de5xT2Nsm4bqaex7n67xX5d1y8Uyea3ZwEAAA==
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
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_062316_887862_054536D6 
X-CRM114-Status: GOOD (  20.02  )
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
passed to the spi and spi-mem controller drivers. A non-negligible
amount of those controller drivers convert bytes into cycles before
programming the registers.

When the conversions are lossless, it is not a big deal, just time
spent. However these silent conversions sometimes hide bugs and
sometimes also prevent using certain chips/configurations, as recently
reported on Macronix 1-1-8 chips requiring 20 cycles. Not all
controllers can do that, but the ones that can, would anyway reject
those chips.

Convert spi-mem, the trivial spi-mem controller drivers and then SPI NOR
to use dummy cycles instead of dummy bytes. SPI NAND may come later. As
part of those conversions, I also instated new de-facto sanity
checks. Those core checks allow us to drop many redundant checks from
the drivers after the conversion into using the cycles.

This second RFC adds the remaining controller conversions (nxp-fspi,
zynqmp-gqspi, atmel-quadspi and rpc-if), the range checks for the
controllers with limited dummy cycle fields, and the controller-specific
dummy buswidth fixes that depend on the cycles conversion. The dummy
buswidth fixes that do not depend on it have been (mostly) sent as a
separate series.

The series is build tested, but not run on hardware yet. I plan do
perform testing on the various controllers I have access to. This
version is not meant to be applied in the spi tree yet. Applying it for
your own review or testing requires the previous patch series cleaning
up the drivers (I split the two because of the size of the number of
patches...).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Better sanitize the operations in the core.
- Drop more redundant checks from the controller drivers.
- Add a Fixes tag and fix the DTR sanitizing corner case.
- Fix the dummy conversion ordering, the spi_sync() fallback, the
  poll_status() path and the dirmap fallback.
- Fix the trace event to report the dummy phase for both representations.
- Fix the listed controller driver bugs (unused code, missing capability,
  pointer typos, range checks) and the s25fs256t dummy count.
- Convert nxp-fspi, zynqmp-gqspi, atmel-quadspi and rpc-if to dummy
  cycles.
- Add range checks for the controllers with limited dummy cycle fields.
- Link to v1: https://lore.kernel.org/r/20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com

---
Miquel Raynal (35):
      spi: spi-mem: Stop checking the dummy buswidth against board wiring
      spi: spi-mem: Fix the odd byte count error message
      spi: spi-mem: Handle a corner case while sanitizing ops
      spi: spi-mem: Sanitize mixed DTR modes
      spi: spi-mem: Sanitize mixed buswidth
      spi: spi-mem: Add support for dummy cycles
      spi: amlogic-spifc-a1: Consume dummy cycles directly
      spi: amlogic-spifc-a1: Reject excessive dummy cycle counts
      spi: amlogic-spifc-a4: Consume dummy cycles directly
      spi: atmel-quadspi: Consume dummy cycles directly
      spi: atmel-quadspi: Reject excessive dummy cycle counts
      spi: cadence-qspi: Consume dummy cycles directly
      spi: cadence-qspi: Drop redundant checks
      spi: cadence-qspi: Drop now useless checks
      spi: fsl-qspi: Consume dummy cycles directly
      spi: microchip-core-qspi: Consume dummy cycles directly
      spi: mtk-snfi: Drop redundant check
      spi: nxp-fspi: Consume dummy cycles directly
      spi: nxp-fspi: Reject mixed DTR modes
      spi: nxp-xspi: Consume dummy cycles directly
      spi: nxp-xspi: Fix a comment
      spi: nxp-xspi: Reject mixed DTR modes
      spi: realtek-rtl-snand: Drop redundant check
      spi: rpc-if: Consume dummy cycles directly
      spi: rtk-nor: Consume dummy cycles directly
      spi: rtk-nor: Drop redundant checks
      spi: sn-f-ospi: Consume dummy cycles directly
      spi: spi-qpic-snand: Drop redundant check
      spi: stm32-ospi: Consume dummy cycles directly
      spi: stm32-ospi: Reject excessive dummy cycle counts
      spi: stm32-qspi: Consume dummy cycles directly
      spi: stm32-qspi: Reject excessive dummy cycle counts
      spi: wpcm-fiu: Drop redundant checks
      spi: zynqmp-gqspi: Consume dummy cycles directly
      mtd: spi-nor: Express the dummy phase in cycles

 drivers/mtd/spi-nor/core.c            |  36 ++---
 drivers/mtd/spi-nor/core.h            |   8 +-
 drivers/mtd/spi-nor/micron-st.c       |   2 +-
 drivers/mtd/spi-nor/spansion.c        |   8 +-
 drivers/spi/atmel-quadspi.c           |  27 ++--
 drivers/spi/spi-amlogic-spifc-a1.c    |  15 +-
 drivers/spi/spi-amlogic-spifc-a4.c    |  29 +---
 drivers/spi/spi-cadence-quadspi.c     |  50 ++----
 drivers/spi/spi-fsl-qspi.c            |  13 +-
 drivers/spi/spi-mem.c                 | 287 ++++++++++++++++++++++++++++++----
 drivers/spi/spi-microchip-core-qspi.c |  12 +-
 drivers/spi/spi-mtk-snfi.c            |   2 +-
 drivers/spi/spi-nxp-fspi.c            |  24 ++-
 drivers/spi/spi-nxp-xspi.c            |  24 ++-
 drivers/spi/spi-qpic-snand.c          |   2 +-
 drivers/spi/spi-realtek-rtl-snand.c   |   2 +-
 drivers/spi/spi-rpc-if.c              |  10 +-
 drivers/spi/spi-rtk-nor.c             |  31 ++--
 drivers/spi/spi-sn-f-ospi.c           |  15 +-
 drivers/spi/spi-stm32-ospi.c          |  28 ++--
 drivers/spi/spi-stm32-qspi.c          |  26 ++-
 drivers/spi/spi-wpcm-fiu.c            |   3 -
 drivers/spi/spi-zynqmp-gqspi.c        |  29 +++-
 include/linux/spi/spi-mem.h           |  39 ++++-
 include/trace/events/spi-mem.h        |   5 +-
 25 files changed, 482 insertions(+), 245 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20261125-macronix-upstreaming-spi-mem-cycles-103274708fec
prerequisite-message-id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
prerequisite-patch-id: 2f68de4139876dfa8e57afb65b429a69628214ab
prerequisite-patch-id: 7182a6b4808193323664f79c226ae2a57104b473
prerequisite-patch-id: 34a99e8e6644d1db0978b5aa6ca90342a42561f8
prerequisite-patch-id: cc060f58179f09af4593df6909b958a29bf11cb2
prerequisite-patch-id: c5a7a78ef01696c25c10b6d2968c0b65ab0f4ec6
prerequisite-patch-id: 340ee3d69095259d6141c017ea59c0c137d353b5
prerequisite-patch-id: 1629dd27a1f0b1d6622199cc7603dad4b17d29b6
prerequisite-patch-id: 29bc9e59b1d732a00cd65ba1d73270e051898fd7
prerequisite-patch-id: 7a028831f1df214099241bfac0dc290e2f799276
prerequisite-patch-id: c28c78ff316ce2ac8c1b6151367662ca8039acd3
prerequisite-patch-id: eea3b5adeb19b753a14bf03c5114eb407566c248
prerequisite-patch-id: 87bd95813776fe216ac157f9fad23586c71db87b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
