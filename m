Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbQQe-000747-EP
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 13:05:41 +0000
Received: by mail-wm0-x244.google.com with SMTP id s14-v6so14445662wmc.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2018 06:05:30 -0700 (PDT)
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
To: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] mtd: stm32-quadspi: replace "%p" with "%pK"
Date: Fri,  6 Jul 2018 15:05:25 +0200
Message-Id: <20180706130525.22223-1-benjamin.gaignard@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The format specifier "%p" can leak kernel addresses.
Use "%pK" instead.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/mtd/spi-nor/stm32-quadspi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
index 72553506a00b..13e9fc961d3b 100644
--- a/drivers/mtd/spi-nor/stm32-quadspi.c
+++ b/drivers/mtd/spi-nor/stm32-quadspi.c
@@ -355,7 +355,7 @@ static int stm32_qspi_read_reg(struct spi_nor *nor,
 	struct device *dev = flash->qspi->dev;
 	struct stm32_qspi_cmd cmd;
 
-	dev_dbg(dev, "read_reg: cmd:%#.2x buf:%p len:%#x\n", opcode, buf, len);
+	dev_dbg(dev, "read_reg: cmd:%#.2x buf:%pK len:%#x\n", opcode, buf, len);
 
 	memset(&cmd, 0, sizeof(cmd));
 	cmd.opcode = opcode;
@@ -376,7 +376,7 @@ static int stm32_qspi_write_reg(struct spi_nor *nor, u8 opcode,
 	struct device *dev = flash->qspi->dev;
 	struct stm32_qspi_cmd cmd;
 
-	dev_dbg(dev, "write_reg: cmd:%#.2x buf:%p len:%#x\n", opcode, buf, len);
+	dev_dbg(dev, "write_reg: cmd:%#.2x buf:%pK len:%#x\n", opcode, buf, len);
 
 	memset(&cmd, 0, sizeof(cmd));
 	cmd.opcode = opcode;
@@ -398,7 +398,7 @@ static ssize_t stm32_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
 	struct stm32_qspi_cmd cmd;
 	int err;
 
-	dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#zx\n",
+	dev_dbg(qspi->dev, "read(%#.2x): buf:%pK from:%#.8x len:%#zx\n",
 		nor->read_opcode, buf, (u32)from, len);
 
 	memset(&cmd, 0, sizeof(cmd));
-- 
2.15.0
