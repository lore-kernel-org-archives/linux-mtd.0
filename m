Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT1RR-00061c-Tv
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 05:02:00 +0000
Received: by igbhn18 with SMTP id hn18so33962700igb.2
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 21:01:32 -0800 (PST)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 2/3] mtd:Remove no longer required function,
 check_free_sectors in inftlmount.c
Date: Wed,  4 Mar 2015 00:01:24 -0500
Message-Id: <1425445285-17678-2-git-send-email-xerofoify@gmail.com>
In-Reply-To: <1425445285-17678-1-git-send-email-xerofoify@gmail.com>
References: <1425445285-17678-1-git-send-email-xerofoify@gmail.com>
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

Removes the no longer required function,check_free_sectors as this
functions only caller,INFTL_formatblock has removed it's call to
check_free_sectors.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 drivers/mtd/inftlmount.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 8f16de1..f9f1511 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -329,45 +329,6 @@ static int memcmpb(void *a, int c, int n)
 	return 0;
 }
 
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
-
-/*
- * INFTL_format: format a Erase Unit by erasing ALL Erase Zones in the Erase
- *		 Unit and Update INFTL metadata. Each erase operation is
- *		 checked with check_free_sectors.
- *
- * Return: 0 when succeed, -1 on error.
- *
- */
 int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 {
 	size_t retlen;
-- 
2.1.0
