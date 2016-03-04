Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abz2X-0001AH-Ea
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2016 23:21:46 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] mtd: nand: sunxi: remove direct mtd->priv accesses
Date: Sat,  5 Mar 2016 00:21:20 +0100
Message-Id: <1457133680-18419-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd->priv is no longer pointing to the struct nand_chip it is attached to.
Replace those accesses by mtd_to_nand() calls.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Fixes: 4be4e03efc7f ("mtd: nand: sunxi: add randomizer support")
---
Sorry for the inconvenience, but apparently I was not expecting
the mtd_to_nand() rework to be taken before the randomizer patch,
and I forgot to repost a version replacing mtd->priv by mtd_to_nand().
---
 drivers/mtd/nand/sunxi_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index b5ea6b3..1c03eee 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -642,7 +642,7 @@ static u16 sunxi_nfc_randomizer_state(struct mtd_info *mtd, int page, bool ecc)
 static void sunxi_nfc_randomizer_config(struct mtd_info *mtd,
 					int page, bool ecc)
 {
-	struct nand_chip *nand = mtd->priv;
+	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
 	u16 state;
@@ -658,7 +658,7 @@ static void sunxi_nfc_randomizer_config(struct mtd_info *mtd,
 
 static void sunxi_nfc_randomizer_enable(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd->priv;
+	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
@@ -670,7 +670,7 @@ static void sunxi_nfc_randomizer_enable(struct mtd_info *mtd)
 
 static void sunxi_nfc_randomizer_disable(struct mtd_info *mtd)
 {
-	struct nand_chip *nand = mtd->priv;
+	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
-- 
2.1.4
