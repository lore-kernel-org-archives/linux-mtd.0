Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRePo-0007zo-Gr
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:14:33 +0000
Received: by padet14 with SMTP id et14so3420900pad.0
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:14:11 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/5] mtd: nand_bbt: fix theoretical integer overflow in BBT
 write
Date: Sat, 28 Feb 2015 02:13:13 -0800
Message-Id: <1425118393-25179-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
References: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This statement was written with a cast-to-loff_t to be sure to have a
full 64-bit mask. However, we don't account for the fact that
'1 << this->bbt_erase_shift' might already overflow.

This will not be a problem in practice, since eraseblocks should never
be anywhere near 4GiB. But we can do this for completeness, and quiet
Coverity in the meantime. CID #1226806.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 516db2c4524b..2c4fa1a17031 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -719,7 +719,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		/* Must we save the block contents? */
 		if (td->options & NAND_BBT_SAVECONTENT) {
 			/* Make it block aligned */
-			to &= ~((loff_t)((1 << this->bbt_erase_shift) - 1));
+			to &= ~(((loff_t)1 << this->bbt_erase_shift) - 1);
 			len = 1 << this->bbt_erase_shift;
 			res = mtd_read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
-- 
2.1.0
