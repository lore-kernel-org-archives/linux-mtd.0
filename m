Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7F3C43602
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eugh6h8FTpssSzB8aVWLbPypGDjyWbRXVKodeIslCz8=; b=BmUjHZtfANBca0
	M3a2GtHZbgO+GMQnJXirjCrJMa/XPr8uOQvaUpwrEMVBdd4AjZd6wnvt9i6I0tfiOdXjwnfWGa7uy
	I1zz3uNhLFX0+dFUTJTG6qOKOGeBj7zw6QUraHC4D/t1cauKVZCIK87WtefuORe/OhHfEVkebTZZZ
	56WON4EvIrNnFwELYtSq2f/scjHMGLJHMDzwjVBdRSK9BfBfH7/ILUjfjNxpPIDwnS/ZHWb6iVUkh
	8fpTNdVOiLEEV7XEMzUHLgpuZ2I4EeP89fWQD3iN4TrB3Pvu/FXpAFd4LaDUQLHYL4+BeHMvthwGW
	l0yh3PJ3ZRzIG5dD/qcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuP-00000007GY3-2QJI;
	Fri, 03 Jul 2026 14:30:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuN-00000007GXr-47AV
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 14:30:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ED1D600B0;
	Fri,  3 Jul 2026 14:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1991F000E9;
	Fri,  3 Jul 2026 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089022;
	bh=YuS9rWn/UpjoxAe+D3hMPCZ9qXXtvPPE9DHjNwtH8a8=;
	h=From:To:Cc:Subject:Date;
	b=aJgdxGcV6MeObyhAowtBxEpWVT/vLSuscJVrOdYHmNF6YJ28hH1eZYvcy2jtK61lG
	 VBZES21stKn0qS9nuc0wmygz4+wG0SXJTrZwd7ggW7DG+2FKU5aNhxg01PExtXZP1n
	 +ffPLBDejaDvErkj9xS8GRPTWqecGF5VmmUr/2Fd8xzi/Yrfr3nfn86dQ76V/sThAj
	 RjGwPV0hwY+gyHa3MuR/Ouwh4uXBIYDZ+VYAY2D1WKrwmSnybT2JL64mYFTZ3PsTQP
	 71tVla3lAvFQMFPEx63QPBTAZ4kEG2J4wUmSz/9e2JvTngV/HUvDgaIxPQiOtNYbEU
	 phsG0M4mYxPXg==
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
Subject: [PATCH v1 0/8] mtd: spi-nor: Rework flash parameter initialization
Date: Fri,  3 Jul 2026 16:29:11 +0200
Message-ID: <20260703143003.1809579-1-mwalle@kernel.org>
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

changes since the RFC:
 - new patches to address the rollback issue, as pointed out by
   Sashiko
 - remove SKIP_SFDP from kerneldoc, as pointed out by Sashiko
 - mention issuing the potential unsupported RDSFPD command in the
   commit message, as pointed out by Tudor

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
