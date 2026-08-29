Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F2BC61DD3
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2026 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N7hbCVIgiEqf0Wps0rG48FBWlWJyFARswWFH+kI17aQ=; b=e/rYuGgKED2ChO
	0hZPa/N8n/WbNhVk1ivdyjUrYlr2bb5nfHIY0TvfNObSwWC1ZewDWKB81JQwHRib3STc7d+1LZ/sU
	HQvUGV43bj1jNinhkeg9QNOZbGHp5NE8GqM88CmJXTTk8XxdbPTJU7tyLgbUUr3KzR8+vTTCdjrqa
	yL3yNSz0vAba5ki4B+HWTSswOk3JZqHbl+2OJr2vYm3G4w4sIbD7qOzzIMAyfJJhdd/AotXxcKn5u
	VUpbne9/vVlg8L+lPJmT9dclzQ4QCl5c7kDJamdAostvQADm4P4OZSH0eLURFRX2GdrabSf9eNgbC
	mvWSQeE9wbDoAF6ZBh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x07Uu-00000006ZBv-3VJW;
	Sat, 29 Aug 2026 01:04:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x07Us-00000006ZBb-1xaG
	for linux-mtd@lists.infradead.org;
	Sat, 29 Aug 2026 01:04:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB329429C5;
	Sat, 29 Aug 2026 01:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 923CDC2BCF4;
	Sat, 29 Aug 2026 01:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787965477;
	bh=PBI+LaNfGSxOirkJdYCxWZ8AJkmpI5XaPvy0YgrWEek=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rZUB82B3Coy2oGC7Fs9xHghm7YhPSwqvN6pXej40bS0CpoSO/pYyulH6bZ2jz6nEd
	 GUXnSlRtQN18hpFh20g9aH5WO0ujYrncEaGzSmJcgw+IbtFvucDaSgUy3CIwIBaVQ+
	 Upn0EzfURGxY1GV8OO1tFeboWZIC1wvoY7QNr3xyIEq8nh+qgTeE7MGX1NffjMnYdk
	 qM69jk5b201D1HLFN7JqG4kmRGuDvEuwwhWip3Pxg0rJx1lwND3y3UtGoBAItPL9fh
	 +zT9Ngt3azRHu59vrDUsM5Fev4jCTBJdQ0/qX2X9P7mld9FKFO/pKFi9h1pjngDtc8
	 RzBVPCl3/o7nQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDEFC61DB9;
	Sat, 29 Aug 2026 01:04:37 +0000 (UTC)
From: Tobias Jakobsen via B4 Relay <devnull+tjakobsen84.protonmail.com@kernel.org>
Subject: [PATCH 0/2] Report platform enforced SPI flash write protection
Date: Sat, 29 Aug 2026 03:04:31 +0200
Message-Id: <20260829-spi-nor-platform-lock-v1-0-cd362d4914e2@protonmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnA1oGK76KuIhtHEL07akMgbiu
 694/A7/f0IRUykwNSeYfLVoihV924B/c3wJaqgG6mjoHI1YsmJMhnnjY02245b8BwPz6B6ByT0
 JaptNVv3d33m5rj9VYQJ2ZwAAAA==
X-Change-ID: 20260829-spi-nor-platform-lock-daa984da2872
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Tobias Jakobsen <tjakobsen84@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787965476; l=2383;
 i=tjakobsen84@protonmail.com; s=20260829; h=from:subject:message-id;
 bh=PBI+LaNfGSxOirkJdYCxWZ8AJkmpI5XaPvy0YgrWEek=;
 b=7ZRRI9GhC5gUJfBbhnYTWjPUeUAGrjglrB3dDPoLyZpLpokf/7UNQ5vB4Y0G7YLU3ZJmoZMxp
 B7ahFGi/8RNBGTPP72mHpraZqueZvF0feYTKz3aSM0hgPe6OTdWhbfH
X-Developer-Key: i=tjakobsen84@protonmail.com; a=ed25519;
 pk=UREd6cisfwsFIDP455nUH6Ysx+ZDGnAVE9nGmKzm1Ks=
X-Endpoint-Received: by B4 Relay for tjakobsen84@protonmail.com/20260829
 with auth_id=986
X-Original-From: Tobias Jakobsen <tjakobsen84@protonmail.com>
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
Reply-To: tjakobsen84@protonmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MEMISLOCKED currently answers only from the flash chip's own block
protection bits. On platforms where write protection is enforced
elsewhere -- an Intel PCH SPI controller with protected range registers
being the common case -- those bits say nothing about what is actually
enforced, and are typically left clear.

The result is that MEMISLOCKED either fails with -EOPNOTSUPP, or, once
the chip gains SPI_NOR_HAS_LOCK, confidently reports a range as unlocked
while the controller is refusing writes to it. As more chips gain lock
flags over time, the second case replaces the first, so the wrong answer
spreads rather than the missing one.

Patch 1 lets a platform supply an is_locked() callback through struct
flash_platform_data, which spi-nor prefers over the chip's own bits. It
is inert on its own: nothing sets the callback, so every existing
platform keeps the behaviour it has today, and the series stays
bisectable.

Patch 2 adds the only user, spi-intel, which already computes protected
range state at probe but has had no way to expose it since the SPI MEM
conversion removed its visibility of the MTD device.

Full before/after numbers from a Coffee Lake NUC are in patch 2. Only
the Intel PCH path is functionally tested; the flash.h change is an
append-only addition and all existing users of that struct use
designated initialisers, so they are unaffected.

This came out of a discussion about fwupd reporting the BIOS region as
unlocked on Intel PCH systems:
https://bugzilla.kernel.org/show_bug.cgi?id=221927

Question for the maintainers: this straddles MTD and SPI, so I do not
know which tree it should go through. Happy to resend in whatever shape
suits.

Signed-off-by: Tobias Jakobsen <tjakobsen84@protonmail.com>
---
Tobias Jakobsen (2):
      mtd: spi-nor: allow the platform to supply write protection state
      spi: spi-intel: report controller enforced write protection

 drivers/mtd/spi-nor/core.c | 52 ++++++++++++++++++++++++++++++++++++++++++++--
 drivers/spi/spi-intel.c    | 46 ++++++++++++++++++++++++++++++++++++++++
 include/linux/spi/flash.h  | 12 +++++++++++
 3 files changed, 108 insertions(+), 2 deletions(-)
---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260829-spi-nor-platform-lock-daa984da2872

Best regards,
-- 
Tobias Jakobsen <tjakobsen84@protonmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
