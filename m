Received: from mail-pa0-f41.google.com ([209.85.220.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS07b-0005zm-5R
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 09:57:27 +0000
Received: by pacgr6 with SMTP id gr6so154251591pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 02:57:05 -0700 (PDT)
From: Jagan Teki <jteki@openedev.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jteki@openedev.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/3] mtd: spi-nor: Use write_sr for write status
Date: Wed, 19 Aug 2015 15:26:43 +0530
Message-Id: <1439978205-6092-1-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use existing write_sr() call instead of decoding and
calling nor->write_reg separately.

Signed-off-by: Jagan Teki <jteki@openedev.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 47516d3..3e198b4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -869,8 +869,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	val = read_sr(nor);
 	write_enable(nor);
 
-	nor->cmd_buf[0] = val | SR_QUAD_EN_MX;
-	nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1, 0);
+	write_sr(nor, val | SR_QUAD_EN_MX);
 
 	if (spi_nor_wait_till_ready(nor))
 		return 1;
-- 
1.9.1
