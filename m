Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZmcl-0004TX-Ft
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 23:51:09 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>
Subject: [RFC PATCH 2/2] mtd: nand: always request data transfer for parameter
 page
Date: Fri, 12 Jan 2018 00:50:37 +0100
Message-Id: <20180111235037.10912-2-stefan@agner.ch>
In-Reply-To: <20180111235037.10912-1-stefan@agner.ch>
References: <20180111235037.10912-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To make sure the controller actually transfers data add a
DATA_IN op even if len is 0.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/nand_base.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 96c97588e1ba..26bbf54e125b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1510,10 +1510,6 @@ static int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 		};
 		struct nand_operation op = NAND_OPERATION(instrs);
 
-		/* Drop the DATA_IN instruction if len is set to 0. */
-		if (!len)
-			op.ninstrs--;
-
 		return nand_exec_op(chip, &op);
 	}
 
-- 
2.15.1
