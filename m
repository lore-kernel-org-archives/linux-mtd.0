Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B14CC6B08
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HLZBRb1uP4qRMMapBQh+aBkCsvW6sF/WoFMBr0DeIck=; b=fUXM9j/ag7ZE6/
	xdW36iw6oNfAGZ/ma62kSrNg0jN9NqCgzKQqaOEYGkatoTmFds0raEQ7lGk+v8pXwWvQA387xe/S5
	r/+X2zN84WYOlgJgkstVnd24ZrMeMwUlVYa/7Tgj0rrXo6kBCG2QlPJSycglzH1Y3kxvBOgVGcMFC
	skENTs/zAAccaorG7mPOoTgHcHIohGRUPZpyFgTkgKAQy6+VilheGDZluJ6LXv7wV6BSB19HK1qRD
	o/ufevxP1vOXVlEh0nDlvlv8VUaPs5OvZ3zPciWV74H97T+dPn3hPe2euFfRUjDz5AAode85P9xZq
	PKlYOve1kGKYDTZSrkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdH1-0000000D3F8-2IrU;
	Tue, 13 Oct 2026 14:14:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdGx-0000000D3EW-39QT
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:14:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DF7961A11FE;
	Tue, 13 Oct 2026 14:14:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B164E60362;
	Tue, 13 Oct 2026 14:14:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57A9F11D71685;
	Tue, 13 Oct 2026 16:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791900861; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=M7v3OFxHD5HFJWdU0x370CW7QUMAdlkfUri/wCjcHM4=;
	b=zMARofIf6k6WEWO/oIkTaOA/apZzy1x5XguuWVQqZ0qBf1XjstgNfeCRed2uT9kqGMN7JU
	MN2vIRYBxV5wNZ/EqDNRbLovAeLFQi+om0v2PuT1xyAQyCeFBHqY9Cl1iwrWS/SffHQH1P
	L42dOP3EHhNxjEjOBpd0fpn3s01MDtcpyRcnJJyRSCfjE5v6iS3h1DS7ifYzFdttyutjBe
	zCYwV2naDwgqQuNYCIeNmBiRva0rTp1Qj5VFvcBwvIV3MRrpmbW+r9guIRQhX5vLCyviVE
	KOG1XZZRrKhKZMpDrNCidJE4lfn7hR2lGHRS630wuQ08h8nQ/12ZNv4bgp1zsw==
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
Subject: [PATCH v2 0/7] spi: Add support for panic mem writes
Date: Tue, 13 Oct 2026 16:13:43 +0200
Message-ID: <20261013141350.189996-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_071431_928158_8F53D7EE 
X-CRM114-Status: GOOD (  14.17  )
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

Here is the v2 of my patchset that updates the MTD spi-nor code as well
as the spi-mem code, to add support for panic mem writes to a memory
partition configured as pstore.

Changelog:

 - Old patch [4/5] ("spi: cadence-xspi: Don't use infinite timeout in
   register poll") was dropped. The V2's [6/7] updates that code so
   there was little point in keeping the patch, especially since it
   was fixing a never-taken code path.

 - [1/7]: 
        - Don't call spi_mem_access_start/end on panic. We don't need to
          flush the SPI queue at that point, and we don't need to lock the
          mutexes.
        - Check that the SPI controller's PM status is active, and bail out
          otherwise.

 - [2/7]: New patch.
          Updates the spi-nor code to use the iopoll macros, to make it
	  easier to convert it to atomic-context polling later.

 - [3/7]: (was v1's [2/5])
        - Update spi_nor_wait_till_ready_with_timeout() to use
          poll_timeout_us_atomic() on panic
        - Alloc temp buffer with GFP_ATOMIC in spi_nor_octal_dtr_write()
          on panic
        - Bail out if nor->rww.ongoing_pe is set in spi_nor_panic_write()

 - [4/7]: New patch.
          Address an issue found by Sashiko, where we poll for a bit in
          the IRQ status register but never clear the bit back to 0.

 - [5/7]: (was v1's [3/5])
        - Make sure we only enable interrupts if not using polling mode

 - [6/7]:
        - Don't enable interrupts if doing a panic write
        - Use a new cdns_readl_poll() macro that will resolve to calling
          readl_relaxed_poll_timeout_atomic() when doing a panic write, or
          readl_relaxed_poll_timeout() otherwise.
        - Drop cdns_xspi->panic_write. We don't actually need to check it
	  in cdns_xspi_is_dll_locked(), because this code is never called
	  in the kernel panic path.

 - [4/7]: New patch.
          Update the dt-bindings to make the IRQ line optional.

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
 drivers/mtd/spi-nor/core.c                    | 111 +++++++++++++----
 drivers/spi/spi-cadence-xspi.c                | 116 +++++++++++-------
 drivers/spi/spi-mem.c                         |  35 +++++-
 include/linux/spi/spi-mem.h                   |   5 +
 5 files changed, 194 insertions(+), 74 deletions(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
