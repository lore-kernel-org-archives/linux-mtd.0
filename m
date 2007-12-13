Date: Thu, 13 Dec 2007 11:49:52 +0900
From: Sheng Yongjie <samsheng@trident.com.cn>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD][OneNAND] Use the u_char instead of char in oobbuf
Message-ID: <20071213024952.GA19145@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In function onenand_verify_oob, local variable oobbuf shall be unsigned char.

In the case of a value is >= 0x80, it's unequal in comparing the value in an unsigned char and signed char.

Signed-off-by: Sheng Yongjie (Sam) <samsheng@trident.com.cn>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index f2bb276..52cce5c 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1217,7 +1217,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 static int onenand_verify_oob(struct mtd_info *mtd, const u_char *buf, loff_t to)
 {
 	struct onenand_chip *this = mtd->priv;
-	char oobbuf[64];
+	u_char oobbuf[64];
 	int status, i;
 
 	this->command(mtd, ONENAND_CMD_READOOB, to, mtd->oobsize);
-- 
1.5.0.6
