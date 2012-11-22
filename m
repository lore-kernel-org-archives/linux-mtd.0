Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tbafg-0000xp-Un
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 17:34:42 +0000
Received: by mail-bk0-f49.google.com with SMTP id jm19so2317494bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2012 09:34:39 -0800 (PST)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V2] mtd nand : print flash size during detection
Date: Thu, 22 Nov 2012 18:33:40 +0100
Message-Id: <1353605620-29549-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This help to detect bad flash identification in case the size is not present
on the name (ONFI).

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 16e95e7..8eda5db 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3285,10 +3285,10 @@ ident_done:
 		chip->cmdfunc = nand_command_lp;
 
 	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
-		" page size: %d, OOB size: %d\n",
+		" %dMiB, page size: %d, OOB size: %d\n",
 		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
 		chip->onfi_version ? chip->onfi_params.model : type->name,
-		mtd->writesize, mtd->oobsize);
+		(int)(chip->chipsize >> 20), mtd->writesize, mtd->oobsize);
 
 	return type;
 }
-- 
1.7.10.4
