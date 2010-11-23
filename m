Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=VA3EHSOBE005.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PKy53-0007S7-An
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2010 18:59:08 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mxc_nand: Fix warning on nr_parts unused variable
Date: Tue, 23 Nov 2010 17:02:13 -0200
Message-ID: <1290538933-12607-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dwmw2@infradead.org,
	u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If CONFIG_MTD_PARTITIONS is not selected, then the following warning is generated:

  CC      drivers/mtd/nand/mxc_nand.o
drivers/mtd/nand/mxc_nand.c: In function 'mxcnd_probe':
drivers/mtd/nand/mxc_nand.c:1014: warning: unused variable 'nr_parts'

Fix it by marking nr_parts as __maybe_unused.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 214b03a..ef932ba 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1009,7 +1009,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	struct mxc_nand_platform_data *pdata = pdev->dev.platform_data;
 	struct mxc_nand_host *host;
 	struct resource *res;
-	int err = 0, nr_parts = 0;
+	int err = 0, __maybe_unused nr_parts = 0;
 	struct nand_ecclayout *oob_smallpage, *oob_largepage;
 
 	/* Allocate memory for MTD device structure and private data */
-- 
1.6.0.4
