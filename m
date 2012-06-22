Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiDO5-0004h1-Gk
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 23:35:38 +0000
Received: by mail-pz0-f49.google.com with SMTP id m1so3145809dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2012 16:35:37 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/8] mtd: nand_bbt: refactor check_pattern_no_oob()
Date: Fri, 22 Jun 2012 16:35:43 -0700
Message-Id: <1340408145-24531-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This function only returns 0 or -1, so make that clear.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 35e8cdf..ca07230 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -71,12 +71,9 @@
 
 static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
 {
-	int ret;
-
-	ret = memcmp(buf, td->pattern, td->len);
-	if (!ret)
-		return ret;
-	return -1;
+	if (memcmp(buf, td->pattern, td->len))
+		return -1;
+	return 0;
 }
 
 /**
-- 
1.7.10
