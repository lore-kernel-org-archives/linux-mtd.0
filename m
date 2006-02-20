Received: from sorrow.cyrius.com ([65.19.161.204])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FAyYP-0007sI-Sr
	for linux-mtd@lists.infradead.org; Sun, 19 Feb 2006 19:05:28 -0500
Date: Mon, 20 Feb 2006 00:05:05 +0000
From: Martin Michlmayr <tbm@cyrius.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20060220000505.GA17834@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: LASAT: depend on MTD_CFI
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following difference was found between the mainline and linux-mips
kernel.  LASAT depends on MTD_CFI.

Signed-off-by: Martin Michlmayr <tbm@cyrius.com>

--- linux-2.6.16-rc4/drivers/mtd/maps/Kconfig	2006-02-19 20:09:05.000000000 +0000
+++ mips-2.6.16-rc4/drivers/mtd/maps/Kconfig	2006-02-19 20:15:19.000000000 +0000
@@ -200,8 +200,8 @@
 	  Support for the flash chip on Tsunami TIG bus.
 
 config MTD_LASAT
-	tristate "Flash chips on LASAT board"
-	depends on LASAT
+	tristate "LASAT flash device"
+	depends on LASAT && MTD_CFI
 	help
 	  Support for the flash chips on the Lasat 100 and 200 boards.
 

-- 
Martin Michlmayr
http://www.cyrius.com/
