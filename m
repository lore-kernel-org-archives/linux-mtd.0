Received: from rnd-relay.smtp.broadcom.com ([192.19.229.170])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eGcja-0008Py-EC
 for linux-mtd@lists.infradead.org; Mon, 20 Nov 2017 03:27:00 +0000
From: Albert Hsieh <wen.hsieh@broadcom.com>
To: computersforpeace@gmail.com
Cc: kdasu.kdev@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org, hsiehwt@gmail.com,
 Albert Hsieh <wen.hsieh@broadcom.com>
Subject: [PATCH 1/1] mtd: nand: brcmnand: Zero bitflip is not an error
Date: Mon, 20 Nov 2017 11:26:26 +0800
Message-Id: <1511148386-14573-1-git-send-email-wen.hsieh@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A negative return value of brcmstb_nand_verify_erased_page() indicates a
real bitflip error of an erased page, and other return values (>= 0) show
the corrected bitflip number. Zero return value means no bitflip, but the
current driver code treats it as an error, and eventually leads to
falsely reported ECC error.

Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflip")
Signed-off-by: Albert Hsieh <wen.hsieh@broadcom.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index e0eb51d..dd56a67 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1763,7 +1763,7 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 			err = brcmstb_nand_verify_erased_page(mtd, chip, buf,
 							      addr);
 			/* erased page bitflips corrected */
-			if (err > 0)
+			if (err >= 0)
 				return err;
 		}
 
-- 
2.1.0
