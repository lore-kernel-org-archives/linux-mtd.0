Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QSCnR-0002It-RA
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 18:39:06 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: remove unnecessary TODO
Date: Thu, 2 Jun 2011 11:38:26 -0700
Message-ID: <1307039906-6462-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Florian Fainelli <ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I believe this TODO was unnecessary back when it was introduced:
	commit d1e1f4e42b5df063712ca2926e50c07b95c96b96
	mtd: nand: add support for reading ONFI parameters...

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a46e9bb..7781988 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3151,7 +3151,6 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
-	/* TODO onfi flash name */
 	printk(KERN_INFO "NAND device: Manufacturer ID:"
 		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
 		nand_manuf_ids[maf_idx].name,
-- 
1.7.0.4
