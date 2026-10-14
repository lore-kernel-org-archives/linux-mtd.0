Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6E5CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=INJgme/jpHDxlvpU/HZmcVJuT4f2NKwoM4qLyvBaRVw=; b=pStXnAy9stp2id
	EWs5JYvMgVdEEnqTCbWWHRNob8fyoyIVefuRQ115o8WaK42FybMtVf7/2G7wDHFfqKn32JwJJNUqm
	2YrQtLiO9mPRnLpK03wWdFHgQQUF7wPaMVR5IUz8UqCUAApTMLVV+Njmamclsi2Fnco92oytM/sqM
	RWLBNyCQcMEYO9KRLif95U6Uv7cC8hKrHUABVBTx8WCHBqPc/Y9oLb3GkvKmJw5T0IWHbdq269da5
	6RPimV9T6r7Pa3xPF6MIffDE0zlVhNsV0j6xi2ysNsEvklrAQezdpwhvZ8oe3rNcuK49ttk5jNgvH
	TsrmOfQnIav4EI57NlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH19M-0000000Fss1-2iyl;
	Wed, 14 Oct 2026 15:44:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH19H-0000000FsqB-3jo5
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 15:44:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E76D4E411FA;
	Wed, 14 Oct 2026 15:44:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4CC660368;
	Wed, 14 Oct 2026 15:44:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F11DE1032806C;
	Wed, 14 Oct 2026 17:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791992646; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=IRNvNHczv/4RYpS6PDlOGN0xfjV5SxkuPqy6rEKMu3g=;
	b=ulWYPyiH4Wb/z63khCUujM0htofB1uPMt4YgtuWc+/m1/owRs4dwBQNJrnOdA6E4ZaYWvQ
	iWITjgyQqNJID6yWxrOGUPZdgfbbpwbvHdbUqRt42uKU+PDDrfUkQllJlOVqEkZBaUUtlL
	tDodv0zDdZQnbxmoav1NAefw7otqrLdaHlpeV1rLHN1c3TU2r9xtQ+2OTdwPBDO0AzPHJ/
	HW9SPbMATKjgSzPGU92ERiY+TA8MSyHnRogi86ciJeayRd5bex4/HaBRbkEQZg1esiGyV5
	F97XJSI7UXpqGFHGGl1mkUAiF6TrT9Fva4y6LQGh7DDBOl0zV4Mewieys1L24Q==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 0/7] spi: Add support for panic mem writes
Date: Wed, 14 Oct 2026 17:42:54 +0200
Message-ID: <20261014154301.157755-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_084412_984235_928CBD24 
X-CRM114-Status: UNSURE (   8.46  )
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

Hi,

Here is the v3 of my patchset that updates the MTD spi-nor code as well
as the spi-mem code, to add support for panic mem writes to a memory
partition configured as pstore.

Changelog:

 - [1/7]: 
        - Use pm_runtime_active() instead of pm_runtime_get_if_active().
	  The latter cannot be used in a panic context.
        - Forbid fallback to regular SPI on panic

 - [2/7]:
        - Set 'timeout_ms' parameter to u64 to prevent u32 overflow

 - [3/7]:
        - Use GFP_KERNEL xor GFP_ATOMIC

 - Patch 4->7 unchanged.

Cheers,
-Paul

Tanmay Jagdale (7):
  spi: spi-mem: Add support for panic mem writes
  mtd: spi-nor: Wait for NOR ready with poll_timeout_us()
  mtd: spi-nor: Add support for panic writes
  spi: cadence-xspi: Clear "SDMA ready" IRQ flag after polling
  spi: cadence-xspi: Add irq-less support
  spi: cadence-xspi: Add support for panic writes
  spi: dt-bindings: cadence: Make XSPI's IRQ line optional

 .../devicetree/bindings/spi/cdns,xspi.yaml    |   1 -
 drivers/mtd/spi-nor/core.c                    | 109 +++++++++++++----
 drivers/spi/spi-cadence-xspi.c                | 114 +++++++++++-------
 drivers/spi/spi-mem.c                         |  42 ++++++-
 include/linux/spi/spi-mem.h                   |   5 +
 5 files changed, 194 insertions(+), 77 deletions(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
