Received: from mail-db8lp0185.outbound.messaging.microsoft.com
 ([213.199.154.185] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vgqkj-0007oN-2H
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 06:50:09 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 4/8] mtd: gpmi: rename the functions from gpmi_nfc_* to
 gpmi_nand_*
Date: Thu, 14 Nov 2013 14:25:47 +0800
Message-ID: <1384410351-2169-5-git-send-email-b32955@freescale.com>
In-Reply-To: <1384410351-2169-1-git-send-email-b32955@freescale.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The gpmi_nfc_* is the legacy name. In order to avoid the confusion,
The patch renames the gpmi_nfc_* functions to gpmi_nand_*.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 1faf198..36ef60a 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1561,7 +1561,7 @@ static int gpmi_set_geometry(struct gpmi_nand_data *this)
 	return gpmi_alloc_dma_buffer(this);
 }
 
-static void gpmi_nfc_exit(struct gpmi_nand_data *this)
+static void gpmi_nand_exit(struct gpmi_nand_data *this)
 {
 	nand_release(&this->mtd);
 	gpmi_free_dma_buffer(this);
@@ -1604,7 +1604,7 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	return 0;
 }
 
-static int gpmi_nfc_init(struct gpmi_nand_data *this)
+static int gpmi_nand_init(struct gpmi_nand_data *this)
 {
 	struct mtd_info  *mtd = &this->mtd;
 	struct nand_chip *chip = &this->nand;
@@ -1668,7 +1668,7 @@ static int gpmi_nfc_init(struct gpmi_nand_data *this)
 	return 0;
 
 err_out:
-	gpmi_nfc_exit(this);
+	gpmi_nand_exit(this);
 	return ret;
 }
 
@@ -1725,7 +1725,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_nfc_init;
 
-	ret = gpmi_nfc_init(this);
+	ret = gpmi_nand_init(this);
 	if (ret)
 		goto exit_nfc_init;
 
@@ -1745,7 +1745,7 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
 
-	gpmi_nfc_exit(this);
+	gpmi_nand_exit(this);
 	release_resources(this);
 	return 0;
 }
-- 
1.7.2.rc3
