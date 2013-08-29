Received: from usausmgw02.spansion.com ([12.110.209.162])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VF205-0002gD-5X
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 13:11:01 +0000
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: cfi_cmdset_0002: 65 nm changes
Date: Thu, 29 Aug 2013 17:14:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201308291714.49766.Gernot.Hoyler@spansion.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To increase both program throughput and data reliability, Spansion recommends
to operate today's flash devices that are built in 65 nm or smaller process
technology in block write mode. For example, the Spansion S29GL-S family
internally programs data in chunks of 32 bytes. Therefore a writesize of a multiple
of 32 bytes would be fine in general. A value of 512 has been found a good
compromise between maximum throughput (the larger the better) and risk of
data loss during a power failure event (the smaller the better).


Signed-off-by: Gernot Hoyler <Gernot.Hoyler@spansion.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index b8f7b87..9952fde 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -196,9 +196,17 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
+
 	if (cfi->cfiq->BufWriteTimeoutTyp) {
 		pr_debug("Using buffer write method\n" );
 		mtd->_write = cfi_amdstd_write_buffers;
+
+		if (extp->SiliconRevision >= 0x1C) {
+			mtd->writesize = 512;
+			mtd->flags &= ~MTD_BIT_WRITEABLE;
+			printk(KERN_INFO "Setting mtd writesize = 512 bytes\n");
+		}
 	}
 }
 
-- 
1.7.4.2
