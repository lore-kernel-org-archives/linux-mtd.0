From: vimalsingh@ti.com (Vimal Singh)
Date: Tue, 5 Jan 2010 16:43:08 +0530
Subject: [PATCH] fixing omap nand driver issues
Message-ID: <mailman.121.1262786349.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

fixing omap nand driver issues.

Vimal Singh (3):
  Fixing compilation warning for 'nand/omap2.c'
  NAND: OMAP: correct 'info' pointer in 'omap_nand_remove'
  NAND: OMAP: Fixing issue in oamp nand driver in prefetch mode read

 drivers/mtd/nand/omap2.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)
