From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 4/4] mtd: nand: remove the NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE
Date: Sat, 21 Dec 2013 00:02:30 +0800
Message-Id: <1387555350-989-5-git-send-email-shijie8@gmail.com>
In-Reply-To: <1387555350-989-1-git-send-email-shijie8@gmail.com>
References: <1387555350-989-1-git-send-email-shijie8@gmail.com>
Cc: s.hauer@pengutronix.de, akinobu.mita@gmail.com, josh@joshtriplett.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no reference to these two macros now.
Just remove them.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 include/linux/mtd/nand.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 4bbcaba..863609e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -52,14 +52,6 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 #define NAND_MAX_CHIPS		8
 
 /*
- * This constant declares the max. oobsize / page, which
- * is supported now. If you add a chip with bigger oobsize/page
- * adjust this accordingly.
- */
-#define NAND_MAX_OOBSIZE	744
-#define NAND_MAX_PAGESIZE	8192
-
-/*
  * Constants for hardware specific CLE/ALE/NCE function
  *
  * These are bits which can be or'ed to set/clear multiple
-- 
1.8.3.1
