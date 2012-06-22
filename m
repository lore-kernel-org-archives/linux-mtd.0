Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiDO6-0004hF-Pp
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 23:35:39 +0000
Received: by mail-pz0-f49.google.com with SMTP id m1so3145823dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2012 16:35:38 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/8] mtd: nand_bbt: use string library
Date: Fri, 22 Jun 2012 16:35:44 -0700
Message-Id: <1340408145-24531-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some nand_bbt code can be shortened by using memcmp() and memchr_inv().
As an added bonus, there is a possbile performance benefit.

Borrowed some code from Akinobu Mita.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index ca07230..45cdb97 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -68,6 +68,7 @@
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
 #include <linux/export.h>
+#include <linux/string.h>
 
 static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
 {
@@ -89,19 +90,16 @@ static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
  */
 static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
 {
-	int i, end = 0;
+	int end = 0;
 	uint8_t *p = buf;
 
 	if (td->options & NAND_BBT_NO_OOB)
 		return check_pattern_no_oob(buf, td);
 
 	end = paglen + td->offs;
-	if (td->options & NAND_BBT_SCANEMPTY) {
-		for (i = 0; i < end; i++) {
-			if (p[i] != 0xff)
-				return -1;
-		}
-	}
+	if (td->options & NAND_BBT_SCANEMPTY)
+		if (memchr_inv(p, 0xff, end))
+			return -1;
 	p += end;
 
 	/* Compare the pattern */
@@ -111,10 +109,8 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
 	if (td->options & NAND_BBT_SCANEMPTY) {
 		p += td->len;
 		end += td->len;
-		for (i = end; i < len; i++) {
-			if (*p++ != 0xff)
-				return -1;
-		}
+		if (memchr_inv(p, 0xff, len - end))
+			return -1;
 	}
 	return 0;
 }
@@ -130,14 +126,9 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
  */
 static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
 {
-	int i;
-	uint8_t *p = buf;
-
 	/* Compare the pattern */
-	for (i = 0; i < td->len; i++) {
-		if (p[td->offs + i] != td->pattern[i])
-			return -1;
-	}
+	if (memcmp(buf + td->offs, td->pattern, td->len))
+		return -1;
 	return 0;
 }
 
-- 
1.7.10
