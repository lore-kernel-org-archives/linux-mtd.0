Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csRtR-0004EY-LI
 for linux-mtd@lists.infradead.org; Mon, 27 Mar 2017 10:28:59 +0000
From: Sekhar Nori <nsekhar@ti.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Muralidharan Karicheri <m-karicheri2@ti.com>,
 Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] Revert "mtd: davinci-nand: disable subpage write for
 keystone-nand"
Date: Mon, 27 Mar 2017 15:56:55 +0530
Message-ID: <9d21903d38de6685c9bf45d6eb8e32ab0e8c65c5.1490609415.git.nsekhar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This partly reverts commit 28c015a9daabe4ed3aeb0ccf669a3f1c2b8b81d5.

Since f6d7c1b5598b ("mtd: nand: davinci: Reinitialize the HW ECC
engine in 4bit hwctl") using subpage and 4bit HWECC works.

Revert the original workaround made for this. Tested with
mtd_subpagetest and UBIFS on K2E, K2HK, K2L EVMs.

The addition of keystone specific compatible to davinci_nand_of_match[]
contained in original commit is retained.

Cc: Muralidharan Karicheri <m-karicheri2@ti.com>
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 drivers/mtd/nand/davinci_nand.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 27fa8b87cd5f..56c4afed8d74 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -580,11 +580,6 @@ static struct davinci_nand_pdata
 		if (of_property_read_bool(pdev->dev.of_node,
 			"ti,davinci-nand-use-bbt"))
 			pdata->bbt_options = NAND_BBT_USE_FLASH;
-
-		if (of_device_is_compatible(pdev->dev.of_node,
-					    "ti,keystone-nand")) {
-			pdata->options |= NAND_NO_SUBPAGE_WRITE;
-		}
 	}
 
 	return dev_get_platdata(&pdev->dev);
-- 
2.9.0
