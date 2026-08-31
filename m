Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA342C61DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/tG8V4dxz3ErKaO+rYmjZnfEXHVAxgXhrx9U8MElDXY=; b=LdM5kDX8GO8JFy
	Kvc8HMTZtWo2FQYxle3ealrLa1/tr9HqDmUg2dyHYpGcBoCHa32JnFtfvMWLtFPet9/ov7oDsyPSV
	R4UX4j9/2pxPmz4TRVpge3yLVF7pmwhqm54b1iQ3avyxCZo6kXAylgpoGOG9b3wEzVU5jAw8xyL6u
	tKsSdKm3Alx46UbAkPc0G+TAPFpsWEiC6Wgy1IjXHvaVPZNeYY9NSwHtRity4uYKv+4f+OlPkDmYb
	ZRfd5LRNUym0Q/G1gDZ4RBKvwcIaiOP9haceUibTuOsAklCd7URWMJ5w0rZNsY8w1/WvKiZX/JU6U
	CfkNy9DOfdm/PJpa3LhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10ly-00000009GGj-3HyI;
	Mon, 31 Aug 2026 12:05:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10lw-00000009GG1-0tPz
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 12:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A07D740983;
	Mon, 31 Aug 2026 12:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78E85C2BCFA;
	Mon, 31 Aug 2026 12:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788177955;
	bh=XxFUu38Xpgfw5uH5rLWH9TFddXTQwTMb/VoPXqh4zDg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=X+ryOt03BB1jPRalL1D3wyFTALCNSTR5yS0hol8CLvk33vXg4u1uRqLoT8TwjrL5U
	 sxco6/sk9UAvG5TT0Xg+CMKi5xj00SSFx44U6ylYOitRV0Bl9lP9FgwVqBp95HxoFj
	 wkK9fJKAEJ9jzulPNZYPISxBLfy7+YC+ZUCm1diDtfg1eULCA4ubHyoi1qt/9xjXyv
	 1tcPD+4iBeisR0vBup5kbVWydTvWexc+/dQqqPlD7XUrxMRigAO5DxL0LSyeQO3rlc
	 Ps716HahqbpaqyJpK/5M/QOTERxM7GTAaDpEEGhKJQLfdCqC1pDDTrCF2eCGTMKI68
	 qUVEhmSiJh2fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FBBC624A4;
	Mon, 31 Aug 2026 12:05:55 +0000 (UTC)
From: Tobias Jakobsen via B4 Relay <devnull+tjakobsen84.protonmail.com@kernel.org>
Subject: [PATCH v2 0/2] Report platform enforced SPI flash write protection
Date: Mon, 31 Aug 2026 14:05:50 +0200
Message-Id: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RgYCYIr72FYNG2RidBppoRoC
 He3cgGX7yX//Q2SV/YJbsUG6ldOLCEDnQqwowlPj+wyA5XUlC11mCJjEMU4mWUQnXES+0JnTNf
 WzlB7JcjbqH7g99F99JlHTovo57hZq5/9V1wrLNG6S0Ou7qra0z2qLBJmw9PZygz9vu9faEJow
 78AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788177954; l=2977;
 i=tjakobsen84@protonmail.com; s=20260829; h=from:subject:message-id;
 bh=XxFUu38Xpgfw5uH5rLWH9TFddXTQwTMb/VoPXqh4zDg=;
 b=/WgtaKN2ADvM0QeWuHKb3ySKNZE5CmbRyLgubMeA7/eyVSw4ZV/2Ju6IJBu28eNc+wlFzOJ4a
 4vSqtOyrh7sBVXfGyhA7NfddNMQpC1KTfQ/V2CVJObg2N1gJ4hk49RE
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

Tooling disclosure, per Documentation/process/generated-content.rst:
this series was produced with the help of an LLM assistant in an
interactive session. All code was tested, results reviewed and can be
defended.

Question for the maintainers: this straddles MTD and SPI, so I do not
know which tree it should go through. Happy to resend in whatever shape
suits.

Signed-off-by: Tobias Jakobsen <tjakobsen84@protonmail.com>
---
Changes in v2:
- Reuse the protected range register decoding via a new helper instead
  of duplicating it (Mika Westerberg)
- Drop an unhelpful comment in intel_spi_is_locked() (Mika Westerberg)
- Add an Assisted-by tag and a tooling disclosure in the cover letter
- Link to v1: https://lore.kernel.org/r/20260829-spi-nor-platform-lock-v1-0-cd362d4914e2@protonmail.com

---
Tobias Jakobsen (2):
      mtd: spi-nor: allow the platform to supply write protection state
      spi: spi-intel: report controller enforced write protection

 drivers/mtd/spi-nor/core.c | 52 +++++++++++++++++++++++++++++++++--
 drivers/spi/spi-intel.c    | 68 ++++++++++++++++++++++++++++++++++++++++++----
 include/linux/spi/flash.h  | 12 ++++++++
 3 files changed, 124 insertions(+), 8 deletions(-)
---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260829-spi-nor-platform-lock-daa984da2872

Best regards,
-- 
Tobias Jakobsen <tjakobsen84@protonmail.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
