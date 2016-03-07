From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 11/16] mtd: nand: sunxi: fix NFC_CTL setting
Date: Mon,  7 Mar 2016 17:21:30 +0100
Message-Id: <1457367695-26420-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1457367695-26420-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1457367513-26069-1-git-send-email-boris.brezillon@free-electrons.com>
 <1457367695-26420-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NFC_PAGE_SHIFT() already takes the real page_shift value and subtract 10
to it.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index c1ab33a..22d4d55 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -411,7 +411,7 @@ static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
 		sel = &sunxi_nand->sels[chip];
 
 		ctl |= NFC_CE_SEL(sel->cs) | NFC_EN |
-		       NFC_PAGE_SHIFT(nand->page_shift - 10);
+		       NFC_PAGE_SHIFT(nand->page_shift);
 		if (sel->rb.type == RB_NONE) {
 			nand->dev_ready = NULL;
 		} else {
-- 
2.1.4
