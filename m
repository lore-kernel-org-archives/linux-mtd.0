Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu0lW-00016v-Ib
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 16:18:27 +0000
Received: by qgbb65 with SMTP id b65so44065790qgb.2
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 08:18:05 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 1/6] mtd: pxa3xx_nand: Increase the initial chunk size
Date: Wed,  4 Nov 2015 13:13:41 -0300
Message-Id: <1446653626-14802-2-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The chunk size represents the size of the data chunks, which
is used by the controllers that allow to split transfered data.

However, the initial chunk size is used in a non-splitted way,
during device identification. Therefore, it must be large enough
for all the NAND commands issued during device identification.
This includes NAND_CMD_PARAM which was recently changed to
transfer up to 2048 bytes (for the redundant parameter pages).

Thus, the initial chunk size should be 2048 as well.

On Armada 370/XP platforms (NFCv2) booted without the keep-config
devicetree property, this commit fixes a timeout on the NAND_CMD_PARAM
command:

  [..]
  pxa3xx-nand f10d0000.nand: This platform can't do DMA on this device
  pxa3xx-nand f10d0000.nand: Wait time out!!!
  nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x38
  nand: Micron MT29F8G08ABABAWP
  nand: 1024 MiB, SLC, erase size: 512 KiB, page size: 4096, OOB size: 224

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index e453ae9a17fa..3d3ae903eec8 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1592,7 +1592,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 		goto KEEP_CONFIG;
 
 	/* Set a default chunk size */
-	info->chunk_size = 512;
+	info->chunk_size = PAGE_CHUNK_SIZE;
 
 	ret = pxa3xx_nand_config_flash(info);
 	if (ret)
-- 
2.5.2
