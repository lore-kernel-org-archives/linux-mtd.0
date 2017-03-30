From: Guochun Mao <guochun.mao@mediatek.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Guochun Mao <guochun.mao@mediatek.com>
Subject: [PATCH V1 1/1] mtd: mtk-nor: set controller to 4B mode with large
 capacity flash
Date: Thu, 30 Mar 2017 16:23:42 +0800
Message-ID: <1490862222-723-2-git-send-email-guochun.mao@mediatek.com>
In-Reply-To: <1490862222-723-1-git-send-email-guochun.mao@mediatek.com>
References: <1490862222-723-1-git-send-email-guochun.mao@mediatek.com>
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

when nor's size larger than 16MByte, nor and controller should
enter 4Byte mode simultaneously.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
---
 drivers/mtd/spi-nor/mtk-quadspi.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index e661877..05cd8a8 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -369,6 +369,13 @@ static int mt8173_nor_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 		/* We only handle 1 byte */
 		ret = mt8173_nor_wr_sr(mt8173_nor, *buf);
 		break;
+	case SPINOR_OP_EN4B:
+		/* Set nor controller to 4-byte address mode,
+		 * and simultaneously set nor flash.
+		 * This case should cooperate with default operation.
+		 */
+		writeb(readb(mt8173_nor->base + MTK_NOR_DUAL_REG) | 0x10,
+				mt8173_nor->base + MTK_NOR_DUAL_REG);
 	default:
 		ret = mt8173_nor_do_tx_rx(mt8173_nor, opcode, buf, len, NULL, 0);
 		if (ret)
-- 
1.7.9.5
