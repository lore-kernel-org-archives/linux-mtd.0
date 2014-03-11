Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNIjp-00050M-8n
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 09:12:41 +0000
Received: by mail-ig0-f182.google.com with SMTP id uy17so10679965igb.3
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 02:12:18 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: gpmi-nand: use erased-page bitflip check
Date: Tue, 11 Mar 2014 02:11:52 -0700
Message-Id: <1394529112-9659-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>, Pekon Gupta <pekon@ti.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GPMI NAND cannot correct bitflips in unprogrammed pages.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Untested, but perhaps this can replace the need for [1]

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index bb77f750e75a..f7da1d56a1b2 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1698,6 +1698,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	chip->badblock_pattern	= &gpmi_bbt_descr;
 	chip->block_markbad	= gpmi_block_markbad;
 	chip->options		|= NAND_NO_SUBPAGE_WRITE;
+	chip->options		|= NAND_ECC_NEED_CHECK_FF;
 	if (of_get_nand_on_flash_bbt(this->dev->of_node))
 		chip->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
 
-- 
1.8.3.2
