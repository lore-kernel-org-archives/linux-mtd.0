Received: from mail-qg0-x230.google.com ([2607:f8b0:400d:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq5DV-0007WU-G6
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 20:47:23 +0000
Received: by mail-qg0-x230.google.com with SMTP id f105so26921703qge.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2016 13:47:01 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>,
	<linux-leds@vger.kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jacek Anaszewski <j.anaszewski@samsung.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 1/4] mtd: Uninline mtd_write_oob and move it to mtdcore.c
Date: Tue, 12 Apr 2016 17:46:39 -0300
Message-Id: <1460494002-8578-2-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's no reason for having mtd_write_oob inlined in mtd.h header.
Move it to mtdcore.c where it belongs.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/mtdcore.c   | 12 ++++++++++++
 include/linux/mtd/mtd.h | 12 +-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 309625130b21..99d83f3331b0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -997,6 +997,18 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 }
 EXPORT_SYMBOL_GPL(mtd_read_oob);
 
+int mtd_write_oob(struct mtd_info *mtd, loff_t to,
+				struct mtd_oob_ops *ops)
+{
+	ops->retlen = ops->oobretlen = 0;
+	if (!mtd->_write_oob)
+		return -EOPNOTSUPP;
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+	return mtd->_write_oob(mtd, to, ops);
+}
+EXPORT_SYMBOL_GPL(mtd_write_oob);
+
 /*
  * Method to access the protection register area, present in some flash
  * devices. The user data is one time programmable but the factory data is read
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 771272187316..ef9fea4fc400 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -283,17 +283,7 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		    const u_char *buf);
 
 int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops);
-
-static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
-				struct mtd_oob_ops *ops)
-{
-	ops->retlen = ops->oobretlen = 0;
-	if (!mtd->_write_oob)
-		return -EOPNOTSUPP;
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-	return mtd->_write_oob(mtd, to, ops);
-}
+int mtd_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops);
 
 int mtd_get_fact_prot_info(struct mtd_info *mtd, size_t len, size_t *retlen,
 			   struct otp_info *buf);
-- 
2.7.0
