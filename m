Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SL9ug-0001Xc-72
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 09:13:58 +0000
Received: by wibhj13 with SMTP id hj13so349206wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2012 02:13:56 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 0/9] sh_flctl hardware ECC mode cleanup
Date: Fri, 20 Apr 2012 11:13:41 +0200
Message-Id: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series cleans up the flctl when run in hardware ecc mode. The first 2 patches make sure we catch all errors that result from hardware transmission. The other patches handle how the ecc is layed out, correct some code to write and read it and make sure we propagate the statistics about errors/repairs to the nand base.

Bastian Hecht (9):
  mtd: sh_flctl: Add support for error IRQ
  ARM: sh-mobile: mackerel: Add error IRQ resource
  mtd: sh_flctl: Use different OOB layout
  mtd: sh_flctl: Fix hardware ECC behaviour
  mtd: sh_flctl: Simplify the hardware ecc page read
  mtd: sh_flctl: Group sector accesses into a single transfer
  mtd: sh_flctl: Restructure the hardware ECC handling
  mtd: sh_flctl: Use user oob data in hardware ECC mode
  ARM: sh-mobile: mackerel: Use hardware error correction

 arch/arm/mach-shmobile/board-mackerel.c |    7 +-
 drivers/mtd/nand/sh_flctl.c             |  289 ++++++++++++++++++-------------
 include/linux/mtd/sh_flctl.h            |   21 ++-
 3 files changed, 188 insertions(+), 129 deletions(-)

-- 
1.7.5.4
