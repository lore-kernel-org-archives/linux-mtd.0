Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOFsG-00070G-UL
	for linux-mtd@lists.infradead.org; Tue, 28 Mar 2006 10:12:51 -0500
Date: Tue, 28 Mar 2006 17:12:39 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060328151239.GB16959@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH] enable mainstone MTD map driver on LogicPD PXA270 platform
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The LogicPD PXA270 platform is very similar to the Intel Mainstone,
and can use the same MTD map driver.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

Index: linux-2.6.16/drivers/mtd/maps/Kconfig
===================================================================
--- linux-2.6.16.orig/drivers/mtd/maps/Kconfig
+++ linux-2.6.16/drivers/mtd/maps/Kconfig
@@ -131,7 +131,7 @@ config MTD_LUBBOCK
 
 config MTD_MAINSTONE
 	tristate "CFI Flash device mapped on Intel Mainstone XScale eval board"
-	depends on MACH_MAINSTONE && MTD_CFI_INTELEXT
+	depends on (MACH_LOGICPD_PXA270 || MACH_MAINSTONE) && MTD_CFI_INTELEXT
 	select MTD_PARTITIONS
 	help
 	  This provides a driver for the on-board flash of the Intel
