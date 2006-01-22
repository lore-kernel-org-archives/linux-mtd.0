Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F0int-0000iM-6T
	for linux-mtd@lists.infradead.org; Sun, 22 Jan 2006 12:15:12 -0500
Date: Sun, 22 Jan 2006 18:12:56 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>
Message-ID: <20060122171256.GE10003@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: [RFC: 2.6 patch] MTD_NAND_SHARPSL and MTD_NAND_NANDSIM should be
	tristate's
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD_NAND=m and MTD_NAND_SHARPSL=y or MTD_NAND_NANDSIM=y are illegal 
combinations that mustn't be allowed.

This patch fixes this bug by making MTD_NAND_SHARPSL and 
MTD_NAND_NANDSIM tristate's.

Additionally, it fixes some whitespace damage at these options.


Signed-off-by: Adrian Bunk <bunk@stusta.de>
Acked-by: Richard Purdie <rpurdie@rpsys.net>

---

This patch was already sent on:
- 13 Jan 2006
- 31 Dec 2005

--- linux-git/drivers/mtd/nand/Kconfig.old	2005-12-31 12:20:12.000000000 +0100
+++ linux-git/drivers/mtd/nand/Kconfig	2005-12-31 12:21:35.000000000 +0100
@@ -178,17 +178,16 @@
 	  Even if you leave this disabled, you can enable BBT writes at module
 	  load time (assuming you build diskonchip as a module) with the module
 	  parameter "inftl_bbt_write=1".
-	  
- config MTD_NAND_SHARPSL
- 	bool "Support for NAND Flash on Sharp SL Series (C7xx + others)"
- 	depends on MTD_NAND && ARCH_PXA
- 
- config MTD_NAND_NANDSIM
- 	bool "Support for NAND Flash Simulator"
- 	depends on MTD_NAND && MTD_PARTITIONS
 
+config MTD_NAND_SHARPSL
+	tristate "Support for NAND Flash on Sharp SL Series (C7xx + others)"
+	depends on MTD_NAND && ARCH_PXA
+
+config MTD_NAND_NANDSIM
+	tristate "Support for NAND Flash Simulator"
+	depends on MTD_NAND && MTD_PARTITIONS
 	help
 	  The simulator may simulate verious NAND flash chips for the
 	  MTD nand layer.
- 
+
 endmenu
