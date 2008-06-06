Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4dPq-0002IP-MW
	for linux-mtd@lists.infradead.org; Fri, 06 Jun 2008 14:59:43 +0000
Date: Fri, 6 Jun 2008 18:59:40 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: NAND: fsl_elbc_nand: fix section mismatch between
	probe and remove
Message-ID: <20080606145940.GA25327@polina.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

WARNING: drivers/mtd/nand/built-in.o(.devinit.text+0x114): Section mismatch
in reference from the function fsl_elbc_ctrl_probe() to the function
.devexit.text:fsl_elbc_ctrl_remove()

__devinit functions should not call functions with __devexit. Since probe
function calls remove in case of errors, we want to remove __devexit
attribute from it.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 4b69aac..1b06d29 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -917,7 +917,7 @@ static int __devinit fsl_elbc_ctrl_init(struct fsl_elbc_ctrl *ctrl)
 	return 0;
 }
 
-static int __devexit fsl_elbc_ctrl_remove(struct of_device *ofdev)
+static int fsl_elbc_ctrl_remove(struct of_device *ofdev)
 {
 	struct fsl_elbc_ctrl *ctrl = dev_get_drvdata(&ofdev->dev);
 	int i;
@@ -1041,7 +1041,7 @@ static struct of_platform_driver fsl_elbc_ctrl_driver = {
 	},
 	.match_table = fsl_elbc_match,
 	.probe = fsl_elbc_ctrl_probe,
-	.remove = __devexit_p(fsl_elbc_ctrl_remove),
+	.remove = fsl_elbc_ctrl_remove,
 };
 
 static int __init fsl_elbc_init(void)
-- 
1.5.5.1
