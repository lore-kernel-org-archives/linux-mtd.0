From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v2 2/2] mtd: nand: Fix some function description mismatches in
 core.c
Date: Thu, 29 Mar 2018 09:34:59 +0800
Message-ID: <1522287299-12620-3-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1522287299-12620-1-git-send-email-xiaolei.li@mediatek.com>
References: <1522287299-12620-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In core.c, some function descriptions do not match function
definitions. Just fix these mismatches.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index f237a68..d0cd6f8 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -51,7 +51,7 @@ bool nanddev_isbad(struct nand_device *nand, const struct nand_pos *pos)
 /**
  * nanddev_markbad() - Mark a block as bad
  * @nand: NAND device
- * @block: block to mark bad
+ * @pos: position of the block to mark bad
  *
  * Mark a block bad. This function is updating the BBT if available and
  * calls the low-level markbad hook (nand->ops->markbad()).
@@ -117,9 +117,9 @@ bool nanddev_isreserved(struct nand_device *nand, const struct nand_pos *pos)
 /**
  * nanddev_erase() - Erase a NAND portion
  * @nand: NAND device
- * @block: eraseblock to erase
+ * @pos: position of the block to erase
  *
- * Erases @block if it's not bad.
+ * Erases the block if it's not bad.
  *
  * Return: 0 in case of success, a negative error code otherwise.
  */
@@ -179,11 +179,11 @@ int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo)
 /**
  * nanddev_init() - Initialize a NAND device
  * @nand: NAND device
- * @memorg: NAND memory organization descriptor
  * @ops: NAND device operations
+ * @owner: NAND device owner
  *
- * Initializes a NAND device object. Consistency checks are done on @memorg and
- * @ops. Also takes care of initializing the BBT.
+ * Initializes a NAND device object. Consistency checks are done on @ops and
+ * @nand->memorg. Also takes care of initializing the BBT.
  *
  * Return: 0 in case of success, a negative error code otherwise.
  */
-- 
1.9.1
