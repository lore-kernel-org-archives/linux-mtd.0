From: vimalsingh@ti.com (Vimal Singh)
Date: Mon, 8 Feb 2010 05:19:20 +0530
Subject: [PATCH] OMAP: NAND: support flashes on sdp boards
Message-ID: <mailman.198.1265628142.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

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
 arch/arm/plat-omap/include/plat/nand.h       |   10 +-
 drivers/mtd/nand/omap2.c                     |   35 +---
 8 files changed, 586 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm/mach-omap2/board-sdp-flash.c
 create mode 100644 arch/arm/mach-omap2/gpmc-nand.c
 create mode 100644 arch/arm/mach-omap2/include/mach/board-sdp.h
