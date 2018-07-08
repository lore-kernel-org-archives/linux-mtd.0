Received: from smtp47.i.mail.ru ([94.100.177.107])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fc7tS-0007EM-GN
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 11:30:19 +0000
From: Sergey Larin <cerg2010cerg2010@mail.ru>
To: 
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: [PATCH 1/2] mtd: rawnand: docg4: fix NULL deref while probing
Date: Sun,  8 Jul 2018 14:29:23 +0300
Message-Id: <30a41254ed09624a8972aa1daf14e4dd1efabed3.1531045014.git.cerg2010cerg2010@mail.ru>
In-Reply-To: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
References: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_scan_tail() invokes nand_chip->scan_bbt() at the end, which is not set
by the driver. Use the default nand_default_bbt() function to avoid NULL
dereferncing.

Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>
---
 drivers/mtd/nand/raw/docg4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
index bb96cb33cd6b..bbed8ea7858c 100644
--- a/drivers/mtd/nand/raw/docg4.c
+++ b/drivers/mtd/nand/raw/docg4.c
@@ -1269,6 +1269,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	nand->read_buf = docg4_read_buf;
 	nand->write_buf = docg4_write_buf16;
 	nand->erase = docg4_erase_block;
+	nand->scan_bbt = nand_default_bbt;
 	nand->set_features = nand_get_set_features_notsupp;
 	nand->get_features = nand_get_set_features_notsupp;
 	nand->ecc.read_page = docg4_read_page;
-- 
2.18.0
