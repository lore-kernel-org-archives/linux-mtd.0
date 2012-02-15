From: Huang Shijie <b32955@freescale.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] mtd: fix the wrong check condition
Date: Wed, 15 Feb 2012 18:33:28 +0800
Message-ID: <1329302008-10228-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we use `||` check condition, many NAND chips which are not
ONFI nands have to do the ONFI detection.

Use `&&` here to detect the ONFI NAND when we can not find any type
in the nand_flash_ids.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8a393f9..90020a5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2966,7 +2966,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			break;
 
 	chip->onfi_version = 0;
-	if (!type->name || !type->pagesize) {
+	if (!type->name && !type->pagesize) {
 		/* Check is chip is ONFI compliant */
 		ret = nand_flash_detect_onfi(mtd, chip, &busw);
 		if (ret)
-- 
1.7.3.2
