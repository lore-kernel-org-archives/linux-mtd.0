Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCBHj-0001hu-Lx
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 18:06:16 +0000
Received: by mail-ig0-f176.google.com with SMTP id hl2so2937207igb.3
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jan 2015 10:05:54 -0800 (PST)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 2/2] mtd: Remove the no longer need functions,
 check_free_sectors and  memcmpb
Date: Fri, 16 Jan 2015 13:05:45 -0500
Message-Id: <1421431545-7883-2-git-send-email-xerofoify@gmail.com>
In-Reply-To: <1421431545-7883-1-git-send-email-xerofoify@gmail.com>
References: <1421431545-7883-1-git-send-email-xerofoify@gmail.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The functions,check_free_sectors and memcmpb are no longer needed due to
removing the only caller for both functions in check_free_sectors for
memcmpb and in INFTL_formatblock for check_free_sectors respectfully.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 drivers/mtd/inftlmount.c | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index f5808ad..d0a7b7c 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -319,46 +319,6 @@ static int find_boot_record(struct INFTLrecord *inftl)
 	return -1;
 }
 
-static int memcmpb(void *a, int c, int n)
-{
-	int i;
-	for (i = 0; i < n; i++) {
-		if (c != ((unsigned char *)a)[i])
-			return 1;
-	}
-	return 0;
-}
-
-/*
- * check_free_sector: check if a free sector is actually FREE,
- *	i.e. All 0xff in data and oob area.
- */
-static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
-	int len, int check_oob)
-{
-	u8 buf[SECTORSIZE + inftl->mbd.mtd->oobsize];
-	struct mtd_info *mtd = inftl->mbd.mtd;
-	size_t retlen;
-	int i;
-
-	for (i = 0; i < len; i += SECTORSIZE) {
-		if (mtd_read(mtd, address, SECTORSIZE, &retlen, buf))
-			return -1;
-		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
-			return -1;
-
-		if (check_oob) {
-			if(inftl_read_oob(mtd, address, mtd->oobsize,
-					  &retlen, &buf[SECTORSIZE]) < 0)
-				return -1;
-			if (memcmpb(buf + SECTORSIZE, 0xff, mtd->oobsize) != 0)
-				return -1;
-		}
-		address += SECTORSIZE;
-	}
-
-	return 0;
-}
 
 /*
  * INFTL_format: format a Erase Unit by erasing ALL Erase Zones in the Erase
-- 
2.1.0
