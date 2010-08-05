Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22w-0007Qy-N9
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:51 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/7] mtd: Blackfin NFC: delete useless comment about jffs2
Date: Thu,  5 Aug 2010 11:07:39 -0400
Message-Id: <1281020864-26842-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
References: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Barry Song <barry.song@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Barry Song <barry.song@analog.com>

The low level NAND driver doesn't care about filesystems, so punt the
local comment indicating otherwise.

Signed-off-by: Barry Song <barry.song@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index f3e3e74..81a05cd 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -20,9 +20,6 @@
  *		- DMA supported in ECC_HW
  *		- YAFFS tested as rootfs in both ECC_HW and ECC_SW
  *
- * TODO:
- * 	Enable JFFS2 over NAND as rootfs
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
-- 
1.7.2
