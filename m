Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbOIX-0000gh-Qy
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 02:45:10 +0000
From: <b35362@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 1/2] mtd/nand : don't free the global data
	fsl_lbc_ctrl_dev->nand in fsl_elbc_chip_remove()
Date: Tue, 28 Jun 2011 09:50:51 +0800
Message-ID: <1309225852-1664-1-git-send-email-b35362@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Liu Shuo <b35362@freescale.com>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Liu Shuo <b35362@freescale.com>

The global data fsl_lbc_ctrl_dev->nand don't have to be freed in
fsl_elbc_chip_remove(). The right place to do that is in fsl_elbc_nand_remove()
if elbc_fcm_ctrl->counter is zero.

Signed-off-by: Liu Shuo <b35362@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 0bb254c..a212116 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -829,7 +829,6 @@ static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
 
 	elbc_fcm_ctrl->chips[priv->bank] = NULL;
 	kfree(priv);
-	kfree(elbc_fcm_ctrl);
 	return 0;
 }
 
-- 
1.7.1
