Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D800C44506
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BzZ81JUBcgKurOwvRWBsbBaIhs4yKN+UE9zjz0G1Qt4=; b=KwfHZ/CKowIod+
	8GVDnEVkc86XDVDWMzbvnCdLF31910/HBBeDwsdUE4ow24eNP50A4ylRqrpGaCuSUOZrmZ+FuNKQG
	BJG/UHvOa7xAParI5mgs/FoPwLqb2o0qsCsg/CKkDRK7fRESqqg89oKQf0DzlelLDXmL41KWm/p1+
	qKOFibzVpNqdHYkhul5rjpVVia9hkG0Ars5HXjRoj98/gftj2AVMLKG99knv7TLs16Nro2QwKp3WX
	W4c1I2bsw8TDctZbAgbo6pg2jSCQAkQ9VNQsEOxDXF3nzG2y9JKOEkp5GP97enzNtkqodi4/TLtrU
	YF7ZJr2ImdyHbDb8APCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCi1-00000008gEE-3yep;
	Mon, 13 Jul 2026 09:12:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCi0-00000008gDG-1C6h
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFC7342B19;
	Mon, 13 Jul 2026 09:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7919E1F000E9;
	Mon, 13 Jul 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933935;
	bh=TiL28kGObEAGAIyeXoG8tSeerUHzkraHChIcpDKfoLY=;
	h=From:To:Cc:Subject:Date;
	b=lTVCN7azRalMOftvPNMVCdFvnrcSwieoB12HcEnMgzdaRy1sbrHCiegvHG0N9vo4d
	 gA7MWYiLMLrZXS0LablJwG6Mo5nPnaIjy2pT6y8ZelTA7w7UlJAuCg1ONsNvwLhuS0
	 SiXiRQGjMSCdbMSs3kTs8vRnDBf69SXtVM32hi3ARFwJXJaPp8Czn1DbXArqc7INDO
	 zJrLRqE3GO555G++rc3e4j721rtRwngASfBIMoD+oCvJHvAnKOczj852LDiYK2QSxZ
	 mnHrtXIPunWPAJvDJ80o6ou+pMNTDar69E5i4VS7k5w23NUPAcw9RA6wNpCc/0jM+O
	 nGCR6RNR2dEAg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] mtd: spi-nor: Rework flash parameter initialization
Date: Mon, 13 Jul 2026 11:11:38 +0200
Message-ID: <20260713091206.2414400-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Try to simplify the flash initialization and get rid of the legacy
handling. As default, all the flags of the in-kernel database are
taken and amended with the SFDP data.

This might have the consequence that all the flashes now get a
RDSFPD opcode which might be an unknown opcode. But that was already
the case for any flashes which were unknown to the linux kernel. So
far, there was not a single complaint. See patch 8 for more
information.

Sashiko found that not everything is rolled back in case of a SFDP
parsing failure. Thus there are now 5 additional patches which will
move the discovered parameters into spi_nor_flash_parameter which is
rolled back. The new rule is now:

  SFDP parsing and the per-flash SFDP fixups must only change the
  spi_nor_flash_parameter data.

changes since v1:
 - collected Tb and Rb tags
 - Fixed the roll-back issue Sashiko found, we now keep two backups
   for the parameters.
 - Link to v1: https://lore.kernel.org/linux-mtd/20260703143003.1809579-1-mwalle@kernel.org/

changes since the RFC:
 - new patches to address the rollback issue, as pointed out by
   Sashiko
 - remove SKIP_SFDP from kerneldoc, as pointed out by Sashiko
 - mention issuing the potential unsupported RDSFPD command in the
   commit message, as pointed out by Tudor
 - Link to the RFC: https://lore.kernel.org/linux-mtd/20260601125438.3481722-1-mwalle@kernel.org/

Michael Walle (8):
  mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
  mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES flag on failure
  mtd: spi-nor: move cmd_ext_type into spi_nor_flash_parameter
  mtd: spi-nor: move flags into spi_nor_flash_parameter
  mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp
  mtd: spi-nor: spansion: s25fs256t: move ARCFN check into .late_init
  mtd: spi-nor: push the rollback mechanism into the sfdp module
  mtd: spi-nor: rework flash parameter initialization

 drivers/mtd/spi-nor/core.c      | 178 +++++++++++---------------------
 drivers/mtd/spi-nor/core.h      |  13 +--
 drivers/mtd/spi-nor/debugfs.c   |   6 +-
 drivers/mtd/spi-nor/macronix.c  |   2 +-
 drivers/mtd/spi-nor/micron-st.c |   8 +-
 drivers/mtd/spi-nor/sfdp.c      |  70 ++++++++++---
 drivers/mtd/spi-nor/spansion.c  |  36 ++++---
 drivers/mtd/spi-nor/swp.c       |  52 ++++++----
 drivers/mtd/spi-nor/winbond.c   |   4 +-
 include/linux/mtd/spi-nor.h     |   4 -
 10 files changed, 185 insertions(+), 188 deletions(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
