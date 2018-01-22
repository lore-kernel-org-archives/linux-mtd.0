Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1edYYp-0006yc-W0
 for linux-mtd@lists.infradead.org; Mon, 22 Jan 2018 09:38:41 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: Make sure the device supports erase operations in
 mtd_erase()
Date: Mon, 22 Jan 2018 10:38:01 +0100
Message-Id: <20180122093801.19618-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some devices do not implement ->_erase() or have an invalid ->erasesize
value. In this case, mtd_erase() should return -ENOTSUPP.

Note that the test is not done on the MTD_NO_ERASE flag because this
flag means 'erasing a block before writing to it is unnecessary',
not 'the erase operation is not supported'. Actually, some drivers are
setting the MTD_NO_ERASE flag but still implementing the ->_erase()
hook and setting a valid ->erasesize value.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/mtdcore.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d7ab091b36b2..f24144cbc99c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -971,10 +971,14 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
  */
 int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
+	if (!mtd->erasesize || !mtd->_erase)
+		return -ENOTSUPP;
+
 	if (instr->addr >= mtd->size || instr->len > mtd->size - instr->addr)
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+
 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 	if (!instr->len) {
 		instr->state = MTD_ERASE_DONE;
-- 
2.11.0
