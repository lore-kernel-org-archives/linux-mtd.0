Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eSQsU-0003fz-FC
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 17:13:05 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: nand: Fix unfinished comment in
 nand_init_data_interface()
Date: Fri, 22 Dec 2017 18:12:41 +0100
Message-Id: <20171222171241.27416-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Give an unfinished comment a meaning.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ab8ad9e8a8d8..96c97588e1ba 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1284,7 +1284,10 @@ static int nand_init_data_interface(struct nand_chip *chip)
 		if (ret)
 			continue;
 
-		/* Pass -1 to only */
+		/*
+		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
+		 * controller supports the requested timings.
+		 */
 		ret = chip->setup_data_interface(mtd,
 						 NAND_DATA_IFACE_CHECK_ONLY,
 						 &chip->data_interface);
-- 
2.11.0
