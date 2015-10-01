Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhfK6-0001I3-Ep
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 14:59:07 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Huang Shijie <shijie.huang@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] mtd: nand: remove unused ->init_size() hook
Date: Thu,  1 Oct 2015 16:58:27 +0200
Message-Id: <1443711507-1875-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ->init_size() hook was introduced to let NAND controller drivers
support NAND devices that could not be described in the nand_ids table.
Since then, the core has added support for extended-id parsing and
full-id description, thus allowing to describe pretty much all existing
NANDs.
Moreover, this hook is not used by any mainline driver, and should not be
used by new drivers, because detecting the NAND chip is not something
controller specific.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 5 +----
 include/linux/mtd/nand.h     | 6 ------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 37c0d9d..a8230b1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3836,10 +3836,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->chipsize = (uint64_t)type->chipsize << 20;
 
-	if (!type->pagesize && chip->init_size) {
-		/* Set the pagesize, oobsize, erasesize by the driver */
-		busw = chip->init_size(mtd, chip, id_data);
-	} else if (!type->pagesize) {
+	if (!type->pagesize) {
 		/* Decode parameters from extended ID */
 		nand_decode_ext_id(mtd, chip, id_data, &busw);
 	} else {
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c4d8e30..50e1f94 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -556,10 +556,6 @@ struct nand_buffers {
  * @block_markbad:	[REPLACEABLE] mark a block bad
  * @cmd_ctrl:		[BOARDSPECIFIC] hardwarespecific function for controlling
  *			ALE/CLE/nCE. Also used to write command and address
- * @init_size:		[BOARDSPECIFIC] hardwarespecific function for setting
- *			mtd->oobsize, mtd->writesize and so on.
- *			@id_data contains the 8 bytes values of NAND_CMD_READID.
- *			Return with the bus width.
  * @dev_ready:		[BOARDSPECIFIC] hardwarespecific function for accessing
  *			device ready/busy line. If set to NULL no access to
  *			ready/busy is available and the ready/busy information
@@ -658,8 +654,6 @@ struct nand_chip {
 	int (*block_bad)(struct mtd_info *mtd, loff_t ofs, int getchip);
 	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	void (*cmd_ctrl)(struct mtd_info *mtd, int dat, unsigned int ctrl);
-	int (*init_size)(struct mtd_info *mtd, struct nand_chip *this,
-			u8 *id_data);
 	int (*dev_ready)(struct mtd_info *mtd);
 	void (*cmdfunc)(struct mtd_info *mtd, unsigned command, int column,
 			int page_addr);
-- 
2.1.4
