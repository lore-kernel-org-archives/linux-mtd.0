Received: from qw-out-1920.google.com ([74.125.92.147])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KbDyZ-0003od-PF
	for linux-mtd@lists.infradead.org; Thu, 04 Sep 2008 12:30:16 +0000
Received: by qw-out-1920.google.com with SMTP id 4so399818qwk.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Sep 2008 05:30:15 -0700 (PDT)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] tmio_nand: fix base address programming
Date: Thu,  4 Sep 2008 16:27:44 +0400
Message-Id: <1220531264-1006-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix offset of second word used for programming base address of memory
window. Also program tmio with offset of the FCR, not with physical
memory location.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Ian Molton <spyro@f2s.com>
---
 drivers/mtd/nand/tmio_nand.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index cbab654..edb1e32 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -109,7 +109,7 @@ struct tmio_nand {
 
 	void __iomem *ccr;
 	void __iomem *fcr;
-	unsigned long fcr_phys;
+	unsigned long fcr_base;
 
 	unsigned int irq;
 
@@ -316,8 +316,8 @@ static int tmio_hw_init(struct platform_device *dev, struct tmio_nand *tmio)
 	tmio_iowrite8(0x81, tmio->ccr + CCR_ICC);
 
 	/* (10h)BaseAddress    0x1000 spba.spba2 */
-	tmio_iowrite16(tmio->fcr_phys, tmio->ccr + CCR_BASE);
-	tmio_iowrite16(tmio->fcr_phys >> 16, tmio->ccr + CCR_BASE + 16);
+	tmio_iowrite16(tmio->fcr_base, tmio->ccr + CCR_BASE);
+	tmio_iowrite16(tmio->fcr_base >> 16, tmio->ccr + CCR_BASE + 2);
 
 	/* (04h)Command Register I/O spcmd */
 	tmio_iowrite8(0x02, tmio->ccr + CCR_COMMAND);
@@ -395,7 +395,7 @@ static int tmio_probe(struct platform_device *dev)
 		goto err_iomap_ccr;
 	}
 
-	tmio->fcr_phys = (unsigned long)fcr->start;
+	tmio->fcr_base = fcr->start & 0xfffff;
 	tmio->fcr = ioremap(fcr->start, fcr->end - fcr->start + 1);
 	if (!tmio->fcr) {
 		retval = -EIO;
-- 
1.5.6.5
