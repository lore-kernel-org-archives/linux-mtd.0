Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9dgh-0002Ph-Nl
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 14:35:56 +0000
Received: by wgbdr1 with SMTP id dr1so591715wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2012 07:35:52 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] support ONFI multi lun NAND
Date: Mon, 19 Mar 2012 15:35:25 +0100
Message-Id: <1332167725-7792-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With onfi a flash is organized into one or more logical units (LUNs).
A logical unit (LUN) is the minimum unit that can independently execute
commands and report status.

Mtd does not exploit LUN, so make it see a big single flash where size is
lun_size * number_of_lun.

Without this patch MT29F8G08ADBDAH4 size is 512MB instead of 1GB.

Signed-off-by: Matthieu Castet <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8a393f9..04c1baf 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2898,7 +2898,8 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 	mtd->erasesize = le32_to_cpu(p->pages_per_block) * mtd->writesize;
 	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
-	chip->chipsize = (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->erasesize;
+	chip->chipsize = (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->erasesize
+					* p->lun_count;
 	*busw = 0;
 	if (le16_to_cpu(p->features) & 1)
 		*busw = NAND_BUSWIDTH_16;
-- 
1.7.9.1
