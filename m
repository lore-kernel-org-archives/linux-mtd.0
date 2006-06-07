Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fnvfc-0006hs-Cv
	for linux-mtd@lists.infradead.org; Wed, 07 Jun 2006 06:54:00 -0400
Date: Wed, 7 Jun 2006 14:54:37 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix nand_fill_oob
Message-Id: <20060607145437.e737171b.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folks,

inlined is the fix to nand_fill_oob function which prevents it from writing garbage to OOB buffer when ops->len < ops->ooblen.

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77406fc..203693b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1400,7 +1510,7 @@ static int nand_write_page(struct mtd_in
 static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob,
 				  struct mtd_oob_ops *ops)
 {
-	size_t len = ops->ooblen;
+	size_t len = ops->len;
 
 	switch(ops->mode) {
 
