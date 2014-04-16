Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaLWC-00050q-Aw
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 08:48:32 +0000
Received: by mail-pd0-f177.google.com with SMTP id y10so10442009pdj.22
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 01:48:09 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: fsl-quadspi: fix __iomem annotations
Date: Wed, 16 Apr 2014 01:47:59 -0700
Message-Id: <1397638079-1894-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This corrects some sparse warnings:

   drivers/mtd/spi-nor/fsl-quadspi.c:281:31: warning: incorrect type in initializer (different address spaces) [sparse]
   drivers/mtd/spi-nor/fsl-quadspi.c:281:31:    expected void *[noderef] <asn:2>base [sparse]
   drivers/mtd/spi-nor/fsl-quadspi.c:281:31:    got void [noderef] <asn:2>*iobase [sparse]
   (etc.)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Branched off of a previous patch series, but dropped the memcpy() stuff for now

 drivers/mtd/spi-nor/fsl-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index b41bbbc531ff..8d659a2888d5 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -278,7 +278,7 @@ static irqreturn_t fsl_qspi_irq_handler(int irq, void *dev_id)
 
 static void fsl_qspi_init_lut(struct fsl_qspi *q)
 {
-	void *__iomem base = q->iobase;
+	void __iomem *base = q->iobase;
 	int rxfifo = q->devtype_data->rxfifo;
 	u32 lut_base;
 	u8 cmd, addrlen, dummy;
@@ -422,7 +422,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 static int
 fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsigned int addr, int len)
 {
-	void *__iomem base = q->iobase;
+	void __iomem *base = q->iobase;
 	int seqid;
 	u32 reg, reg2;
 	int err;
-- 
1.8.3.2
