Received: from liberdade.minaslivre.org ([72.232.18.203])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJaMZ-0004Kc-4N
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 21:50:48 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Fix typo s/parititions/partitions/
Date: Wed, 24 Jun 2009 18:40:46 -0300
Message-Id: <1245879646-10338-1-git-send-email-cascardo@holoscopio.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux@maxim.org.za, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
---
 drivers/mtd/nand/atmel_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 2802992..20c828b 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -534,7 +534,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 							 &num_partitions);
 
 	if ((!partitions) || (num_partitions == 0)) {
-		printk(KERN_ERR "atmel_nand: No parititions defined, or unsupported device.\n");
+		printk(KERN_ERR "atmel_nand: No partitions defined, or unsupported device.\n");
 		res = ENXIO;
 		goto err_no_partitions;
 	}
-- 
1.6.3
