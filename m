Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1U-00069B-Qi
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:25 +0000
Received: by pbbrq8 with SMTP id rq8so14273168pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:23 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/9] mtd: nand: remove redundant ID read
Date: Mon, 24 Sep 2012 20:40:48 -0700
Message-Id: <1348544455-17656-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
References: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
Cc: Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of reading 2 bytes then later 8 bytes, we can simply read all 8
bytes from the start.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 30588eb..f725247 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2898,7 +2898,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 
-	for (i = 0; i < 2; i++)
+	/* Read entire ID string */
+	for (i = 0; i < 8; i++)
 		id_data[i] = chip->read_byte(mtd);
 
 	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
@@ -2922,13 +2923,6 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			goto ident_done;
 	}
 
-	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
-
-	/* Read entire ID string */
-
-	for (i = 0; i < 8; i++)
-		id_data[i] = chip->read_byte(mtd);
-
 	if (!type->name)
 		return ERR_PTR(-ENODEV);
 
-- 
1.7.11.3
