Received: from tango.tkos.co.il ([62.219.50.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PunM8-0005DC-E0
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2011 14:48:50 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/mxc_nand: fix read past buffer end
Date: Wed,  2 Mar 2011 16:47:55 +0200
Message-Id: <2edd0d1419770540f85178a1f29cd80fccf11e88.1299077237.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/mxc_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 7b33811..466d7a9 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -641,9 +641,9 @@ static void mxc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 
 	n = min(n, len);
 
-	memcpy(buf, host->data_buf + col, len);
+	memcpy(buf, host->data_buf + col, n);
 
-	host->buf_start += len;
+	host->buf_start += n;
 }
 
 /* Used by the upper layer to verify the data in NAND Flash
-- 
1.7.2.3
