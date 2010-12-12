Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PRhE8-0002bP-Dm
	for linux-mtd@lists.infradead.org; Sun, 12 Dec 2010 08:24:17 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: choose correct chip name (ONFI bug)
Date: Sun, 12 Dec 2010 00:23:32 -0800
Message-ID: <1292142213-645-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Florian Fainelli <ffainelli@freebox.fr>,
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

We have the order of the conditional wrong for choosing the ONFI chip name
vs. the ID table name. Without this fix, we will almost *always* choose a
NULL string to print out instead of the correct one.

This has already been suggested by Matthieu Castet.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 33550c4..38b5eb0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3164,7 +3164,7 @@ ident_done:
 	printk(KERN_INFO "NAND device: Manufacturer ID:"
 		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
 		nand_manuf_ids[maf_idx].name,
-	chip->onfi_version ? type->name : chip->onfi_params.model);
+		chip->onfi_version ? chip->onfi_params.model : type->name);
 
 	return type;
 }
-- 
1.7.0.4
