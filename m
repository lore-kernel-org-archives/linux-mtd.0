Received: from smtp-out-138.synserver.de ([212.40.180.138])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PGbUU-0001f0-DM
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2010 18:03:19 +0000
From: Lars-Peter Clausen <lars@metafoo.de>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] MTD: NAND: jz4740: Make 'struct platform_driver
	jz_nand_driver' static
Date: Thu, 11 Nov 2010 19:02:47 +0100
Message-Id: <1289498568-12191-1-git-send-email-lars@metafoo.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/mtd/nand/jz4740_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index 67343fc..c9e2a59 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -489,7 +489,7 @@ static int __devexit jz_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver jz_nand_driver = {
+static struct platform_driver jz_nand_driver = {
 	.probe = jz_nand_probe,
 	.remove = __devexit_p(jz_nand_remove),
 	.driver = {
-- 
1.5.6.5
