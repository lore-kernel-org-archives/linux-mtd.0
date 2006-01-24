Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F1Xvs-0006OB-M9
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2006 18:50:42 -0500
Date: Wed, 25 Jan 2006 00:50:38 +0100
From: Adrian Bunk <bunk@stusta.de>
To: dwmw2@infradead.org
Message-ID: <20060124235038.GL3590@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC: 2.6 patch] Kconfig help: MTD_JEDECPROBE already supports
	Intel chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Unless I'm misunderstanding the code in jedec_probe.c, Intel chips are 
already supported.


Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

 drivers/mtd/chips/Kconfig |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.16-rc1-mm2-full/drivers/mtd/chips/Kconfig.old	2006-01-25 00:42:51.000000000 +0100
+++ linux-2.6.16-rc1-mm2-full/drivers/mtd/chips/Kconfig	2006-01-25 00:43:20.000000000 +0100
@@ -19,21 +19,20 @@
 config MTD_JEDECPROBE
 	tristate "Detect non-CFI AMD/JEDEC-compatible flash chips"
 	depends on MTD
 	select MTD_GEN_PROBE
 	help
 	  This option enables JEDEC-style probing of flash chips which are not
 	  compatible with the Common Flash Interface, but will use the common
 	  CFI-targetted flash drivers for any chips which are identified which
 	  are in fact compatible in all but the probe method. This actually
-	  covers most AMD/Fujitsu-compatible chips, and will shortly cover also
-	  non-CFI Intel chips (that code is in MTD CVS and should shortly be sent
-	  for inclusion in Linus' tree)
+	  covers most AMD/Fujitsu-compatible chips and also non-CFI
+	  Intel chips.
 
 config MTD_GEN_PROBE
 	tristate
 	select OBSOLETE_INTERMODULE
 
 config MTD_CFI_ADV_OPTIONS
 	bool "Flash chip driver advanced configuration options"
 	depends on MTD_GEN_PROBE
 	help
