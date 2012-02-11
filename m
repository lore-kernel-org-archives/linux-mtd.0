Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RwBPA-000478-SR
 for linux-mtd@lists.infradead.org; Sat, 11 Feb 2012 11:46:14 +0000
Received: by bkcjk13 with SMTP id jk13so3578629bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 11 Feb 2012 03:46:09 -0800 (PST)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-sh@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/7] SH Mobile sh_flctl driver brush up
Date: Sat, 11 Feb 2012 12:44:58 +0100
Message-Id: <1328960705-18699-1-git-send-email-hechtb@gmail.com>
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

This patch series brushs up the sh_flctl.c a bit to make it work with
the mackerel board. The hardware has changed and this needed to be
reflected in the NAND host driver.
On the road some minor enhancements have been incorporated.

Bastian Hecht (7):
  mtd: sh_flctl: Expand FLCMNCR register bit field
  mtd: sh_flctl: Reorder empty_fifo() calls
  mtd: sh_flctl: Expand the READID command to 8 bytes
  mtd: sh_flctl: Implement NAND_CMD_RNDOUT command
  mtd: sh_flctl: Use cached register value for FLCMNCR
  mtd: sh_flctl: Add FLHOLDCR register
  ARM: mach-shmobile: mackerel: Add the flash controller flctl

 arch/arm/mach-shmobile/board-mackerel.c |   71 +++++++++++++++++++++++++++++++
 arch/arm/mach-shmobile/clock-sh7372.c   |    4 +-
 drivers/mtd/nand/sh_flctl.c             |   48 +++++++++++++--------
 include/linux/mtd/sh_flctl.h            |   37 ++++++++++++++++
 4 files changed, 141 insertions(+), 19 deletions(-)

-- 
1.7.5.4
