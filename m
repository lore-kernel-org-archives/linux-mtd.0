Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB5CD98F0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jun 2026 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/tm0/aPoudsttoYqK69AXpg0FNN3WSAwQlYjQuAE1YU=; b=Z/kEcjUILsGlON
	IwHDufmnKzAlsc5TM/hI/hyu6A7oEhDQGxcI5gT5tBipSw19yb19zO74cWJu92EdfJTBICrSaGpL+
	2kcKy8UYcWzlZx87fhgq4cUytgGAjxyHez3FAGCladDhNyntoqXS2LtGPIMD6C5sZ8b8URErgdo2A
	ce9gPveq049jr25YqOBbEAowRPy3xjb8/t1iC2IzRo+fXW0AcCbdiudw8pL9zq8OW1f5i4e6E1afS
	P45ZLYmD7/SywEw5GVRKCwzhvKD2ohrGsLEOECsU/9MiXs1Z0yHDiN241iGeUTHt+4FqoyEpTQpZL
	EmMQDDZtRNquAC+BpAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZowx-0000000HI5b-1rph;
	Wed, 17 Jun 2026 12:00:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoww-0000000HI5T-1nS7
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jun 2026 12:00:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33C6B44404;
	Wed, 17 Jun 2026 12:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13D81F000E9;
	Wed, 17 Jun 2026 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781697654;
	bh=iDb+feyhI/fEpkP3axJoebokiHgvmCe1iw6p9Zqb6oo=;
	h=From:To:Cc:Subject:Date;
	b=oIDDxpzImcQnsL0Zs2pxRq3DPm/N+wrs8Wj7JbJe1jgKmJiCVuahdxeDOjtuzHAMr
	 tOcQlrGFEHhDFuIM78NVj6M8HlQ61Kyio6Je/WM7iXpc016/4bhlDjdb0+6PtkhK/9
	 wdjXL2xw66zSkeiIfgk4SvWhLcJZVKJH/hbUyPOhc8+5z68s7TMoT1QJabWkZNj75A
	 e63OyYYQYy4HU0XutrShKWS1D1jOwCq8nubVWuxTWVH0pTPwWMjecKlRF1z31D/Y/z
	 zRTaI7rqTsIgcDO1v+f/sJBC0/jG5pOQX6gIUk4F3rpfgWd/InKpPjSUNbxi+PIYBu
	 IYg0mHJlYP5+g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [GIT PULL] SPI NOR changes for 7.2
Date: Wed, 17 Jun 2026 14:00:51 +0200
Message-ID: <2vxz33ylpea4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

Hi Miquel,

Here are the SPI NOR changes for 7.2.

Regards,
Pratyush Yadav

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/for-7.2

for you to fetch changes up to df415c5e1de0f1aeefacb4e6252ff98d38c04437:

  mtd: spi-nor: spansion: add die erase support in s28hx-t (2026-05-28 15:57:24 +0200)

----------------------------------------------------------------
SPI NOR changes for 7.2

Notable changes:

- Big set of cleanups and improvements to the locking support. This
  series contains some cleanups and bug fixes for code and documentation
  around write protection. Then support is added for complement locking,
  which allows finer grained configuration of what is considered locked
  and unlocked. Then complement locking is enabled on a bunch of Winbond
  W25 flashes.

- Fix die erase support on Spansion flashes. Die erase is only supported
  on multi-die flashes, but the die erase opcode was set for all. When
  the opcode is set, it overrides the default chip erase opcode which
  should be used for single-die flashes. Only set the opcode on
  multi-die flashes. Also, the opcode was not set on multi-die s28hx-t
  flashes. Set it so they can use die-erase correctly.

----------------------------------------------------------------
Miquel Raynal (28):
      mtd: spi-nor: debugfs: Fix the flags list
      mtd: spi-nor: swp: Improve locking user experience
      mtd: spi-nor: Drop duplicate Kconfig dependency
      mtd: spi-nor: Make sure the QE bit is kept enabled if useful
      mtd: spi-nor: Improve opcodes documentation
      mtd: spi-nor: debugfs: Align variable access with the rest of the file
      mtd: spi-nor: debugfs: Enhance output
      mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour
      mtd: spi-nor: swp: Clarify a comment
      mtd: spi-nor: swp: Use a pointer for SR instead of a single byte
      mtd: spi-nor: swp: Create a helper that writes SR, CR and checks
      mtd: spi-nor: swp: Rename a mask
      mtd: spi-nor: swp: Create a TB intermediate variable
      mtd: spi-nor: swp: Create helpers for building the SR register
      mtd: spi-nor: swp: Simplify checking the locked/unlocked range
      mtd: spi-nor: swp: Cosmetic changes
      mtd: spi-nor: Create a local SR cache
      mtd: spi-nor: debugfs: Add locking support
      mtd: spi-nor: debugfs: Add a locked sectors map
      mtd: spi-nor: Add steps for testing locking support
      mtd: spi-nor: swp: Add support for the complement feature
      mtd: spi-nor: Add steps for testing locking with CMP
      mtd: spi-nor: winbond: Add W25H512NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25H01NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25H02NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25Q01NWxxIQ CMP locking support
      mtd: spi-nor: winbond: Add W25Q01NWxxIM CMP locking support
      mtd: spi-nor: winbond: Add W25Q02NWxxIM CMP locking support

Takahiro Kuwano (2):
      mtd: spi-nor: spansion: use die erase for multi-die devices only
      mtd: spi-nor: spansion: add die erase support in s28hx-t

 Documentation/driver-api/mtd/spi-nor.rst | 170 +++++++++++++++
 drivers/mtd/spi-nor/Kconfig              |   1 -
 drivers/mtd/spi-nor/core.c               |  76 ++++++-
 drivers/mtd/spi-nor/core.h               |  25 ++-
 drivers/mtd/spi-nor/debugfs.c            |  72 +++++-
 drivers/mtd/spi-nor/spansion.c           |   7 +-
 drivers/mtd/spi-nor/swp.c                | 363 ++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/winbond.c            |  41 +++-
 include/linux/mtd/spi-nor.h              |   7 +-
 9 files changed, 671 insertions(+), 91 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
