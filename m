Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KIPsw-0002mJ-1J
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 15:22:42 +0000
Date: Mon, 14 Jul 2008 19:20:37 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD] [NAND] fsl_elbc_nand: fix section mismatch with
	CONFIG_MTD_OF_PARTS=y
Message-ID: <20080714152037.GA21062@polina.dev.rtsoft.ru>
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

With CONFIG_MTD_OF_PARTS=y I'm getting this new section mismatch in reference
from the function fsl_elbc_chip_probe() to the function
.devinit.text:of_mtd_parse_partitions()

This patch fixes the mismatch by providing __devinit annotation to the
fsl_elbc_chip_probe() function.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index d6d1ff5..9dff513 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -836,8 +836,8 @@ static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
 	return 0;
 }
 
-static int fsl_elbc_chip_probe(struct fsl_elbc_ctrl *ctrl,
-                               struct device_node *node)
+static int __devinit fsl_elbc_chip_probe(struct fsl_elbc_ctrl *ctrl,
+					 struct device_node *node)
 {
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
 	struct fsl_elbc_mtd *priv;
-- 
1.5.5.4
