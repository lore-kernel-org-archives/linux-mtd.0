Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LXMOE-000149-2r
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2009 21:13:05 +0000
Message-Id: <200902112112.n1BLCKlR010256@imap1.linux-foundation.org>
Subject: [patch for 2.6.29? 4/4] mtd/maps: blackfin async flash maps: fix up
	memory leak
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

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/maps/bfin-async-flash.c |    1 +
 1 file changed, 1 insertion(+)

diff -puN drivers/mtd/maps/bfin-async-flash.c~mtd-maps-blackfin-async-flash-maps-fix-up-memory-leak drivers/mtd/maps/bfin-async-flash.c
--- a/drivers/mtd/maps/bfin-async-flash.c~mtd-maps-blackfin-async-flash-maps-fix-up-memory-leak
+++ a/drivers/mtd/maps/bfin-async-flash.c
@@ -170,6 +170,7 @@ static int __devinit bfin_flash_probe(st
 	if (ret > 0) {
 		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using commandline partition definition\n");
 		add_mtd_partitions(state->mtd, pdata->parts, ret);
+		kfree(pdata->parts);
 
 	} else if (pdata->nr_parts) {
 		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using board partition definition\n");
_
