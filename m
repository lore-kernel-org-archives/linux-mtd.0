Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOjEl-0005kz-Fg
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 07:10:17 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 05/12] mtd: nand: print out the cell information for nand
 chip
Date: Wed, 25 Sep 2013 14:58:14 +0800
Message-ID: <1380092301-21924-6-git-send-email-b32955@freescale.com>
In-Reply-To: <1380092301-21924-1-git-send-email-b32955@freescale.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Print out the cell information for nand chip.

(Since the message is too long, this patch also splits the log
with two separate pr_info())

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 94d9084..b94309b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3460,11 +3460,14 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
-	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
-		" %dMiB, page size: %d, OOB size: %d\n",
+	pr_info("NAND device: Manufacturer ID: 0x%02x,"
+			"Chip ID: 0x%02x (%s %s) \n",
 		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
-		chip->onfi_version ? chip->onfi_params.model : type->name,
-		(int)(chip->chipsize >> 20), mtd->writesize, mtd->oobsize);
+		chip->onfi_version ? chip->onfi_params.model : type->name);
+
+	pr_info("NAND device: %dMiB, %s, page size: %d, OOB size: %d\n",
+		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
+		mtd->writesize, mtd->oobsize);
 
 	return type;
 }
-- 
1.7.1
