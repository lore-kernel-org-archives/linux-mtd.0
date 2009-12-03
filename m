From: vimalsingh@ti.com (Vimal Singh)
Date: Thu, 3 Dec 2009 18:35:23 +0530
Subject: [PATCH] OMAP: Introducing gpmc-nand.c
Message-ID: <mailman.62.1259849065.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This patch series introduces generic gpmc-nand.c for nand device
related gpmc init.

Vimal Singh (2):
  Correcting GPMC_CONFIG1_DEVICETYPE_NAND
  Introducing 'gpmc-nand.c' for GPMC specific NAND init

 arch/arm/mach-omap2/Makefile           |    3 +
 arch/arm/mach-omap2/gpmc-nand.c        |  141 ++++++++++++++++++++++++++++++++
 arch/arm/plat-omap/include/plat/gpmc.h |    2 +-
 arch/arm/plat-omap/include/plat/nand.h |    6 ++
 drivers/mtd/nand/omap2.c               |   26 +-----
 5 files changed, 154 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm/mach-omap2/gpmc-nand.c
