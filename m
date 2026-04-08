Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D376A1073CA3
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ogqIyfiwVbl3VfISmESoW1pvOX341dBnh1ituxzu2bE=; b=QYY78E63olYlDx
	UO71M9iYf9frDDf7hMbtUqLgKLdWsYnUtQ+xRvD1+uYvKiCiTlmg6RPIfTA+hTzIknnXVvQLt1biJ
	Vn1A9brw4by3vqj4Wn39j+bfTn/7dTHS0iS5ivsrq+XlL1weDF20FeusKBIGfppe4pknLEMvlzkY+
	29TXYmudnH3keG+aIfm7vsKFsVnLP6y74Uxe+/cURVhh5+n5d2LbwybgaqZRCpb06sj/q8y67k6M3
	SgA0Zi2SRmZ91cxjMVbpvrzSgxv4afNsjPt/kIJlXqX4X/JlaYRGVKY4fvzlkokgVaFy3lXUIV5pd
	0iKVJAEp/GgV/96OrOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARhL-00000008nR9-3UMB;
	Wed, 08 Apr 2026 12:07:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARhK-00000008nR3-2U0R
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 12:07:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A341760121;
	Wed,  8 Apr 2026 12:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC081C19421;
	Wed,  8 Apr 2026 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775650073;
	bh=qfKfBHxDZujoZ93BidiV/y/dFvuo5y0JheivnjigL44=;
	h=From:To:Cc:Subject:Date:From;
	b=TgA4NJx9FEmJoQdQO3kjXoUz+UwGxHmfBSZP0frR36xWB1zcWqujBMLv/7L0UV2m3
	 XZxMMcDd/7M9KywQa1x6LuqrVGP1scpfcknrrDVbjKhFhgOxCkvg/cl9usGLqi0ir6
	 bU7V8LZVagsf+ZUXWb23t/3albi+qGNViA6EtznA1sZvSAtsQYiVHQdCmoQ57xYzcW
	 soHpEZdE8B16QKn9KBXseM0GbbhK9rfw69hr9IkyW3WMnBrAgH5Kmwtt3BSGlHmAEZ
	 0tGAWyrs/QUwCkkW7bSxuDPmAosWPz4CMkGlmANDBy2v8pZ/2VjPsvePfcZlE3IHXT
	 S6RrOFXkh77Rg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for 7.1
Date: Wed, 08 Apr 2026 12:07:50 +0000
Message-ID: <2vxzo6jtac4p.fsf@kernel.org>
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

Here are the SPI NOR changes for 7.1.

Regards,
Pratyush Yadav

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/for-7.1

for you to fetch changes up to cf6788aed0cd911c2e7dded6f28214996dfabc30:

  mtd: spi-nor: micron-st: Enable die erase support for MT35XU02GCBA (2026-03-31 15:46:47 +0000)

----------------------------------------------------------------
SPI NOR changes for 7.1

There is only a collection of bugfixes this time around, with no notable
changes to the core. Some of the more noteworthy bugfixes listed below.

- Enable die erase on MT35XU02GCBA. We knew this flash needed this fixup
since 7f77c561e227 ("mtd: spi-nor: micron-st: add TODO for fixing
mt35xu02gcba") but did not add it due to lack of hardware to test on.

- Fix locking on some Winbond w25q series flashes.

- Fix Auto Address Increment (AAI) writes on SST that flashes that start
  on odd address. The write enable latch needs to be set again after the
  single byte program.

----------------------------------------------------------------
Eliav Farber (3):
      mtd: spi-nor: winbond: Fix locking support for w25q256jwm
      mtd: spi-nor: winbond: Fix locking support for w25q64jvm
      mtd: spi-nor: winbond: Fix locking support for w25q256jw

Haibo Chen (2):
      mtd: spi-nor: core: correct the op.dummy.nbytes when check read operations
      mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR sfdp fixup for mt35xu512aba

Haoyu Lu (1):
      mtd: spi-nor: micron-st: Enable die erase support for MT35XU02GCBA

Jonas Gorski (1):
      mtd: spi-nor: update spi_nor_fixups::post_sfdp() documentation

Sanjaikumar V S (1):
      mtd: spi-nor: sst: Fix write enable before AAI sequence

Shiji Yang (1):
      mtd: spi-nor: swp: check SR_TB flag when getting tb_mask

 drivers/mtd/spi-nor/core.c      |  2 +-
 drivers/mtd/spi-nor/core.h      |  2 +-
 drivers/mtd/spi-nor/micron-st.c | 27 ++++++++++++++-------------
 drivers/mtd/spi-nor/sst.c       | 13 +++++++++++++
 drivers/mtd/spi-nor/swp.c       |  4 +++-
 drivers/mtd/spi-nor/winbond.c   |  4 +++-
 6 files changed, 35 insertions(+), 17 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
