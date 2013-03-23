Received: from arrakis.dune.hu ([78.24.191.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJOAv-0001s8-Kx
 for linux-mtd@lists.infradead.org; Sat, 23 Mar 2013 13:08:01 +0000
From: Jonas Gorski <jogo@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BPATCH=203/3=5D=20MTD=3A=20bcm63xxpart=3A=20use=20nvram=20for=20PSI=20size?=
Date: Sat, 23 Mar 2013 14:07:49 +0100
Message-Id: <1364044070-10486-4-git-send-email-jogo@openwrt.org>
In-Reply-To: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Read out the SPI size from nvram instead of defaulting to 64K - some
vendors actually use values larger than the "max" value of 64.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 drivers/mtd/bcm63xxpart.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index fc3d7d0..5c81390 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -4,7 +4,7 @@
  * Copyright © 2006-2008  Florian Fainelli <florian@openwrt.org>
  *			  Mike Albon <malbon@openwrt.org>
  * Copyright © 2009-2010  Daniel Dickinson <openwrt@cshore.neomailbox.net>
- * Copyright © 2011-2012  Jonas Gorski <jonas.gorski@gmail.com>
+ * Copyright © 2011-2013  Jonas Gorski <jonas.gorski@gmail.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -33,6 +33,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
+#include <asm/mach-bcm63xx/bcm63xx_nvram.h>
 #include <asm/mach-bcm63xx/bcm963xx_tag.h>
 #include <asm/mach-bcm63xx/board_bcm963xx.h>
 
@@ -91,7 +92,8 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 			      BCM63XX_CFE_BLOCK_SIZE);
 
 	cfelen = cfe_erasesize;
-	nvramlen = cfe_erasesize;
+	nvramlen = bcm63xx_nvram_get_psi_size() * SZ_1K;
+	nvramlen = roundup(nvramlen, cfe_erasesize);
 
 	/* Allocate memory for buffer */
 	buf = vmalloc(sizeof(struct bcm_tag));
-- 
1.7.10.4
