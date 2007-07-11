Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8jOD-0004ev-6H
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 22:06:26 +0100
Date: Wed, 11 Jul 2007 17:04:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD:  Remove useless references to MIPS_HYDROGEN3 and
	MIPS_MIRAGE_WHY.
Message-ID: <Pine.LNX.4.64.0707111700370.19869@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  this is a superset of the earlier patch.  this one removes *both*
apparently useless references from alchemy-flash.c.  ralf already
verified that the HYDROGEN3 reference is toast, perhaps he can verify
the second one as well.


diff --git a/drivers/mtd/maps/alchemy-flash.c b/drivers/mtd/maps/alchemy-flash.c
index 84fbe0e..82811bc 100644
--- a/drivers/mtd/maps/alchemy-flash.c
+++ b/drivers/mtd/maps/alchemy-flash.c
@@ -75,13 +75,6 @@
 #define BOARD_FLASH_WIDTH 2 /* 16-bits */
 #endif

-#ifdef CONFIG_MIPS_HYDROGEN3
-#define BOARD_MAP_NAME "Hydrogen3 Flash"
-#define BOARD_FLASH_SIZE 0x02000000 /* 32MB */
-#define BOARD_FLASH_WIDTH 4 /* 32-bits */
-#define USE_LOCAL_ACCESSORS /* why? */
-#endif
-
 #ifdef CONFIG_MIPS_BOSPORUS
 #define BOARD_MAP_NAME "Bosporus Flash"
 #define BOARD_FLASH_SIZE 0x01000000 /* 16MB */
@@ -130,13 +123,6 @@ int __init alchemy_mtd_init(void)

 	window_addr = 0x20000000 - BOARD_FLASH_SIZE;
 	window_size = BOARD_FLASH_SIZE;
-#ifdef CONFIG_MIPS_MIRAGE_WHY
-	/* Boot ROM flash bank only; no user bank */
-	window_addr = 0x1C000000;
-	window_size = 0x04000000;
-	/* USERFS from 0x1C00 0000 to 0x1FC00000 */
-	alchemy_partitions[0].size = 0x03C00000;
-#endif

 	/*
 	 * Static partition definition selection
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
========================================================================
