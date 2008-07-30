Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOHS2-0000kg-Et
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 19:35:11 +0000
Message-Id: <200807301935.m6UJZ0bK012285@imap1.linux-foundation.org>
Subject: [patch 05/13] Blackfin NFC Driver: fix bug - do not clobber the
	status from the first 256 bytes if operating on 512 pages
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:34:59 -0700
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

Singed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-fix-bug-do-not-clobber-the-status-from-the-first-256-bytes-if-operating-on-512-pages drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-fix-bug-do-not-clobber-the-status-from-the-first-256-bytes-if-operating-on-512-pages
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -273,7 +273,7 @@ static int bf5xx_nand_correct_data(struc
 		dat += 256;
 		read_ecc += 8;
 		calc_ecc += 8;
-		ret = bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
+		ret |= bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
 	}
 
 	return ret;
_
