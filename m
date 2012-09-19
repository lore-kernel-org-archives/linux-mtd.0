Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEJ4a-00064i-CW
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2012 12:08:10 +0000
Received: by bkcji2 with SMTP id ji2so458944bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2012 05:08:06 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH RFC] bcm47xxsflash: just use memcpy for reading
Date: Wed, 19 Sep 2012 14:08:14 +0200
Message-Id: <1348056494-30019-1-git-send-email-zajec5@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Jonas Gorski <jonas.gorski@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
Still have to check it with aiaiai
---
 drivers/mtd/devices/bcm47xxsflash.c |   31 ++-----------------------------
 1 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index a328872..2f8dfd4 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -14,41 +14,14 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			      size_t *retlen, u_char *buf)
 {
 	struct bcma_sflash *sflash = mtd->priv;
-	size_t bytes_read = 0;
-	__iomem u8 *src = (__iomem u8 *)KSEG0ADDR(sflash->window + from);
-	int i;
-	size_t unaligned_before, unaligned_after;
 
 	/* Check address range */
 	if ((from + len) > mtd->size)
 		return -EINVAL;
 
-	unaligned_before = from & 0x3;
-	unaligned_after = (from + len) & 0x3;
+	memcpy(buf, (void *)KSEG0ADDR(sflash->window + from), len);
 
-	for (i = 0; i < unaligned_before; i++) {
-		*buf = readb(src);
-		buf++;
-		src++;
-		bytes_read++;
-	}
-	for (i = from - unaligned_before; i < from + len - unaligned_after;
-	     i += 4) {
-		*(u32 *)buf = readl(src);
-		buf += 4;
-		src += 4;
-		bytes_read += 4;
-	}
-	for (i = 0; i < unaligned_after; i++) {
-		*buf = readb(src);
-		buf++;
-		src++;
-		bytes_read++;
-	}
-
-	*retlen = bytes_read;
-
-	return 0;
+	return len;
 }
 
 static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
-- 
1.7.7
