From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/3] mtd: nand: sunxi: Improve sunxi_nfc_cmd_ctrl()
Date: Fri,  6 Jan 2017 10:42:07 +0100
Message-Id: <1483695727-17415-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483695727-17415-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483695727-17415-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We only need to call sunxi_nfc_wait_cmd_fifo_empty() if we want to send
a new command. Move the sunxi_nfc_wait_cmd_fifo_empty() call to right
place to avoid extra register reads.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 76449f79d4c5..0eeeb8b889ea 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -604,10 +604,6 @@ static void sunxi_nfc_cmd_ctrl(struct mtd_info *mtd, int dat,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	int ret;
 
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return;
-
 	if (dat == NAND_CMD_NONE && (ctrl & NAND_NCE) &&
 	    !(ctrl & (NAND_CLE | NAND_ALE))) {
 		u32 cmd = 0;
@@ -637,6 +633,10 @@ static void sunxi_nfc_cmd_ctrl(struct mtd_info *mtd, int dat,
 			writel(sunxi_nand->addr[1],
 			       nfc->regs + NFC_REG_ADDR_HIGH);
 
+		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+		if (ret)
+			return;
+
 		writel(cmd, nfc->regs + NFC_REG_CMD);
 		sunxi_nand->addr[0] = 0;
 		sunxi_nand->addr[1] = 0;
-- 
2.7.4
