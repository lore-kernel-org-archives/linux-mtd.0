Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rqmjc-0007Ma-4K
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 14:25:01 +0000
Received: by dadz9 with SMTP id z9so564831dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 06:24:59 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH] mtd/inftlmount: use memchr_inv
Date: Fri, 27 Jan 2012 23:24:52 +0900
Message-Id: <1327674295-3700-5-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
References: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use memchr_inv to check if the data contains all 0xFF bytes.  It is
faster than looping for each byte.
This also removes memcmpb which is no longer used.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/inftlmount.c |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 4adc037..419b1c9 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -320,16 +320,6 @@ static int find_boot_record(struct INFTLrecord *inftl)
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
 /*
  * check_free_sector: check if a free sector is actually FREE,
  *	i.e. All 0xff in data and oob area.
@@ -345,14 +335,14 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 	for (i = 0; i < len; i += SECTORSIZE) {
 		if (mtd_read(mtd, address, SECTORSIZE, &retlen, buf))
 			return -1;
-		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
+		if (memchr_inv(buf, 0xff, SECTORSIZE))
 			return -1;
 
 		if (check_oob) {
 			if(inftl_read_oob(mtd, address, mtd->oobsize,
 					  &retlen, &buf[SECTORSIZE]) < 0)
 				return -1;
-			if (memcmpb(buf + SECTORSIZE, 0xff, mtd->oobsize) != 0)
+			if (memchr_inv(buf + SECTORSIZE, 0xff, mtd->oobsize))
 				return -1;
 		}
 		address += SECTORSIZE;
-- 
1.7.4.4
