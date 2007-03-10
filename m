Received: from ftp.linux-mips.org ([194.74.144.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HQAmG-0004Hd-Jy
	for linux-mtd@lists.infradead.org; Sat, 10 Mar 2007 18:15:08 -0500
Received: from localhost.localdomain ([127.0.0.1]:3018 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20021967AbXCJXMx (ORCPT <rfc822;linux-mtd@lists.infradead.org>);
	Sat, 10 Mar 2007 23:12:53 +0000
Date: Sat, 10 Mar 2007 23:10:50 +0000
From: Ralf Baechle <ralf@linux-mips.org>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [MTD] Fix dependencies for MIPS MTD drivers
Message-ID: <20070310231050.GA28085@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 o A dependency on the processor architecture does not make sense,
   delete it.
 o The Alchemy and MTX drivers requires MTD_PARTITIONS and MTD_CFI to work,
   make those dependencies.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index bbf0553..5922888 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -240,13 +240,13 @@ config MTD_NETtel
 
 config MTD_ALCHEMY
 	tristate "AMD Alchemy Pb1xxx/Db1xxx/RDK MTD support"
-	depends on SOC_AU1X00
+	depends on SOC_AU1X00 && MTD_PARTITIONS && MTD_CFI
 	help
 	  Flash memory access on AMD Alchemy Pb/Db/RDK Reference Boards
 
 config MTD_MTX1
 	tristate "4G Systems MTX-1 Flash device"
-	depends on MIPS && MIPS_MTX1
+	depends on MIPS_MTX1 && MTD_CFI
 	help
 	  Flash memory access on 4G Systems MTX-1 Board. If you have one of
 	  these boards and would like to use the flash chips on it, say 'Y'.
@@ -384,7 +384,7 @@ config MTD_TQM834x
 
 config MTD_OCELOT
 	tristate "Momenco Ocelot boot flash device"
-	depends on MIPS && MOMENCO_OCELOT
+	depends on MOMENCO_OCELOT
 	help
 	  This enables access routines for the boot flash device and for the
 	  NVRAM on the Momenco Ocelot board. If you have one of these boards
