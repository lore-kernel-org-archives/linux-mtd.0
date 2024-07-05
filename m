Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC7FC30658
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2024 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5T8SDPfqoi9bjvELiCOWXNaovmkWgVIqi+cBv2dv9FQ=; b=IdWd5eebhVG4Eh
	pIrbkaJkk4m2Wzh3ILC9y+EoPqAAohV5Q65rbw3dAOB5Z0NwtUeJbXoifZw1+UeasRtnDDVPOnK5n
	6yMz8xi0cWNrbKwTKJfpl+ynTlEv/sa7ROFcWpDEztLFXpsFYxYxw9gNK2bu/MOSrk3byYNJKTOeN
	8Emm5eDkuO3FLHm19aZ2v1IP7qwCM7D4AFxXjCqNQB93gv5WGv1LxKWhqOp48ac1UQkiAgjHso3fP
	NSDhVQ/kS6uc0rQAXYPIO/Kj0eUP6hrTpUVQccdpdddeFhWkwl+haLFJDrYbWo8I02mHp2zwhGh08
	d7S7sxHGWEkNwNvc0JpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjp4-0000000GBt5-1vU4;
	Fri, 05 Jul 2024 14:22:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjp1-0000000GBsL-1upS
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jul 2024 14:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9398CE10F6;
	Fri,  5 Jul 2024 14:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F71C116B1;
	Fri,  5 Jul 2024 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720189314;
	bh=Ii14oGG8TVlZ45csFGX+BROKWE2U6DZi++XTunUacY8=;
	h=From:To:Cc:Subject:Date:From;
	b=QK5L66MN8zZIANHUePEyqpxGu06N6dHrCpYxDUXzjSpE14AOatITc6Whx6AD5vE5o
	 sEYHwKMzENpopE7sO183rgdLLzxrjhQmjMzntKY8YcpEP4v7mTPPaGlpZIyOWHLNll
	 czjrxijeGkoL3f15Mscek5cfwztzQCg2z06Vi4hTwk397FoqzJJCvquE3X7B/vzkne
	 V0s4oR4hQHh81KbklLr3vHjJ7yuVQL1uNoWEfqgTd1mBM902K9lkAEfpm8yY9tyXcc
	 KYVOec0G3wEnWpYnxn/ZZMkV/tZfUS4A7we7OCMjBBsmK80R7gcQDdmp+LOObY3OJt
	 aw5LwlwhHdwAQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for v6.11
Date: Fri, 05 Jul 2024 16:21:51 +0200
Message-ID: <mafs0bk3bor5s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_072159_694928_023881AB 
X-CRM114-Status: GOOD (  10.12  )
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

Here are the SPI NOR changes for v6.11.

Regards,
Pratyush Yadav

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-6.11

for you to fetch changes up to d35df77707bf5ae1221b5ba1c8a88cf4fcdd4901:

  mtd: spi-nor: winbond: fix w25q128 regression (2024-06-21 17:49:36 +0200)

----------------------------------------------------------------
SPI NOR changes for 6.11

Notable changes:

- Drop support for Xilinx S3AN flashes. These flashes are for the very
  old Xilinx Spartan 3 FPGAs and they need some awkward code in the core
  to support. Drop support for these flashes, along with the special
  handling we needed for them in the core like non-power-of-2 page size
  handling and the .setup() callback.

- Fix regression for old w25q128 flashes without SFDP tables. Commit
  83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
  dropped support for such devices under the assumption that they aren't
  being used anymore. Users have now surfaced [0] so fix the regression
  by supporting both kind of devices.

- Core cleanups including removal of SPI_NOR_NO_FR flag and
  simplification of spi_nor_get_flash_info().

[0] https://lore.kernel.org/r/CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com/

----------------------------------------------------------------
Michael Walle (6):
      mtd: spi-nor: Remove support for Xilinx S3AN flashes
      mtd: spi-nor: get rid of non-power-of-2 page size handling
      mtd: spi-nor: remove .setup() callback
      mtd: spi-nor: get rid of SPI_NOR_NO_FR
      mtd: spi-nor: simplify spi_nor_get_flash_info()
      mtd: spi-nor: winbond: fix w25q128 regression

 drivers/mtd/spi-nor/Makefile   |   1 -
 drivers/mtd/spi-nor/core.c     | 206 ++++++++++++++++-------------------------
 drivers/mtd/spi-nor/core.h     |  12 ---
 drivers/mtd/spi-nor/everspin.c |  19 +++-
 drivers/mtd/spi-nor/winbond.c  |   2 +
 drivers/mtd/spi-nor/xilinx.c   | 169 ---------------------------------
 6 files changed, 98 insertions(+), 311 deletions(-)
 delete mode 100644 drivers/mtd/spi-nor/xilinx.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
