Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjXf0-0004hs-Sl
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 15:26:36 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd gpmi-nand: Fix read page when reading to vmalloced area
Date: Tue, 26 Jun 2012 17:26:16 +0200
Message-Id: <1340724377-22279-1-git-send-email-s.hauer@pengutronix.de>
Cc: Subodh Nijsure <snijsure@grid-net.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 stable@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 kernel@pengutronix.de, Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The gpmi-nand driver uses virt_addr_valid() to check whether a buffer
is suitable for dma. If it's not, a driver allocated buffer is used
instead. Then after a page read the driver allocated buffer must be
copied to the user supplied buffer. This does not happen since:

commit 7725cc85932bd02dd12c23108e0ef748c551ccba
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Wed May 2 10:15:02 2012 -0700

    mtd: gpmi-nand: utilize oob_requested parameter

    Don't read OOB if the caller didn't request it.

    Signed-off-by: Brian Norris <computersforpeace@gmail.com>
    Acked-by: Huang Shijie <b32955@freescale.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

This patch fixes this. The bug is encountered with UBI which uses a vmalloced
buffer for the volume table.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Cc: stable@vger.kernel.org
Cc: Huang Shijie <b32955@freescale.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Subodh Nijsure <snijsure@grid-net.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 6bb6f48..0179685 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -920,12 +920,12 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		 */
 		memset(chip->oob_poi, ~0, mtd->oobsize);
 		chip->oob_poi[0] = ((uint8_t *) auxiliary_virt)[0];
-
-		read_page_swap_end(this, buf, mtd->writesize,
-				this->payload_virt, this->payload_phys,
-				nfc_geo->payload_size,
-				payload_virt, payload_phys);
 	}
+
+	read_page_swap_end(this, buf, mtd->writesize,
+			this->payload_virt, this->payload_phys,
+			nfc_geo->payload_size,
+			payload_virt, payload_phys);
 exit_nfc:
 	return ret;
 }
-- 
1.7.10
