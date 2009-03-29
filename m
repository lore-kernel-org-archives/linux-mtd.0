Received: from cathcart.site5.com ([74.54.107.137])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LnseR-0001DH-S0
	for linux-mtd@lists.infradead.org; Sun, 29 Mar 2009 10:54:12 +0000
From: Mike Rapoport <mike@compulab.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: maps/pxa2xx_flash: fix build breakage
Date: Sun, 29 Mar 2009 13:53:53 +0300
Message-Id: <1238324033-30754-1-git-send-email-mike@compulab.co.il>
Cc: nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  LD      init/built-in.o
  LD      .tmp_vmlinux1
`pxa2xx_flash_remove' referenced in section `.data' of
drivers/built-in.o: defined in discarded section `.exit.text' of
drivers/built-in.o
make: *** [.tmp_vmlinux1] Error 1

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/mtd/maps/pxa2xx-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index e9026cb..572d32f 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -117,7 +117,7 @@ static int __init pxa2xx_flash_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __exit pxa2xx_flash_remove(struct platform_device *dev)
+static int __devexit pxa2xx_flash_remove(struct platform_device *dev)
 {
 	struct pxa2xx_flash_info *info = platform_get_drvdata(dev);
 
-- 
1.5.6.4
