Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiDO0-0004gf-6k
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 23:35:32 +0000
Received: by pbbrq13 with SMTP id rq13so4463143pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2012 16:35:31 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/8] mtd: move mtd_read_oob() definition out of mtd.h
Date: Fri, 22 Jun 2012 16:35:38 -0700
Message-Id: <1340408145-24531-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_read_oob() will be expanded a little, so don't leave it in the header
as a static inline function.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/mtdcore.c   |    9 +++++++++
 include/linux/mtd/mtd.h |    9 +--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5757307..fcfce24 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -858,6 +858,15 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
 
+int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
+{
+	ops->retlen = ops->oobretlen = 0;
+	if (!mtd->_read_oob)
+		return -EOPNOTSUPP;
+	return mtd->_read_oob(mtd, from, ops);
+}
+EXPORT_SYMBOL_GPL(mtd_read_oob);
+
 /*
  * Method to access the protection register area, present in some flash
  * devices. The user data is one time programmable but the factory data is read
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 63dadc0..81d61e7 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -265,14 +265,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		    const u_char *buf);
 
-static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
-			       struct mtd_oob_ops *ops)
-{
-	ops->retlen = ops->oobretlen = 0;
-	if (!mtd->_read_oob)
-		return -EOPNOTSUPP;
-	return mtd->_read_oob(mtd, from, ops);
-}
+int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops);
 
 static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
-- 
1.7.10
