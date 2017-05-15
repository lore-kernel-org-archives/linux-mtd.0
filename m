From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>,
 <matthias.bgg@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <rogercc.lin@mediatek.com>, <yt.shen@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v3 2/4] mtd: nand: mediatek: refine register NFI_PAGEFMT
 setting
Date: Mon, 15 May 2017 20:39:37 +0800
Message-ID: <1494851979-14416-3-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1494851979-14416-1-git-send-email-xiaolei.li@mediatek.com>
References: <1494851979-14416-1-git-send-email-xiaolei.li@mediatek.com>
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

The register NFI_PAGEFMT is always 32 bits length, so it is better to
do register program using writel() compare with writew().

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/mtk_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index 6c517c6..c28f4b7 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -408,7 +408,7 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
 
 	fmt |= mtk_nand->fdm.reg_size << PAGEFMT_FDM_SHIFT;
 	fmt |= mtk_nand->fdm.ecc_size << PAGEFMT_FDM_ECC_SHIFT;
-	nfi_writew(nfc, fmt, NFI_PAGEFMT);
+	nfi_writel(nfc, fmt, NFI_PAGEFMT);
 
 	nfc->ecc_cfg.strength = chip->ecc.strength;
 	nfc->ecc_cfg.len = chip->ecc.size + mtk_nand->fdm.ecc_size;
@@ -1009,7 +1009,7 @@ static inline void mtk_nfc_hw_init(struct mtk_nfc *nfc)
 	 * 0  : poll the status of the busy/ready signal after [7:4]*16 cycles.
 	 */
 	nfi_writew(nfc, 0xf1, NFI_CNRNB);
-	nfi_writew(nfc, PAGEFMT_8K_16K, NFI_PAGEFMT);
+	nfi_writel(nfc, PAGEFMT_8K_16K, NFI_PAGEFMT);
 
 	mtk_nfc_hw_reset(nfc);
 
-- 
1.9.1
