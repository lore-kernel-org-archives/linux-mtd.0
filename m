From: vimalsingh@ti.com (Vimal Singh)
Date: Thu, 19 Nov 2009 19:28:11 +0530
Subject: No subject
Message-ID: <mailman.43.1258639761.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This patch series adds flash support for NAND (in sdp, zoom and ldp),
OneNAND and NOR (in sdp)

Tested on Zoom2 and 3430SDP

Vimal Singh (4):
[PATCH-v6 1/4] OMAP2/3: Add support for flash on SDP boards
[PATCH-v6 2/4] OMAP3: Add support for NAND on ZOOM/LDP boards
[PATCH-v6 3/4] OMAP: Zoom2: Enable NAND and JFFS2 support in defconfig
[PATCH-v6 4/4] OMAP: 3430SDP: Enable NAND in defconfig


v6 :
1. Implemented Tony's comments on below threads:

[PATCH-v5 1/4] OMAP2/3: Add support for flash on SDP boards
http://marc.info/?l=linux-omap&m=125805845217778&w=2

[PATCH-v5 2/4] OMAP3: Add support for NAND on ZOOM2/LDP boards
http://marc.info/?l=linux-omap&m=125805867318269&w=2

[PATCH 2/3]NAND: OMAP: Fixing omap nand driver, compiled as module
http://marc.info/?l=linux-omap&m=125787938923028&w=2

2. Creating 'mach-omap2/gpmc-nand.c' to handle GPMC related setups for
the driver.
3. Removed all 'gpmc_cs_read_reg' and 'gpmc_cs_write_reg' calls from
'nand/omap2.c'
4. Corrected macro 'GPMC_CONFIG1_DEVICETYPE_NAND' for NAND
5. Removed 'nand unlock' routine in patch 2/4, will take this
discussion to mtd list.

v4-v5:
[PATCH-v5 1/4] OMAP2/3: Add support for flash on SDP boards:
Implemented Tony's comments.

-- 
Regards,
Vimal Singh
