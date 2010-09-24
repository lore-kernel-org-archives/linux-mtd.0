Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz6UN-0002Hs-Op
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 11:30:52 +0000
Received: by qyk34 with SMTP id 34so4203004qyk.15
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 04:30:50 -0700 (PDT)
From: Huang Shijie <shijie8@gmail.com>
To: David.Woodhouse@intel.com
Subject: [PATCH] mtd : add init_size hook for NAND driver
Date: Fri, 24 Sep 2010 19:34:23 +0800
Message-Id: <1285328063-7982-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not all the NAND devices have all the information in additional
id bytes.

So add a hook in the nand_chip{} is a good method to calculate the
right value of oobsize, erasesize and so on.

Without the hook,you will get the wrong value, and you have to hack
in the ->scan_bbt() to change the wrong value which make the code
mess.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    6 ++++--
 include/linux/mtd/nand.h     |    5 +++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d551ddd..0288f1f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2848,8 +2848,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->chipsize = (uint64_t)type->chipsize << 20;
 
-	/* Newer devices have all the information in additional id bytes */
-	if (!type->pagesize) {
+	if (!type->pagesize && chip->init_size) {
+		/* set the pagesize, oobsize, erasesize by the driver*/
+		busw = chip->init_size(mtd, chip);
+	} else if (!type->pagesize) {
 		int extid;
 		/* The 3rd id byte holds MLC / multichip data */
 		chip->cellinfo = id_data[2];
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 102e12c..2296a7a 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -332,6 +332,9 @@ struct nand_buffers {
  * @block_markbad:	[REPLACEABLE] mark the block bad
  * @cmd_ctrl:		[BOARDSPECIFIC] hardwarespecific funtion for controlling
  *			ALE/CLE/nCE. Also used to write command and address
+ * @init_size:		[BOARDSPECIFIC] hardwarespecific funtion for setting
+ *			mtd->oobsize, mtd->writesize and so on.
+ *			Return with the bus width.
  * @dev_ready:		[BOARDSPECIFIC] hardwarespecific function for accesing device ready/busy line
  *			If set to NULL no access to ready/busy is available and the ready/busy information
  *			is read from the chip status register
@@ -386,6 +389,8 @@ struct nand_chip {
 	int		(*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
 				    unsigned int ctrl);
+	int		(*init_size)(struct mtd_info *mtd,
+					struct nand_chip *this);
 	int		(*dev_ready)(struct mtd_info *mtd);
 	void		(*cmdfunc)(struct mtd_info *mtd, unsigned command, int column, int page_addr);
 	int		(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this);
-- 
1.7.2.2
