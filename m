From: Bayi Cheng <bayi.cheng@mediatek.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <srv_heupstream@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>
Subject: [RESEND PATCH] mtd: mtk-nor: adjust sequence of trigger function and
 assignment function
Date: Fri, 18 Dec 2015 11:02:40 +0800
Message-ID: <1450407760-30030-1-git-send-email-bayi.cheng@mediatek.com>
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

Move write data register before excute command to avoid
missing first byte write to nor flash

Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
---
the previous patch didn't drop the Change-Id

---
 drivers/mtd/spi-nor/mtk-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index dd269650..04da971 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -272,10 +272,10 @@ static int mt8173_nor_write_single_byte(struct mt8173_nor *mt8173_nor,
 	mt8173_nor_set_addr(mt8173_nor, addr);
 
 	for (i = 0; i < length; i++) {
+		writeb(*data++, mt8173_nor->base + MTK_NOR_WDATA_REG);
 		ret = mt8173_nor_execute_cmd(mt8173_nor, MTK_NOR_PIO_WR_CMD);
 		if (ret < 0)
 			return ret;
-		writeb(*data++, mt8173_nor->base + MTK_NOR_WDATA_REG);
 	}
 	return 0;
 }
-- 
1.8.1.1.dirty
