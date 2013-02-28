Received: from smtp17.mail.ru ([94.100.176.154])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UAyRm-00052W-HE
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 08:02:36 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: nand_base: Removed unnecessary cleaning
 "onfi_version" variable
Date: Thu, 28 Feb 2013 12:02:20 +0400
Message-Id: <1362038541-22406-2-git-send-email-shc_work@mail.ru>
In-Reply-To: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
References: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Variable "onfi_version" is already set to zero before nand_flash_detect_onfi()
call, so additional cleaning is not necessary.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/nand_base.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 13c89c9..382b857 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2888,8 +2888,6 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->onfi_version = 20;
 	else if (val & (1 << 1))
 		chip->onfi_version = 10;
-	else
-		chip->onfi_version = 0;
 
 	if (!chip->onfi_version) {
 		pr_info("%s: unsupported ONFI version: %d\n", __func__, val);
-- 
1.7.3.4
