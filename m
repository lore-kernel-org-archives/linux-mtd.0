Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma4ks-0005P1-G6
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 09:31:58 +0000
Received: by ewy7 with SMTP id 7so2088885ewy.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 09 Aug 2009 02:31:53 -0700 (PDT)
Message-ID: <4A7E9868.6070505@gmail.com>
Date: Sun, 09 Aug 2009 11:35:36 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] MTD: Prevent a read from eraseregions[-1]
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the erase region was found in the first iteration we read from
eraseregions[-1]

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 792b547..db6de74 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -427,7 +427,7 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 		 * to-be-erased area begins. Verify that the starting
 		 * offset is aligned to this region's erase size:
 		 */
-		if (instr->addr & (erase_regions[i].erasesize - 1))
+		if (i < 0 || instr->addr & (erase_regions[i].erasesize - 1))
 			return -EINVAL;
 
 		/*
@@ -440,8 +440,8 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 		/*
 		 * check if the ending offset is aligned to this region's erase size
 		 */
-		if ((instr->addr + instr->len) & (erase_regions[i].erasesize -
-						  1))
+		if (i < 0 || ((instr->addr + instr->len) &
+					(erase_regions[i].erasesize - 1)))
 			return -EINVAL;
 	}
 
