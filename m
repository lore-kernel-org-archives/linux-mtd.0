Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK6LC-00071K-Qu
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 11:13:02 +0000
Received: by wibhm17 with SMTP id hm17so489988wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 04:12:57 -0700 (PDT)
Sender: "Ivantchek ." <ivantchek@gmail.com>
From: Ivan Djelic <ivan.djelic@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: omap: fix race condition in omap_wait()
Date: Tue, 17 Apr 2012 13:11:53 +0200
Message-Id: <1334661113-24709-1-git-send-email-ivan.djelic@parrot.com>
Cc: ivan.djelic@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a context switch occurs in function omap_wait() just before the
while loop is entered, then upon return from context switch the
timeout may already have elapsed: in that case, status is never
read from NAND device, and omap_wait() returns an error.
This failure has been experimentally observed during stress tests.

This patch ensures a NAND status read is always performed before
returning, as in the generic nand_wait() function.

Signed-off-by: Ivan Djelic <ivan.djelic@parrot.com>
---
 drivers/mtd/nand/omap2.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c2b0bba..45c6205 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -879,7 +879,7 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 							mtd);
 	unsigned long timeo = jiffies;
-	int status = NAND_STATUS_FAIL, state = this->state;
+	int status, state = this->state;
 
 	if (state == FL_ERASING)
 		timeo += (HZ * 400) / 1000;
@@ -894,6 +894,8 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip *chip)
 			break;
 		cond_resched();
 	}
+
+	status = gpmc_nand_read(info->gpmc_cs, GPMC_NAND_DATA);
 	return status;
 }
 
-- 
1.7.10
