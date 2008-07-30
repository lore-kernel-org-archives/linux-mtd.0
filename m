Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOHS5-0000rz-FD
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 19:35:16 +0000
Message-Id: <200807301935.m6UJZ3Pr012303@imap1.linux-foundation.org>
Subject: [patch 09/13] Blackfin NFC Driver: enable Blackfin nand HWECC support
	by default
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:35:02 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	cooloney@kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -puN drivers/mtd/nand/Kconfig~blackfin-nfc-driver-enable-blackfin-nand-hwecc-support-by-default drivers/mtd/nand/Kconfig
--- a/drivers/mtd/nand/Kconfig~blackfin-nfc-driver-enable-blackfin-nand-hwecc-support-by-default
+++ a/drivers/mtd/nand/Kconfig
@@ -104,6 +104,7 @@ config MTD_NAND_BF5XX
 
 config MTD_NAND_BF5XX_HWECC
 	bool "BF5XX NAND Hardware ECC"
+	default y
 	depends on MTD_NAND_BF5XX
 	help
 	  Enable the use of the BF5XX's internal ECC generator when
_
