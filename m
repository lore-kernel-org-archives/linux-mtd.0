Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N8qBW-00064U-0e
	for linux-mtd@lists.infradead.org; Fri, 13 Nov 2009 07:03:10 +0000
Received: by yxe40 with SMTP id 40so2895136yxe.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Nov 2009 23:03:04 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: alauda: Use hweight8
Date: Fri, 13 Nov 2009 16:02:22 +0900
Message-Id: <1258095742-13221-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/alauda.c |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
index 6d96491..2d67732 100644
--- a/drivers/mtd/nand/alauda.c
+++ b/drivers/mtd/nand/alauda.c
@@ -372,15 +372,6 @@ static int alauda_read_oob(struct mtd_info *mtd, loff_t from, void *oob)
 	return __alauda_read_page(mtd, from, ignore_buf, oob);
 }
 
-static int popcount8(u8 c)
-{
-	int ret = 0;
-
-	for ( ; c; c>>=1)
-		ret += c & 1;
-	return ret;
-}
-
 static int alauda_isbad(struct mtd_info *mtd, loff_t ofs)
 {
 	u8 oob[16];
@@ -391,7 +382,7 @@ static int alauda_isbad(struct mtd_info *mtd, loff_t ofs)
 		return err;
 
 	/* A block is marked bad if two or more bits are zero */
-	return popcount8(oob[5]) >= 7 ? 0 : 1;
+	return hweight8(oob[5]) >= 7 ? 0 : 1;
 }
 
 static int alauda_bounce_read(struct mtd_info *mtd, loff_t from, size_t len,
-- 
1.6.5.1
