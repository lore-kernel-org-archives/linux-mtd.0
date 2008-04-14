Received: from smtp5.pp.htv.fi ([213.243.153.39])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPZ1-00044i-2k
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:21:43 +0000
Date: Mon, 14 Apr 2008 17:20:38 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtd: proper onenand_bbt_read_oob() prototype
Message-ID: <20080414142038.GV6695@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a proper prototype for onenand_bbt_read_oob() in 
include/linux/mtd/onenand.h

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 drivers/mtd/onenand/onenand_bbt.c |    3 ---
 include/linux/mtd/onenand.h       |    3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

716790e26f0b833687cc5b730ccf3240553d7fd4 diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 1d590cd..268ffc1 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -17,9 +17,6 @@
 #include <linux/mtd/onenand.h>
 #include <linux/mtd/compatmac.h>
 
-extern int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
-				struct mtd_oob_ops *ops);
-
 /**
  * check_short_pattern - [GENERIC] check if a pattern is in the buffer
  * @param buf		the buffer to search
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index fd0a260..9aa2a91 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -187,4 +187,7 @@ struct onenand_manufacturers {
         char *name;
 };
 
+int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
+			 struct mtd_oob_ops *ops);
+
 #endif	/* __LINUX_MTD_ONENAND_H */
