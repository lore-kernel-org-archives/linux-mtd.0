Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN2or-0008WL-NO
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 14:03:46 +0000
Received: by werp11 with SMTP id p11so97524wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 07:03:43 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH v2 0/10] sh_flctl hardware ECC mode cleanup
Date: Wed, 25 Apr 2012 16:03:28 +0200
Message-Id: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

changelog:
  - extract the iounmap calls from patch "Add support for error IRQ" into a new patch.
  - swapped patches "Add support for error IRQ" and "Add error IRQ resource"
  - corrected an indentation mistake

This series cleans up the flctl when run in hardware ecc mode. The first 2 patches make sure we catch all errors that result from hardware transmission. The other patches handle how the ecc is layed out, correct some code to write and read it and make sure we propagate the statistics about errors/repairs to the nand base.

Bastian Hecht (10):
  mtd: sh_flctl: Add missing iounmap()
  ARM: sh-mobile: mackerel: Add error IRQ resource
  mtd: sh_flctl: Add support for error IRQ
  mtd: sh_flctl: Use different OOB layout
  mtd: sh_flctl: Fix hardware ECC behaviour
  mtd: sh_flctl: Simplify the hardware ecc page read/write
  mtd: sh_flctl: Group sector accesses into a single transfer
  mtd: sh_flctl: Restructure the hardware ECC handling
  mtd: sh_flctl: Use user oob data in hardware ECC mode
  ARM: sh-mobile: mackerel: Use hardware error correction

 arch/arm/mach-shmobile/board-mackerel.c |    7 +-
 drivers/mtd/nand/sh_flctl.c             |  296 ++++++++++++++++++-------------
 include/linux/mtd/sh_flctl.h            |   23 ++-
 3 files changed, 193 insertions(+), 133 deletions(-)

-- 
1.7.5.4
