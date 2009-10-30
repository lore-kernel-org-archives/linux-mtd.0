Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3krW-000763-FL
	for linux-mtd@lists.infradead.org; Fri, 30 Oct 2009 06:21:31 +0000
Received: by mail-bw0-f212.google.com with SMTP id 4so3543519bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Oct 2009 23:21:26 -0700 (PDT)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 30 Oct 2009 11:51:06 +0530
Message-ID: <ce9ab5790910292321nf230810v353c23f9c1ce1931@mail.gmail.com>
Subject: [PATCH 1/3] Fixing compilation warning for 'nand/omap2.c'
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vimal Singh <vimalsingh@ti.com>
Date: Fri, 30 Oct 2009 11:31:34 +0530
Subject: [PATCH] Fixing compilation warning for 'nand/omap2.c'

Fixing below warning in compilation:
drivers/mtd/nand/omap2.c: In function 'omap_write_buf_dma_pref':
drivers/mtd/nand/omap2.c:508: warning: passing argument 2 of
'omap_nand_dma_transfer' discards qualifiers from pointer target type

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/omap2.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 090ab87..92573d5 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -501,11 +501,13 @@ static void omap_read_buf_dma_pref(struct
mtd_info *mtd, u_char *buf, int len)
 static void omap_write_buf_dma_pref(struct mtd_info *mtd,
 					const u_char *buf, int len)
 {
+	u_char *p = (u_char *)buf;
+
 	if (len <= mtd->oobsize)
-		omap_write_buf_pref(mtd, buf, len);
+		omap_write_buf_pref(mtd, p, len);
 	else
 		/* start transfer in DMA mode */
-		omap_nand_dma_transfer(mtd, buf, len, 0x1);
+		omap_nand_dma_transfer(mtd, p, len, 0x1);
 }

 /**
-- 
1.5.5
