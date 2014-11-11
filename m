Received: from mail-bl2on0134.outbound.protection.outlook.com ([65.55.169.134]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoDtR-00070D-KV
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 16:02:10 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <computersforpeace@gmail.com>
Subject: [PATCH] mtd: gpmi: Remove noisy error message
Date: Tue, 11 Nov 2014 14:01:31 -0200
Message-ID: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mx28evk board has a socket for NAND flash that comes with no NAND flash
populated, and then we get this message on every boot:

[    1.657603] gpmi-nand 8000c000.gpmi-nand: driver registration failed: -19

,which is not very helpful, so get rid of this error message.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 959cb9b..1ecf0e3 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1828,7 +1828,6 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 exit_nfc_init:
 	release_resources(this);
 exit_acquire_resources:
-	dev_err(this->dev, "driver registration failed: %d\n", ret);
 
 	return ret;
 }
-- 
1.9.1
