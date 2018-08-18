Received: from smtprz14.163.net ([106.3.154.247] helo=smtp.tom.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqxK1-0003GE-Cv
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2018 09:15:05 +0000
Received: from antispam2.tom.com (unknown [172.25.16.56])
 by freemail02.tom.com (Postfix) with ESMTP id 674AFB00D45
 for <linux-mtd@lists.infradead.org>; Sat, 18 Aug 2018 17:14:31 +0800 (CST)
Received: from antispam2.tom.com (antispam2.tom.com [127.0.0.1])
 by antispam2.tom.com (Postfix) with ESMTP id 92F9C812A6
 for <linux-mtd@lists.infradead.org>; Sat, 18 Aug 2018 17:14:30 +0800 (CST)
Received: from antispam2.tom.com ([127.0.0.1])
 by antispam2.tom.com (antispam2.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrfEaeQqRLVj for <linux-mtd@lists.infradead.org>;
 Sat, 18 Aug 2018 17:14:29 +0800 (CST)
From: Liu Xiang <liu.xiang6@zte.com.cn>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, han.xu@nxp.com, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, liuxiang_1999@126.com,
 Liu Xiang <liu.xiang6@zte.com.cn>
Subject: [PATCH] mtd: spi-nor: fsl-quadspi: fix read error for flash size
 larger than 16MB
Date: Sat, 18 Aug 2018 17:14:23 +0800
Message-Id: <1534583663-2842-1-git-send-email-liu.xiang6@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the size of spi-nor flash is larger than 16MB, the read_opcode
is set to SPINOR_OP_READ_1_1_4_4B, and fsl_qspi_get_seqid() will
return -EINVAL when cmd is SPINOR_OP_READ_1_1_4_4B. This can
cause read operation fail.

Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 7d9620c..64304a3 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -478,6 +478,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 {
 	switch (cmd) {
 	case SPINOR_OP_READ_1_1_4:
+	case SPINOR_OP_READ_1_1_4_4B:
 		return SEQID_READ;
 	case SPINOR_OP_WREN:
 		return SEQID_WREN;
-- 
1.9.1
