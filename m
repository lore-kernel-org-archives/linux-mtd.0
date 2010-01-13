Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUx0Q-0001oE-FR
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 06:47:07 +0000
Received: by bwz4 with SMTP id 4so15298703bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 22:47:01 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 13 Jan 2010 12:16:41 +0530
Message-ID: <ce9ab5791001122246v254bb721p68c58607a292fb8e@mail.gmail.com>
Subject: [PATCH 0/3] OMAP: NAND: support flashes on sdp boards
To: linux-omap@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Tony Lindgren <tony@atomide.com>, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 4fbddd880c7a0da61fb66ae1d2c2553e3fbc82cb Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Tue, 12 Jan 2010 18:14:14 +0530
Subject: [PATCH] OMAP: NAND: support flashes on sdp boards

1st patch introduces 'gpmc-nand.c' for generic gpmc stuffs. Which may be
used by any omap board.

2nd and 3rd patches are to show up how to use 'gpmc-nand.c' with example
of 3430sdp board.

Vimal Singh (3):
  Introducing 'gpmc-nand.c' for GPMC specific NAND init
  OMAP: SDP: Introducing 'board-sdp-flash.c' for flash init
  OMAP3: Add support for flash on 3430SDP board

 arch/arm/mach-omap2/Makefile                 |    4 +
 arch/arm/mach-omap2/board-3430sdp.c          |  111 ++++++++++
 arch/arm/mach-omap2/board-sdp-flash.c        |  295 ++++++++++++++++++++++++++
 arch/arm/mach-omap2/gpmc-nand.c              |  139 ++++++++++++
 arch/arm/mach-omap2/include/mach/board-sdp.h |   22 ++
 arch/arm/plat-omap/include/plat/gpmc.h       |    2 +
 arch/arm/plat-omap/include/plat/nand.h       |    8 +
 drivers/mtd/nand/omap2.c                     |   35 +---
 8 files changed, 585 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm/mach-omap2/board-sdp-flash.c
 create mode 100644 arch/arm/mach-omap2/gpmc-nand.c
 create mode 100644 arch/arm/mach-omap2/include/mach/board-sdp.h
