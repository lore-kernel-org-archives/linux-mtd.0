Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E133D111A8
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Nov 2025 22:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mGT4miSRIwuLwz3pOlo2mWj/wKaAKxnFj30Qji9Q5tQ=; b=y/EbV5SuLE7ZzL
	4Mfk77iCCgqnb2v3Oshp18tJoIq4nrMXYn21xnU26bYa1CHLnISO09LiUwPxz9tN7RnceKXH1lUqH
	1m6g+JARG9eN6/XgOS0gB0uLNCCthIdraVxv3Jm1MVmyhLQXO82A6McgWTNf0gkGl80qMFk2TgtpR
	8HC/Lti0fXM2pDIDdU0GoSOB/502lkylNSeVleSJPIE2GBiJsrhfYZioKc+BNkGBBLpUYB+GeZTHO
	Sa0vBMb1PfvXW1aWjTrO8mYFG0PUwS8bXyio57TBvaa2Jf3ti4Tdzh3HYTRK9A4LP8iuMBSNHTA4x
	DkWW8eccXIZh2hHtBd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOkXX-0000000HH6d-1hj0;
	Thu, 27 Nov 2025 22:32:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOkXV-0000000HH5y-2uhC
	for linux-mtd@lists.infradead.org;
	Thu, 27 Nov 2025 22:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81D6840054;
	Thu, 27 Nov 2025 22:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E275C4CEF8;
	Thu, 27 Nov 2025 22:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764282756;
	bh=qjzMVKKpOgPda0fs6CtS7dKcnTuuClHhPDOqbwboV4Q=;
	h=From:To:Cc:Subject:Date:From;
	b=mfkA2IWnPv/5/cAEjfUqpr9dQjM9k/76xh7t7qA+0jKxs0adJDbEmlQCmPJCQVyP4
	 j8JBNzubJoefpxsw+0RHVuYFtv4axYXhws9VtfiqQXal0LIoU59csEe6iK95nGNUEy
	 N9ipRAVEJlv4zYwUgUrsaYZP0ujlQKmxvakIfuYmlo94/TMR0pgIOHA3Xu+FzA7Vrs
	 7pyy3U21wIxgfrQ5sXcMOGVlmRYAIrfEt4zLZ4IXcEqyi3qPyuS/09oPU05OF7m+LN
	 TTsn9upAqyW/a3lOnP0NTjj/4JHonCiWQpm8Jcf6tqSUGZFN1sKd/6mzSNVNfiHikp
	 quHWkkgDc7wVg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for v6.18
Date: Thu, 27 Nov 2025 23:32:34 +0100
Message-ID: <mafs0y0nrumwt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_143237_776529_A2EB7244 
X-CRM114-Status: GOOD (  14.00  )
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

Here are the SPI NOR changes for 6.19

Regards,
Pratyush Yadav

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-6.19

for you to fetch changes up to ed26bd40df11ee438d623adc9c6cc2a7bf9c5dd3:

  mailmap: update Pratyush Yadav's email address (2025-11-25 18:16:53 +0100)

----------------------------------------------------------------
SPI NOR changes for 6.19

Notable changes:

- Fix SMPT parsing for S25FS-S flash family. They report variable dummy
  cycles for reads. This results in the default of 0 being used. This
  works for other Infineon chips, but not for the S25FS-S family. They
  need 8 dummy cycles. Add fixup hooks to specify that. Also add fixup
  hooks to fix incorrect map ID data in SFDP.

- Add support for a bunch of Winbond flashes. Their block protection
  information is not discoverable, so they need to have an entry in the
  flash tables to describe that.

- Some cleanups for Micron flash support.

- Add support for Micron mt35xu01gbba.

- Some SPI controllers like the Intel one on the PCI bus do not support
  the read CR opcode (0x35). Do not use the opcode if the controller
  does not support it.

----------------------------------------------------------------
Haibo Chen (5):
      mtd: spi-nor: micron-st: rename the die_late_init functions
      mtd: spi-nor: micron-st: move set_octal_dtr to late_init()
      mtd: spi-nor: micron-st: use SFDP of mt35xu512aba
      mtd: spi-nor: micron-st: add mt35xu01gbba support
      mtd: spi-nor: micron-st: add TODO for fixing mt35xu02gcba

Jakub Czapiga (1):
      mtd: spi-nor: core: Check read CR support

Miquel Raynal (6):
      mtd: spi-nor: winbond: Add support for W25Q01NWxxIQ chips
      mtd: spi-nor: winbond: Add support for W25Q01NWxxIM chips
      mtd: spi-nor: winbond: Add support for W25Q02NWxxIM chips
      mtd: spi-nor: winbond: Add support for W25H512NWxxAM chips
      mtd: spi-nor: winbond: Add support for W25H01NWxxAM chips
      mtd: spi-nor: winbond: Add support for W25H02NWxxAM chips

Pratyush Yadav (1):
      mailmap: update Pratyush Yadav's email address

Takahiro Kuwano (3):
      mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup hook
      mtd: spi-nor: sfdp: introduce smpt_map_id fixup hook
      mtd: spi-nor: spansion: SMPT fixups for S25FS-S

 .mailmap                        |   1 +
 drivers/mtd/spi-nor/core.c      |  10 ++++
 drivers/mtd/spi-nor/core.h      |   6 +++
 drivers/mtd/spi-nor/micron-st.c | 101 +++++++++++++++++++++++-----------------
 drivers/mtd/spi-nor/sfdp.c      |  30 +++++++++++-
 drivers/mtd/spi-nor/spansion.c  |  38 +++++++++++++++
 drivers/mtd/spi-nor/winbond.c   |  24 ++++++++++
 7 files changed, 164 insertions(+), 46 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
