Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LXMOC-0000wp-9I
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2009 21:13:14 +0000
Message-Id: <200902112112.n1BLCJ3U010253@imap1.linux-foundation.org>
Subject: [patch for 2.6.29? 3/4] mtd/maps: blackfin async flash maps:
	bfin-async mtd driver needs complex mappings
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 11 Feb 2009 13:12:19 -0800
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

Correct a build error.  bfin-async uses complex mappings and so needs it.

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/maps/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/maps/Kconfig~mtd-maps-blackfin-async-flash-maps-bfin-async-mtd-driver-needs-complex-mappings drivers/mtd/maps/Kconfig
--- a/drivers/mtd/maps/Kconfig~mtd-maps-blackfin-async-flash-maps-bfin-async-mtd-driver-needs-complex-mappings
+++ a/drivers/mtd/maps/Kconfig
@@ -491,7 +491,7 @@ config MTD_PCMCIA_ANONYMOUS
 
 config MTD_BFIN_ASYNC
 	tristate "Blackfin BF533-STAMP Flash Chip Support"
-	depends on BFIN533_STAMP && MTD_CFI
+	depends on BFIN533_STAMP && MTD_CFI && MTD_COMPLEX_MAPPINGS
 	select MTD_PARTITIONS
 	default y
 	help
_
