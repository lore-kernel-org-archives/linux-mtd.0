Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWrhp-0002ow-OT
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:58:58 +0000
Received: by pacfv12 with SMTP id fv12so5906774pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:58:36 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 00/10] mtd: spi-nor: cleanups + block protection support
 updates
Date: Tue,  1 Sep 2015 12:57:05 -0700
Message-Id: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Note: as this is sent out during the merge window, it's based on the
semi-unofficial l2-mtd.git/next branch, which is targeting 4.4, not 4.3]

Hi all,

I've been reviewing various spi-nor drivers as well as working with some
Winbond flash to support new locking features. The former helped point out a
few more things that could use some improvement, and the latter suggested that
we have some glaring oversights in the spi-nor lock/unlock code.

<side note>
Some helpful companion code, for mtd-utils:

 http://lists.infradead.org/pipermail/linux-mtd/2015-August/061526.html

This extends the flash_lock tool so that you can more easily test specific
ranges, using:

  # flash_lock --lock /dev/mtdX <offset> <block-count>
  # flash_lock --unlock /dev/mtdX <offset> <block-count>
  # flash_lock --islocked /dev/mtdX <offset> <block-count>
</side note>

The first half of this series is fairly self-explanatory. The second might take
a bit of thought, as a formulaic approach is a little more subtle than a
table-based approach, so I tried to copy the relevant portions distilled from a
few datasheets and include comments. Please shout if anything deserves more
explanation or looks funny to you.

Highlights:

 * clean up spi-nor.h header
 * spi-nor now supports MEMISLOCKED
 * MEM{LOCK,UNLOCK} support is a little more robust and extendible
 * turn on dual/quad read for Winbond w25q{32,64}dw
 * enable block protection for Winbond flash

Regards,
Brian

Brian Norris (10):
  mtd: spi-nor: make implicit <linux/bitops.h> dependency explicit
  mtd: spi-nor: make bitfield constants more consistent
  mtd: spi-nor: add SPI NOR manufacturer IDs
  mtd: spi-nor: use SNOR_MFR_* instead of CFI_MFR_*
  mtd: spi-nor: fixup kernel-doc for flash lock/unlock function pointers
  mtd: spi-nor: refactor block protection functions
  mtd: spi-nor: add mtd_is_locked() support
  mtd: spi-nor: add DUAL_READ for w25q{32,64}dw
  mtd: spi-nor: support lock/unlock/is_locked for Winbond
  mtd: spi-nor: disable protection for Winbond flash at startup

 drivers/mtd/spi-nor/spi-nor.c | 241 +++++++++++++++++++++++++++++++-----------
 include/linux/mtd/spi-nor.h   |  44 +++++---
 2 files changed, 211 insertions(+), 74 deletions(-)

-- 
2.5.0.457.gab17608
