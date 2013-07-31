Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4Kfi-0007eG-69
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2013 00:53:50 +0000
Received: by mail-pb0-f48.google.com with SMTP id ma3so95174pbc.21
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 17:53:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 3/6] mtd: nand: eliminate cast
Date: Tue, 30 Jul 2013 17:52:57 -0700
Message-Id: <1375231980-13721-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1375231980-13721-1-git-send-email-computersforpeace@gmail.com>
References: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
 <1375231980-13721-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just make 'res' an int.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 3ff9d36..3f18776 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1370,8 +1370,7 @@ int nand_default_bbt(struct mtd_info *mtd)
 int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 {
 	struct nand_chip *this = mtd->priv;
-	int block;
-	uint8_t res;
+	int block, res;
 
 	block = (int)(offs >> this->bbt_erase_shift);
 	res = bbt_get_entry(this, block);
@@ -1380,7 +1379,7 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 			"(block %d) 0x%02x\n",
 			(unsigned int)offs, block, res);
 
-	switch ((int)res) {
+	switch (res) {
 	case BBT_BLOCK_GOOD:
 		return 0;
 	case BBT_BLOCK_WORN:
-- 
1.7.9.5
