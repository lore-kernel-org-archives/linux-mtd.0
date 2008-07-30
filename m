Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOHS5-0000sr-S9
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 19:35:15 +0000
Message-Id: <200807301935.m6UJZ3Xs012306@imap1.linux-foundation.org>
Subject: [patch 10/13] Blackfin NFC Driver: use standard dev_err() rather than
	printk()
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:35:03 -0700
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

 drivers/mtd/nand/bf5xx_nand.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-use-standard-dev_err-rather-than-printk drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-use-standard-dev_err-rather-than-printk
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -684,8 +684,7 @@ static int __devinit bf5xx_nand_probe(st
 	dev_dbg(&pdev->dev, "(%p)\n", pdev);
 
 	if (peripheral_request_list(bfin_nfc_pin_req, DRV_NAME)) {
-		printk(KERN_ERR DRV_NAME
-		": Requesting Peripherals failed\n");
+		dev_err(&pdev->dev, "requesting Peripherals failed\n");
 		return -EFAULT;
 	}
 
_
