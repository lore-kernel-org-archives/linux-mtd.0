Received: from ftp.linux-mips.org ([194.74.144.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HQAnR-0004Hd-4Y
	for linux-mtd@lists.infradead.org; Sat, 10 Mar 2007 18:16:56 -0500
Received: from localhost.localdomain ([127.0.0.1]:7882 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20021974AbXCJXQN (ORCPT <rfc822;linux-mtd@lists.infradead.org>);
	Sat, 10 Mar 2007 23:16:13 +0000
Date: Sat, 10 Mar 2007 23:14:12 +0000
From: Ralf Baechle <ralf@linux-mips.org>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [MTD] Alchemy cleanups
Message-ID: <20070310231412.GA28308@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Delete RCS $Id string and unused debug code.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

diff --git a/drivers/mtd/maps/alchemy-flash.c b/drivers/mtd/maps/alchemy-flash.c
index 7fc8097..84fbe0e 100644
--- a/drivers/mtd/maps/alchemy-flash.c
+++ b/drivers/mtd/maps/alchemy-flash.c
@@ -1,10 +1,7 @@
 /*
  * Flash memory access on AMD Alchemy evaluation boards
  *
- * $Id: alchemy-flash.c,v 1.2 2005/11/07 11:14:26 gleixner Exp $
- *
  * (C) 2003, 2004 Pete Popov <ppopov@embeddedalley.com>
- *
  */
 
 #include <linux/init.h>
@@ -18,12 +15,6 @@
 
 #include <asm/io.h>
 
-#ifdef 	DEBUG_RW
-#define	DBG(x...)	printk(x)
-#else
-#define	DBG(x...)
-#endif
-
 #ifdef CONFIG_MIPS_PB1000
 #define BOARD_MAP_NAME "Pb1000 Flash"
 #define BOARD_FLASH_SIZE 0x00800000 /* 8MB */
