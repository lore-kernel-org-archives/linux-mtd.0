Received: from mail.kmu-office.ch ([178.209.48.109])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euJMM-000607-VV
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2018 14:51:04 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com,
	boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org, stefan@agner.ch
Subject: [PATCH v7 3/3] mtd: rawnand: vf610_nfc: support ONFI SET/GET_FEATURES
 commands
Date: Fri,  9 Mar 2018 15:50:38 +0100
Message-Id: <20180309145038.29024-4-stefan@agner.ch>
In-Reply-To: <20180309145038.29024-1-stefan@agner.ch>
References: <20180309145038.29024-1-stefan@agner.ch>
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
index 4f2e8578fb1d..98d411d980c8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,8 +805,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	chip->exec_op = vf610_nfc_exec_op;
 	chip->select_chip = vf610_nfc_select_chip;
-	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
-- 
2.16.2
