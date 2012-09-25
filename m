Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1T-000691-3O
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:24 +0000
Received: by dajq27 with SMTP id q27so278434daj.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:21 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/9] mtd: nand: remove unnecessary variable
Date: Mon, 24 Sep 2012 20:40:47 -0700
Message-Id: <1348544455-17656-2-git-send-email-computersforpeace@gmail.com>
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

We don't actually use the 'ret' variable; we set it, test it, and then it dies.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 88f671c..30588eb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2872,7 +2872,6 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 {
 	int i, maf_idx;
 	u8 id_data[8];
-	int ret;
 
 	/* Select the device */
 	chip->select_chip(mtd, 0);
@@ -2919,8 +2918,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
 		/* Check is chip is ONFI compliant */
-		ret = nand_flash_detect_onfi(mtd, chip, &busw);
-		if (ret)
+		if (nand_flash_detect_onfi(mtd, chip, &busw))
 			goto ident_done;
 	}
 
-- 
1.7.11.3
