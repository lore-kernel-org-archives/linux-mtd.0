Received: from d1.icnet.pl ([212.160.220.21])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSq1a-0003TO-7f
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 12:00:10 +0000
From: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: NAND: ams-delta: select for built-in by default
Date: Wed, 15 Dec 2010 12:58:15 +0100
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <201012151258.16764.jkrzyszt@tis.icnet.pl>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the Amstrad Delta NAND driver is converted to a platform driver, 
which prevents it from interfering with other unrelated hardware in multiple 
OMAP1 cpu and machine configurations, it can be automatically configured for 
being built into the kernel if the Amstrad Delta board is also selected.

Created against linux-2.6.37-rc5.

Signed-off-by: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
---

 drivers/mtd/nand/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-2.6.37-rc5/drivers/mtd/nand/Kconfig.orig	2010-12-09 23:08:16.000000000 +0100
+++ linux-2.6.37-rc5/drivers/mtd/nand/Kconfig	2010-12-11 15:58:12.000000000 +0100
@@ -96,6 +96,7 @@ config MTD_NAND_SPIA
 config MTD_NAND_AMS_DELTA
 	tristate "NAND Flash device on Amstrad E3"
 	depends on MACH_AMS_DELTA
+	default y
 	help
 	  Support for NAND flash on Amstrad E3 (Delta).
 
