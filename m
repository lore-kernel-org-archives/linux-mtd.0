Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exais-0008Mx-36
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2018 15:59:52 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com,
	boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org, stefan@agner.ch
Subject: [PATCH v8 3/3] mtd: rawnand: vf610_nfc: support ONFI SET/GET_FEATURES
 commands
Date: Sun, 18 Mar 2018 16:59:29 +0100
Message-Id: <20180318155929.16561-4-stefan@agner.ch>
In-Reply-To: <20180318155929.16561-1-stefan@agner.ch>
References: <20180318155929.16561-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the move to ->exec_op() the driver should now support ONFI
SET/GET_FEATURES commands.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index c71100d1b2bc..eceaeccdaa4f 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -813,8 +813,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	chip->exec_op = vf610_nfc_exec_op;
 	chip->select_chip = vf610_nfc_select_chip;
-	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
-- 
2.16.2
