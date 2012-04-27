Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNiHl-000364-3O
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 10:20:21 +0000
Received: by wibhj13 with SMTP id hj13so329333wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 03:20:18 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: Add a NAND_CMD_STATUS when using write verification
Date: Fri, 27 Apr 2012 12:19:31 +0200
Message-Id: <1335521971-5046-1-git-send-email-hechtb@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To make sure the NAND chip is properly programmed we need a status
command before each page write. When CONFIG_MTD_NAND_VERIFY_WRITE=y this
assumption is broken when writing multiple pages consecutively. This
patch fixes this.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8a393f9..58335cd 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2101,6 +2101,9 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	if (chip->verify_buf(mtd, buf, mtd->writesize))
 		return -EIO;
+
+	/* Make sure the next page prog is preceded by a status read */
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
 #endif
 	return 0;
 }
-- 
1.7.5.4
