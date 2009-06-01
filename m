Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MAxGm-0007La-CU
	for linux-mtd@lists.infradead.org; Mon, 01 Jun 2009 02:29:07 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KKJ00CJ4G2SI8G0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Sun, 31 May 2009 22:25:40 -0400 (EDT)
Date: Sun, 31 May 2009 22:25:40 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd orion_nand: use burst reads with double word accesses
Message-id: <alpine.LFD.2.00.0905312223100.3906@xanadu.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is not 8 times faster than byte access, but still around 60% faster.

Signed-off-by: Nicolas Pitre <nico@marvell.com>
---
 drivers/mtd/nand/orion_nand.c |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index c2dfd3e..7ad9722 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -47,6 +47,28 @@ static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl
 	writeb(cmd, nc->IO_ADDR_W + offs);
 }
 
+static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	struct nand_chip *chip = mtd->priv;
+	void __iomem *io_base = chip->IO_ADDR_R;
+	uint64_t *buf64;
+	int i = 0;
+
+	while (len && (unsigned long)buf & 7) {
+		*buf++ = readb(io_base);
+		len--;
+	}
+	buf64 = (uint64_t *)buf;
+	while (i < len/8) {
+		uint64_t x;
+		asm ("ldrd\t%0, [%1]" : "=r" (x) : "r" (io_base));
+		buf64[i++] = x;
+	}
+	i *= 8;
+	while (i < len)
+		buf[i++] = readb(io_base);
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct mtd_info *mtd;
@@ -83,6 +105,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	nc->priv = board;
 	nc->IO_ADDR_R = nc->IO_ADDR_W = io_base;
 	nc->cmd_ctrl = orion_nand_cmd_ctrl;
+	nc->read_buf = orion_nand_read_buf;
 	nc->ecc.mode = NAND_ECC_SOFT;
 
 	if (board->chip_delay)
