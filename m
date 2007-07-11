Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8gei-0003c7-D8
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 14:11:24 -0400
Date: Wed, 11 Jul 2007 14:08:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD: Remove support for dead HYDROGEN3.
Message-ID: <Pine.LNX.4.64.0707111406100.10131@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Ralf Baechle <ralf@linux-mips.org>
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

  i've Cc'ed ralf baechle so he can verify that HYDROGEN3 is dead.  (i
don't *think* i've sent this patch in before.)


diff --git a/drivers/mtd/maps/alchemy-flash.c b/drivers/mtd/maps/alchemy-flash.c
index 84fbe0e..c557e53 100644
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
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
========================================================================
